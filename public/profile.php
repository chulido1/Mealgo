<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';
require_auth();

$user = current_user();

if (is_post()) {
    verify_csrf();
    $action = (string) ($_POST['action'] ?? '');

    if ($action === 'update_profile') {
        $name = trim((string) ($_POST['name'] ?? ''));
        $phone = trim((string) ($_POST['phone'] ?? ''));

        if (mb_strlen($name) < 2) {
            flash('error', 'Имя слишком короткое.');
        } else {
            db_exec(
                'UPDATE users SET name = :name, phone = :phone, updated_at = :updated_at WHERE id = :id',
                ['name' => $name, 'phone' => $phone, 'updated_at' => now(), 'id' => $user['id']]
            );
            flash('success', 'Профиль обновлен.');
        }

        redirect_to('/profile.php');
    }

    if ($action === 'delete_address' || isset($_POST['delete_address'])) {
        $addressId = (int) ($_POST['address_id'] ?? 0);
        if ($addressId <= 0) {
            flash('error', 'Адрес не найден.');
            redirect_to('/profile.php');
        }

        db_exec(
            'DELETE FROM user_addresses WHERE id = :id AND user_id = :user_id',
            ['id' => $addressId, 'user_id' => $user['id']]
        );

        flash('success', 'Адрес удален.');
        redirect_to('/profile.php');
    }

    if ($action === 'add_address' || $action === 'update_address') {
        $title = trim((string) ($_POST['title'] ?? ''));
        $address = trim((string) ($_POST['address_line'] ?? ''));

        if ($title === '' || mb_strlen($address) < 8) {
            flash('error', 'Заполните название и полный адрес.');
            redirect_to('/profile.php');
        }

        $payload = [
            'title' => $title,
            'address_line' => $address,
            'entrance' => trim((string) ($_POST['entrance'] ?? '')),
            'floor' => trim((string) ($_POST['floor'] ?? '')),
            'apartment' => trim((string) ($_POST['apartment'] ?? '')),
            'intercom_code' => trim((string) ($_POST['intercom_code'] ?? '')),
            'comment' => trim((string) ($_POST['comment'] ?? '')),
            'updated_at' => now(),
        ];

        if ($action === 'add_address') {
            db_exec(
                'INSERT INTO user_addresses (user_id, title, address_line, entrance, floor, apartment, intercom_code, comment, created_at, updated_at)
                 VALUES (:user_id, :title, :address_line, :entrance, :floor, :apartment, :intercom_code, :comment, :created_at, :updated_at)',
                $payload + [
                    'user_id' => $user['id'],
                    'created_at' => now(),
                ]
            );
            flash('success', 'Адрес добавлен.');
            redirect_to('/profile.php');
        }

        $addressId = (int) ($_POST['address_id'] ?? 0);
        if ($addressId <= 0) {
            flash('error', 'Адрес не найден.');
            redirect_to('/profile.php');
        }

        db_exec(
            'UPDATE user_addresses
             SET title = :title,
                 address_line = :address_line,
                 entrance = :entrance,
                 floor = :floor,
                 apartment = :apartment,
                 intercom_code = :intercom_code,
                 comment = :comment,
                 updated_at = :updated_at
             WHERE id = :id AND user_id = :user_id',
            $payload + [
                'id' => $addressId,
                'user_id' => $user['id'],
            ]
        );
        flash('success', 'Адрес обновлен.');
        redirect_to('/profile.php');
    }
}

$orderStats = db_one(
    'SELECT COUNT(*) AS total_orders, COALESCE(SUM(total_amount),0) AS total_spent
     FROM orders WHERE user_id = :user_id',
    ['user_id' => $user['id']]
);
$favoritesCount = db_one(
    'SELECT COUNT(*) AS cnt FROM favorites WHERE user_id = :user_id',
    ['user_id' => $user['id']]
);
$addresses = db_all(
    'SELECT * FROM user_addresses WHERE user_id = :user_id ORDER BY created_at DESC',
    ['user_id' => $user['id']]
);
$recentOrders = db_all(
    'SELECT id, status, total_amount, created_at FROM orders
     WHERE user_id = :user_id
     ORDER BY created_at DESC
     LIMIT 12',
    ['user_id' => $user['id']]
);

