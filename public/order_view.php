<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';
require_auth();

$user = current_user();
$orderId = (int) ($_GET['id'] ?? 0);
$order = db_one(
    'SELECT o.*, r.name AS restaurant_name
     FROM orders o
     JOIN restaurants r ON r.id = o.restaurant_id
     WHERE o.id = :id AND o.user_id = :user_id
     LIMIT 1',
    ['id' => $orderId, 'user_id' => (int) $user['id']]
);

if (!$order) {
    flash('error', 'Заказ не найден.');
    redirect_to('/orders.php');
}

$order = sync_auto_order_status($order);
$statusProgress = order_status_progress((string) $order['status']);

$items = db_all(
    'SELECT * FROM order_items WHERE order_id = :order_id ORDER BY id ASC',
    ['order_id' => $orderId]
);

$pageTitle = 'Детали заказа';
$pageClass = 'page-profile-brutal';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container order-detail-page">
    <div class="order-detail-head">
        <div>
            <p class="muted">Mealgo order tracking</p>
            <h1>Заказ #<?= (int) $order['id'] ?></h1>
            <p class="muted">
                <?= e((string) $order['restaurant_name']) ?> •
                <span data-order-status-label><?= e(order_status_label((string) $order['status'])) ?></span> •
                <?= e((string) $order['created_at']) ?>
            </p>
        </div>
        <a class="btn btn-ghost" href="<?= e(base_url('/orders.php')) ?>">К заказам</a>
    </div>

    <section
        class="panel order-status-card"
        data-order-tracker
        data-order-id="<?= (int) $order['id'] ?>"
        data-status-url="<?= e(base_url('/api/order_status.php?id=' . (int) $order['id'])) ?>"
    >
        <div class="order-status-card__top">
            <div>
                <p class="muted">Текущий этап</p>
                <h2 data-order-status-title><?= e(order_status_label((string) $order['status'])) ?></h2>
            </div>
            <div class="order-status-card__badge" data-order-status-badge>
                <?= e(order_status_label((string) $order['status'])) ?>
            </div>
        </div>

        <div class="order-progress" aria-label="Статус заказа">
            <div class="order-progress__track">
                <span class="order-progress__fill" data-order-progress-fill style="width: <?= (int) $statusProgress['percent'] ?>%;"></span>
                <span class="order-progress__runner" data-order-progress-runner style="left: <?= (int) $statusProgress['percent'] ?>%;"></span>
            </div>

            <div class="order-progress__steps" data-order-progress-steps>
                <?php foreach ($statusProgress['flow'] as $index => $step): ?>
                    <?php
                    $isDone = $index <= $statusProgress['current_index'];
                    $isCurrent = $index === $statusProgress['current_index'];
                    ?>
                    <div class="order-progress-step <?= $isDone ? 'is-done' : '' ?> <?= $isCurrent ? 'is-current' : '' ?>" data-order-step="<?= e((string) $step['status']) ?>">
                        <span class="order-progress-step__dot"></span>
                        <strong><?= e((string) $step['label']) ?></strong>
                    </div>
                <?php endforeach; ?>
            </div>
        </div>

    </section>

    <div class="checkout-layout order-detail-layout">
        <div class="panel">
            <h3 style="margin-top:0;">Позиции</h3>
            <div class="order-list">
                <?php foreach ($items as $item): ?>
                    <article class="order-item order-detail-item">
                        <div>
                            <strong><?= e((string) $item['item_name']) ?></strong>
                            <p class="muted" style="margin:4px 0;">
                                <?= number_format((float) $item['item_price'], 0, '.', ' ') ?> ₽ × <?= (int) $item['quantity'] ?>
                            </p>
                        </div>
                        <strong><?= number_format((float) $item['line_total'], 0, '.', ' ') ?> ₽</strong>
                    </article>
                <?php endforeach; ?>
            </div>
        </div>
        <aside class="panel sticky order-detail-summary">
            <h3 style="margin-top:0;">Сводка</h3>
            <p>Имя: <strong><?= e((string) $order['customer_name']) ?></strong></p>
            <p>Телефон: <strong><?= e((string) $order['customer_phone']) ?></strong></p>
            <p>Адрес: <strong><?= e((string) $order['delivery_address']) ?></strong></p>
            <p>Оплата: <strong><?= e(payment_method_label((string) $order['payment_method'])) ?></strong></p>
            <hr class="order-detail-summary__divider">
            <p>Подытог: <strong><?= number_format((float) $order['subtotal_amount'], 0, '.', ' ') ?> ₽</strong></p>
            <p>Доставка: <strong><?= number_format((float) $order['delivery_fee'], 0, '.', ' ') ?> ₽</strong></p>
            <p>Итого: <strong><?= number_format((float) $order['total_amount'], 0, '.', ' ') ?> ₽</strong></p>
        </aside>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
