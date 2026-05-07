<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_once ROOT_PATH . '/includes/admin_helpers.php';
require_admin();

$statuses = ['new', 'confirmed', 'preparing', 'on_the_way', 'delivered', 'cancelled'];

if (is_post()) {
    verify_csrf();
    $id = (int) ($_POST['id'] ?? 0);
    $status = (string) ($_POST['status'] ?? 'new');
    if ($id > 0 && in_array($status, $statuses, true)) {
        db_exec(
            'UPDATE orders SET status = :status, updated_at = :updated_at WHERE id = :id',
            ['status' => $status, 'updated_at' => now(), 'id' => $id]
        );
        admin_log((int) current_user()['id'], 'update_status', 'order', $id);
        flash('success', 'Статус заказа обновлен.');
    }
    redirect_to('/admin/orders.php');
}

$orders = db_all(
    'SELECT o.id, o.status, o.total_amount, o.payment_method, o.created_at, u.name AS user_name, r.name AS restaurant_name
     FROM orders o
     JOIN users u ON u.id = o.user_id
     JOIN restaurants r ON r.id = o.restaurant_id
     ORDER BY o.created_at DESC'
);

$pageTitle = 'Админ: Заказы';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container">
    <h1 style="margin-top:0;">Заказы</h1>
    <div class="admin-layout">
        <?php render_admin_nav('orders.php'); ?>
        <div class="panel">
            <table>
                <thead>
                <tr><th>#</th><th>Клиент</th><th>Ресторан</th><th>Оплата</th><th>Сумма</th><th>Дата</th><th>Статус</th></tr>
                </thead>
                <tbody>
                <?php foreach ($orders as $order): ?>
                    <tr>
                        <td><?= (int) $order['id'] ?></td>
                        <td><?= e($order['user_name']) ?></td>
                        <td><?= e($order['restaurant_name']) ?></td>
                        <td><?= e(payment_method_label((string) $order['payment_method'])) ?></td>
                        <td><?= number_format((float) $order['total_amount'], 0, '.', ' ') ?> ₽</td>
                        <td><?= e($order['created_at']) ?></td>
                        <td>
                            <form method="post" style="display:flex;gap:6px;">
                                <?= csrf_field() ?>
                                <input type="hidden" name="id" value="<?= (int) $order['id'] ?>">
                                <select name="status">
                                    <?php foreach ($statuses as $status): ?>
                                        <option value="<?= e($status) ?>" <?= $order['status'] === $status ? 'selected' : '' ?>><?= e(order_status_label($status)) ?></option>
                                    <?php endforeach; ?>
                                </select>
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
