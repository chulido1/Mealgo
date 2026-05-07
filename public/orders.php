<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';
require_auth();

$orders = db_all(
    'SELECT o.*, r.name AS restaurant_name
     FROM orders o
     JOIN restaurants r ON r.id = o.restaurant_id
     WHERE o.user_id = :user_id
     ORDER BY o.created_at DESC',
    ['user_id' => current_user()['id']]
);

$pageTitle = 'История заказов';
$pageClass = 'page-profile-brutal';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container">
    <h1 style="margin-top:0;">История заказов</h1>
    <?php if (!$orders): ?>
        <div class="orders-empty">
            <h2>Заказов пока нет</h2>
            <p>Выберите ресторан, соберите корзину и первый заказ появится здесь.</p>
            <a class="btn btn-primary" href="<?= e(base_url('/restaurants.php')) ?>">Перейти в каталог</a>
        </div>
    <?php else: ?>
        <div class="order-list orders-history-list">
            <?php foreach ($orders as $order): ?>
                <article class="order-item">
                    <div>
                        <strong>Заказ #<?= (int) $order['id'] ?></strong>
                        <p class="muted" style="margin:4px 0;">
                            <?= e($order['restaurant_name']) ?> • <?= e(order_status_label((string) $order['status'])) ?> • <?= e($order['created_at']) ?>
                        </p>
                    </div>
                    <div style="display:flex;align-items:center;gap:10px;">
                        <strong><?= number_format((float) $order['total_amount'], 0, '.', ' ') ?> ₽</strong>
                        <a class="btn btn-ghost" href="<?= e(base_url('/order_view.php?id=' . (int) $order['id'])) ?>">Детали</a>
                    </div>
                </article>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
