<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_once ROOT_PATH . '/includes/admin_helpers.php';
require_admin();

$admin = current_user();
$kitchenCategories = db_all('SELECT id, name FROM restaurant_categories WHERE is_active = 1 ORDER BY name ASC');

function save_restaurant_image_upload(array $file, string $fallbackPath, string $kind): string
{
    if (($file['error'] ?? UPLOAD_ERR_NO_FILE) === UPLOAD_ERR_NO_FILE) {
        return $fallbackPath;
    }

    if (($file['error'] ?? UPLOAD_ERR_OK) !== UPLOAD_ERR_OK) {
        flash('error', 'Не удалось загрузить изображение ресторана.');
        redirect_to('/admin/restaurants.php');
    }

    $maxSize = 6 * 1024 * 1024;
    if ((int) ($file['size'] ?? 0) > $maxSize) {
        flash('error', 'Изображение ресторана должно быть не больше 6 МБ.');
        redirect_to('/admin/restaurants.php');
    }

    $tmpName = (string) ($file['tmp_name'] ?? '');
    $finfo = new finfo(FILEINFO_MIME_TYPE);
    $mime = $finfo->file($tmpName) ?: '';
    $allowed = [
        'image/jpeg' => 'jpg',
        'image/png' => 'png',
        'image/webp' => 'webp',
    ];

    if (!isset($allowed[$mime])) {
        flash('error', 'Загрузите логотип или баннер в формате JPG, PNG или WEBP.');
        redirect_to('/admin/restaurants.php');
    }

    $uploadDir = ROOT_PATH . '/public/uploads/restaurants';
    if (!is_dir($uploadDir) && !mkdir($uploadDir, 0775, true) && !is_dir($uploadDir)) {
        flash('error', 'Не удалось создать папку для изображений ресторанов.');
        redirect_to('/admin/restaurants.php');
    }

    $safeKind = preg_replace('/[^a-z0-9_-]/i', '', $kind) ?: 'image';
    $fileName = 'restaurant-' . $safeKind . '-' . date('Ymd-His') . '-' . bin2hex(random_bytes(4)) . '.' . $allowed[$mime];
    $targetPath = $uploadDir . '/' . $fileName;

    if (!move_uploaded_file($tmpName, $targetPath)) {
        flash('error', 'Не удалось сохранить изображение ресторана.');
        redirect_to('/admin/restaurants.php');
    }

    return '/uploads/restaurants/' . $fileName;
}

function parse_working_hours(string $hours): array
{
    if (preg_match('/(\d{2}:\d{2})\s*[-–—]\s*(\d{2}:\d{2})/u', $hours, $matches)) {
        return [$matches[1], $matches[2]];
    }

    return ['10:00', '22:00'];
}

