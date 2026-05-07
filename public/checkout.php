<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';
require_auth();

$user = current_user();
$userId = (int) $user['id'];
$cartId = (int) ($_GET['cart_id'] ?? $_POST['cart_id'] ?? 0);

if ($cartId <= 0) {
    flash('error', 'Корзина не выбрана.');
    redirect_to('/restaurants.php');
}

$savedAddresses = db_all(
    'SELECT id, title, address_line FROM user_addresses WHERE user_id = :user_id ORDER BY created_at DESC',
    ['user_id' => $userId]
);

$savedAddressMap = [];
foreach ($savedAddresses as $address) {
    $savedAddressMap[(int) $address['id']] = $address;
}

if (is_post()) {
    verify_csrf();
    $action = (string) ($_POST['action'] ?? '');

    if ($action === 'update_item') {
        update_cart_item_quantity($userId, (int) ($_POST['cart_item_id'] ?? 0), (int) ($_POST['quantity'] ?? 1));
        redirect_to('/checkout.php?cart_id=' . $cartId);
    }

    if ($action === 'remove_item') {
        remove_cart_item($userId, (int) ($_POST['cart_item_id'] ?? 0));
        redirect_to('/checkout.php?cart_id=' . $cartId);
    }

    if ($action === 'place_order') {
        $savedAddressId = (int) ($_POST['saved_address_id'] ?? 0);
        $selectedAddress = '';
        if ($savedAddressId > 0 && isset($savedAddressMap[$savedAddressId])) {
            $selectedAddress = trim((string) $savedAddressMap[$savedAddressId]['address_line']);
        }

        $payload = [
            'customer_name' => trim((string) ($_POST['customer_name'] ?? '')),
            'customer_email' => trim((string) ($_POST['customer_email'] ?? '')),
            'customer_phone' => trim((string) ($_POST['customer_phone'] ?? '')),
            'delivery_address' => $selectedAddress,
            'comment' => trim((string) ($_POST['comment'] ?? '')),
            'payment_method' => (string) ($_POST['payment_method'] ?? ''),
        ];

        $oldPayload = [
            'customer_name' => $payload['customer_name'],
            'customer_email' => $payload['customer_email'],
            'customer_phone' => $payload['customer_phone'],
            'comment' => $payload['comment'],
            'payment_method' => $payload['payment_method'],
            'saved_address_id' => (string) $savedAddressId,
        ];

        $errors = validate(
            [
                'customer_name' => ['required', 'min:2'],
                'customer_email' => ['required', 'email'],
                'customer_phone' => ['required', 'min:7'],
                'delivery_address' => ['required', 'min:8'],
            ],
            $payload
        );

        if ($savedAddressId <= 0 || !isset($savedAddressMap[$savedAddressId])) {
            $errors['saved_address_id'] = 'Выберите адрес из профиля.';
        }

        if (!in_array($payload['payment_method'], ['cash', 'card_on_delivery'], true)) {
            $errors['payment_method'] = 'Выберите способ оплаты.';
        }

        if ($errors) {
            flash('error', 'Проверьте поля формы оформления.');
            with_old_input($oldPayload);
            redirect_to('/checkout.php?cart_id=' . $cartId);
        }

        try {
            $orderId = create_order_from_cart($userId, $cartId, $payload);
            clear_old_input();
            flash('success', 'Заказ оформлен.');
            redirect_to('/order_view.php?id=' . $orderId);
        } catch (Throwable $e) {
            app_log('checkout_error', ['message' => $e->getMessage()]);
            flash('error', 'Не удалось оформить заказ. Повторите попытку.');
            redirect_to('/checkout.php?cart_id=' . $cartId);
        }
    }
}

$cart = get_cart_detail($userId, $cartId);
if (!$cart) {
    flash('error', 'Корзина не найдена.');
    redirect_to('/restaurants.php');
}

$paymentLabels = [
    'cash' => 'Наличными курьеру',
    'card_on_delivery' => 'Картой курьеру',
];
$paymentMethod = (string) old('payment_method', 'cash');
if (!isset($paymentLabels[$paymentMethod])) {
    $paymentMethod = 'cash';
}

