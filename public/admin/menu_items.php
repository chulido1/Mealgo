<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_once ROOT_PATH . '/includes/admin_helpers.php';
require_admin();

$restaurants = db_all('SELECT id, name FROM restaurants ORDER BY name ASC');
$menuCategories = db_all(
    'SELECT mc.id, mc.name, mc.restaurant_id, r.name AS restaurant_name
     FROM menu_categories mc
     JOIN restaurants r ON r.id = mc.restaurant_id
     ORDER BY r.name ASC, mc.sort_order ASC, mc.name ASC'
);

function save_menu_item_image_upload(array $file, string $fallbackPath): string
{
    if (($file['error'] ?? UPLOAD_ERR_NO_FILE) === UPLOAD_ERR_NO_FILE) {
        return $fallbackPath;
    }

    if (($file['error'] ?? UPLOAD_ERR_OK) !== UPLOAD_ERR_OK) {
        flash('error', 'Не удалось загрузить изображение блюда.');
        redirect_to('/admin/menu_items.php');
    }

    $maxSize = 4 * 1024 * 1024;
    if ((int) ($file['size'] ?? 0) > $maxSize) {
        flash('error', 'Изображение блюда должно быть не больше 4 МБ.');
        redirect_to('/admin/menu_items.php');
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
        flash('error', 'Загрузите изображение в формате JPG, PNG или WEBP.');
        redirect_to('/admin/menu_items.php');
    }

    $uploadDir = ROOT_PATH . '/public/uploads/menu';
    if (!is_dir($uploadDir) && !mkdir($uploadDir, 0775, true) && !is_dir($uploadDir)) {
        flash('error', 'Не удалось создать папку для изображений.');
        redirect_to('/admin/menu_items.php');
    }

    $fileName = 'dish-' . date('Ymd-His') . '-' . bin2hex(random_bytes(4)) . '.' . $allowed[$mime];
    $targetPath = $uploadDir . '/' . $fileName;

    if (!move_uploaded_file($tmpName, $targetPath)) {
        flash('error', 'Не удалось сохранить изображение блюда.');
        redirect_to('/admin/menu_items.php');
    }

    return '/uploads/menu/' . $fileName;
}

function auto_attach_menu_item_images(int $restaurantId = 0): array
{
    $uploadDir = ROOT_PATH . '/public/uploads/menu';
    $extensions = ['webp', 'jpg', 'jpeg', 'png'];
    $sql = 'SELECT mi.id, r.id AS restaurant_id, r.name AS restaurant_name
            FROM menu_items mi
            JOIN restaurants r ON r.id = mi.restaurant_id';
    $params = [];

    if ($restaurantId > 0) {
        $sql .= ' WHERE mi.restaurant_id = :restaurant_id';
        $params['restaurant_id'] = $restaurantId;
    }

    $sql .= ' ORDER BY mi.id ASC';
    $items = db_all($sql, $params);
    $updated = 0;
    $missing = 0;

    foreach ($items as $item) {
        $id = (int) $item['id'];
        $restaurantFolder = restaurant_image_folder_name((string) $item['restaurant_name']);
        $found = false;

        foreach ($extensions as $extension) {
            $fileName = 'dish-' . $id . '.' . $extension;
            $candidates = [
                [
                    'absolute' => $uploadDir . '/' . $restaurantFolder . '/' . $fileName,
                    'public' => '/uploads/menu/' . $restaurantFolder . '/' . $fileName,
                ],
                [
                    'absolute' => $uploadDir . '/' . $fileName,
                    'public' => '/uploads/menu/' . $fileName,
                ],
            ];

            foreach ($candidates as $candidate) {
                if (!is_file($candidate['absolute'])) {
                    continue;
                }

                db_exec(
                    'UPDATE menu_items SET image = :image, updated_at = :updated_at WHERE id = :id',
                    ['image' => $candidate['public'], 'updated_at' => now(), 'id' => $id]
                );
                $updated++;
                $found = true;
                break 2;
            }
        }

        if (!$found) {
            $missing++;
        }
    }

    return ['updated' => $updated, 'missing' => $missing, 'total' => count($items)];
}

