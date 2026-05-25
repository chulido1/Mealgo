<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';

$pageTitle = 'Главная';
$pageClass = 'page-home-brutal';

$homeKitchenCategories = [];
foreach (get_kitchen_categories() as $category) {
    $homeKitchenCategories[(string) $category['slug']] = (int) $category['id'];
}

$foodIntentTiles = [
    ['title' => 'Выберите, что хочется сейчас', 'url' => '/restaurants.php', 'image' => '/uploads/menu/tile-all-menu.png', 'variant' => 'featured'],
    ['title' => 'Новинки и хиты', 'url' => '/restaurants.php?has_hits=1', 'image' => '/uploads/menu/tile-new-hits.png', 'variant' => 'compact'],
    ['title' => 'Кофе и десерты', 'menu_category' => 'Напитки|Десерты|Трайфлы|Эклеры|Торты', 'image' => '/uploads/menu/tile-coffee-desserts.png', 'variant' => 'compact'],
    ['title' => 'Завтраки', 'menu_category' => 'Завтраки|Круассаны', 'image' => '/uploads/menu/tile-breakfast.png'],
    ['title' => 'Горячие блюда', 'menu_category' => 'Горячее|Вторые блюда|Паста|Паста и ризотто', 'image' => '/uploads/menu/tile-hot-meals.png'],
    ['title' => 'Закуски и салаты', 'menu_category' => 'Закуски|Салаты|Снеки|Снэки', 'image' => '/uploads/menu/tile-snacks-salads.png'],
    ['title' => 'Супы', 'menu_category' => 'Супы', 'image' => '/uploads/menu/tile-soups.png'],
    ['title' => 'Роллы и сеты', 'menu_category' => 'Роллы|Сеты|Суши|Запеченные роллы|Запечённые роллы', 'image' => '/uploads/menu/tile-rolls-sets.png'],
    ['title' => 'Бургеры и комбо', 'menu_category' => 'Бургеры|Комбо', 'image' => '/uploads/menu/tile-burgers-combo.png'],
];

$moscowFoodBrands = [
    ['alt' => 'Vkusno i Tochka', 'src' => '/assets/img/brands/burgers/vkusno_i_tochka.svg'],
    ['alt' => 'Burger King', 'src' => '/assets/img/brands/burgers/burger_king.svg'],
    ['alt' => "Rostic's", 'src' => '/assets/img/brands/burgers/rostics.png'],
    ['alt' => 'Tanuki', 'src' => '/assets/img/brands/sushi/tanuki.png'],
    ['alt' => 'Why Not Sushi', 'src' => '/assets/img/brands/sushi/why_not_sushi.png'],
    ['alt' => 'Yakitoriya', 'src' => '/assets/img/brands/sushi/yakitoriya.png'],
    ['alt' => 'Dodo Pizza', 'src' => '/assets/img/brands/pizza/dodo_pizza.png'],
    ['alt' => 'Pizza City', 'src' => '/assets/img/brands/pizza/pizza_city.png'],
    ['alt' => 'Domino Pizza', 'src' => '/assets/img/brands/pizza/domino_pizza.svg'],
    ['alt' => 'One Love', 'src' => '/assets/img/brands/dessert/one_love.png'],
    ['alt' => '11/47 Bakery', 'src' => '/assets/img/brands/dessert/bakery_1147.webp'],
    ['alt' => 'Особенный Наполеон Кондитерская', 'src' => '/assets/img/brands/dessert/special_napoleon.png'],
    ['alt' => 'Osteria Amici', 'src' => '/assets/img/brands/italian/osteria_amici.webp'],
    ['alt' => 'Fattoria Marian', 'src' => '/assets/img/brands/italian/fattoria_marian.png'],
    ['alt' => 'Dolce Far Niente', 'src' => '/assets/img/brands/italian/dolce_far_niente.png'],
    ['alt' => 'Kultura Vstrechi', 'src' => '/assets/img/brands/russian/kultura_vstrechi.svg'],
    ['alt' => 'Kofemania', 'src' => '/assets/img/brands/russian/kofemania.svg'],
    ['alt' => 'Теремок', 'src' => '/assets/img/brands/russian/teremok.png'],
];

$tileUrl = static function (array $tile) use ($homeKitchenCategories): string {
    if (isset($tile['url'])) {
        return base_url((string) $tile['url']);
    }

    $query = [];
    if (!empty($tile['menu_category'])) {
        $query['menu_category'] = (string) $tile['menu_category'];
    }

    $slug = (string) ($tile['category_slug'] ?? '');
    if (!$query && $slug !== '' && isset($homeKitchenCategories[$slug])) {
        $query['category_id'] = $homeKitchenCategories[$slug];
    } elseif (!empty($tile['search'])) {
        $query['search'] = (string) $tile['search'];
    }

    return base_url('/restaurants.php' . ($query ? '?' . http_build_query($query) : ''));
};

