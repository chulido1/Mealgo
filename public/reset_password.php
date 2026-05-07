<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';

$token = trim((string) ($_GET['token'] ?? $_POST['token'] ?? ''));
$record = $token !== '' ? db_one(
    'SELECT prt.*, u.email
     FROM password_reset_tokens prt
     JOIN users u ON u.id = prt.user_id
     WHERE prt.token = :token
       AND prt.used_at IS NULL
       AND prt.expires_at > :now
     LIMIT 1',
    ['token' => $token, 'now' => now()]
) : null;

if (is_post()) {
    verify_csrf();

    $password = (string) ($_POST['password'] ?? '');
    $passwordConfirmation = (string) ($_POST['password_confirmation'] ?? '');

    if (!$record) {
        flash('error', 'Токен недействителен или истек.');
        redirect_to('/forgot_password.php');
    }

    $passwordErrors = validate(['password' => ['required', 'min:8', 'password_strong']], ['password' => $password]);
    if ($passwordErrors || $password !== $passwordConfirmation) {
        flash('error', $passwordErrors['password'] ?? 'Пароли должны совпадать в обоих полях.');
        redirect_to('/reset_password.php?token=' . urlencode($token));
    }

    db_exec(
        'UPDATE users SET password_hash = :password_hash, updated_at = :updated_at WHERE id = :id',
        [
            'password_hash' => password_hash($password, PASSWORD_DEFAULT),
            'updated_at' => now(),
            'id' => $record['user_id'],
        ]
    );
    db_exec(
        'UPDATE password_reset_tokens SET used_at = :used_at WHERE id = :id',
        ['used_at' => now(), 'id' => $record['id']]
    );

    flash('success', 'Пароль обновлен. Теперь можно войти.');
    redirect_to('/login.php');
}

$pageTitle = 'Новый пароль';
$pageClass = 'page-auth-brutal';
require ROOT_PATH . '/templates/header.php';
?>
<section class="auth-wrap">
    <div class="panel">
        <h1 style="margin-top:0;">Установка нового пароля</h1>
        <?php if (!$record): ?>
            <div class="empty-state">Ссылка недействительна или устарела.</div>
        <?php else: ?>
            <p class="muted">Новый пароль для <?= e((string) $record['email']) ?></p>
            <form class="auth-form" method="post">
                <?= csrf_field() ?>
                <input type="hidden" name="token" value="<?= e($token) ?>">
                <div class="field">
                    <label for="password">Новый пароль</label>
                    <input id="password" type="password" name="password" minlength="8" required>
                    <small class="form-hint">Минимум 8 символов, заглавная буква и спецсимвол.</small>
                </div>
                <div class="field">
                    <label for="password_confirmation">Подтвердите пароль</label>
                    <input id="password_confirmation" type="password" name="password_confirmation" minlength="8" required>
                </div>
                <button class="btn btn-primary" type="submit">Сохранить пароль</button>
            </form>
        <?php endif; ?>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
