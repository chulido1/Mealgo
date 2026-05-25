<?php

declare(strict_types=1);

class OrderMinimumAmountException extends RuntimeException
{
}

function create_order_from_cart(int $userId, int $cartId, array $payload): int
{
    $cart = get_cart_detail($userId, $cartId);
    if (!$cart || empty($cart['items'])) {
        throw new RuntimeException('Корзина не найдена или пуста.');
    }

    $minOrderAmount = (float) ($cart['min_order_amount'] ?? 0);
    if ($minOrderAmount > 0 && (float) $cart['subtotal'] < $minOrderAmount) {
        throw new OrderMinimumAmountException(
            'Минимальная сумма заказа в этом ресторане: '
            . number_format($minOrderAmount, 0, '.', ' ')
            . ' ₽.'
        );
    }

    $pdo = db();
    $pdo->beginTransaction();

    try {
        db_exec(
            'INSERT INTO orders (
                user_id, restaurant_id, status, customer_name, customer_email, customer_phone,
                delivery_address, comment, payment_method, subtotal_amount, delivery_fee, total_amount, created_at, updated_at
             ) VALUES (
                :user_id, :restaurant_id, "new", :customer_name, :customer_email, :customer_phone,
                :delivery_address, :comment, :payment_method, :subtotal_amount, :delivery_fee, :total_amount, :created_at, :updated_at
             )',
            [
                'user_id' => $userId,
                'restaurant_id' => $cart['restaurant_id'],
                'customer_name' => trim((string) $payload['customer_name']),
                'customer_email' => trim((string) $payload['customer_email']),
                'customer_phone' => trim((string) $payload['customer_phone']),
                'delivery_address' => trim((string) $payload['delivery_address']),
                'comment' => trim((string) ($payload['comment'] ?? '')),
                'payment_method' => $payload['payment_method'],
                'subtotal_amount' => $cart['subtotal'],
                'delivery_fee' => $cart['delivery_fee'],
                'total_amount' => $cart['total'],
                'created_at' => now(),
                'updated_at' => now(),
            ]
        );

        $orderId = (int) $pdo->lastInsertId();

        foreach ($cart['items'] as $item) {
            db_exec(
                'INSERT INTO order_items (order_id, menu_item_id, item_name, item_price, quantity, line_total)
                 VALUES (:order_id, :menu_item_id, :item_name, :item_price, :quantity, :line_total)',
                [
                    'order_id' => $orderId,
                    'menu_item_id' => $item['menu_item_id'],
                    'item_name' => $item['name'],
                    'item_price' => $item['price'],
                    'quantity' => $item['quantity'],
                    'line_total' => $item['line_total'],
                ]
            );
        }

        db_exec(
            'UPDATE carts SET status = "converted", updated_at = :updated_at WHERE id = :id',
            ['updated_at' => now(), 'id' => $cartId]
        );

        $pdo->commit();
        return $orderId;
    } catch (Throwable $e) {
        $pdo->rollBack();
        throw $e;
    }
}

function order_status_flow(): array
{
    return [
        ['status' => 'new', 'label' => 'Новый', 'seconds' => 0],
        ['status' => 'confirmed', 'label' => 'Подтвержден', 'seconds' => 60],
        ['status' => 'preparing', 'label' => 'Готовится', 'seconds' => 120],
        ['status' => 'on_the_way', 'label' => 'В пути', 'seconds' => 180],
        ['status' => 'delivered', 'label' => 'Доставлен', 'seconds' => 240],
    ];
}

function auto_order_status_from_created_at(string $createdAt): string
{
    $createdTimestamp = strtotime($createdAt);
    if ($createdTimestamp === false) {
        return 'new';
    }

    $elapsedSeconds = max(0, time() - $createdTimestamp);
    $currentStatus = 'new';

    foreach (order_status_flow() as $step) {
        if ($elapsedSeconds >= (int) $step['seconds']) {
            $currentStatus = (string) $step['status'];
        }
    }

    return $currentStatus;
}

function order_status_progress(string $status): array
{
    $flow = order_status_flow();
    $statuses = array_column($flow, 'status');
    $currentIndex = array_search($status, $statuses, true);

    if ($currentIndex === false) {
        $currentIndex = 0;
    }

    $lastIndex = max(1, count($flow) - 1);

    return [
        'flow' => $flow,
        'current_index' => (int) $currentIndex,
        'percent' => (int) round(((int) $currentIndex / $lastIndex) * 100),
    ];
}

function sync_auto_order_status(array $order): array
{
    $currentStatus = (string) ($order['status'] ?? 'new');
    if (in_array($currentStatus, ['cancelled', 'delivered'], true)) {
        return $order;
    }

    $nextStatus = auto_order_status_from_created_at((string) $order['created_at']);
    if ($nextStatus !== $currentStatus) {
        db_exec(
            'UPDATE orders SET status = :status, updated_at = :updated_at WHERE id = :id',
            ['status' => $nextStatus, 'updated_at' => now(), 'id' => (int) $order['id']]
        );
        $order['status'] = $nextStatus;
        $order['updated_at'] = now();
    }

    return $order;
}
