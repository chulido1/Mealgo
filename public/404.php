<?php
declare(strict_types=1);

require_once dirname(__DIR__) . '/includes/bootstrap.php';

http_response_code(404);
$pageTitle = 'Страница не найдена';
$pageClass = 'page-profile-brutal page-404-brutal';
require ROOT_PATH . '/templates/header.php';
?>
<section class="container not-found-page">
    <div class="not-found-card">
        <div class="not-found-content">
            <p class="not-found-kicker">Ошибка 404</p>
            <h1>Эта страница не в зоне доставки</h1>
            <p>
                Адрес, по которому вы перешли, не найден. Можно вернуться на главную
                или сразу открыть каталог ресторанов Mealgo.
            </p>
            <div class="not-found-actions">
                <a class="btn btn-primary" href="<?= e(base_url('/restaurants.php')) ?>">К ресторанам</a>
                <a class="btn btn-ghost" href="<?= e(base_url('/index.php')) ?>">На главную</a>
            </div>
        </div>
        <div class="not-found-visual" aria-hidden="true">
            <span>404</span>
            <div class="not-found-orbit not-found-orbit--one"></div>
            <div class="not-found-orbit not-found-orbit--two"></div>
        </div>
    </div>
</section>
<?php require ROOT_PATH . '/templates/footer.php'; ?>
