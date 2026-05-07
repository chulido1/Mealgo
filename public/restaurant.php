<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';

$restaurantId = (int) ($_GET['id'] ?? 0);
$restaurant = $restaurantId > 0 ? get_restaurant_by_id($restaurantId) : null;

if (!$restaurant) {
    http_response_code(404);
    $pageTitle = 'Ресторан не найден';
    $pageClass = 'page-restaurant-brutal';
    require ROOT_PATH . '/templates/header.php';
    echo '<section class="container"><div class="empty-state restaurants-empty">Ресторан не найден.</div></section>';
    require ROOT_PATH . '/templates/footer.php';
    exit;
}

if (is_post()) {
    require_auth();
    verify_csrf();

    $rating = (int) ($_POST['rating'] ?? 0);
    $comment = trim((string) ($_POST['comment'] ?? ''));
    if ($rating < 1 || $rating > 5 || mb_strlen($comment) < 5) {
        flash('error', 'Проверьте рейтинг и текст отзыва (минимум 5 символов).');
    } else {
        db_exec(
            'INSERT INTO reviews (user_id, restaurant_id, rating, comment, is_approved, created_at, updated_at)
             VALUES (:user_id, :restaurant_id, :rating, :comment, 0, :created_at, :updated_at)',
            [
                'user_id' => (int) current_user()['id'],
                'restaurant_id' => $restaurantId,
                'rating' => $rating,
                'comment' => $comment,
                'created_at' => now(),
                'updated_at' => now(),
            ]
        );
        flash('success', 'Спасибо! Отзыв отправлен на модерацию.');
    }
    redirect_to('/restaurant.php?id=' . $restaurantId);
}

$pageTitle = (string) $restaurant['name'];
$pageClass = 'page-restaurant-brutal';

$byCategory = [];
foreach ($restaurant['menu_items'] as $item) {
    $byCategory[(int) $item['category_id']][] = $item;
}

require ROOT_PATH . '/templates/header.php';
?>

