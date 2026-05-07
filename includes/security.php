<?php

declare(strict_types=1);

function rate_limit_key(string $action, string $identifier): string
{
    return hash('sha256', strtolower($action) . '|' . strtolower($identifier));
}

function check_rate_limit(string $action, string $identifier, int $maxAttempts, int $decaySeconds): array
{
    $key = rate_limit_key($action, $identifier);
    $row = db_one(
        'SELECT * FROM rate_limits WHERE limiter_key = :limiter_key LIMIT 1',
        ['limiter_key' => $key]
    );

    $currentTime = time();
    if (!$row) {
        db_exec(
            'INSERT INTO rate_limits (limiter_key, action_name, attempts, expires_at, created_at, updated_at)
             VALUES (:limiter_key, :action_name, 1, :expires_at, :created_at, :updated_at)',
            [
                'limiter_key' => $key,
                'action_name' => $action,
                'expires_at' => date('Y-m-d H:i:s', $currentTime + $decaySeconds),
                'created_at' => now(),
                'updated_at' => now(),
            ]
        );
        return ['allowed' => true, 'remaining' => $maxAttempts - 1];
    }

    $expiresAt = strtotime((string) $row['expires_at']);
    if ($expiresAt !== false && $expiresAt <= $currentTime) {
        db_exec(
            'UPDATE rate_limits
             SET attempts = 1, expires_at = :expires_at, updated_at = :updated_at
             WHERE id = :id',
            [
                'expires_at' => date('Y-m-d H:i:s', $currentTime + $decaySeconds),
                'updated_at' => now(),
                'id' => $row['id'],
            ]
        );
        return ['allowed' => true, 'remaining' => $maxAttempts - 1];
    }

    $attempts = (int) $row['attempts'];
    if ($attempts >= $maxAttempts) {
        log_security_event($action, 'rate_limit_blocked', [
            'identifier' => $identifier,
            'ip' => client_ip(),
        ]);
        return ['allowed' => false, 'remaining' => 0];
    }

    db_exec(
        'UPDATE rate_limits SET attempts = attempts + 1, updated_at = :updated_at WHERE id = :id',
        ['updated_at' => now(), 'id' => $row['id']]
    );

    return ['allowed' => true, 'remaining' => max(0, $maxAttempts - $attempts - 1)];
}

function log_security_event(string $action, string $eventType, array $meta = []): void
{
    db_exec(
        'INSERT INTO security_events (action_name, event_type, ip_address, user_agent, metadata_json, created_at)
         VALUES (:action_name, :event_type, :ip_address, :user_agent, :metadata_json, :created_at)',
        [
            'action_name' => $action,
            'event_type' => $eventType,
            'ip_address' => client_ip(),
            'user_agent' => substr((string) ($_SERVER['HTTP_USER_AGENT'] ?? ''), 0, 255),
            'metadata_json' => json_encode($meta, JSON_UNESCAPED_UNICODE),
            'created_at' => now(),
        ]
    );
}

function admin_log(int $adminId, string $action, string $entityType, ?int $entityId = null): void
{
    db_exec(
        'INSERT INTO admin_logs (admin_id, action, entity_type, entity_id, created_at)
         VALUES (:admin_id, :action, :entity_type, :entity_id, :created_at)',
        [
            'admin_id' => $adminId,
            'action' => $action,
            'entity_type' => $entityType,
            'entity_id' => $entityId,
            'created_at' => now(),
        ]
    );
}

