<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';

if (auth_check()) {
    logout_user();
}

session_name(app_config('session_name'));
session_start([
    'cookie_httponly' => true,
    'cookie_samesite' => 'Lax',
]);
flash('success', 'Вы вышли из аккаунта.');
redirect_to('/login.php');

