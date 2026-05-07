<?php

declare(strict_types=1);

function create_email_verification_code(int $userId, string $email): string
{
    $code = (string) random_int(100000, 999999);
    db_exec(
        'INSERT INTO email_verification_codes (user_id, email, code, expires_at, created_at)
         VALUES (:user_id, :email, :code, :expires_at, :created_at)',
        [
            'user_id' => $userId,
            'email' => mb_strtolower(trim($email)),
            'code' => $code,
            'expires_at' => date('Y-m-d H:i:s', time() + 900),
            'created_at' => now(),
        ]
    );
    return $code;
}

function send_verification_email(string $email, string $name, string $code): bool
{
    $subject = 'Код подтверждения Mealgo';
    $html = mealgo_email_template(
        'Подтверждение почты',
        '<p style="margin:0 0 16px;">Здравствуйте, ' . e($name) . '!</p>'
        . '<p style="margin:0 0 14px;">Введите этот код на странице подтверждения:</p>'
        . '<div style="display:inline-block;padding:14px 18px;border-radius:14px;background:#f4f1ea;border:1px solid #ddd5c8;font-size:30px;font-weight:900;letter-spacing:.12em;color:#111111;">' . e($code) . '</div>'
        . '<p style="margin:16px 0 0;color:#6f685f;">Код действует 15 минут.</p>',
        null,
        'Если вы не регистрировались в Mealgo, просто проигнорируйте это письмо.'
    );

    return send_email($email, $subject, $html, "Ваш код подтверждения: {$code}");
}

function create_password_reset_token(int $userId): string
{
    $token = random_string(64);
    db_exec(
        'INSERT INTO password_reset_tokens (user_id, token, expires_at, created_at)
         VALUES (:user_id, :token, :expires_at, :created_at)',
        [
            'user_id' => $userId,
            'token' => $token,
            'expires_at' => date('Y-m-d H:i:s', time() + 3600),
            'created_at' => now(),
        ]
    );
    return $token;
}

function send_password_reset_email(string $email, string $name, string $token): bool
{
    $resetUrl = absolute_url('/reset_password.php?token=' . urlencode($token));
    $subject = 'Сброс пароля Mealgo';

    $html = mealgo_email_template(
        'Сброс пароля',
        '<p style="margin:0 0 16px;">Здравствуйте, ' . e($name) . '. Мы получили запрос на установку нового пароля для вашего аккаунта.</p>'
        . '<p style="margin:0;color:#6f685f;">Нажмите на кнопку ниже. Ссылка действует 60 минут.</p>',
        ['label' => 'Сбросить пароль', 'url' => $resetUrl],
        'Если кнопка не открывается, скопируйте ссылку в браузер: ' . $resetUrl
    );

    return send_email($email, $subject, $html, "Ссылка для сброса пароля Mealgo: {$resetUrl}");
}
