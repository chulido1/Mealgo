<?php

declare(strict_types=1);

function get_or_create_active_cart(int $userId, int $restaurantId): int
{
    $existing = db_one(
        'SELECT id FROM carts
         WHERE user_id = :user_id AND restaurant_id = :restaurant_id AND status = "active"
         LIMIT 1',
        [
            'user_id' => $userId,
            'restaurant_id' => $restaurantId,
        ]
    );

    if ($existing) {
        return (int) $existing['id'];
    }

    db_exec(
        'INSERT INTO carts (user_id, restaurant_id, status, created_at, updated_at)
         VALUES (:user_id, :restaurant_id, "active", :created_at, :updated_at)',
        [
            'user_id' => $userId,
            'restaurant_id' => $restaurantId,
            'created_at' => now(),
            'updated_at' => now(),
        ]
    );

    return (int) db()->lastInsertId();
}

function add_item_to_cart(int $userId, int $restaurantId, int $menuItemId, int $quantity = 1): void
{
    $cartId = get_or_create_active_cart($userId, $restaurantId);
    $item = db_one(
        'SELECT id, price, is_available FROM menu_items
         WHERE id = :id AND restaurant_id = :restaurant_id LIMIT 1',
        ['id' => $menuItemId, 'restaurant_id' => $restaurantId]
    );
    if (!$item || (int) $item['is_available'] !== 1) {
        throw new RuntimeException('Блюдо недоступно');
    }

    $existing = db_one(
        'SELECT id, quantity FROM cart_items WHERE cart_id = :cart_id AND menu_item_id = :menu_item_id LIMIT 1',
        ['cart_id' => $cartId, 'menu_item_id' => $menuItemId]
    );

    if ($existing) {
        db_exec(
            'UPDATE cart_items SET quantity = quantity + :quantity WHERE id = :id',
            ['quantity' => $quantity, 'id' => $existing['id']]
        );
    } else {
        db_exec(
            'INSERT INTO cart_items (cart_id, menu_item_id, quantity, price)
             VALUES (:cart_id, :menu_item_id, :quantity, :price)',
            [
                'cart_id' => $cartId,
                'menu_item_id' => $menuItemId,
                'quantity' => max(1, $quantity),
                'price' => $item['price'],
            ]
        );
    }

    db_exec('UPDATE carts SET updated_at = :updated_at WHERE id = :id', [
        'updated_at' => now(),
        'id' => $cartId,
    ]);
}

function get_active_carts(int $userId): array
{
    return db_all(
        'SELECT c.id, c.restaurant_id, c.updated_at, r.name AS restaurant_name, r.delivery_fee,
                COALESCE(SUM(ci.quantity),0) AS items_count,
                COALESCE(SUM(ci.quantity * ci.price),0) AS subtotal
         FROM carts c
         JOIN restaurants r ON r.id = c.restaurant_id
         LEFT JOIN cart_items ci ON ci.cart_id = c.id
         WHERE c.user_id = :user_id AND c.status = "active"
         GROUP BY c.id, c.restaurant_id, c.updated_at, r.name, r.delivery_fee
         ORDER BY c.updated_at DESC',
        ['user_id' => $userId]
    );
}

function clear_active_cart(int $userId, int $cartId): void
{
    db_exec(
        'UPDATE carts
         SET status = "abandoned", updated_at = :updated_at
         WHERE id = :id AND user_id = :user_id AND status = "active"',
        [
            'id' => $cartId,
            'user_id' => $userId,
            'updated_at' => now(),
        ]
    );
}

function get_active_carts_payload(int $userId): array
{
    $activeCarts = get_active_carts($userId);
    $cartCount = 0;
    $cartsPayload = [];

    foreach ($activeCarts as $cartMeta) {
        $cartId = (int) $cartMeta['id'];
        $itemsCount = (int) $cartMeta['items_count'];
        $cartCount += $itemsCount;

        $detail = get_cart_detail($userId, $cartId);
        if (!$detail) {
            continue;
        }

        $items = [];
        foreach ($detail['items'] as $item) {
            $items[] = [
                'name' => (string) $item['name'],
                'quantity' => (int) $item['quantity'],
            ];
        }

        $cartsPayload[] = [
            'id' => $cartId,
            'restaurant_name' => (string) $cartMeta['restaurant_name'],
            'items_count' => $itemsCount,
            'subtotal' => (float) $cartMeta['subtotal'],
            'details_url' => base_url('/cart.php?cart=' . $cartId),
            'items' => $items,
        ];
    }

    return [
        'cart_count' => $cartCount,
        'carts' => $cartsPayload,
    ];
}

function get_cart_detail(int $userId, int $cartId): ?array
{
    $cart = db_one(
        'SELECT c.*, r.name AS restaurant_name, r.delivery_fee, r.min_order_amount
         FROM carts c
         JOIN restaurants r ON r.id = c.restaurant_id
         WHERE c.id = :id AND c.user_id = :user_id LIMIT 1',
        ['id' => $cartId, 'user_id' => $userId]
    );

    if (!$cart) {
        return null;
    }

    $items = db_all(
        'SELECT ci.id, ci.menu_item_id, ci.quantity, ci.price,
                mi.name, mi.image,
                (ci.quantity * ci.price) AS line_total
         FROM cart_items ci
         JOIN menu_items mi ON mi.id = ci.menu_item_id
         WHERE ci.cart_id = :cart_id
         ORDER BY ci.id ASC',
        ['cart_id' => $cartId]
    );

    $subtotal = 0.0;
    foreach ($items as $item) {
        $subtotal += (float) $item['line_total'];
    }

    $deliveryFee = (float) $cart['delivery_fee'];
    $cart['items'] = $items;
    $cart['subtotal'] = $subtotal;
    $cart['total'] = $subtotal + $deliveryFee;
    return $cart;
}

function update_cart_item_quantity(int $userId, int $cartItemId, int $quantity): void
{
    $item = db_one(
        'SELECT ci.id, ci.cart_id
         FROM cart_items ci
         JOIN carts c ON c.id = ci.cart_id
         WHERE ci.id = :id AND c.user_id = :user_id AND c.status = "active"
         LIMIT 1',
        ['id' => $cartItemId, 'user_id' => $userId]
    );

    if (!$item) {
        return;
    }

    if ($quantity <= 0) {
        db_exec('DELETE FROM cart_items WHERE id = :id', ['id' => $cartItemId]);
    } else {
        db_exec(
            'UPDATE cart_items SET quantity = :quantity WHERE id = :id',
            ['quantity' => $quantity, 'id' => $cartItemId]
        );
    }

    db_exec('UPDATE carts SET updated_at = :updated_at WHERE id = :id', [
        'updated_at' => now(),
        'id' => $item['cart_id'],
    ]);
}

function remove_cart_item(int $userId, int $cartItemId): void
{
    update_cart_item_quantity($userId, $cartItemId, 0);
}
