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

$restaurantId = 15;

$categoryNames = [
    218 => ['Неаполитана', 10],
    214 => ['Закуски', 20],
    217 => ['Паста и ризотто', 30],
    215 => ['Салаты', 40],
];

$items = [
    1405 => [218, 'Маргарита', 'Томатный соус, моцарелла, оливковое масло, базилик и орегано — классическая итальянская пицца.'],
    1406 => [218, 'Кватро формаджи', 'Сливочная основа и смесь сыров: горгонзола, моцарелла, пармезан и чеддер.'],
    1407 => [218, 'Груша с горгонзолой', 'Сливочный соус, сыр горгонзола и карамелизированная груша с базиликом.'],
    1408 => [218, 'Мортаделла со страчателлой', 'Сливочный соус, моцарелла, томаты, микс салата, мортаделла и страчателла.'],
    1409 => [218, 'Пепперони', 'Томатный соус, пепперони, острый перец и моцарелла.'],
    1410 => [218, 'Прошутто с рукколой', 'Тесто, томатный соус, помидоры черри, моцарелла, руккола, прошутто и оливковое масло.'],
    1381 => [214, 'Итальянские деликатесы', 'Ассорти мясных деликатесов и сыров с фруктами и закусками.'],
    1382 => [214, 'Вителло тоннато', 'Тонко нарезанная говядина под соусом из тунца с пряными нотами.'],
    1383 => [214, 'Капрезе с вялеными томатами', 'Моцарелла, томаты и вяленые томаты с ароматной заправкой.'],
    1384 => [214, 'Креветки в панировке', 'Обжаренные креветки с хрустящей корочкой и соусом.'],
    1385 => [214, 'Парма-манго', 'Пармская ветчина с манго и зеленью.'],
    1386 => [214, 'Баклажан пармиджано', 'Запечённый баклажан с томатным соусом и сыром.'],
    1399 => [217, 'Ризотто с гребешком', 'Кремовое ризотто с морским гребешком.'],
    1400 => [217, 'Лингвини с вонголе', 'Паста с моллюсками в ароматном соусе.'],
    1401 => [217, 'Тальятелле с креветками в соусе аррабьята', 'Паста с креветками в остром томатном соусе.'],
    1402 => [217, 'Спагетти карбонара', 'Паста с панчеттой, сыром и сливочно-яичным соусом.'],
    1403 => [217, 'Равиоли с уткой', 'Паста с начинкой из утки и сливочным соусом.'],
    1404 => [217, 'Ризотто с белыми грибами', 'Кремовое ризотто с ароматными грибами.'],
    1387 => [215, 'Зелёный салат с креветкой', 'Цукини, авокадо, огурец, шпинат, брокколи, креветки и яйцо пашот с лаймовой заправкой.'],
    1388 => [215, 'Романо цезарь с креветками', 'Салат романо, айсберг, креветки, сыр грана падано, сухарики и соус цезарь.'],
    1389 => [215, 'Овощной салат рамиро', 'Свежие овощи: перец рамиро, томаты, огурцы и зелень с оливковым маслом.'],
    1390 => [215, 'Романо цезарь с курицей', 'Салат с куриным филе, сыром, сухариками и соусом цезарь.'],
    1391 => [215, 'Ростбиф с баклажаном стир-фрай', 'Салат с ростбифом, баклажаном и овощами.'],
    1392 => [215, 'Страчателла с томатами', 'Нежный сыр страчателла с томатами и зеленью.'],
];

$hiddenItemIds = [1393, 1394, 1395, 1396, 1397, 1398, 1411, 1412, 1413, 1414, 1415, 1416, 1417, 1418, 1419, 1420, 1421, 1422];
$disabledCategoryIds = [216, 219, 220];

$pdo->beginTransaction();

$updateRestaurant = $pdo->prepare(
    'UPDATE restaurants
     SET short_description = :short_description,
         updated_at = NOW()
     WHERE id = :id'
);

$updateRestaurant->execute([
    'id' => $restaurantId,
    'short_description' => 'Неаполитанская пицца, паста, ризотто, салаты и итальянские закуски.',
]);

$updateCategory = $pdo->prepare(
    'UPDATE menu_categories
     SET name = :name, sort_order = :sort_order, is_active = 1
     WHERE id = :id AND restaurant_id = :restaurant_id'
);

foreach ($categoryNames as $id => [$name, $sortOrder]) {
    $updateCategory->execute([
        'id' => $id,
        'name' => $name,
        'sort_order' => $sortOrder,
        'restaurant_id' => $restaurantId,
    ]);
}

$disableCategory = $pdo->prepare(
    'UPDATE menu_categories
     SET is_active = 0
     WHERE id = :id AND restaurant_id = :restaurant_id'
);

foreach ($disabledCategoryIds as $id) {
    $disableCategory->execute(['id' => $id, 'restaurant_id' => $restaurantId]);
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

echo 'Updated Dolce Far Niente items: ' . $updatedItems . PHP_EOL;
echo 'Hidden old items: ' . $hiddenItems . PHP_EOL;
