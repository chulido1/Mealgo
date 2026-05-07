<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_once ROOT_PATH . '/includes/admin_helpers.php';
require_admin();

if (is_post()) {
    verify_csrf();
    $id = (int) ($_POST['id'] ?? 0);
    $role = (string) ($_POST['role'] ?? 'user');
    $isActive = isset($_POST['is_active']) ? 1 : 0;

    if (!in_array($role, ['user', 'admin'], true)) {
        $role = 'user';
    }

    if ($id > 0) {
        db_exec(
            'UPDATE users SET role = :role, is_active = :is_active, updated_at = :updated_at WHERE id = :id',
            ['role' => $role, 'is_active' => $isActive, 'updated_at' => now(), 'id' => $id]
        );
        admin_log((int) current_user()['id'], 'update', 'user', $id);
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
            <table>
                <thead>
                <tr>
                    <th>ID</th><th>Имя</th><th>Эл. почта</th><th>Телефон</th><th>Роль</th><th>Активен</th><th>Эл. почта подтверждена</th><th>Действия</th>
                </tr>
                </thead>
                <tbody>
                <?php foreach ($users as $user): ?>
                    <tr>
                        <td><?= (int) $user['id'] ?></td>
                        <td><?= e($user['name']) ?></td>
                        <td><?= e($user['email']) ?></td>
                        <td><?= e((string) $user['phone']) ?></td>
                        <td><?= e(user_role_label((string) $user['role'])) ?></td>
                        <td><?= (int) $user['is_active'] === 1 ? 'Да' : 'Нет' ?></td>
                        <td><?= $user['email_verified_at'] ? 'Да' : 'Нет' ?></td>
                        <td>
                            <form method="post" style="display:flex;gap:6px;align-items:center;">
                                <?= csrf_field() ?>
                                <input type="hidden" name="id" value="<?= (int) $user['id'] ?>">
                                <select name="role">
                                    <option value="user" <?= $user['role'] === 'user' ? 'selected' : '' ?>>Пользователь</option>
                                    <option value="admin" <?= $user['role'] === 'admin' ? 'selected' : '' ?>>Администратор</option>
                                </select>
                                <label style="display:flex;align-items:center;gap:4px;">
                                    <input type="checkbox" name="is_active" <?= (int) $user['is_active'] === 1 ? 'checked' : '' ?>> активен
                                </label>
                                <button class="btn btn-ghost" type="submit">Сохранить</button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
