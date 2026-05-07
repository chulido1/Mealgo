<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';

header('Content-Type: application/json; charset=utf-8');

if (!auth_check()) {
    http_response_code(401);
    echo json_encode(['ok' => false, 'message' => 'Нужна авторизация'], JSON_UNESCAPED_UNICODE);
    exit;
}

if (!is_post()) {
    http_response_code(405);
    echo json_encode(['ok' => false, 'message' => 'Метод не поддерживается'], JSON_UNESCAPED_UNICODE);
    exit;
}

try {
    verify_csrf();
    $restaurantId = (int) ($_POST['restaurant_id'] ?? 0);
    if ($restaurantId <= 0) {
        throw new RuntimeException('Некорректный ресторан');
    }

    $favorite = toggle_favorite((int) current_user()['id'], $restaurantId);
    echo json_encode(['ok' => true, 'favorite' => $favorite], JSON_UNESCAPED_UNICODE);
} catch (Throwable $e) {
    http_response_code(422);
    echo json_encode(['ok' => false, 'message' => $e->getMessage()], JSON_UNESCAPED_UNICODE);
}