$pageTitle = 'Личный кабинет';
$pageClass = 'page-profile-brutal';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container">
    <h1 style="margin-top:0;">Личный кабинет</h1>

    <?php if (is_admin()): ?>
        <article class="admin-profile-entry">
            <div>
                <span>Администратор Mealgo</span>
                <h2>Управление сайтом доступно в админ-панели</h2>
                <p>Здесь остаётся обычный профиль аккаунта, а рестораны, блюда, заказы, пользователи и отзывы редактируются отдельно.</p>
            </div>
            <a class="btn btn-primary" href="<?= e(base_url('/admin/index.php')) ?>">Открыть админ-панель</a>
        </article>
    <?php endif; ?>

    <div class="dashboard-grid">
        <article class="stat-card">
            <p class="muted">Заказов</p>
            <h2 style="margin:0;"><?= (int) ($orderStats['total_orders'] ?? 0) ?></h2>
        </article>
        <article class="stat-card">
            <p class="muted">Потрачено</p>
            <h2 style="margin:0;"><?= number_format((float) ($orderStats['total_spent'] ?? 0), 0, '.', ' ') ?> ₽</h2>
        </article>
        <article class="stat-card">
            <p class="muted">Избранных ресторанов</p>
            <h2 style="margin:0;"><?= (int) ($favoritesCount['cnt'] ?? 0) ?></h2>
        </article>
        <article class="stat-card">
            <p class="muted">Эл. почта</p>
            <h2 style="margin:0;font-size:1rem;"><?= $user['email_verified_at'] ? 'Подтвержден' : 'Не подтвержден' ?></h2>
        </article>
    </div>

    <div class="checkout-layout profile-main-row" style="margin-top:18px;">
        <div class="panel">
            <h3 style="margin-top:0;">Профиль</h3>
            <form method="post">
                <?= csrf_field() ?>
                <input type="hidden" name="action" value="update_profile">
                <div class="field">
                    <label for="name">Имя</label>
                    <input id="name" type="text" name="name" value="<?= e((string) $user['name']) ?>" required>
                </div>
                <div class="field">
                    <label for="email">Эл. почта</label>
                    <input id="email" type="email" value="<?= e((string) $user['email']) ?>" disabled>
                </div>
                <div class="field">
                    <label for="phone">Телефон</label>
                    <input id="phone" type="tel" name="phone" value="<?= e((string) $user['phone']) ?>" placeholder="+7 (___) ___-__-__">
                </div>
                <button class="btn btn-primary" type="submit">Сохранить профиль</button>
                <a class="btn btn-ghost profile-logout-btn" href="<?= e(base_url('/logout.php')) ?>">Выйти</a>
            </form>
        </div>

        <aside class="panel sticky profile-orders-panel">
            <h3 style="margin-top:0;">Последние заказы</h3>
            <?php if (!$recentOrders): ?>
                <p class="muted">Заказов пока нет.</p>
            <?php else: ?>
                <div class="order-list profile-recent-orders">
                    <?php foreach ($recentOrders as $order): ?>
                        <article class="order-item">
                            <div>
                                <strong>#<?= (int) $order['id'] ?></strong>
                                <p class="muted" style="margin:4px 0;"><?= e(order_status_label((string) $order['status'])) ?></p>
                            </div>
                            <a class="btn btn-ghost" href="<?= e(base_url('/order_view.php?id=' . (int) $order['id'])) ?>">Открыть</a>
                        </article>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </aside>
    </div>

    <div class="checkout-layout profile-address-layout" style="margin-top:18px;">
        <div class="panel">
            <h3 style="margin-top:0;">Новый адрес</h3>
            <form method="post">
                <?= csrf_field() ?>
                <input type="hidden" name="action" value="add_address">
                <div class="field">
                    <label for="title">Название</label>
                    <input id="title" type="text" name="title" placeholder="Дом / Офис" required>
                </div>
                <div class="field">
                    <label for="address_line">Адрес</label>
                    <input
                        id="address_line"
                        type="text"
                        name="address_line"
                        data-address-input
                        data-suggest-url="<?= e(base_url('/api/address_suggest.php')) ?>"
                        autocomplete="off"
                        placeholder="Начните вводить улицу или дом"
                        required
                    >
                    <div class="address-suggest" data-address-suggest-panel hidden></div>
                </div>
                <div class="two-col">
                    <input type="text" name="entrance" placeholder="Подъезд">
                    <input type="text" name="floor" placeholder="Этаж">
                </div>
                <div class="two-col">
                    <input type="text" name="apartment" placeholder="Квартира">
                    <input type="text" name="intercom_code" placeholder="Домофон">
                </div>
                <textarea name="comment" placeholder="Комментарий"></textarea>
                <button class="btn btn-primary" type="submit">Добавить адрес</button>
            </form>
        </div>

        <aside class="panel profile-address-panel">
            <h3 style="margin-top:0;">Адреса доставки</h3>
            <?php if (!$addresses): ?>
                <p class="muted">Адреса пока не добавлены.</p>
            <?php else: ?>
                <div class="order-list profile-address-list">
                    <?php foreach ($addresses as $address): ?>
                        <?php $addressId = (int) $address['id']; ?>
                        <details class="profile-address-card">
                            <summary>
                                <span>
                                    <strong><?= e($address['title']) ?></strong>
                                    <small><?= e($address['address_line']) ?></small>
                                </span>
                                <b>Редактировать</b>
                            </summary>
                            <form method="post" class="profile-address-edit-form">
                                <?= csrf_field() ?>
                                <input type="hidden" name="action" value="update_address">
                                <input type="hidden" name="address_id" value="<?= $addressId ?>">
                                <div class="field">
                                    <label for="address_title_<?= $addressId ?>">Название</label>
                                    <input id="address_title_<?= $addressId ?>" type="text" name="title" value="<?= e($address['title']) ?>" required>
                                </div>
                                <div class="field">
                                    <label for="address_line_<?= $addressId ?>">Адрес</label>
                                    <input
                                        id="address_line_<?= $addressId ?>"
                                        type="text"
                                        name="address_line"
                                        value="<?= e($address['address_line']) ?>"
                                        data-address-input
                                        data-suggest-url="<?= e(base_url('/api/address_suggest.php')) ?>"
                                        autocomplete="off"
                                        required
                                    >
                                    <div class="address-suggest" data-address-suggest-panel hidden></div>
                                </div>
                                <div class="two-col">
                                    <input type="text" name="entrance" placeholder="Подъезд" value="<?= e((string) $address['entrance']) ?>">
                                    <input type="text" name="floor" placeholder="Этаж" value="<?= e((string) $address['floor']) ?>">
                                </div>
                                <div class="two-col">
                                    <input type="text" name="apartment" placeholder="Квартира" value="<?= e((string) $address['apartment']) ?>">
                                    <input type="text" name="intercom_code" placeholder="Домофон" value="<?= e((string) $address['intercom_code']) ?>">
                                </div>
                                <textarea name="comment" placeholder="Комментарий"><?= e((string) $address['comment']) ?></textarea>
                                <button class="btn btn-primary" type="submit">Сохранить адрес</button>
                                <button class="btn btn-ghost profile-address-delete" type="submit" name="delete_address" value="1" formnovalidate onclick="return confirm('Удалить этот адрес?')">Удалить</button>
                            </form>
                        </details>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </aside>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
