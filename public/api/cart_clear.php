<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';

header('Content-Type: application/json; charset=utf-8');

if (!auth_check()) {
    http_response_code(401);
    echo json_encode(['ok' => false, 'message' => 'Требуется авторизация'], JSON_UNESCAPED_UNICODE);
    exit;
}

if (!is_post()) {
    http_response_code(405);
    echo json_encode(['ok' => false, 'message' => 'Метод не поддерживается'], JSON_UNESCAPED_UNICODE);
    exit;
}

try {
    verify_csrf();

    $cartId = (int) ($_POST['cart_id'] ?? 0);
    if ($cartId <= 0) {
        throw new RuntimeException('Некорректная корзина');
    }

    $userId = (int) current_user()['id'];
    clear_active_cart($userId, $cartId);
    $payload = get_active_carts_payload($userId);

    echo json_encode([
        'ok' => true,
        'message' => 'Корзина очищена',
        'cart_count' => (int) $payload['cart_count'],
        'carts' => $payload['carts'],
    ], JSON_UNESCAPED_UNICODE);
} catch (Throwable $e) {
    http_response_code(422);
    echo json_encode(['ok' => false, 'message' => $e->getMessage()], JSON_UNESCAPED_UNICODE);
}
