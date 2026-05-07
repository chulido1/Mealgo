<?php

declare(strict_types=1);

function current_user(): ?array
{
    static $cached = null;
    static $cachedUserId = null;

    $userId = $_SESSION['user_id'] ?? null;
    if (!$userId) {
        $cached = null;
        $cachedUserId = null;
        return $cached;
    }

    if ($cachedUserId === (int) $userId && $cached !== null) {
        return $cached;
    }

    $user = db_one(
        'SELECT id, name, email, phone, role, email_verified_at, is_active, created_at
         FROM users WHERE id = :id LIMIT 1',
        ['id' => $userId]
    );

    if (!$user || (int) $user['is_active'] !== 1) {
        unset($_SESSION['user_id']);
        $cachedUserId = null;
        return $cached = null;
    }

    $cachedUserId = (int) $userId;
    return $cached = $user;
}

function auth_check(): bool
{
    return current_user() !== null;
}

function is_admin(): bool
{
    $user = current_user();
    return $user !== null && $user['role'] === 'admin';
}

function require_auth(): void
{
    if (!auth_check()) {
        flash('error', 'Нужно войти в аккаунт.');
        redirect_to('/login.php');
    }
}

function require_admin(): void
{
    if (!is_admin()) {
        redirect_to('/404.php');
    }
}

function login_user(int $userId): void
{
    session_regenerate_id(true);
    $_SESSION['user_id'] = $userId;
}

function logout_user(): void
{
    $_SESSION = [];
    if (ini_get('session.use_cookies')) {
        $params = session_get_cookie_params();
        setcookie(session_name(), '', time() - 42000, $params['path'], $params['domain'], (bool) $params['secure'], (bool) $params['httponly']);
    }
    session_destroy();
}

function attempt_login(string $email, string $password): bool
{
    $user = db_one('SELECT * FROM users WHERE email = :email LIMIT 1', ['email' => mb_strtolower(trim($email))]);
    if (!$user || (int) $user['is_active'] !== 1) {
        return false;
    }

    if (!password_verify($password, $user['password_hash'])) {
        return false;
    }

    login_user((int) $user['id']);
    return true;
}
