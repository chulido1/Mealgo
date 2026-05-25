<?php

declare(strict_types=1);

function admin_url(string $path = ''): string
{
    return base_url('/admin/' . ltrim($path, '/'));
}

function admin_nav_items(): array
{
    return [
        'index.php' => 'Последние заказы',
        'restaurants.php' => 'Рестораны',
        'restaurant_categories.php' => 'Категории кухонь',
        'menu_categories.php' => 'Категории меню',
        'menu_items.php' => 'Блюда',
        'users.php' => 'Пользователи',
        'orders.php' => 'Заказы',
        'reviews.php' => 'Отзывы',
        'logs.php' => 'Логи',
    ];
}

function render_admin_nav(string $current): void
{
    echo '<aside class="admin-nav">';
    echo '<div class="admin-nav__eyebrow">Админ-панель</div>';
    foreach (admin_nav_items() as $file => $label) {
        $class = $current === $file ? ' class="is-active"' : '';
        echo '<a' . $class . ' href="' . e(admin_url($file)) . '">' . e($label) . '</a>';
    }
    echo '</aside>';
}
