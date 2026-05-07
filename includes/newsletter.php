<?php

declare(strict_types=1);

function ensure_newsletter_table(): void
{
    db()->exec(
        "CREATE TABLE IF NOT EXISTS newsletter_subscribers (
            id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
            email VARCHAR(190) NOT NULL,
            status ENUM('active', 'unsubscribed') NOT NULL DEFAULT 'active',
            source VARCHAR(80) NOT NULL DEFAULT 'footer',
            ip_address VARCHAR(64) NULL,
            user_agent VARCHAR(255) NULL,
            subscribed_at DATETIME NOT NULL,
            updated_at DATETIME NOT NULL,
            UNIQUE KEY uq_newsletter_email (email),
            INDEX idx_newsletter_status (status),
            INDEX idx_newsletter_created (subscribed_at)
        ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci"
    );
}

function subscribe_newsletter(string $email, string $source = 'footer'): void
{
    ensure_newsletter_table();

    $now = now();
    db_exec(
        'INSERT INTO newsletter_subscribers
            (email, status, source, ip_address, user_agent, subscribed_at, updated_at)
         VALUES
            (:email, "active", :source, :ip_address, :user_agent, :subscribed_at, :updated_at)
         ON DUPLICATE KEY UPDATE
            status = "active",
            source = VALUES(source),
            ip_address = VALUES(ip_address),
            user_agent = VALUES(user_agent),
            updated_at = VALUES(updated_at)',
        [
            'email' => mb_strtolower(trim($email)),
            'source' => mb_substr($source, 0, 80),
            'ip_address' => client_ip(),
            'user_agent' => mb_substr((string) ($_SERVER['HTTP_USER_AGENT'] ?? ''), 0, 255),
            'subscribed_at' => $now,
            'updated_at' => $now,
        ]
    );
}

function newsletter_subscription_exists(string $email): bool
{
    ensure_newsletter_table();

    $row = db_one(
        'SELECT id FROM newsletter_subscribers WHERE email = :email AND status = "active" LIMIT 1',
        ['email' => mb_strtolower(trim($email))]
    );

    return $row !== null;
}

function send_newsletter_welcome_email(string $email): bool
{
    $subject = 'Вы подписались на новости Mealgo';
    $html = mealgo_email_template(
        'Добро пожаловать в Mealgo',
        '<p style="margin:0 0 16px;">Вы подписались на новости и обновления сервиса доставки еды Mealgo.</p>'
        . '<p style="margin:0;color:#6f685f;">Мы будем присылать подборки ресторанов, новые блюда и полезные обновления проекта.</p>',
        ['label' => 'Открыть каталог', 'url' => absolute_url('/restaurants.php')],
        'Вы получили это письмо, потому что подписались на новости через форму на сайте Mealgo.'
    );
    $text = 'Вы подписались на новости Mealgo. Мы будем присылать подборки ресторанов, новые блюда и обновления проекта.';

    return send_email($email, $subject, $html, $text);
}
