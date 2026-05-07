<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_once ROOT_PATH . '/includes/admin_helpers.php';
require_admin();

$adminLogs = db_all(
    'SELECT al.*, u.name AS admin_name
     FROM admin_logs al
     JOIN users u ON u.id = al.admin_id
     ORDER BY al.created_at DESC
     LIMIT 100'
);

$securityEvents = db_all(
    'SELECT * FROM security_events ORDER BY created_at DESC LIMIT 100'
);

$adminActionLabels = [
    'create' => 'Создание',
    'update' => 'Обновление',
    'moderate' => 'Модерация',
    'toggle_active' => 'Смена активности',
    'update_status' => 'Смена статуса',
];
$entityLabels = [
    'restaurant' => 'Ресторан',
    'restaurant_category' => 'Категория ресторана',
    'menu_category' => 'Категория меню',
    'menu_item' => 'Блюдо',
    'user' => 'Пользователь',
    'review' => 'Отзыв',
    'order' => 'Заказ',
];
$securityActionLabels = [
    'login' => 'Вход',
    'register' => 'Регистрация',
    'forgot_password' => 'Восстановление пароля',
    'verify_resend' => 'Повторная отправка кода',
];
$securityEventLabels = [
    'failed' => 'Ошибка',
    'rate_limit_blocked' => 'Ограничение по частоте',
];

$pageTitle = 'Админ: Логи';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container">
    <h1 style="margin-top:0;">Логи</h1>
    <div class="admin-layout">
        <?php render_admin_nav('logs.php'); ?>
        <div>
            <div class="panel">
                <h3 style="margin-top:0;">Журнал админ-действий</h3>
                <table>
                    <thead><tr><th>Время</th><th>Админ</th><th>Действие</th><th>Сущность</th><th>ID</th></tr></thead>
                    <tbody>
                    <?php foreach ($adminLogs as $log): ?>
                        <tr>
                            <td><?= e($log['created_at']) ?></td>
                            <td><?= e($log['admin_name']) ?></td>
                            <td><?= e($adminActionLabels[$log['action']] ?? $log['action']) ?></td>
                            <td><?= e($entityLabels[$log['entity_type']] ?? $log['entity_type']) ?></td>
                            <td><?= e((string) $log['entity_id']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>

            <div class="panel" style="margin-top:16px;">
                <h3 style="margin-top:0;">События безопасности</h3>
                <table>
                    <thead><tr><th>Время</th><th>Действие</th><th>Событие</th><th>IP</th><th>Браузер</th></tr></thead>
                    <tbody>
                    <?php foreach ($securityEvents as $event): ?>
                        <tr>
                            <td><?= e($event['created_at']) ?></td>
                            <td><?= e($securityActionLabels[$event['action_name']] ?? $event['action_name']) ?></td>
                            <td><?= e($securityEventLabels[$event['event_type']] ?? $event['event_type']) ?></td>
                            <td><?= e((string) $event['ip_address']) ?></td>
                            <td><?= e((string) $event['user_agent']) ?></td>
                        </tr>
                    <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
