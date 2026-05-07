<?php

declare(strict_types=1);

return [
    'app_name' => getenv('APP_NAME') ?: 'Mealgo',
    'app_url' => getenv('APP_URL') ?: '/diplomv2/public',
    'app_public_url' => getenv('APP_PUBLIC_URL') ?: 'http://localhost/diplomv2/public',
    'timezone' => getenv('APP_TIMEZONE') ?: 'Europe/Moscow',
    'session_name' => getenv('SESSION_NAME') ?: 'mealgo_session',
    'mail' => [
        'driver' => getenv('MAIL_DRIVER') ?: 'smtp',
        'from_email' => getenv('MAIL_FROM') ?: 'no-reply@mealgo.local',
        'from_name' => getenv('MAIL_FROM_NAME') ?: 'Mealgo',
        'smtp_host' => getenv('MAIL_HOST') ?: '127.0.0.1',
        'smtp_port' => (int) (getenv('MAIL_PORT') ?: 1025),
    ],
    'security' => [
        'login_attempts' => 5,
        'login_decay_seconds' => 600,
        'register_attempts' => 4,
        'register_decay_seconds' => 3600,
        'verification_attempts' => 6,
        'verification_decay_seconds' => 600,
        'password_reset_attempts' => 4,
        'password_reset_decay_seconds' => 1800,
    ],
    'maps' => [
        'provider' => getenv('MAP_PROVIDER') ?: 'dadata',
        'nominatim_url' => getenv('NOMINATIM_URL') ?: 'https://nominatim.openstreetmap.org/search',
        'dadata_suggest_url' => getenv('DADATA_SUGGEST_URL') ?: 'https://suggestions.dadata.ru/suggestions/api/4_1/rs/suggest/address',
        'dadata_api_key' => getenv('DADATA_API_KEY') ?: '76cb7a0cd7c96a33f60bd54eb12309d00ea32aac',
    ],
];
