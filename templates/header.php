<?php
/** @var string $pageTitle */
$pageTitle = $pageTitle ?? 'Mealgo';
$pageClass = $pageClass ?? '';
$isAdminArea = str_contains((string) ($_SERVER['SCRIPT_NAME'] ?? ''), '/admin/');
if ($isAdminArea && $pageClass === '') {
    $pageClass = 'page-admin-brutal';
}
$pageClassList = preg_split('/\s+/', trim($pageClass)) ?: [];
$isHome = (bool) array_intersect(
    $pageClassList,
    ['page-home-brutal', 'page-restaurants-brutal', 'page-restaurant-brutal', 'page-auth-brutal', 'page-profile-brutal', 'page-cart-brutal', 'page-admin-brutal'],
);
$user = current_user();
$activeCarts = $user ? get_active_carts((int) $user['id']) : [];
$cartCount = 0;
foreach ($activeCarts as $cartMeta) {
    $cartCount += (int) $cartMeta['items_count'];
}
$styleVersion = (string) @filemtime(ROOT_PATH . '/public/assets/css/style.css');
?>
<!doctype html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?= e($pageTitle) ?> | <?= e(app_config('app_name')) ?></title>
    <link rel="stylesheet" href="<?= e(base_url('/assets/css/style.css?v=' . $styleVersion)) ?>">
</head>
<body class="<?= e($pageClass) ?>">
<div class="site-shell">
    <header class="site-header">
        <div class="container header-grid<?= $isHome ? ' header-grid-home' : '' ?>">
            <a class="logo" href="<?= e(base_url('/index.php')) ?>">
                <span class="logo-text">MEALGO</span>
            </a>

            <?php if ($isHome): ?>
                <nav class="main-nav main-nav-home">
                    <a href="<?= e(base_url('/restaurants.php')) ?>">Рестораны</a>
                    <a href="<?= e(base_url('/favorites.php')) ?>">Избранное</a>
                    <a href="<?= e(base_url('/orders.php')) ?>">Заказы</a>
                    <a href="<?= e(base_url('/profile.php')) ?>">Профиль</a>
                    <?php if (is_admin()): ?>
                        <a href="<?= e(base_url('/admin/index.php')) ?>">Админ</a>
                    <?php endif; ?>
                    <?php if ($user): ?>
                        <a class="home-cart-link" href="<?= e(base_url('/cart.php')) ?>">&#1050;&#1086;&#1088;&#1079;&#1080;&#1085;&#1072;<?= $cartCount > 0 ? ' (' . (int) $cartCount . ')' : '' ?></a>
                    <?php endif; ?>
                </nav>
            <?php else: ?>
                <nav class="main-nav">
                    <a href="<?= e(base_url('/restaurants.php')) ?>">Рестораны</a>
                    <a href="<?= e(base_url('/favorites.php')) ?>">Избранное</a>
                    <a href="<?= e(base_url('/orders.php')) ?>">Заказы</a>
                    <a href="<?= e(base_url('/profile.php')) ?>">Профиль</a>
                    <?php if (is_admin()): ?>
                        <a href="<?= e(base_url('/admin/index.php')) ?>">Админ</a>
                    <?php endif; ?>
                </nav>
                <form class="header-search" action="<?= e(base_url('/restaurants.php')) ?>" method="get">
                    <input type="text" name="search" placeholder="Поиск ресторанов">
                    <button type="submit">Найти</button>
                </form>
                <div class="header-actions">
                    <?php if (!$user): ?>
                        <a class="btn btn-ghost" href="<?= e(base_url('/login.php')) ?>">Войти</a>
                        <a class="btn btn-primary" href="<?= e(base_url('/register.php')) ?>">Регистрация</a>
                    <?php else: ?>
                        <a class="profile-chip" href="<?= e(base_url('/profile.php')) ?>">
                            <span class="avatar"><?= e(mb_substr($user['name'], 0, 1)) ?></span>
                            <span><?= e($user['name']) ?></span>
                        </a>
                        <a class="cart-btn" href="<?= e(base_url('/cart.php')) ?>">
                            Корзины
                            <span class="badge"><?= (int) $cartCount ?></span>
                        </a>
                    <?php endif; ?>
                </div>
            <?php endif; ?>
        </div>
    </header>

    <?php
    $successMessage = flash('success');
    $errorMessage = flash('error');
    ?>
    <?php if ($successMessage || $errorMessage): ?>
        <div class="toast-stack" aria-live="polite" aria-atomic="true">
            <?php if ($successMessage): ?>
                <div class="alert alert-success" role="status">
                    <span><?= e($successMessage) ?></span>
                </div>
            <?php endif; ?>
            <?php if ($errorMessage): ?>
                <div class="alert alert-error" role="alert">
                    <span><?= e($errorMessage) ?></span>
                </div>
            <?php endif; ?>
        </div>
    <?php endif; ?>

    <?php
    $currentScript = basename((string) ($_SERVER['SCRIPT_NAME'] ?? ''));
    $showVerifyNotice = $user
        && empty($user['email_verified_at'])
        && $currentScript !== 'verify_email.php';
    ?>
    <?php if ($showVerifyNotice): ?>
        <section class="email-verify-notice">
            <div class="container email-verify-notice__inner">
                <div>
                    <strong>Подтвердите эл. почту</strong>
                    <span>Введите код из письма, чтобы восстановление пароля и важные уведомления работали корректно.</span>
                </div>
                <a class="email-verify-notice__btn" href="<?= e(base_url('/verify_email.php')) ?>">Подтвердить</a>
            </div>
        </section>
    <?php endif; ?>

    <main class="main-content">
