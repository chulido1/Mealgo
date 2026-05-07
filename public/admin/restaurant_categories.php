<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_once ROOT_PATH . '/includes/admin_helpers.php';
require_admin();

if (is_post()) {
    verify_csrf();
    $action = (string) ($_POST['action'] ?? '');
    $adminId = (int) current_user()['id'];

    if ($action === 'save') {
        $id = (int) ($_POST['id'] ?? 0);
        $name = trim((string) ($_POST['name'] ?? ''));
        $slug = trim((string) ($_POST['slug'] ?? ''));
        $isActive = isset($_POST['is_active']) ? 1 : 0;

        if ($name === '' || $slug === '') {
            flash('error', 'Название и слаг обязательны.');
            redirect_to('/admin/restaurant_categories.php');
        }

        if ($id > 0) {
            db_exec(
                'UPDATE restaurant_categories SET name=:name, slug=:slug, is_active=:is_active WHERE id=:id',
                ['name' => $name, 'slug' => $slug, 'is_active' => $isActive, 'id' => $id]
            );
            admin_log($adminId, 'update', 'restaurant_category', $id);
            flash('success', 'Категория обновлена.');
        } else {
            db_exec(
                'INSERT INTO restaurant_categories (name, slug, is_active) VALUES (:name, :slug, :is_active)',
                ['name' => $name, 'slug' => $slug, 'is_active' => $isActive]
            );
            $newId = (int) db()->lastInsertId();
            admin_log($adminId, 'create', 'restaurant_category', $newId);
            flash('success', 'Категория создана.');
        }
        redirect_to('/admin/restaurant_categories.php');
    }
}

$editId = (int) ($_GET['edit'] ?? 0);
$editing = $editId > 0 ? db_one('SELECT * FROM restaurant_categories WHERE id = :id', ['id' => $editId]) : null;
$rows = db_all('SELECT * FROM restaurant_categories ORDER BY id DESC');

$pageTitle = 'Админ: Категории кухонь';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container">
    <h1 style="margin-top:0;">Категории кухонь</h1>
    <div class="admin-layout">
        <?php render_admin_nav('restaurant_categories.php'); ?>
        <div>
            <div class="panel">
                <h3 style="margin-top:0;"><?= $editing ? 'Редактирование' : 'Новая категория' ?></h3>
                <form method="post">
                    <?= csrf_field() ?>
                    <input type="hidden" name="action" value="save">
                    <input type="hidden" name="id" value="<?= (int) ($editing['id'] ?? 0) ?>">
                    <div class="two-col">
                        <div class="field"><label>Название</label><input name="name" value="<?= e((string) ($editing['name'] ?? '')) ?>" required></div>
                        <div class="field"><label>Слаг</label><input name="slug" value="<?= e((string) ($editing['slug'] ?? '')) ?>" required></div>
                    </div>
                    <label style="display:flex;align-items:center;gap:8px;">
                        <input type="checkbox" name="is_active" <?= !isset($editing['is_active']) || (int) $editing['is_active'] === 1 ? 'checked' : '' ?>>
                        Активна
                    </label>
                    <button class="btn btn-primary" type="submit"><?= $editing ? 'Сохранить' : 'Создать' ?></button>
                    <?php if ($editing): ?><a class="btn btn-ghost" href="<?= e(admin_url('restaurant_categories.php')) ?>">Отмена</a><?php endif; ?>
                </form>
            </div>

            <div class="panel" style="margin-top:16px;">
                <table>
                    <thead><tr><th>ID</th><th>Название</th><th>Слаг</th><th>Активна</th><th></th></tr></thead>
                    <tbody>
                    <?php foreach ($rows as $row): ?>
                        <tr>
                            <td><?= (int) $row['id'] ?></td>
                            <td><?= e($row['name']) ?></td>
                            <td><?= e($row['slug']) ?></td>
                            <td><?= (int) $row['is_active'] === 1 ? 'Да' : 'Нет' ?></td>
                            <td><a class="btn btn-ghost" href="<?= e(admin_url('restaurant_categories.php?edit=' . (int) $row['id'])) ?>">Редактировать</a></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
