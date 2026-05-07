<?php
declare(strict_types=1);

$config = require dirname(__DIR__) . '/config/database.php';

$dsn = sprintf(
    'mysql:host=%s;port=%d;dbname=%s;charset=%s',
    $config['host'],
    $config['port'],
    $config['name'],
    $config['charset']
);

$pdo = new PDO($dsn, $config['user'], $config['pass'], [
    PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION,
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,
]);

$restaurantId = 8;

$categoryNames = [
    161 => ['Пицца', 10, 1],
    162 => ['Закуски', 20, 1],
    163 => ['Сэндвичи', 30, 1],
    164 => ['Напитки', 40, 1],
    165 => ['Соусы', 50, 1],
    166 => ['Скрытая категория', 60, 0],
];

$items = [
    1063 => [161, 'Пицца Маргарита', 'Классическая пицца с томатным соусом и сыром моцарелла'],
    1064 => [161, 'Пицца Пепперони', 'Пицца с колбасой пепперони, сыром и томатным соусом'],
    1065 => [161, 'Пицца 6 сыров', 'Пицца с насыщенной смесью нескольких видов сыра'],
    1066 => [161, 'Пицца Мясной пир', 'Пицца с ассорти мясных ингредиентов и сыром'],
    1067 => [161, 'Пицца Супер Пепперони', 'Усиленная версия с двойной порцией пепперони'],
    1068 => [161, 'Пицца 4 сыра', 'Пицца с сочетанием четырех видов сыра на сливочной основе'],
    1069 => [162, 'Ассорти Ситипицца №1', 'Набор из закусок: курица, роллы, картофель и соусы'],
    1070 => [162, 'Ассорти Ситипицца №2', 'Большой набор закусок с крыльями, хот-догами и роллами'],
    1071 => [162, 'Мини-хот-доги', 'Небольшие сосиски в тесте с соусом'],
    1072 => [162, 'Картофель по-деревенски', 'Запеченные картофельные дольки со специями'],
    1073 => [162, 'Куриные крылья', 'Обжаренные куриные крылышки с хрустящей корочкой'],
    1074 => [162, 'Чесночные палочки', 'Запеченные палочки с чесноком и сыром'],
    1075 => [163, 'Ролл мексиканский', 'Ролл с мясной начинкой, овощами и острым соусом'],
    1076 => [163, 'Ролл пепперони 3 мяса', 'Ролл с несколькими видами мяса и сыром'],
    1077 => [163, 'Ролл ветчина и сыр', 'Ролл с ветчиной и расплавленным сыром'],
    1078 => [163, 'Ролл с лососем и соусом песто', 'Ролл с рыбой и ароматным соусом'],
    1079 => [163, 'Чиабатта Цезарь', 'Сэндвич с курицей, салатом и соусом Цезарь'],
    1080 => [163, 'Чиабатта барбекю', 'Сэндвич с мясом и соусом барбекю'],
    1081 => [164, 'Морс облепиха', 'Натуральный ягодный напиток'],
    1082 => [164, 'Ягодный морс', 'Освежающий напиток из ягод'],
    1083 => [164, 'Домашний лимонад', 'Напиток с цитрусовым вкусом'],
    1084 => [164, 'Эвервесс Кола', 'Классический газированный напиток'],
    1085 => [164, 'Чай Липтон зеленый', 'Холодный чай с мягким вкусом'],
    1086 => [164, 'Чай Липтон лимон', 'Холодный чай с лимонным вкусом'],
    1087 => [165, 'Соус Heinz сырный', 'Сливочный соус с сырным вкусом'],
    1088 => [165, 'Соус Heinz горчичный', 'Острый соус с горчичной ноткой'],
    1089 => [165, 'Соус Heinz кисло-сладкий', 'Соус с балансом сладости и кислоты'],
    1090 => [165, 'Соус Heinz чесночный', 'Соус с насыщенным чесночным вкусом'],
    1091 => [165, 'Соус Heinz барбекю', 'Густой соус с дымным вкусом'],
    1092 => [165, 'Соус Heinz кетчуп', 'Классический томатный соус'],
];

$hiddenItemIds = [1093, 1094, 1095, 1096, 1097, 1098];

$pdo->beginTransaction();

$updateCategory = $pdo->prepare(
    'UPDATE menu_categories
     SET name = :name, sort_order = :sort_order, is_active = :is_active
     WHERE id = :id AND restaurant_id = :restaurant_id'
);

foreach ($categoryNames as $id => [$name, $sortOrder, $isActive]) {
    $updateCategory->execute([
        'id' => $id,
        'name' => $name,
        'sort_order' => $sortOrder,
        'is_active' => $isActive,
        'restaurant_id' => $restaurantId,
    ]);
}

$updateItem = $pdo->prepare(
    'UPDATE menu_items
     SET category_id = :category_id,
         name = :name,
         description = :description,
         is_available = 1,
         updated_at = NOW()
     WHERE id = :id AND restaurant_id = :restaurant_id'
);

$updatedItems = 0;
foreach ($items as $id => [$categoryId, $name, $description]) {
    $updateItem->execute([
        'id' => $id,
        'category_id' => $categoryId,
        'name' => $name,
        'description' => $description,
        'restaurant_id' => $restaurantId,
    ]);
    $updatedItems += $updateItem->rowCount();
}

$hideItem = $pdo->prepare(
    'UPDATE menu_items
     SET is_available = 0, updated_at = NOW()
     WHERE id = :id AND restaurant_id = :restaurant_id'
);

$hiddenItems = 0;
foreach ($hiddenItemIds as $id) {
    $hideItem->execute(['id' => $id, 'restaurant_id' => $restaurantId]);
    $hiddenItems += $hideItem->rowCount();
}

$pdo->commit();

echo 'Updated Pizza City items: ' . $updatedItems . PHP_EOL;
echo 'Hidden old items: ' . $hiddenItems . PHP_EOL;

