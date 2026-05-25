<?php

declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';

function newsletter_redirect_back(): never
{
    $target = (string) ($_POST['_redirect'] ?? '');
    $base = base_url('/');

    if ($target !== '' && str_starts_with($target, $base)) {
        header('Location: ' . $target);
        exit;
    }

    redirect_to('/index.php#footer-subscribe');
}

if (!is_post()) {
    redirect_to('/index.php#footer-subscribe');
}

verify_csrf();

$email = mb_strtolower(trim((string) ($_POST['email'] ?? '')));
with_old_input(['newsletter_email' => $email]);

$limit = check_rate_limit(
    'newsletter_subscribe',
    ($email !== '' ? $email : 'empty') . '|' . client_ip(),
    5,
    600
);

if (!$limit['allowed']) {
    flash('error', 'Слишком много попыток подписки. Попробуйте чуть позже.');
    newsletter_redirect_back();
}

if (!filter_var($email, FILTER_VALIDATE_EMAIL)) {
    flash('error', 'Введите корректную эл. почту для подписки.');
    newsletter_redirect_back();
}

try {
    if (newsletter_subscription_exists($email)) {
        clear_old_input();
        flash('success', 'Эта эл. почта уже подписана на новости Mealgo.');
        newsletter_redirect_back();
    }

    subscribe_newsletter($email);
    clear_old_input();

    if (send_newsletter_welcome_email($email)) {
        flash('success', 'Подписка оформлена. Письмо отправлено вам на почту.');
    } else {
        flash('error', 'Подписка сохранена, но MailHog сейчас не отвечает. Проверьте, что MailHog запущен на 127.0.0.1:1025.');
    }
} catch (Throwable $exception) {
    app_log('newsletter_error', [
        'email' => $email,
        'message' => $exception->getMessage(),
    ]);
    flash('error', 'Не удалось оформить подписку. Попробуйте позже.');
}

newsletter_redirect_back();
