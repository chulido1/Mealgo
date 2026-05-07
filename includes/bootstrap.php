<?php

declare(strict_types=1);

define('ROOT_PATH', dirname(__DIR__));

$appConfig = require ROOT_PATH . '/config/app.php';
$dbConfig = require ROOT_PATH . '/config/database.php';

date_default_timezone_set($appConfig['timezone']);

if (session_status() === PHP_SESSION_NONE) {
    session_name($appConfig['session_name']);
    session_start([
        'cookie_httponly' => true,
        'cookie_samesite' => 'Lax',
        'use_strict_mode' => true,
    ]);
}

require_once ROOT_PATH . '/includes/db.php';
require_once ROOT_PATH . '/includes/functions.php';
require_once ROOT_PATH . '/includes/security.php';
require_once ROOT_PATH . '/includes/auth.php';
require_once ROOT_PATH . '/includes/validation.php';
require_once ROOT_PATH . '/includes/auth_flows.php';
require_once ROOT_PATH . '/includes/mailer.php';
require_once ROOT_PATH . '/includes/newsletter.php';
require_once ROOT_PATH . '/includes/repositories.php';
require_once ROOT_PATH . '/includes/cart.php';
require_once ROOT_PATH . '/includes/order.php';
