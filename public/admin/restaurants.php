<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_once ROOT_PATH . '/includes/admin_helpers.php';
require_admin();

$admin = current_user();
$kitchenCategories = db_all('SELECT id, name FROM restaurant_categories WHERE is_active = 1 ORDER BY name ASC');

if (is_post()) {
    verify_csrf();
    $action = (string) ($_POST['action'] ?? '');

    if ($action === 'save') {
        $id = (int) ($_POST['id'] ?? 0);
        $data = [
            'name' => trim((string) ($_POST['name'] ?? '')),
            'short_description' => trim((string) ($_POST['short_description'] ?? '')),
            'logo_image' => trim((string) ($_POST['logo_image'] ?? '')),
            'banner_image' => trim((string) ($_POST['banner_image'] ?? '')),
            'address' => trim((string) ($_POST['address'] ?? '')),
            'phone' => trim((string) ($_POST['phone'] ?? '')),
            'working_hours' => trim((string) ($_POST['working_hours'] ?? '')),
            'rating' => (float) ($_POST['rating'] ?? 0),
            'delivery_fee' => (float) ($_POST['delivery_fee'] ?? 0),
            'min_order_amount' => (float) ($_POST['min_order_amount'] ?? 0),
            'delivery_time_min' => (int) ($_POST['delivery_time_min'] ?? 30),
            'delivery_time_max' => (int) ($_POST['delivery_time_max'] ?? 60),
            'is_active' => isset($_POST['is_active']) ? 1 : 0,
        ];

        if ($data['name'] === '') {
            flash('error', 'Название ресторана обязательно.');
            redirect_to('/admin/restaurants.php');
        }

        if ($id > 0) {
            db_exec(
                'UPDATE restaurants SET
                    name=:name, short_description=:short_description, logo_image=:logo_image, banner_image=:banner_image,
                    address=:address, phone=:phone, working_hours=:working_hours, rating=:rating, delivery_fee=:delivery_fee,
                    min_order_amount=:min_order_amount, delivery_time_min=:delivery_time_min, delivery_time_max=:delivery_time_max,
                    is_active=:is_active, updated_at=:updated_at
                 WHERE id=:id',
                $data + ['updated_at' => now(), 'id' => $id]
            );
            $targetId = $id;
            admin_log((int) $admin['id'], 'update', 'restaurant', $id);
            flash('success', 'Ресторан обновлен.');
        } else {
            db_exec(
                'INSERT INTO restaurants (
                    name, short_description, logo_image, banner_image, address, phone, working_hours, rating, delivery_fee,
                    min_order_amount, delivery_time_min, delivery_time_max, is_active, created_at, updated_at
                 ) VALUES (
                    :name, :short_description, :logo_image, :banner_image, :address, :phone, :working_hours, :rating, :delivery_fee,
                    :min_order_amount, :delivery_time_min, :delivery_time_max, :is_active, :created_at, :updated_at
                 )',
                $data + ['created_at' => now(), 'updated_at' => now()]
            );
            $targetId = (int) db()->lastInsertId();
            admin_log((int) $admin['id'], 'create', 'restaurant', $targetId);
            flash('success', 'Ресторан создан.');
        }

        db_exec('DELETE FROM restaurant_category_links WHERE restaurant_id = :restaurant_id', ['restaurant_id' => $targetId]);
        $categoryIds = $_POST['category_ids'] ?? [];
        if (is_array($categoryIds)) {
            foreach ($categoryIds as $categoryId) {
                $categoryId = (int) $categoryId;
                if ($categoryId <= 0) {
                    continue;
                }
                db_exec(
                    'INSERT IGNORE INTO restaurant_category_links (restaurant_id, category_id) VALUES (:restaurant_id, :category_id)',
                    ['restaurant_id' => $targetId, 'category_id' => $categoryId]
                );
            }
        }
        redirect_to('/admin/restaurants.php');
    }

    if ($action === 'toggle') {
        $id = (int) ($_POST['id'] ?? 0);
        db_exec(
            'UPDATE restaurants SET is_active = CASE WHEN is_active = 1 THEN 0 ELSE 1 END, updated_at=:updated_at WHERE id=:id',
            ['updated_at' => now(), 'id' => $id]
        );
        admin_log((int) $admin['id'], 'toggle_active', 'restaurant', $id);
        flash('success', 'Статус ресторана изменен.');
        redirect_to('/admin/restaurants.php');
    }
}

$editId = (int) ($_GET['edit'] ?? 0);
$editing = $editId > 0 ? db_one('SELECT * FROM restaurants WHERE id = :id', ['id' => $editId]) : null;
$selectedCategories = [];
if ($editing) {
    $selectedCategories = db_all('SELECT category_id FROM restaurant_category_links WHERE restaurant_id = :id', ['id' => $editing['id']]);
    $selectedCategories = array_map(static fn (array $row): int => (int) $row['category_id'], $selectedCategories);
}
$restaurants = db_all('SELECT * FROM restaurants ORDER BY created_at DESC');

