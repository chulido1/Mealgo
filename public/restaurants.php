<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';

$pageTitle = 'Рестораны';
$pageClass = 'page-restaurants-brutal';

$allowedSorts = [
    'rating_desc' => 'По рейтингу',
    'delivery_fast' => 'По скорости доставки',
    'newest' => 'Сначала новые',
    'min_order_asc' => 'По минимальному заказу',
];

$sort = (string) ($_GET['sort'] ?? 'rating_desc');
if (!isset($allowedSorts[$sort])) {
    $sort = 'rating_desc';
}

$filters = [
    'search' => trim((string) ($_GET['search'] ?? '')),
    'category_id' => (int) ($_GET['category_id'] ?? 0),
    'min_rating' => (float) ($_GET['min_rating'] ?? 0),
    'max_delivery_fee' => (float) ($_GET['max_delivery_fee'] ?? 0),
    'max_delivery_time' => (int) ($_GET['max_delivery_time'] ?? 0),
    'max_min_order' => (float) ($_GET['max_min_order'] ?? 0),
    'has_hits' => (int) ($_GET['has_hits'] ?? 0),
    'menu_category' => trim((string) ($_GET['menu_category'] ?? '')),
    'sort' => $sort,
];
$currentSortLabel = $allowedSorts[$filters['sort']] ?? $allowedSorts['rating_desc'];

$categories = get_kitchen_categories();
$categoryOrder = ['burgers', 'pizza', 'sushi', 'desserts', 'italian', 'russian'];
$categoriesBySlug = [];
foreach ($categories as $category) {
    $categoriesBySlug[(string) $category['slug']] = $category;
}
$orderedCategories = [];
foreach ($categoryOrder as $slug) {
    if (isset($categoriesBySlug[$slug])) {
        $orderedCategories[] = $categoriesBySlug[$slug];
        unset($categoriesBySlug[$slug]);
    }
}
foreach ($categoriesBySlug as $category) {
    $orderedCategories[] = $category;
}

$restaurants = get_restaurants($filters);

$baseQuery = [
    'search' => $filters['search'],
    'category_id' => $filters['category_id'],
    'has_hits' => $filters['has_hits'],
    'menu_category' => $filters['menu_category'],
    'sort' => $filters['sort'],
];

$catalogUrl = static function (array $overrides = []) use ($baseQuery): string {
    $query = array_merge($baseQuery, $overrides);
    $normalized = [];

    if (trim((string) $query['search']) !== '') {
        $normalized['search'] = trim((string) $query['search']);
    }
    if ((int) $query['category_id'] > 0) {
        $normalized['category_id'] = (int) $query['category_id'];
    }
    if ((int) $query['has_hits'] === 1) {
        $normalized['has_hits'] = 1;
    }
    if (trim((string) ($query['menu_category'] ?? '')) !== '') {
        $normalized['menu_category'] = trim((string) $query['menu_category']);
    }
    if ((string) $query['sort'] !== 'rating_desc') {
        $normalized['sort'] = (string) $query['sort'];
    }

    return base_url('/restaurants.php' . ($normalized ? '?' . http_build_query($normalized) : ''));
};

require ROOT_PATH . '/templates/header.php';
?>

