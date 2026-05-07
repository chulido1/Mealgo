<?php

declare(strict_types=1);

return [
    'host' => getenv('DB_HOST') ?: '127.0.0.1',
    'port' => (int) (getenv('DB_PORT') ?: 3306),
    'name' => getenv('DB_DATABASE') ?: 'diplom_foodhub',
    'user' => getenv('DB_USERNAME') ?: 'root',
    'pass' => getenv('DB_PASSWORD') !== false ? getenv('DB_PASSWORD') : '',
    'charset' => getenv('DB_CHARSET') ?: 'utf8mb4',
];

