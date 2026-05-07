<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_once ROOT_PATH . '/includes/admin_helpers.php';
require_admin();

$restaurants = db_all('SELECT id, name FROM restaurants ORDER BY name ASC');

if (is_post()) {
    verify_csrf();
    $action = (string) ($_POST['action'] ?? '');
    $adminId = (int) current_user()['id'];

    if ($action === 'save') {
        $id = (int) ($_POST['id'] ?? 0);
        $payload = [
            'restaurant_id' => (int) ($_POST['restaurant_id'] ?? 0),
            'name' => trim((string) ($_POST['name'] ?? '')),
            'sort_order' => (int) ($_POST['sort_order'] ?? 0),
            'is_active' => isset($_POST['is_active']) ? 1 : 0,
        ];

        if ($payload['restaurant_id'] <= 0 || $payload['name'] === '') {
            flash('error', 'Ресторан и название категории обязательны.');
            redirect_to('/admin/menu_categories.php');
        }

        if ($id > 0) {
            db_exec(
                'UPDATE menu_categories SET
                    restaurant_id=:restaurant_id, name=:name, sort_order=:sort_order, is_active=:is_active, updated_at=:updated_at
                 WHERE id=:id',
                $payload + ['updated_at' => now(), 'id' => $id]
            );
            admin_log($adminId, 'update', 'menu_category', $id);
            flash('success', 'Категория меню обновлена.');
        } else {
            db_exec(
                'INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
                 VALUES (:restaurant_id, :name, :sort_order, :is_active, :created_at, :updated_at)',
                $payload + ['created_at' => now(), 'updated_at' => now()]
            );
            $newId = (int) db()->lastInsertId();
            admin_log($adminId, 'create', 'menu_category', $newId);
            flash('success', 'Категория меню создана.');
        }
        redirect_to('/admin/menu_categories.php');
    }
}

$editId = (int) ($_GET['edit'] ?? 0);
$editing = $editId > 0 ? db_one('SELECT * FROM menu_categories WHERE id = :id', ['id' => $editId]) : null;
$rows = db_all(
    'SELECT mc.*, r.name AS restaurant_name
     FROM menu_categories mc
     JOIN restaurants r ON r.id = mc.restaurant_id
     ORDER BY mc.id DESC'
);

$pageTitle = 'Админ: Категории меню';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container">
    <h1 style="margin-top:0;">Категории меню</h1>
    <div class="admin-layout">
        <?php render_admin_nav('menu_categories.php'); ?>
        <div>
            <div class="panel">
                <h3 style="margin-top:0;"><?= $editing ? 'Редактирование' : 'Новая категория меню' ?></h3>
                <form method="post">
                    <?= csrf_field() ?>
                    <input type="hidden" name="action" value="save">
                    <input type="hidden" name="id" value="<?= (int) ($editing['id'] ?? 0) ?>">
                    <div class="two-col">
                        <div class="field">
                            <label>Ресторан</label>
                            <select name="restaurant_id" required>
                                <option value="">Выберите ресторан</option>
                                <?php foreach ($restaurants as $restaurant): ?>
                                    <option value="<?= (int) $restaurant['id'] ?>" <?= (int) ($editing['restaurant_id'] ?? 0) === (int) $restaurant['id'] ? 'selected' : '' ?>>
                                        <?= e($restaurant['name']) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="field"><label>Название</label><input name="name" value="<?= e((string) ($editing['name'] ?? '')) ?>" required></div>
                    </div>
                    <div class="two-col">
                        <div class="field"><label>Порядок</label><input type="number" name="sort_order" value="<?= e((string) ($editing['sort_order'] ?? 0)) ?>"></div>
                        <label style="display:flex;align-items:center;gap:8px;"><input type="checkbox" name="is_active" <?= !isset($editing['is_active']) || (int) $editing['is_active'] === 1 ? 'checked' : '' ?>> Активна</label>
                    </div>
                    <button class="btn btn-primary" type="submit"><?= $editing ? 'Сохранить' : 'Создать' ?></button>
                </form>
            </div>

            <div class="panel" style="margin-top:16px;">
                <table>
                    <thead><tr><th>ID</th><th>Ресторан</th><th>Категория</th><th>Порядок</th><th>Активна</th><th></th></tr></thead>
                    <tbody>
                    <?php foreach ($rows as $row): ?>
                        <tr>
                            <td><?= (int) $row['id'] ?></td>
                            <td><?= e($row['restaurant_name']) ?></td>
                            <td><?= e($row['name']) ?></td>
                            <td><?= (int) $row['sort_order'] ?></td>
                            <td><?= (int) $row['is_active'] === 1 ? 'Да' : 'Нет' ?></td>
                            <td><a class="btn btn-ghost" href="<?= e(admin_url('menu_categories.php?edit=' . (int) $row['id'])) ?>">Редактировать</a></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