<section class="container restaurants-dark">
    <header class="restaurants-dark__head">
        <h1>Рестораны</h1>
        <p>Выберите категорию и найдите лучшие варианты по рейтингу и скорости доставки.</p>
    </header>

    <div class="restaurants-controls">
        <div class="restaurants-chips">
            <a class="restaurants-chip <?= (int) $filters['category_id'] === 0 && (int) $filters['has_hits'] === 0 && $filters['menu_category'] === '' ? 'is-active' : '' ?>" href="<?= e($catalogUrl(['category_id' => 0, 'has_hits' => 0, 'menu_category' => ''])) ?>">Все</a>
            <a class="restaurants-chip <?= (int) $filters['has_hits'] === 1 && $filters['menu_category'] === '' ? 'is-active' : '' ?>" href="<?= e($catalogUrl(['category_id' => 0, 'has_hits' => 1, 'menu_category' => ''])) ?>">Новинки и хиты</a>
            <?php foreach ($orderedCategories as $category): ?>
                <?php $categoryId = (int) $category['id']; ?>
                <a
                    class="restaurants-chip <?= (int) $filters['category_id'] === $categoryId && (int) $filters['has_hits'] === 0 && $filters['menu_category'] === '' ? 'is-active' : '' ?>"
                    href="<?= e($catalogUrl(['category_id' => $categoryId, 'has_hits' => 0, 'menu_category' => ''])) ?>"
                >
                    <?= e($category['name']) ?>
                </a>
            <?php endforeach; ?>
        </div>

        <form class="restaurants-sort" method="get">
            <?php if ($filters['search'] !== ''): ?>
                <input type="hidden" name="search" value="<?= e($filters['search']) ?>">
            <?php endif; ?>
            <?php if ((int) $filters['category_id'] > 0): ?>
                <input type="hidden" name="category_id" value="<?= (int) $filters['category_id'] ?>">
            <?php endif; ?>
            <?php if ((int) $filters['has_hits'] === 1): ?>
                <input type="hidden" name="has_hits" value="1">
            <?php endif; ?>
            <?php if ($filters['menu_category'] !== ''): ?>
                <input type="hidden" name="menu_category" value="<?= e($filters['menu_category']) ?>">
            <?php endif; ?>

            <div class="restaurants-sort__field" data-sort-dropdown>
                <span class="restaurants-sort__icon" aria-hidden="true">⇅</span>
                <span class="restaurants-sort__label">Сортировка</span>
                <input type="hidden" name="sort" value="<?= e((string) $filters['sort']) ?>" data-sort-input>

                <div class="restaurants-sort-dropdown">
                    <button
                        class="restaurants-sort-dropdown__toggle"
                        type="button"
                        data-sort-toggle
                        aria-haspopup="listbox"
                        aria-expanded="false"
                    >
                        <span data-sort-current><?= e($currentSortLabel) ?></span>
                        <span class="restaurants-sort-dropdown__caret" aria-hidden="true">▾</span>
                    </button>

                    <div class="restaurants-sort-dropdown__menu" data-sort-menu role="listbox" aria-label="Сортировка ресторанов">
                        <?php foreach ($allowedSorts as $key => $label): ?>
                            <button
                                class="restaurants-sort-dropdown__option<?= $filters['sort'] === $key ? ' is-active' : '' ?>"
                                type="button"
                                role="option"
                                data-sort-option
                                data-value="<?= e($key) ?>"
                                data-label="<?= e($label) ?>"
                                aria-selected="<?= $filters['sort'] === $key ? 'true' : 'false' ?>"
                            >
                                <?= e($label) ?>
                            </button>
                        <?php endforeach; ?>
                    </div>
                </div>
            </div>
        </form>
    </div>

    <?php if (!$restaurants): ?>
        <div class="empty-state restaurants-empty">
            Ничего не найдено по текущим фильтрам. Попробуйте выбрать другую категорию.
        </div>
    <?php else: ?>
        <div class="restaurants-dark-grid">
            <?php foreach ($restaurants as $restaurant): ?>
                <?php
                $restaurantId = (int) $restaurant['id'];
                $restaurantUrl = base_url('/restaurant.php?id=' . $restaurantId);
                $deliveryFee = (float) $restaurant['delivery_fee'];
                ?>
                <article class="restaurant-dark-card">
                    <a class="restaurant-dark-card__media" href="<?= e($restaurantUrl) ?>">
                        <img src="<?= e(base_url($restaurant['banner_image'] ?: '/uploads/restaurants/placeholder.svg')) ?>" alt="<?= e($restaurant['name']) ?>">
                    </a>
                    <div class="restaurant-dark-card__content">
                        <div class="restaurant-dark-card__top">
                            <a class="restaurant-dark-card__name" href="<?= e($restaurantUrl) ?>"><?= e($restaurant['name']) ?></a>
                            <span class="restaurant-dark-card__rating">★ <?= e(number_format((float) $restaurant['rating'], 1)) ?></span>
                        </div>
                        <p class="restaurant-dark-card__meta">⏱ <?= (int) $restaurant['delivery_time_min'] ?>–<?= (int) $restaurant['delivery_time_max'] ?> мин</p>
                        <div class="restaurant-dark-card__tags">
                            <span><?= $deliveryFee > 0 ? 'Доставка ' . number_format($deliveryFee, 0, '.', ' ') . ' ₽' : 'Бесплатная доставка' ?></span>
                            <span>Мин. заказ <?= number_format((float) $restaurant['min_order_amount'], 0, '.', ' ') ?> ₽</span>
                        </div>
                    </div>
                </article>
            <?php endforeach; ?>
        </div>
    <?php endif; ?>
</section>

<?php require ROOT_PATH . '/templates/footer.php'; ?>
