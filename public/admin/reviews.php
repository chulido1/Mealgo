<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';
require_once ROOT_PATH . '/includes/admin_helpers.php';
require_admin();

if (is_post()) {
    verify_csrf();
    $id = (int) ($_POST['id'] ?? 0);
    $isApproved = isset($_POST['is_approved']) ? 1 : 0;
    if ($id > 0) {
        db_exec(
            'UPDATE reviews SET is_approved = :is_approved, updated_at = :updated_at WHERE id = :id',
            ['is_approved' => $isApproved, 'updated_at' => now(), 'id' => $id]
        );
        admin_log((int) current_user()['id'], 'moderate', 'review', $id);
        flash('success', 'Статус отзыва обновлен.');
    }
    redirect_to('/admin/reviews.php');
}

$reviews = db_all(
    'SELECT rv.id, rv.rating, rv.comment, rv.is_approved, rv.created_at, u.name AS user_name, r.name AS restaurant_name
     FROM reviews rv
     JOIN users u ON u.id = rv.user_id
     JOIN restaurants r ON r.id = rv.restaurant_id
     ORDER BY rv.created_at DESC'
);

$pageTitle = 'Админ: Отзывы';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container">
    <h1 style="margin-top:0;">Модерация отзывов</h1>
    <div class="admin-layout">
        <?php render_admin_nav('reviews.php'); ?>
        <div class="panel">
            <table>
                <thead><tr><th>ID</th><th>Пользователь</th><th>Ресторан</th><th>Рейтинг</th><th>Комментарий</th><th>Дата</th><th>Статус</th></tr></thead>
                <tbody>
                <?php foreach ($reviews as $review): ?>
                    <tr>
                        <td><?= (int) $review['id'] ?></td>
                        <td><?= e($review['user_name']) ?></td>
                        <td><?= e($review['restaurant_name']) ?></td>
                        <td><?= (int) $review['rating'] ?></td>
                        <td><?= e($review['comment']) ?></td>
                        <td><?= e($review['created_at']) ?></td>
                        <td>
                            <form method="post" style="display:flex;gap:6px;align-items:center;">
                                <?= csrf_field() ?>
                                <input type="hidden" name="id" value="<?= (int) $review['id'] ?>">
                                <label style="display:flex;gap:4px;align-items:center;">
                                    <input type="checkbox" name="is_approved" <?= (int) $review['is_approved'] === 1 ? 'checked' : '' ?>> одобрен
                                </label>
                                <button class="btn btn-ghost" type="submit">Сохранить</button>
                            </form>
                        </td>
                    </tr>
                <?php endforeach; ?>
                </tbody>
            </table>
        </div>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
