<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';
require_auth();

$favorites = get_user_favorites((int) current_user()['id']);

$pageTitle = 'Избранное';
$pageClass = 'page-restaurants-brutal';
require ROOT_PATH . '/templates/header.php';
?>

<section class="container restaurants-dark favorites-dark">
    <header class="restaurants-dark__head favorites-dark__head">
        <h1>Избранное</h1>
    </header>

    <div class="empty-state restaurants-empty favorites-empty" data-favorites-empty <?= $favorites ? 'hidden' : '' ?>>
        <h2>Пока пусто</h2>
        <p>Добавляйте рестораны в избранное из каталога, и они появятся здесь.</p>
        <a class="favorites-empty__link" href="<?= e(base_url('/restaurants.php')) ?>">Перейти к ресторанам</a>
    </div>

    <?php if ($favorites): ?>
        <div class="restaurants-dark-grid favorites-dark-grid" data-favorites-grid>
            <?php foreach ($favorites as $restaurant): ?>
                <?php
                $restaurantId = (int) $restaurant['id'];
                $restaurantUrl = base_url('/restaurant.php?id=' . $restaurantId);
                $deliveryFee = (float) $restaurant['delivery_fee'];
                $description = trim((string) ($restaurant['short_description'] ?? ''));
                ?>
                <article class="restaurant-dark-card favorite-dark-card" data-favorite-card>
                    <button
                        class="favorite-dark-card__heart"
                        type="button"
                        title="Убрать из избранного"
                        aria-label="Убрать <?= e($restaurant['name']) ?> из избранного"
                        data-favorite-toggle
                        data-remove-favorite-card
                        data-restaurant-id="<?= $restaurantId ?>"
                        data-url="<?= e(base_url('/api/favorite_toggle.php')) ?>"
                        data-csrf="<?= e(csrf_token()) ?>"
                        data-favorite-label="★"
                        data-unfavorite-label="☆"
                    >★</button>

                    <a class="restaurant-dark-card__media" href="<?= e($restaurantUrl) ?>">
                        <img src="<?= e(base_url($restaurant['banner_image'] ?: '/uploads/restaurants/placeholder.svg')) ?>" alt="<?= e($restaurant['name']) ?>">
                    </a>

                    <div class="restaurant-dark-card__content">
                        <div class="restaurant-dark-card__top">
                            <a class="restaurant-dark-card__name" href="<?= e($restaurantUrl) ?>"><?= e($restaurant['name']) ?></a>
                            <span class="restaurant-dark-card__rating">★ <?= e(number_format((float) $restaurant['rating'], 1)) ?></span>
                        </div>
                        <p class="restaurant-dark-card__meta">⏱ <?= (int) $restaurant['delivery_time_min'] ?>–<?= (int) $restaurant['delivery_time_max'] ?> мин</p>
                        <?php if ($description !== ''): ?>
                            <p class="favorite-dark-card__description"><?= e($description) ?></p>
                        <?php endif; ?>
                        <div class="restaurant-dark-card__tags">
                            <span><?= $deliveryFee > 0 ? 'Доставка ' . number_format($deliveryFee, 0, '.', ' ') . ' ₽' : 'Бесплатная доставка' ?></span>
                            <span>Мин. заказ <?= number_format((float) $restaurant['min_order_amount'], 0, '.', ' ') ?> ₽</span>
                        </div>
                        <a class="favorite-dark-card__link" href="<?= e($restaurantUrl) ?>">Открыть меню</a>
                    </div>
                </article>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</section>

<?php require ROOT_PATH . '/templates/footer.php'; ?>
