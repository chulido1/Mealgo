<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';
require_auth();

$user = current_user();
if ($user['email_verified_at']) {
    flash('success', 'Эл. почта уже подтверждена.');
    redirect_to('/profile.php');
}

if (is_post()) {
    verify_csrf();

    $action = (string) ($_POST['action'] ?? 'verify');
    if ($action === 'resend') {
        $limit = check_rate_limit(
            'verify_resend',
            (string) $user['id'],
            (int) app_config('security.verification_attempts'),
            (int) app_config('security.verification_decay_seconds')
        );

        if (!$limit['allowed']) {
            flash('error', 'Слишком много запросов на повторную отправку.');
        } else {
            $code = create_email_verification_code((int) $user['id'], (string) $user['email']);
            send_verification_email((string) $user['email'], (string) $user['name'], $code);
            flash('success', 'Новый код отправлен.');
        }
        redirect_to('/verify_email.php');
    }

    $code = trim((string) ($_POST['code'] ?? ''));
    $row = db_one(
        'SELECT * FROM email_verification_codes
         WHERE user_id = :user_id
           AND code = :code
           AND verified_at IS NULL
           AND expires_at > :now
         ORDER BY id DESC
         LIMIT 1',
        [
            'user_id' => $user['id'],
            'code' => $code,
            'now' => now(),
        ]
    );

    if (!$row) {
        flash('error', 'Неверный или просроченный код.');
        redirect_to('/verify_email.php');
    }

    db_exec(
        'UPDATE email_verification_codes SET verified_at = :verified_at WHERE id = :id',
        ['verified_at' => now(), 'id' => $row['id']]
    );
    db_exec(
        'UPDATE users SET email_verified_at = :verified_at, updated_at = :updated_at WHERE id = :id',
        ['verified_at' => now(), 'updated_at' => now(), 'id' => $user['id']]
    );

    flash('success', 'Эл. почта подтверждена.');
    redirect_to('/profile.php');
}

$pageTitle = 'Подтверждение эл. почты';
$pageClass = 'page-auth-brutal';
require ROOT_PATH . '/templates/header.php';
?>
<section class="auth-wrap">
    <div class="panel">
        <h1 style="margin-top:0;">Подтвердите эл. почту</h1>
        <p class="muted">Мы отправили код на <?= e((string) $user['email']) ?>.</p>
        <form class="auth-form" method="post" style="margin-top:12px;">
            <?= csrf_field() ?>
            <input type="hidden" name="action" value="verify">
            <div class="field">
                <label for="code">Код подтверждения</label>
                <input id="code" type="text" name="code" minlength="6" maxlength="6" required>
            </div>
            <button class="btn btn-primary" type="submit">Подтвердить</button>
        </form>
        <form class="auth-form" method="post" style="margin-top:10px;">
            <?= csrf_field() ?>
            <input type="hidden" name="action" value="resend">
            <button class="btn btn-ghost" type="submit">Отправить код повторно</button>
        </form>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
