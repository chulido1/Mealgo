<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';

if (auth_check()) {
    redirect_to(is_admin() ? '/admin/index.php' : '/profile.php');
}

if (is_post()) {
    verify_csrf();

    $email = mb_strtolower(trim((string) ($_POST['email'] ?? '')));
    $password = (string) ($_POST['password'] ?? '');
    with_old_input(['email' => $email]);

    $limit = check_rate_limit(
        'login',
        $email . '|' . client_ip(),
        (int) app_config('security.login_attempts'),
        (int) app_config('security.login_decay_seconds')
    );

    if (!$limit['allowed']) {
        flash('error', 'Слишком много попыток входа. Повторите позже.');
        redirect_to('/login.php');
    }

    if (!attempt_login($email, $password)) {
        log_security_event('login', 'failed', ['email' => $email]);
        flash('error', 'Неверная эл. почта или пароль.');
        redirect_to('/login.php');
    }

    clear_old_input();
    $user = current_user();
    if ($user && !$user['email_verified_at']) {
        flash('error', 'Подтвердите эл. почту кодом для полного доступа.');
        redirect_to('/verify_email.php');
    }

    flash('success', 'Вы успешно вошли.');
    redirect_to(is_admin() ? '/admin/index.php' : '/profile.php');
}

$pageTitle = 'Вход';
$pageClass = 'page-auth-brutal';
require ROOT_PATH . '/templates/header.php';
?>
<section class="auth-wrap">
    <div class="panel">
        <h1 style="margin-top:0;">Вход в аккаунт</h1>
        <form class="auth-form" method="post">
            <?= csrf_field() ?>
            <div class="field">
                <label for="email">Эл. почта</label>
                <input id="email" type="email" name="email" value="<?= e(old('email')) ?>" required>
            </div>
            <div class="field">
                <label for="password">Пароль</label>
                <input id="password" type="password" name="password" required>
            </div>
            <button class="btn btn-primary" type="submit">Войти</button>
        </form>
        <p class="muted">
            <a href="<?= e(base_url('/forgot_password.php')) ?>">Забыли пароль?</a>
            ·
            <a href="<?= e(base_url('/register.php')) ?>">Регистрация</a>
        </p>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