require ROOT_PATH . '/templates/header.php';
?>

<section class="mono-hero">
    <div class="mono-hero-content">
        <p class="mono-kicker">MEALGO АГРЕГАТОР ДОСТАВКИ ЕДЫ</p>
        <h1 class="mono-hero-title">
            <span class="mono-hero-title__line mono-hero-title__line--first">ВАШИ ЛЮБИМЫЕ БЛЮДА</span>
            <span class="mono-hero-title__line mono-hero-title__line--second">— С БЫСТРОЙ ДОСТАВКОЙ</span>
        </h1>
        <form class="mono-hero-search" action="<?= e(base_url('/restaurants.php')) ?>" method="get">
            <input type="text" name="search" placeholder="Найти ресторан, кухню или блюдо">
            <button type="submit">ЗАКАЗАТЬ</button>
        </form>
    </div>
</section>

<div class="home-intent-gradient">
    <section class="mono-section mono-choices container">
        <div class="mono-choices-head">
            <h2>ВЫБЕРИТЕ, ЧТО ХОЧЕТСЯ СЕЙЧАС</h2>
            <p>Нажмите на категорию и получите список ресторанов, где это есть в меню.</p>
        </div>

        <div class="mono-choice-grid">
            <?php foreach ($foodIntentTiles as $tile): ?>
                <?php $variant = (string) ($tile['variant'] ?? 'regular'); ?>
                <a
                    class="mono-choice-card <?= $variant === 'featured' ? 'is-featured' : '' ?> <?= $variant === 'compact' ? 'is-compact' : '' ?>"
                    href="<?= e($tileUrl($tile)) ?>"
                >
                    <span class="mono-choice-title"><?= e($tile['title']) ?></span>
                    <img src="<?= e(base_url((string) $tile['image'])) ?>" alt="<?= e($tile['title']) ?>">
                    <span class="mono-choice-meta">Показать рестораны</span>
                </a>
            <?php endforeach; ?>
        </div>

        <div class="mono-choices-actions">
            <a class="mono-all-restaurants" href="<?= e(base_url('/restaurants.php')) ?>">Весь каталог ресторанов</a>
        </div>
    </section>

    <section id="home-services" class="mono-section mono-services container">
        <div class="mono-services-title">ВСЁ ДЛЯ<br>УДОБНОГО<br>ЗАКАЗА</div>
        <div class="mono-services-list">
            <details open>
                <summary>ЭКСПРЕСС-ДОСТАВКА ЗА 30 МИНУТ</summary>
                <p>Приоритетная маршрутизация курьеров для максимально быстрой доставки.</p>
            </details>
            <details>
                <summary>ОТДЕЛЬНЫЕ КОРЗИНЫ ПО РЕСТОРАНАМ</summary>
                <p>Одна активная корзина на ресторан и несколько корзин у пользователя. Все прозрачно и удобно.</p>
            </details>
            <details>
                <summary>УДОБНОЕ ОТСЛЕЖИВАНИЕ ЗАКАЗА</summary>
                <p>Статусы заказа от <strong>новый</strong> до <strong>доставлен</strong> видны в личном кабинете.</p>
            </details>
        </div>
    </section>
</div>

<section id="home-about" class="mono-story">
    <div class="container mono-story-grid">
        <h3>ВКУСНАЯ СВОБОДА ВЫБОРА</h3>
        <p>
            Mealgo объединяет лучшие рестораны в одном интерфейсе. Вы можете смотреть меню, держать отдельные корзины по ресторанам
            и оформлять доставку в несколько кликов.
        </p>
    </div>
</section>

<section class="mono-wave" aria-label="Бегущая строка с логотипами ресторанов">
    <div class="brand-marquee">
        <div class="brand-marquee__track">
            <?php for ($loop = 0; $loop < 2; $loop++): ?>
                <div class="brand-marquee__group" <?= $loop === 1 ? 'aria-hidden="true"' : '' ?>>
                    <?php foreach ($moscowFoodBrands as $brand): ?>
                        <span class="brand-logo">
                            <img class="brand-logo__img" src="<?= e(base_url($brand['src'])) ?>" alt="<?= e($brand['alt']) ?>" loading="lazy" decoding="async">
                        </span>
                    <?php endforeach; ?>
                </div>
            <?php endfor; ?>
        </div>
    </div>
</section>

<?php require ROOT_PATH . '/templates/footer.php'; ?>
