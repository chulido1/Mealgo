<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_once ROOT_PATH . '/includes/admin_helpers.php';
require_admin();

$stats = [
    'users' => (int) (db_one('SELECT COUNT(*) AS c FROM users')['c'] ?? 0),
    'restaurants' => (int) (db_one('SELECT COUNT(*) AS c FROM restaurants')['c'] ?? 0),
    'menu_items' => (int) (db_one('SELECT COUNT(*) AS c FROM menu_items')['c'] ?? 0),
    'orders' => (int) (db_one('SELECT COUNT(*) AS c FROM orders')['c'] ?? 0),
];
$recentOrders = db_all(
    'SELECT o.id, o.status, o.total_amount, o.created_at, u.name AS customer, r.name AS restaurant_name
     FROM orders o
     JOIN users u ON u.id = o.user_id
     JOIN restaurants r ON r.id = o.restaurant_id
     ORDER BY o.created_at DESC
     LIMIT 10'
);

$pageTitle = 'Админ: Панель';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container">
    <h1 style="margin-top:0;">Админ-панель</h1>
    <div class="admin-layout">
        <?php render_admin_nav('index.php'); ?>
        <div>
            <div class="dashboard-grid">
                <article class="stat-card"><p class="muted">Пользователи</p><h2 style="margin:0;"><?= $stats['users'] ?></h2></article>
                <article class="stat-card"><p class="muted">Рестораны</p><h2 style="margin:0;"><?= $stats['restaurants'] ?></h2></article>
                <article class="stat-card"><p class="muted">Блюда</p><h2 style="margin:0;"><?= $stats['menu_items'] ?></h2></article>
                <article class="stat-card"><p class="muted">Заказы</p><h2 style="margin:0;"><?= $stats['orders'] ?></h2></article>
            </div>

            <div class="panel" style="margin-top:16px;">
                <h3 style="margin-top:0;">Последние заказы</h3>
                <table>
                    <thead>
                    <tr>
                        <th>#</th>
                        <th>Клиент</th>
                        <th>Ресторан</th>
                        <th>Статус</th>
                        <th>Сумма</th>
                        <th>Дата</th>
                    </tr>
                    </thead>
                    <tbody>
                    <?php foreach ($recentOrders as $order): ?>
                        <tr>
                            <td><?= (int) $order['id'] ?></td>
                            <td><?= e($order['customer']) ?></td>
                            <td><?= e($order['restaurant_name']) ?></td>
                            <td><?= e(order_status_label((string) $order['status'])) ?></td>
                            <td><?= number_format((float) $order['total_amount'], 0, '.', ' ') ?> ₽</td>
                            <td><?= e($order['created_at']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