$pageTitle = 'Админ: Рестораны';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container">
    <h1 style="margin-top:0;">Управление ресторанами</h1>
    <div class="admin-layout">
        <?php render_admin_nav('restaurants.php'); ?>
        <div>
            <div class="panel">
                <h3 style="margin-top:0;"><?= $editing ? 'Редактировать ресторан' : 'Новый ресторан' ?></h3>
                <form method="post">
                    <?= csrf_field() ?>
                    <input type="hidden" name="action" value="save">
                    <input type="hidden" name="id" value="<?= (int) ($editing['id'] ?? 0) ?>">
                    <div class="two-col">
                        <div class="field"><label>Название</label><input name="name" value="<?= e((string) ($editing['name'] ?? '')) ?>" required></div>
                        <div class="field"><label>Рейтинг</label><input type="number" step="0.1" min="0" max="5" name="rating" value="<?= e((string) ($editing['rating'] ?? 0)) ?>"></div>
                    </div>
                    <div class="field"><label>Описание</label><textarea name="short_description"><?= e((string) ($editing['short_description'] ?? '')) ?></textarea></div>
                    <div class="two-col">
                        <div class="field"><label>Логотип (путь)</label><input name="logo_image" value="<?= e((string) ($editing['logo_image'] ?? '/uploads/restaurants/placeholder.svg')) ?>"></div>
                        <div class="field"><label>Баннер (путь)</label><input name="banner_image" value="<?= e((string) ($editing['banner_image'] ?? '/uploads/restaurants/placeholder.svg')) ?>"></div>
                    </div>
                    <div class="two-col">
                        <div class="field"><label>Адрес</label><input name="address" value="<?= e((string) ($editing['address'] ?? '')) ?>"></div>
                        <div class="field"><label>Телефон</label><input type="tel" name="phone" value="<?= e((string) ($editing['phone'] ?? '')) ?>" placeholder="+7 (___) ___-__-__"></div>
                    </div>
                    <div class="two-col">
                        <div class="field"><label>Часы работы</label><input name="working_hours" value="<?= e((string) ($editing['working_hours'] ?? '10:00 - 22:00')) ?>"></div>
                        <div class="field"><label>Доставка (₽)</label><input type="number" step="0.01" name="delivery_fee" value="<?= e((string) ($editing['delivery_fee'] ?? 0)) ?>"></div>
                    </div>
                    <div class="two-col">
                        <div class="field"><label>Мин. заказ (₽)</label><input type="number" step="0.01" name="min_order_amount" value="<?= e((string) ($editing['min_order_amount'] ?? 0)) ?>"></div>
                        <div class="two-col">
                            <div class="field"><label>Мин. время</label><input type="number" name="delivery_time_min" value="<?= e((string) ($editing['delivery_time_min'] ?? 30)) ?>"></div>
                            <div class="field"><label>Макс. время</label><input type="number" name="delivery_time_max" value="<?= e((string) ($editing['delivery_time_max'] ?? 60)) ?>"></div>
                        </div>
                    </div>
                    <label style="display:flex;gap:8px;align-items:center;margin:10px 0;">
                        <input type="checkbox" name="is_active" <?= !isset($editing['is_active']) || (int) $editing['is_active'] === 1 ? 'checked' : '' ?>>
                        Активный ресторан
                    </label>
                    <div class="field">
                        <label>Категории кухни</label>
                        <div style="display:flex;gap:10px;flex-wrap:wrap;">
                            <?php foreach ($kitchenCategories as $cat): ?>
                                <label class="pill" style="cursor:pointer;">
                                    <input type="checkbox" name="category_ids[]" value="<?= (int) $cat['id'] ?>" <?= in_array((int) $cat['id'], $selectedCategories, true) ? 'checked' : '' ?>>
                                    <?= e($cat['name']) ?>
                                </label>
                            <?php endforeach; ?>
                        </div>
                    </div>
                    <button class="btn btn-primary" type="submit"><?= $editing ? 'Сохранить' : 'Создать' ?></button>
                    <?php if ($editing): ?><a class="btn btn-ghost" href="<?= e(admin_url('restaurants.php')) ?>">Отмена</a><?php endif; ?>
                </form>
            </div>

            <div class="panel" style="margin-top:16px;">
                <h3 style="margin-top:0;">Список ресторанов</h3>
                <table>
                    <thead><tr><th>ID</th><th>Название</th><th>Рейтинг</th><th>Активен</th><th>Действия</th></tr></thead>
                    <tbody>
                    <?php foreach ($restaurants as $r): ?>
                        <tr>
                            <td><?= (int) $r['id'] ?></td>
                            <td><?= e($r['name']) ?></td>
                            <td><?= e((string) $r['rating']) ?></td>
                            <td><?= (int) $r['is_active'] === 1 ? 'Да' : 'Нет' ?></td>
                            <td style="display:flex;gap:8px;">
                                <a class="btn btn-ghost" href="<?= e(admin_url('restaurants.php?edit=' . (int) $r['id'])) ?>">Редактировать</a>
                                <form method="post">
                                    <?= csrf_field() ?>
                                    <input type="hidden" name="action" value="toggle">
                                    <input type="hidden" name="id" value="<?= (int) $r['id'] ?>">
                                    <button class="btn btn-ghost" type="submit"><?= (int) $r['is_active'] === 1 ? 'Отключить' : 'Включить' ?></button>
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
