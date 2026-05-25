<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_once ROOT_PATH . '/includes/admin_helpers.php';
require_admin();

if (is_post()) {
    verify_csrf();
    $adminId = (int) current_user()['id'];
    $id = (int) ($_POST['id'] ?? 0);
    $role = (string) ($_POST['role'] ?? 'user');
    $isActive = (int) ($_POST['is_active'] ?? 0) === 1 ? 1 : 0;

    if (!in_array($role, ['user', 'admin'], true)) {
        $role = 'user';
    }

    if ($id > 0) {
        if ($id === $adminId && ($role !== 'admin' || $isActive !== 1)) {
            flash('error', 'Нельзя снять роль администратора или отключить собственный аккаунт.');
            redirect_to('/admin/users.php');
        }

        db_exec(
            'UPDATE users SET role = :role, is_active = :is_active, updated_at = :updated_at WHERE id = :id',
            ['role' => $role, 'is_active' => $isActive, 'updated_at' => now(), 'id' => $id]
        );
        admin_log($adminId, 'update', 'user', $id);
        flash('success', 'Пользователь обновлен.');
    }
    redirect_to('/admin/users.php');
}

$users = db_all('SELECT id, name, email, phone, role, is_active, email_verified_at, created_at FROM users ORDER BY id DESC');

$pageTitle = 'Админ: Пользователи';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container">
    <h1 style="margin-top:0;">Пользователи</h1>
    <div class="admin-layout">
        <?php render_admin_nav('users.php'); ?>
        <div class="panel">
            <div class="admin-table-scroll">
                <table class="admin-users-table">
                    <thead>
                    <tr>
                        <th>ID</th><th>Имя</th><th>Эл. почта</th><th>Телефон</th><th>Роль</th><th>Активен</th><th>Эл. почта подтверждена</th><th>Действия</th>
                    </tr>
                    </thead>
                <tbody>
                <?php foreach ($users as $user): ?>
                    <?php $formId = 'admin-user-form-' . (int) $user['id']; ?>
                    <tr>
                        <td><?= (int) $user['id'] ?></td>
                        <td><?= e($user['name']) ?></td>
                        <td><span class="admin-user-email"><?= e($user['email']) ?></span></td>
                        <td><span class="admin-user-phone"><?= e((string) $user['phone']) ?></span></td>
                        <td>
                            <select name="role" form="<?= e($formId) ?>" aria-label="Роль пользователя">
                                <option value="user" <?= $user['role'] === 'user' ? 'selected' : '' ?>>Пользователь</option>
                                <option value="admin" <?= $user['role'] === 'admin' ? 'selected' : '' ?>>Администратор</option>
                            </select>
                        </td>
                        <td>
                            <select name="is_active" form="<?= e($formId) ?>" aria-label="Активность пользователя">
                                <option value="1" <?= (int) $user['is_active'] === 1 ? 'selected' : '' ?>>Да</option>
                                <option value="0" <?= (int) $user['is_active'] === 0 ? 'selected' : '' ?>>Нет</option>
                            </select>
                        </td>
                        <td><?= $user['email_verified_at'] ? 'Да' : 'Нет' ?></td>
                        <td>
                            <form id="<?= e($formId) ?>" method="post" class="admin-user-save-form">
                                <?= csrf_field() ?>
                                <input type="hidden" name="id" value="<?= (int) $user['id'] ?>">
                                <button class="btn btn-ghost" type="submit">Сохранить</button>
                            </form>
                        </td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