<section class="container restaurant-page">
    <article class="restaurant-hero-dark">
        <img class="restaurant-hero-dark__banner" src="<?= e(base_url($restaurant['banner_image'] ?: '/uploads/restaurants/placeholder.svg')) ?>" alt="<?= e($restaurant['name']) ?>">
        <div class="restaurant-hero-dark__overlay"></div>
        <div class="restaurant-hero-dark__content">
            <p class="restaurant-hero-dark__kicker"><?= e((string) $restaurant['category_names']) ?></p>
            <h1><?= e($restaurant['name']) ?></h1>
            <p class="restaurant-hero-dark__description"><?= e((string) $restaurant['short_description']) ?></p>

            <div class="restaurant-hero-dark__meta">
                <span>★ <?= e(number_format((float) $restaurant['rating'], 1)) ?></span>
                <span>⏱ <?= (int) $restaurant['delivery_time_min'] ?>–<?= (int) $restaurant['delivery_time_max'] ?> мин</span>
                <span>Доставка <?= number_format((float) $restaurant['delivery_fee'], 0, '.', ' ') ?> ₽</span>
                <span>Мин. заказ <?= number_format((float) $restaurant['min_order_amount'], 0, '.', ' ') ?> ₽</span>
                <span><?= e((string) $restaurant['working_hours']) ?></span>
            </div>

            <p class="restaurant-hero-dark__contact"><?= e((string) $restaurant['address']) ?> • <?= e((string) $restaurant['phone']) ?></p>

            <?php if (auth_check()): ?>
                <button
                    class="restaurant-hero-dark__favorite"
                    type="button"
                    data-favorite-toggle
                    data-restaurant-id="<?= (int) $restaurant['id'] ?>"
                    data-csrf="<?= e(csrf_token()) ?>"
                    data-url="<?= e(base_url('/api/favorite_toggle.php')) ?>"
                >
                    <?= is_favorite((int) current_user()['id'], (int) $restaurant['id']) ? '★ В избранном' : '☆ В избранное' ?>
                </button>
            <?php endif; ?>
        </div>
    </article>

    <nav class="restaurant-category-tabs" aria-label="Категории меню">
        <?php foreach ($restaurant['menu_categories'] as $category): ?>
            <?php $itemCount = count($byCategory[(int) $category['id']] ?? []); ?>
            <a href="#cat-<?= (int) $category['id'] ?>">
                <?= e((string) $category['name']) ?>
                <small><?= $itemCount ?></small>
            </a>
        <?php endforeach; ?>
    </nav>

    <?php foreach ($restaurant['menu_categories'] as $category): ?>
        <?php $items = $byCategory[(int) $category['id']] ?? []; ?>
        <section class="restaurant-menu-section" id="cat-<?= (int) $category['id'] ?>">
            <header class="restaurant-menu-section__head">
                <h2><?= e((string) $category['name']) ?></h2>
                <p><?= count($items) ?> блюд</p>
            </header>

            <?php if (!$items): ?>
                <div class="empty-state restaurants-empty">В этой категории пока нет блюд.</div>
            <?php else: ?>
                <div class="restaurant-menu-grid">
                    <?php foreach ($items as $item): ?>
                        <article class="restaurant-dish-card">
                            <img src="<?= e(base_url($item['image'] ?: '/uploads/menu/placeholder.svg')) ?>" alt="<?= e((string) $item['name']) ?>">
                            <div class="restaurant-dish-card__body">
                                <div class="restaurant-dish-card__top">
                                    <h3><?= e((string) $item['name']) ?></h3>
                                    <div class="restaurant-dish-card__badges">
                                        <?php if ((int) $item['is_popular'] === 1): ?><span>Популярное</span><?php endif; ?>
                                        <?php if ((int) $item['is_new'] === 1): ?><span>Новинка</span><?php endif; ?>
                                    </div>
                                </div>

                                <p class="restaurant-dish-card__description"><?= e((string) $item['description']) ?></p>
                                <p class="restaurant-dish-card__price"><?= number_format((float) $item['price'], 0, '.', ' ') ?> ₽ <small>• <?= e((string) $item['weight']) ?></small></p>

                                <?php if (!auth_check()): ?>
                                    <a class="restaurant-dish-card__login" href="<?= e(base_url('/login.php')) ?>">Войдите для заказа</a>
                                <?php else: ?>
                                    <form class="restaurant-dish-card__form" data-add-to-cart action="<?= e(base_url('/api/cart_add.php')) ?>" method="post">
                                        <?= csrf_field() ?>
                                        <input type="hidden" name="restaurant_id" value="<?= (int) $restaurant['id'] ?>">
                                        <input type="hidden" name="menu_item_id" value="<?= (int) $item['id'] ?>">
                                        <div class="qty-control" data-qty-control>
                                            <button class="qty-control__btn" type="button" data-qty-dec aria-label="Уменьшить количество">-</button>
                                            <input class="qty-control__input" type="text" name="quantity" value="1" inputmode="numeric" pattern="[0-9]*" data-qty-input readonly>
                                            <button class="qty-control__btn" type="button" data-qty-inc aria-label="Увеличить количество">+</button>
                                        </div>
                                        <button type="submit">Добавить в корзину</button>
                                    </form>
                                <?php endif; ?>
                            </div>
                        </article>
                    <?php endforeach; ?>
                </div>
            <?php endif; ?>
        </section>
    <?php endforeach; ?>

    <section class="restaurant-reviews">
        <h2>Отзывы</h2>

        <?php if ($restaurant['reviews']): ?>
            <div class="restaurant-reviews-list">
                <?php foreach ($restaurant['reviews'] as $review): ?>
                    <article class="restaurant-review-card">
                        <div class="restaurant-review-card__head">
                            <strong><?= e((string) $review['user_name']) ?></strong>
                            <span>★ <?= (int) $review['rating'] ?></span>
                        </div>
                        <p><?= e((string) $review['comment']) ?></p>
                    </article>
                <?php endforeach; ?>
            </div>
        <?php else: ?>
            <div class="empty-state restaurants-empty">Пока нет отзывов.</div>
        <?php endif; ?>

        <?php if (auth_check()): ?>
            <form class="restaurant-review-form" method="post">
                <h3>Оставить отзыв</h3>
                <?= csrf_field() ?>
                <div class="field">
                    <label for="rating">Рейтинг</label>
                    <div class="custom-dropdown review-rating-dropdown" data-custom-dropdown>
                        <input id="rating" type="hidden" name="rating" value="5" data-custom-dropdown-input>
                        <button class="custom-dropdown__toggle" type="button" aria-expanded="false" data-custom-dropdown-toggle>
                            <span data-custom-dropdown-label>5 ★</span>
                            <span class="custom-dropdown__chevron" aria-hidden="true">⌄</span>
                        </button>
                        <div class="custom-dropdown__menu" role="listbox" data-custom-dropdown-menu>
                            <?php for ($i = 5; $i >= 1; $i--): ?>
                                <button
                                    class="custom-dropdown__option <?= $i === 5 ? 'is-active' : '' ?>"
                                    type="button"
                                    role="option"
                                    aria-selected="<?= $i === 5 ? 'true' : 'false' ?>"
                                    data-value="<?= $i ?>"
                                    data-label="<?= $i ?> ★"
                                    data-custom-dropdown-option
                                >
                                    <?= $i ?> ★
                                </button>
                            <?php endfor; ?>
                        </div>
                    </div>
                </div>
                <div class="field">
                    <label for="comment">Комментарий</label>
                    <textarea id="comment" name="comment" required></textarea>
                </div>
                <button type="submit">Отправить на модерацию</button>
            </form>
        <?php endif; ?>
    </section>
</section>

<?php require ROOT_PATH . '/templates/footer.php'; ?>
