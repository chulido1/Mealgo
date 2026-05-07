<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';

if (auth_check()) {
    redirect_to('/profile.php');
}

if (is_post()) {
    verify_csrf();

    $limit = check_rate_limit(
        'register',
        client_ip(),
        (int) app_config('security.register_attempts'),
        (int) app_config('security.register_decay_seconds')
    );

    if (!$limit['allowed']) {
        flash('error', 'Слишком много попыток регистрации. Повторите позже.');
        redirect_to('/register.php');
    }

    $data = [
        'name' => trim((string) ($_POST['name'] ?? '')),
        'email' => mb_strtolower(trim((string) ($_POST['email'] ?? ''))),
        'phone' => trim((string) ($_POST['phone'] ?? '')),
        'password' => (string) ($_POST['password'] ?? ''),
        'password_confirmation' => (string) ($_POST['password_confirmation'] ?? ''),
        'terms' => (string) ($_POST['terms'] ?? ''),
    ];

    $errors = validate([
        'name' => ['required', 'min:2'],
        'email' => ['required', 'email'],
        'phone' => ['required', 'min:6'],
        'password' => ['required', 'min:8', 'password_strong'],
    ], $data);

    if ($data['password'] !== $data['password_confirmation']) {
        $errors['password_confirmation'] = 'Пароли не совпадают.';
    }
    if ($data['terms'] !== '1') {
        $errors['terms'] = 'Нужно согласие с условиями.';
    }

    if (db_one('SELECT id FROM users WHERE email = :email LIMIT 1', ['email' => $data['email']])) {
        $errors['email'] = 'Эл. почта уже используется.';
    }

    if ($errors) {
        with_old_input($data);
        flash('error', implode(' ', array_values($errors)));
        redirect_to('/register.php');
    }

    db_exec(
        'INSERT INTO users (name, email, phone, password_hash, role, is_active, created_at, updated_at)
         VALUES (:name, :email, :phone, :password_hash, "user", 1, :created_at, :updated_at)',
        [
            'name' => $data['name'],
            'email' => $data['email'],
            'phone' => $data['phone'],
            'password_hash' => password_hash($data['password'], PASSWORD_DEFAULT),
            'created_at' => now(),
            'updated_at' => now(),
        ]
    );

    $userId = (int) db()->lastInsertId();
    login_user($userId);
    $code = create_email_verification_code($userId, $data['email']);
    send_verification_email($data['email'], $data['name'], $code);

    clear_old_input();
    flash('success', 'Регистрация успешна. Введите код из письма для подтверждения эл. почты.');
    redirect_to('/verify_email.php');
}

$pageTitle = 'Регистрация';
$pageClass = 'page-auth-brutal';
require ROOT_PATH . '/templates/header.php';
?>
<section class="auth-wrap">
    <div class="panel">
        <h1 style="margin-top:0;">Создать аккаунт</h1>
        <form class="auth-form" method="post">
            <?= csrf_field() ?>
            <div class="field">
                <label for="name">Имя</label>
                <input id="name" type="text" name="name" value="<?= e(old('name')) ?>" required>
            </div>
            <div class="two-col">
                <div class="field">
                    <label for="email">Эл. почта</label>
                    <input id="email" type="email" name="email" value="<?= e(old('email')) ?>" required>
                </div>
                <div class="field">
                    <label for="phone">Телефон</label>
                    <input id="phone" type="tel" name="phone" value="<?= e(old('phone')) ?>" placeholder="+7 (___) ___-__-__" required>
                </div>
            </div>
            <div class="two-col">
                <div class="field">
                    <label for="password">Пароль</label>
                    <input id="password" type="password" name="password" minlength="8" required>
                    <small class="form-hint">Минимум 8 символов, заглавная буква и спецсимвол.</small>
                </div>
                <div class="field">
                    <label for="password_confirmation">Подтверждение пароля</label>
                    <input id="password_confirmation" type="password" name="password_confirmation" required>
                </div>
            </div>
            <label class="auth-terms">
                <input type="checkbox" name="terms" value="1" <?= old('terms') === '1' ? 'checked' : '' ?>>
                Я согласен с условиями сервиса
            </label>
            <button class="btn btn-primary" type="submit">Зарегистрироваться</button>
        </form>
        <p class="muted">Уже есть аккаунт? <a href="<?= e(base_url('/login.php')) ?>">Войти</a></p>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