function restaurant_image_folder_name(string $restaurantName): string
{
    $map = [
        'Вкусно и Точка' => 'vkusno-i-tochka',
        'Burger King' => 'burger-king',
        "Rostic's" => 'rostics',
        'Tanuki' => 'tanuki',
        'Why Not Sushi' => 'why-not-sushi',
        'Якитория' => 'yakitoriya',
        'Dodo Pizza' => 'dodo-pizza',
        'Pizza City' => 'pizza-city',
        'Domino Pizza' => 'domino-pizza',
        'One Love' => 'one-love',
        '11/47 Bakery' => '1147-bakery',
        'Special Napoleon' => 'special-napoleon',
        'Особенный Наполеон Кондитерская' => 'special-napoleon',
        'Osteria Amici' => 'osteria-amici',
        'Fattoria Marian' => 'fattoria-marian',
        'Dolce Far Niente' => 'dolce-far-niente',
        'Культура Встречи' => 'kultura-vstrechi',
        'Кофемания' => 'kofemaniya',
        'Теремок' => 'teremok',
        'Белуга' => 'beluga',
    ];

    return $map[$restaurantName] ?? preg_replace('/[^a-z0-9]+/', '-', strtolower($restaurantName));
}

if (is_post()) {
    verify_csrf();
    $adminId = (int) current_user()['id'];
    $action = (string) ($_POST['action'] ?? '');

    if ($action === 'auto_attach_images') {
        $restaurantFilter = max(0, (int) ($_POST['restaurant_filter'] ?? 0));
        $result = auto_attach_menu_item_images($restaurantFilter);
        $updated = $result['updated'];
        admin_log($adminId, 'auto_attach_images', 'menu_item', null);
        flash('success', 'Автопривязка завершена. Обновлено изображений: ' . $updated . '.');
        redirect_to('/admin/menu_items.php' . ($restaurantFilter > 0 ? '?restaurant_filter=' . $restaurantFilter : ''));
    }

    if ($action === 'save') {
        $id = (int) ($_POST['id'] ?? 0);
        $data = [
            'restaurant_id' => (int) ($_POST['restaurant_id'] ?? 0),
            'category_id' => (int) ($_POST['category_id'] ?? 0),
            'name' => trim((string) ($_POST['name'] ?? '')),
            'description' => trim((string) ($_POST['description'] ?? '')),
            'price' => (float) ($_POST['price'] ?? 0),
            'weight' => trim((string) ($_POST['weight'] ?? '')),
            'image' => trim((string) ($_POST['image'] ?? '/uploads/menu/placeholder.svg')),
            'is_available' => isset($_POST['is_available']) ? 1 : 0,
            'is_popular' => isset($_POST['is_popular']) ? 1 : 0,
            'is_new' => isset($_POST['is_new']) ? 1 : 0,
        ];

        $data['image'] = save_menu_item_image_upload($_FILES['image_file'] ?? [], $data['image']);

        if ($data['restaurant_id'] <= 0 || $data['category_id'] <= 0 || $data['name'] === '' || $data['price'] <= 0) {
            flash('error', 'Заполните обязательные поля блюда.');
            redirect_to('/admin/menu_items.php');
        }

        $categoryBelongsToRestaurant = db_one(
            'SELECT id FROM menu_categories WHERE id = :category_id AND restaurant_id = :restaurant_id',
            ['category_id' => $data['category_id'], 'restaurant_id' => $data['restaurant_id']]
        );

        if (!$categoryBelongsToRestaurant) {
            flash('error', 'Категория меню не принадлежит выбранному ресторану.');
            redirect_to('/admin/menu_items.php');
        }

        if ($id > 0) {
            db_exec(
                'UPDATE menu_items SET
                    restaurant_id=:restaurant_id, category_id=:category_id, name=:name, description=:description,
                    price=:price, weight=:weight, image=:image, is_available=:is_available, is_popular=:is_popular, is_new=:is_new, updated_at=:updated_at
                 WHERE id=:id',
                $data + ['updated_at' => now(), 'id' => $id]
            );
            admin_log($adminId, 'update', 'menu_item', $id);
            flash('success', 'Блюдо обновлено.');
        } else {
            db_exec(
                'INSERT INTO menu_items (
                    restaurant_id, category_id, name, description, price, weight, image, is_available, is_popular, is_new, created_at, updated_at
                 ) VALUES (
                    :restaurant_id, :category_id, :name, :description, :price, :weight, :image, :is_available, :is_popular, :is_new, :created_at, :updated_at
                 )',
                $data + ['created_at' => now(), 'updated_at' => now()]
            );
            $newId = (int) db()->lastInsertId();
            admin_log($adminId, 'create', 'menu_item', $newId);
            flash('success', 'Блюдо создано.');
        }
        redirect_to('/admin/menu_items.php');
    }
}

