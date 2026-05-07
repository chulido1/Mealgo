<?php

declare(strict_types=1);

function app_config(?string $key = null, mixed $default = null): mixed
{
    static $config = null;
    if ($config === null) {
        $config = require ROOT_PATH . '/config/app.php';
    }

    if ($key === null) {
        return $config;
    }

    $segments = explode('.', $key);
    $value = $config;
    foreach ($segments as $segment) {
        if (!is_array($value) || !array_key_exists($segment, $value)) {
            return $default;
        }
        $value = $value[$segment];
    }
    return $value;
}

function e(?string $value): string
{
    return htmlspecialchars((string) ($value ?? ''), ENT_QUOTES | ENT_SUBSTITUTE, 'UTF-8');
}

function base_url(string $path = ''): string
{
    $base = rtrim((string) app_config('app_url', ''), '/');
    $path = '/' . ltrim($path, '/');
    return $base . ($path === '/' ? '' : $path);
}

function absolute_url(string $path = ''): string
{
    $url = base_url($path);
    if (preg_match('#^https?://#i', $url)) {
        return $url;
    }

    $publicBase = rtrim((string) app_config('app_public_url', ''), '/');
    if ($publicBase !== '') {
        $path = '/' . ltrim($path, '/');
        return $publicBase . ($path === '/' ? '' : $path);
    }

    $scheme = (!empty($_SERVER['HTTPS']) && $_SERVER['HTTPS'] !== 'off') ? 'https' : 'http';
    $host = (string) ($_SERVER['HTTP_HOST'] ?? 'localhost');

    return $scheme . '://' . $host . $url;
}

function redirect_to(string $path): never
{
    header('Location: ' . base_url($path));
    exit;
}

function is_post(): bool
{
    return strtoupper($_SERVER['REQUEST_METHOD'] ?? 'GET') === 'POST';
}

function csrf_token(): string
{
    if (empty($_SESSION['_csrf'])) {
        $_SESSION['_csrf'] = bin2hex(random_bytes(32));
    }
    return $_SESSION['_csrf'];
}

function csrf_field(): string
{
    return '<input type="hidden" name="_csrf" value="' . e(csrf_token()) . '">';
}

function verify_csrf(): void
{
    $sessionToken = $_SESSION['_csrf'] ?? '';
    $requestToken = (string) ($_POST['_csrf'] ?? '');

    if (!$sessionToken || !$requestToken || !hash_equals($sessionToken, $requestToken)) {
        http_response_code(419);
        exit('Ошибка CSRF-токена');
    }
}

function order_status_label(string $status): string
{
    return match ($status) {
        'new' => 'Новый',
        'confirmed' => 'Подтвержден',
        'preparing' => 'Готовится',
        'on_the_way' => 'В пути',
        'delivered' => 'Доставлен',
        'cancelled' => 'Отменен',
        default => $status,
    };
}

function payment_method_label(string $paymentMethod): string
{
    return match ($paymentMethod) {
        'cash' => 'Наличными курьеру',
        'card_on_delivery' => 'Картой курьеру',
        default => $paymentMethod,
    };
}

function user_role_label(string $role): string
{
    return match ($role) {
        'admin' => 'Администратор',
        'user' => 'Пользователь',
        default => $role,
    };
}

function flash(string $key, ?string $value = null): ?string
{
    if ($value !== null) {
        $_SESSION['_flash'][$key] = $value;
        return null;
    }

    if (!isset($_SESSION['_flash'][$key])) {
        return null;
    }

    $message = $_SESSION['_flash'][$key];
    unset($_SESSION['_flash'][$key]);
    return $message;
}

function old(string $key, string $default = ''): string
{
    return (string) ($_SESSION['_old'][$key] ?? $default);
}

function with_old_input(array $input): void
{
    $_SESSION['_old'] = $input;
}

function clear_old_input(): void
{
    unset($_SESSION['_old']);
}

function now(): string
{
    return date('Y-m-d H:i:s');
}

function random_string(int $length = 32): string
{
    return bin2hex(random_bytes((int) ceil($length / 2)));
}

function client_ip(): string
{
    $ip = $_SERVER['HTTP_X_FORWARDED_FOR'] ?? $_SERVER['REMOTE_ADDR'] ?? '0.0.0.0';
    if (str_contains($ip, ',')) {
        $parts = explode(',', $ip);
        return trim($parts[0]);
    }
    return trim($ip);
}

function app_log(string $channel, array $payload): void
{
    $dir = ROOT_PATH . '/storage/logs';
    if (!is_dir($dir)) {
        mkdir($dir, 0777, true);
    }
    $line = json_encode([
        'time' => now(),
        'channel' => $channel,
        'payload' => $payload,
    ], JSON_UNESCAPED_UNICODE) . PHP_EOL;
    file_put_contents($dir . '/app.log', $line, FILE_APPEND);
}