if (is_post()) {
    verify_csrf();
    $action = (string) ($_POST['action'] ?? '');

    if ($action === 'save') {
        $id = (int) ($_POST['id'] ?? 0);
        $logoPath = trim((string) ($_POST['logo_image'] ?? ''));
        $bannerPath = trim((string) ($_POST['banner_image'] ?? ''));
        $logoPath = $logoPath !== '' ? $logoPath : '/uploads/restaurants/placeholder.svg';
        $bannerPath = $bannerPath !== '' ? $bannerPath : '/uploads/restaurants/placeholder.svg';

        $logoPath = save_restaurant_image_upload($_FILES['logo_file'] ?? [], $logoPath, 'logo');
        $bannerPath = save_restaurant_image_upload($_FILES['banner_file'] ?? [], $bannerPath, 'banner');

        $workingStart = trim((string) ($_POST['working_hours_start'] ?? '10:00'));
        $workingEnd = trim((string) ($_POST['working_hours_end'] ?? '22:00'));
        $workingHours = preg_match('/^\d{2}:\d{2}$/', $workingStart) && preg_match('/^\d{2}:\d{2}$/', $workingEnd)
            ? $workingStart . ' - ' . $workingEnd
            : '10:00 - 22:00';

        $data = [
            'name' => trim((string) ($_POST['name'] ?? '')),
            'short_description' => trim((string) ($_POST['short_description'] ?? '')),
            'logo_image' => $logoPath,
            'banner_image' => $bannerPath,
            'address' => trim((string) ($_POST['address'] ?? '')),
            'phone' => trim((string) ($_POST['phone'] ?? '')),
            'working_hours' => $workingHours,
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
                <form method="post" enctype="multipart/form-data">
                    <?= csrf_field() ?>
                    <input type="hidden" name="action" value="save">
                    <input type="hidden" name="id" value="<?= (int) ($editing['id'] ?? 0) ?>">
                    <div class="two-col">
                        <div class="field"><label>Название</label><input name="name" value="<?= e((string) ($editing['name'] ?? '')) ?>" required></div>
                        <div class="field"><label>Рейтинг</label><input type="number" step="0.1" min="0" max="5" name="rating" value="<?= e((string) ($editing['rating'] ?? 0)) ?>"></div>
                    </div>
                    <div class="field"><label>Описание</label><textarea name="short_description"><?= e((string) ($editing['short_description'] ?? '')) ?></textarea></div>
                    <?php
                    $currentLogo = (string) ($editing['logo_image'] ?? '/uploads/restaurants/placeholder.svg');
                    $currentBanner = (string) ($editing['banner_image'] ?? '/uploads/restaurants/placeholder.svg');
                    [$workingStart, $workingEnd] = parse_working_hours((string) ($editing['working_hours'] ?? '10:00 - 22:00'));
                    ?>
                    <div class="admin-media-grid">
                        <div class="admin-image-upload admin-image-upload--compact" data-image-upload>
                            <div class="admin-image-upload__content">
                                <label>Логотип ресторана</label>
                                <p class="muted">JPG, PNG или WEBP до 6 МБ. Если файл не выбран, используется текущий путь.</p>
                                <input class="admin-image-upload__path" name="logo_image" value="<?= e($currentLogo) ?>" aria-label="Текущий путь логотипа">
                                <label class="admin-upload-button">
                                    <span>Выбрать логотип</span>
                                    <input type="file" name="logo_file" accept="image/jpeg,image/png,image/webp" data-image-upload-input>
                                </label>
                                <small class="admin-upload-filename" data-image-upload-name>Файл не выбран</small>
                            </div>
                        </div>
                        <div class="admin-image-upload admin-image-upload--compact" data-image-upload>
                            <div class="admin-image-upload__content">
                                <label>Баннер ресторана</label>
                                <p class="muted">Горизонтальное изображение для карточек и страницы ресторана.</p>
                                <input class="admin-image-upload__path" name="banner_image" value="<?= e($currentBanner) ?>" aria-label="Текущий путь баннера">
                                <label class="admin-upload-button">
                                    <span>Выбрать баннер</span>
                                    <input type="file" name="banner_file" accept="image/jpeg,image/png,image/webp" data-image-upload-input>
                                </label>
                                <small class="admin-upload-filename" data-image-upload-name>Файл не выбран</small>
                            </div>
                        </div>
                    </div>
                    <div class="two-col">
                        <div class="field"><label>Адрес</label><input name="address" value="<?= e((string) ($editing['address'] ?? '')) ?>"></div>
                        <div class="field"><label>Телефон</label><input type="tel" name="phone" value="<?= e((string) ($editing['phone'] ?? '')) ?>" placeholder="+7 ( _ _ _ ) _ _ _-_ _-_ _"></div>
                    </div>
                    <div class="two-col">
                        <div class="field">
                            <label>Часы работы</label>
                            <div class="admin-time-range">
                                <label>
                                    <span>С</span>
                                    <input type="time" name="working_hours_start" value="<?= e($workingStart) ?>">
                                </label>
                                <label>
                                    <span>До</span>
                                    <input type="time" name="working_hours_end" value="<?= e($workingEnd) ?>">
                                </label>
                            </div>
                        </div>
                        <div class="field"><label>Доставка (₽)</label><input type="number" inputmode="decimal" step="0.01" name="delivery_fee" value="<?= e((string) ($editing['delivery_fee'] ?? 0)) ?>"></div>
                    </div>
                    <div class="two-col">
                        <div class="field"><label>Мин. заказ (₽)</label><input type="number" inputmode="decimal" step="0.01" name="min_order_amount" value="<?= e((string) ($editing['min_order_amount'] ?? 0)) ?>"></div>
                        <div class="two-col">
                            <div class="field"><label>Мин. время</label><input type="number" inputmode="numeric" name="delivery_time_min" value="<?= e((string) ($editing['delivery_time_min'] ?? 30)) ?>"></div>
                            <div class="field"><label>Макс. время</label><input type="number" inputmode="numeric" name="delivery_time_max" value="<?= e((string) ($editing['delivery_time_max'] ?? 60)) ?>"></div>
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