$defaultAddressId = $savedAddresses ? (string) (int) $savedAddresses[0]['id'] : '0';
$selectedSavedAddressId = (int) old('saved_address_id', $defaultAddressId);
if (!isset($savedAddressMap[$selectedSavedAddressId])) {
    $selectedSavedAddressId = (int) $defaultAddressId;
}
$selectedAddressLabel = $selectedSavedAddressId > 0 && isset($savedAddressMap[$selectedSavedAddressId])
    ? ((string) $savedAddressMap[$selectedSavedAddressId]['title'] . ' — ' . (string) $savedAddressMap[$selectedSavedAddressId]['address_line'])
    : 'Нет сохраненных адресов';

$hasSavedAddresses = count($savedAddresses) > 0;

$pageTitle = 'Оформление заказа';
$pageClass = 'page-profile-brutal';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container checkout-page">
    <h1>Оформление: <?= e($cart['restaurant_name']) ?></h1>
    <?php if (!$cart['items']): ?>
        <div class="empty-state">Эта корзина пуста.</div>
    <?php else: ?>
        <div class="checkout-layout checkout-page-layout">
            <div class="panel checkout-delivery-panel">
                <h3 class="checkout-title">Данные доставки</h3>
                <form method="post" class="checkout-delivery-form">
                    <?= csrf_field() ?>
                    <input type="hidden" name="action" value="place_order">
                    <input type="hidden" name="cart_id" value="<?= (int) $cart['id'] ?>">

                    <div class="two-col">
                        <div class="field">
                            <label for="customer_name">Имя</label>
                            <input
                                id="customer_name"
                                type="text"
                                name="customer_name"
                                value="<?= e(old('customer_name', (string) $user['name'])) ?>"
                                required
                            >
                        </div>
                        <div class="field">
                            <label for="customer_email">Эл. почта</label>
                            <input
                                id="customer_email"
                                type="email"
                                name="customer_email"
                                value="<?= e(old('customer_email', (string) $user['email'])) ?>"
                                required
                            >
                        </div>
                    </div>

                    <div class="two-col">
                        <div class="field">
                            <label for="customer_phone">Телефон</label>
                            <input
                                id="customer_phone"
                                type="tel"
                                name="customer_phone"
                                value="<?= e(old('customer_phone', (string) $user['phone'])) ?>"
                                placeholder="+7 (___) ___-__-__"
                                required
                            >
                        </div>
                        <div class="field">
                            <label>Способ оплаты</label>
                            <div class="custom-dropdown" data-custom-dropdown>
                                <input type="hidden" name="payment_method" value="<?= e($paymentMethod) ?>" data-custom-dropdown-input>
                                <button class="custom-dropdown__toggle" type="button" data-custom-dropdown-toggle aria-haspopup="listbox" aria-expanded="false">
                                    <span data-custom-dropdown-label><?= e($paymentLabels[$paymentMethod]) ?></span>
                                    <span class="custom-dropdown__chevron" aria-hidden="true"></span>
                                </button>
                                <div class="custom-dropdown__menu" data-custom-dropdown-menu role="listbox">
                                    <?php foreach ($paymentLabels as $value => $label): ?>
                                        <button
                                            class="custom-dropdown__option <?= $paymentMethod === $value ? 'is-active' : '' ?>"
                                            type="button"
                                            data-custom-dropdown-option
                                            data-value="<?= e($value) ?>"
                                            data-label="<?= e($label) ?>"
                                            role="option"
                                            aria-selected="<?= $paymentMethod === $value ? 'true' : 'false' ?>"
                                        >
                                            <?= e($label) ?>
                                        </button>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="field">
                        <label>Адрес доставки</label>
                        <?php if ($hasSavedAddresses): ?>
                            <div class="custom-dropdown" data-custom-dropdown>
                                <input type="hidden" name="saved_address_id" value="<?= (int) $selectedSavedAddressId ?>" data-custom-dropdown-input>
                                <button class="custom-dropdown__toggle" type="button" data-custom-dropdown-toggle aria-haspopup="listbox" aria-expanded="false">
                                    <span data-custom-dropdown-label><?= e($selectedAddressLabel) ?></span>
                                    <span class="custom-dropdown__chevron" aria-hidden="true"></span>
                                </button>
                                <div class="custom-dropdown__menu" data-custom-dropdown-menu role="listbox">
                                    <?php foreach ($savedAddresses as $address): ?>
                                        <?php
                                        $addressId = (int) $address['id'];
                                        $addressLabel = (string) $address['title'] . ' — ' . (string) $address['address_line'];
                                        ?>
                                        <button
                                            class="custom-dropdown__option <?= $selectedSavedAddressId === $addressId ? 'is-active' : '' ?>"
                                            type="button"
                                            data-custom-dropdown-option
                                            data-value="<?= $addressId ?>"
                                            data-label="<?= e($addressLabel) ?>"
                                            role="option"
                                            aria-selected="<?= $selectedSavedAddressId === $addressId ? 'true' : 'false' ?>"
                                        >
                                            <?= e($addressLabel) ?>
                                        </button>
                                    <?php endforeach; ?>
                                </div>
                            </div>
                            <p class="muted checkout-note">Адрес выбирается только из сохраненных в профиле.</p>
                        <?php else: ?>
                            <div class="empty-state checkout-address-empty">
                                <p>В профиле пока нет адресов доставки.</p>
                                <a class="btn btn-ghost" href="<?= e(base_url('/profile.php')) ?>">Добавить адрес в профиле</a>
                            </div>
                            <input type="hidden" name="saved_address_id" value="0">
                        <?php endif; ?>
                    </div>

                    <div class="field">
                        <label for="comment">Комментарий курьеру</label>
                        <textarea id="comment" name="comment"><?= e(old('comment')) ?></textarea>
                    </div>

                    <button class="btn btn-primary" type="submit" <?= $hasSavedAddresses ? '' : 'disabled' ?>>Подтвердить заказ</button>
                </form>
            </div>

            <aside class="panel checkout-order-panel">
                <h3 class="checkout-title">Ваш заказ</h3>
                <div class="checkout-order-scroll">
                    <div class="order-list checkout-order-list">
                        <?php foreach ($cart['items'] as $item): ?>
                            <article class="order-item checkout-order-item">
                                <div class="checkout-order-item__head">
                                    <div class="checkout-order-item__name-wrap">
                                        <strong><?= e($item['name']) ?></strong>
                                        <p class="muted checkout-order-item__meta">
                                            <?= number_format((float) $item['price'], 0, '.', ' ') ?> ₽ × <?= (int) $item['quantity'] ?>
                                        </p>
                                    </div>
                                    <strong class="checkout-order-item__total">
                                        <?= number_format((float) $item['line_total'], 0, '.', ' ') ?> ₽
                                    </strong>
                                </div>
                                <div class="checkout-order-item__controls">
                                    <form method="post" class="checkout-item-qty" data-qty-submit>
                                        <?= csrf_field() ?>
                                        <input type="hidden" name="cart_id" value="<?= (int) $cart['id'] ?>">
                                        <input type="hidden" name="cart_item_id" value="<?= (int) $item['id'] ?>">
                                        <input type="hidden" name="action" value="update_item">
                                        <div class="qty-control" data-qty-control>
                                            <button class="qty-control__btn" type="button" data-qty-dec aria-label="Уменьшить количество">-</button>
                                            <input
                                                class="qty-control__input"
                                                type="text"
                                                name="quantity"
                                                value="<?= (int) $item['quantity'] ?>"
                                                inputmode="numeric"
                                                pattern="[0-9]*"
                                                data-qty-input
                                                readonly
                                            >
                                            <button class="qty-control__btn" type="button" data-qty-inc aria-label="Увеличить количество">+</button>
                                        </div>
                                    </form>
                                    <form method="post" class="checkout-order-item__remove">
                                        <?= csrf_field() ?>
                                        <input type="hidden" name="cart_id" value="<?= (int) $cart['id'] ?>">
                                        <input type="hidden" name="cart_item_id" value="<?= (int) $item['id'] ?>">
                                        <input type="hidden" name="action" value="remove_item">
                                        <button class="btn btn-ghost" type="submit">Удалить</button>
                                    </form>
                                </div>
                            </article>
                        <?php endforeach; ?>
                    </div>
                </div>
                <hr class="checkout-divider">
                <div class="checkout-totals">
                    <p>Промежуточный итог: <strong><?= number_format((float) $cart['subtotal'], 0, '.', ' ') ?> ₽</strong></p>
                    <p>Доставка: <strong><?= number_format((float) $cart['delivery_fee'], 0, '.', ' ') ?> ₽</strong></p>
                    <p class="checkout-totals__total">Итого: <strong><?= number_format((float) $cart['total'], 0, '.', ' ') ?> ₽</strong></p>
                </div>
            </aside>
        </div>
    <?php endif; ?>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
