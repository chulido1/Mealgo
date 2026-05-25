<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';
require_auth();

$user = current_user();
$userId = (int) $user['id'];
$focusCartId = (int) ($_GET['cart'] ?? $_POST['cart_id'] ?? 0);

if (is_post()) {
    verify_csrf();
    $action = (string) ($_POST['action'] ?? '');

    if ($action === 'update_item') {
        $itemId = (int) ($_POST['cart_item_id'] ?? 0);
        $quantity = max(1, (int) ($_POST['quantity'] ?? 1));
        if ($itemId > 0) {
            update_cart_item_quantity($userId, $itemId, $quantity);
        }
        redirect_to('/cart.php' . ($focusCartId > 0 ? '?cart=' . $focusCartId : ''));
    }

    if ($action === 'remove_item') {
        $itemId = (int) ($_POST['cart_item_id'] ?? 0);
        if ($itemId > 0) {
            remove_cart_item($userId, $itemId);
        }
        redirect_to('/cart.php' . ($focusCartId > 0 ? '?cart=' . $focusCartId : ''));
    }

    if ($action === 'clear_cart') {
        $cartId = (int) ($_POST['cart_id'] ?? 0);
        if ($cartId > 0) {
            clear_active_cart($userId, $cartId);
            flash('success', 'Корзина очищена.');
        }
        redirect_to('/cart.php');
    }
}

$activeMeta = get_active_carts($userId);
$carts = [];

foreach ($activeMeta as $meta) {
    $detail = get_cart_detail($userId, (int) $meta['id']);
    if ($detail !== null) {
        $carts[] = $detail;
    }
}

if ($focusCartId > 0 && count($carts) > 1) {
    usort(
        $carts,
        static fn(array $a, array $b): int => ((int) $a['id'] === $focusCartId ? -1 : 0) <=> ((int) $b['id'] === $focusCartId ? -1 : 0)
    );
}

$pageTitle = 'Корзина';
$pageClass = 'page-cart-brutal';

require ROOT_PATH . '/templates/header.php';
?>
<section class="container cart-page">
    <header class="cart-page__head">
        <h1>Корзина</h1>
        <p>У вас может быть несколько активных корзин: отдельная корзина для каждого ресторана.</p>
    </header>

    <?php if (!$carts): ?>
        <div class="empty-state restaurants-empty">
            <p>Пока нет активных корзин.</p>
            <a class="btn btn-primary" href="<?= e(base_url('/restaurants.php')) ?>">Выбрать рестораны</a>
        </div>
    <?php else: ?>
        <div class="cart-page__list">
            <?php foreach ($carts as $cart): ?>
                <?php
                $minOrderAmount = (float) ($cart['min_order_amount'] ?? 0);
                $isBelowMinOrder = $minOrderAmount > 0 && (float) $cart['subtotal'] < $minOrderAmount;
                $minOrderLeft = max(0, $minOrderAmount - (float) $cart['subtotal']);
                ?>
                <article class="cart-restaurant-card" id="cart-<?= (int) $cart['id'] ?>">
                    <div class="cart-restaurant-card__top">
                        <div>
                            <h2><?= e((string) $cart['restaurant_name']) ?></h2>
                            <p class="muted">
                                <?= count($cart['items']) ?> поз. •
                                Доставка <?= number_format((float) $cart['delivery_fee'], 0, '.', ' ') ?> ₽
                            </p>
                        </div>

                        <div class="cart-restaurant-card__actions">
                            <a class="btn btn-ghost" href="<?= e(base_url('/restaurant.php?id=' . (int) $cart['restaurant_id'])) ?>">Открыть ресторан</a>
                            <?php if ($isBelowMinOrder): ?>
                                <span class="btn btn-primary btn-disabled" aria-disabled="true">Оформить заказ</span>
                            <?php else: ?>
                                <a class="btn btn-primary" href="<?= e(base_url('/checkout.php?cart_id=' . (int) $cart['id'])) ?>">Оформить заказ</a>
                            <?php endif; ?>
                            <form method="post">
                                <?= csrf_field() ?>
                                <input type="hidden" name="action" value="clear_cart">
                                <input type="hidden" name="cart_id" value="<?= (int) $cart['id'] ?>">
                                <button class="btn btn-ghost" type="submit">Очистить</button>
                            </form>
                        </div>
                    </div>

                    <?php if (!$cart['items']): ?>
                        <div class="empty-state restaurants-empty">Эта корзина пустая.</div>
                    <?php else: ?>
                        <div class="cart-restaurant-card__items">
                            <?php foreach ($cart['items'] as $item): ?>
                                <article class="cart-line">
                                    <img src="<?= e(base_url((string) ($item['image'] ?: '/uploads/menu/placeholder.svg'))) ?>" alt="<?= e((string) $item['name']) ?>">

                                    <div class="cart-line__meta">
                                        <strong><?= e((string) $item['name']) ?></strong>
                                        <p class="muted"><?= number_format((float) $item['price'], 0, '.', ' ') ?> ₽ за порцию</p>
                                    </div>

                                    <form method="post" class="cart-line__qty" data-qty-submit>
                                        <?= csrf_field() ?>
                                        <input type="hidden" name="action" value="update_item">
                                        <input type="hidden" name="cart_id" value="<?= (int) $cart['id'] ?>">
                                        <input type="hidden" name="cart_item_id" value="<?= (int) $item['id'] ?>">
                                        <div class="qty-control" data-qty-control>
                                            <button class="qty-control__btn" type="button" data-qty-dec aria-label="Уменьшить количество">-</button>
                                            <input class="qty-control__input" type="text" name="quantity" value="<?= (int) $item['quantity'] ?>" inputmode="numeric" pattern="[0-9]*" data-qty-input readonly>
                                            <button class="qty-control__btn" type="button" data-qty-inc aria-label="Увеличить количество">+</button>
                                        </div>
                                    </form>

                                    <div class="cart-line__end">
                                        <strong><?= number_format((float) $item['line_total'], 0, '.', ' ') ?> ₽</strong>
                                        <form method="post">
                                            <?= csrf_field() ?>
                                            <input type="hidden" name="action" value="remove_item">
                                            <input type="hidden" name="cart_id" value="<?= (int) $cart['id'] ?>">
                                            <input type="hidden" name="cart_item_id" value="<?= (int) $item['id'] ?>">
                                            <button class="btn btn-ghost" type="submit">Удалить</button>
                                        </form>
                                    </div>
                                </article>
                            <?php endforeach; ?>
                        </div>
                    <?php endif; ?>

                    <div class="cart-restaurant-card__summary">
                        <p>Промежуточный итог: <strong><?= number_format((float) $cart['subtotal'], 0, '.', ' ') ?> ₽</strong></p>
                        <?php if ($minOrderAmount > 0): ?>
                            <p>Минимальный заказ: <strong><?= number_format($minOrderAmount, 0, '.', ' ') ?> ₽</strong></p>
                        <?php endif; ?>
                        <?php if ($isBelowMinOrder): ?>
                            <p class="cart-restaurant-card__warning">Добавьте еще на <?= number_format($minOrderLeft, 0, '.', ' ') ?> ₽, чтобы оформить заказ.</p>
                        <?php endif; ?>
                        <p>Доставка: <strong><?= number_format((float) $cart['delivery_fee'], 0, '.', ' ') ?> ₽</strong></p>
                        <p>Итого: <strong><?= number_format((float) $cart['total'], 0, '.', ' ') ?> ₽</strong></p>
                    </div>
                </article>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</section>

<?php require ROOT_PATH . '/templates/footer.php'; ?>
