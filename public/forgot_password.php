<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';

if (is_post()) {
    verify_csrf();

    $email = mb_strtolower(trim((string) ($_POST['email'] ?? '')));
    $limit = check_rate_limit(
        'forgot_password',
        $email . '|' . client_ip(),
        (int) app_config('security.password_reset_attempts'),
        (int) app_config('security.password_reset_decay_seconds')
    );

    if ($limit['allowed'] && filter_var($email, FILTER_VALIDATE_EMAIL)) {
        $user = db_one('SELECT id, name, email FROM users WHERE email = :email LIMIT 1', ['email' => $email]);
        if ($user) {
            $token = create_password_reset_token((int) $user['id']);
            send_password_reset_email((string) $user['email'], (string) $user['name'], $token);
        }
    }

    flash('success', 'Если эл. почта зарегистрирована, инструкция отправлена.');
    redirect_to('/forgot_password.php');
}

$pageTitle = 'Восстановление пароля';
$pageClass = 'page-auth-brutal';
require ROOT_PATH . '/templates/header.php';
?>
<section class="auth-wrap">
    <div class="panel">
        <h1 style="margin-top:0;">Восстановление пароля</h1>
        <p class="muted">Введите эл. почту. Мы отправим ссылку для сброса пароля.</p>
        <form class="auth-form" method="post">
            <?= csrf_field() ?>
            <div class="field">
                <label for="email">Эл. почта</label>
                <input id="email" type="email" name="email" required>
            </div>
            <button class="btn btn-primary" type="submit">Отправить ссылку</button>
        </form>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
