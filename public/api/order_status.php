<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_auth();

header('Content-Type: application/json; charset=utf-8');

$user = current_user();
$orderId = (int) ($_GET['id'] ?? 0);

$order = db_one(
    'SELECT * FROM orders WHERE id = :id AND user_id = :user_id LIMIT 1',
    ['id' => $orderId, 'user_id' => (int) $user['id']]
);

if (!$order) {
    http_response_code(404);
    echo json_encode(['ok' => false, 'message' => 'Заказ не найден'], JSON_UNESCAPED_UNICODE);
    exit;
}

$order = sync_auto_order_status($order);
$progress = order_status_progress((string) $order['status']);

echo json_encode(
    [
        'ok' => true,
        'status' => (string) $order['status'],
        'label' => order_status_label((string) $order['status']),
        'percent' => (int) $progress['percent'],
        'current_index' => (int) $progress['current_index'],
        'steps' => array_map(
            static fn (array $step): array => [
                'status' => (string) $step['status'],
                'label' => (string) $step['label'],
            ],
            $progress['flow']
        ),
    ],
    JSON_UNESCAPED_UNICODE
);