$editId = (int) ($_GET['edit'] ?? 0);
$selectedRestaurantId = max(0, (int) ($_GET['restaurant_filter'] ?? 0));
$editing = $editId > 0 ? db_one('SELECT * FROM menu_items WHERE id = :id', ['id' => $editId]) : null;
$itemsSql = 'SELECT mi.id, mi.name, mi.price, mi.is_available, mi.is_popular, mi.is_new, r.name AS restaurant_name, mc.name AS category_name
     FROM menu_items mi
     JOIN restaurants r ON r.id = mi.restaurant_id
     JOIN menu_categories mc ON mc.id = mi.category_id';
$itemsParams = [];

if ($selectedRestaurantId > 0) {
    $itemsSql .= ' WHERE mi.restaurant_id = :restaurant_id';
    $itemsParams['restaurant_id'] = $selectedRestaurantId;
}

$itemsSql .= ' ORDER BY r.name ASC, mi.id DESC';
$items = db_all($itemsSql, $itemsParams);

$pageTitle = 'Админ: Блюда';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container">
    <h1 style="margin-top:0;">Управление блюдами</h1>
    <div class="admin-layout">
        <?php render_admin_nav('menu_items.php'); ?>
        <div>
            <div class="panel">
                <h3 style="margin-top:0;"><?= $editing ? 'Редактировать блюдо' : 'Новое блюдо' ?></h3>
                <form method="post" enctype="multipart/form-data" data-admin-menu-item-form>
                    <?= csrf_field() ?>
                    <input type="hidden" name="action" value="save">
                    <input type="hidden" name="id" value="<?= (int) ($editing['id'] ?? 0) ?>">
                    <div class="two-col">
                        <div class="field">
                            <label>Ресторан</label>
                            <select name="restaurant_id" required data-menu-item-restaurant>
                                <option value="">Выберите ресторан</option>
                                <?php foreach ($restaurants as $restaurant): ?>
                                    <option value="<?= (int) $restaurant['id'] ?>" <?= (int) ($editing['restaurant_id'] ?? 0) === (int) $restaurant['id'] ? 'selected' : '' ?>>
                                        <?= e($restaurant['name']) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                        <div class="field">
                            <label>Категория меню</label>
                            <select name="category_id" required data-menu-item-category>
                                <option value="">Выберите категорию</option>
                                <?php foreach ($menuCategories as $category): ?>
                                    <option value="<?= (int) $category['id'] ?>" data-restaurant-id="<?= (int) $category['restaurant_id'] ?>" <?= (int) ($editing['category_id'] ?? 0) === (int) $category['id'] ? 'selected' : '' ?>>
                                        <?= e($category['restaurant_name']) ?> — <?= e($category['name']) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </div>
                    </div>
                    <div class="field"><label>Название</label><input name="name" value="<?= e((string) ($editing['name'] ?? '')) ?>" required></div>
                    <div class="field"><label>Описание</label><textarea name="description"><?= e((string) ($editing['description'] ?? '')) ?></textarea></div>
                    <div class="two-col">
                        <div class="field"><label>Цена</label><input type="number" step="0.01" name="price" value="<?= e((string) ($editing['price'] ?? 0)) ?>" required></div>
                        <div class="field"><label>Вес</label><input name="weight" value="<?= e((string) ($editing['weight'] ?? '')) ?>"></div>
                    </div>
                    <div class="field"><label>Изображение (путь)</label><input name="image" value="<?= e((string) ($editing['image'] ?? '/uploads/menu/placeholder.svg')) ?>"></div>
                    <?php $currentImage = (string) ($editing['image'] ?? '/uploads/menu/placeholder.svg'); ?>
                    <div class="admin-image-upload" data-image-upload>
                        <div class="admin-image-upload__preview">
                            <img src="<?= e(base_url($currentImage)) ?>" alt="Превью блюда" data-image-upload-preview>
                        </div>
                        <div class="admin-image-upload__content">
                            <label>Загрузка изображения</label>
                            <p class="muted">Загрузите JPG, PNG или WEBP до 4 МБ. Если файл не выбран, используется путь из поля выше.</p>
                            <input type="file" name="image_file" accept="image/jpeg,image/png,image/webp" data-image-upload-input>
                        </div>
                    </div>
                    <div style="display:flex;gap:12px;flex-wrap:wrap;">
                        <label><input type="checkbox" name="is_available" <?= !isset($editing['is_available']) || (int) $editing['is_available'] === 1 ? 'checked' : '' ?>> Доступно</label>
                        <label><input type="checkbox" name="is_popular" <?= isset($editing['is_popular']) && (int) $editing['is_popular'] === 1 ? 'checked' : '' ?>> Популярное</label>
                        <label><input type="checkbox" name="is_new" <?= isset($editing['is_new']) && (int) $editing['is_new'] === 1 ? 'checked' : '' ?>> Новинка</label>
                    </div>
                    <button class="btn btn-primary" type="submit"><?= $editing ? 'Сохранить' : 'Создать' ?></button>
                </form>
            </div>

            <div class="panel" style="margin-top:16px;">
                <div class="admin-panel-head">
                    <div>
                        <h3 style="margin-top:0;">Список блюд</h3>
                        <p class="muted">Отфильтруйте позиции по ресторану, чтобы быстрее редактировать меню.</p>
                    </div>
                    <form method="get" class="admin-filter-form">
                        <label class="field">
                            <span>Ресторан</span>
                            <select name="restaurant_filter" data-admin-autosubmit>
                                <option value="0">Все рестораны</option>
                                <?php foreach ($restaurants as $restaurant): ?>
                                    <option value="<?= (int) $restaurant['id'] ?>" <?= $selectedRestaurantId === (int) $restaurant['id'] ? 'selected' : '' ?>>
                                        <?= e($restaurant['name']) ?>
                                    </option>
                                <?php endforeach; ?>
                            </select>
                        </label>
                        <?php if ($selectedRestaurantId > 0): ?>
                            <a class="btn btn-ghost" href="<?= e(admin_url('menu_items.php')) ?>">Сбросить</a>
                        <?php endif; ?>
                    </form>
                    <form method="post" class="admin-sync-form">
                        <?= csrf_field() ?>
                        <input type="hidden" name="action" value="auto_attach_images">
                        <input type="hidden" name="restaurant_filter" value="<?= (int) $selectedRestaurantId ?>">
                        <button class="btn btn-primary" type="submit">Привязать изображения</button>
                    </form>
                </div>
                <table>
                    <thead><tr><th>ID</th><th>Название</th><th>Ресторан</th><th>Категория</th><th>Цена</th><th>Статус</th><th></th></tr></thead>
                    <tbody>
                    <?php foreach ($items as $item): ?>
                        <tr>
                            <td><?= (int) $item['id'] ?></td>
                            <td><?= e($item['name']) ?></td>
                            <td><?= e($item['restaurant_name']) ?></td>
                            <td><?= e($item['category_name']) ?></td>
                            <td><?= number_format((float) $item['price'], 0, '.', ' ') ?> ₽</td>
                            <td><?= (int) $item['is_available'] === 1 ? 'Доступно' : 'Скрыто' ?></td>
                            <td><a class="btn btn-ghost" href="<?= e(admin_url('menu_items.php?edit=' . (int) $item['id'])) ?>">Редактировать</a></td>
                        </tr>
                    <?php endforeach; ?>
                    <?php if (!$items): ?>
                        <tr>
                            <td colspan="7">Блюд для выбранного ресторана пока нет.</td>
                        </tr>
                    <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
