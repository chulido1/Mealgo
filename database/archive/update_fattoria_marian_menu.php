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

$restaurantId = 14;

$categoryNames = [
    207 => ['Пиццетта', 10],
    211 => ['Пицца', 20],
    210 => ['Паста', 30],
    209 => ['Супы', 40],
    213 => ['Десерты', 50],
];

$items = [
    1339 => [207, 'Пиццетта Маргарита', 'Томатный соус, моцарелла, базилик — классическая лёгкая пиццетта.'],
    1340 => [207, 'Пиццетта Пепперони', 'Томатный соус, моцарелла и пикантная колбаса пепперони.'],
    1341 => [207, 'Пиццетта Четыре сыра', 'Сочетание четырёх сыров с насыщенным сливочным вкусом.'],
    1342 => [207, 'Пиццетта Грибная', 'Сливочная основа с шампиньонами и сыром.'],
    1343 => [207, 'Пиццетта Каприччоза', 'Томатный соус, ветчина, грибы, маслины и сыр.'],
    1344 => [207, 'Пиццетта Груша и горгонзола', 'Сладкая груша, сыр горгонзола и сливочная основа.'],
    1363 => [211, 'Пицца Маргарита', 'Томатный соус, моцарелла, базилик — классика итальянской кухни.'],
    1364 => [211, 'Пицца Пепперони', 'Томатный соус, моцарелла и острая колбаса пепперони.'],
    1365 => [211, 'Пицца Капричоза', 'Ветчина, грибы, маслины, томатный соус и сыр.'],
    1366 => [211, 'Пицца Груша и горгонзола', 'Сыр горгонзола, груша и сливочная база.'],
    1367 => [211, 'Пицца Четыре сыра', 'Микс сыров с выраженным сливочным вкусом.'],
    1368 => [211, 'Пицца Полло фунги', 'Курица, грибы, сливочный соус и сыр.'],
    1357 => [210, 'Помодоро базилико', 'Паста с томатным соусом и свежим базиликом.'],
    1358 => [210, 'Карбонара', 'Паста с беконом, сливочным соусом и сыром.'],
    1359 => [210, 'Качо э пепе', 'Паста с сыром и чёрным перцем.'],
    1360 => [210, 'Болоньезе', 'Паста с мясным соусом на основе говядины.'],
    1361 => [210, 'Равиоли с говядиной', 'Паста с начинкой из говядины.'],
    1362 => [210, 'Лазанья', 'Запечённая паста с мясным соусом и сыром.'],
    1351 => [209, 'Чечевичный суп', 'Густой суп из чечевицы с пряностями.'],
    1352 => [209, 'Куриный суп с домашней лапшой и перепелиными яйцами', 'Лёгкий бульон с курицей, лапшой и яйцами.'],
    1375 => [213, 'Панна котта', 'Нежный сливочный десерт с ягодным соусом.'],
    1376 => [213, 'Тирамису', 'Классический десерт с кремом маскарпоне и кофе.'],
    1377 => [213, 'Канноли', 'Хрустящая трубочка с кремовой начинкой.'],
];

$hiddenItemIds = [1345, 1346, 1347, 1348, 1349, 1350, 1353, 1354, 1355, 1356, 1369, 1370, 1371, 1372, 1373, 1374, 1378, 1379, 1380];
$disabledCategoryIds = [208, 212];

$pdo->beginTransaction();

$updateRestaurant = $pdo->prepare(
    'UPDATE restaurants
     SET short_description = :short_description,
         updated_at = NOW()
     WHERE id = :id'
);

$updateRestaurant->execute([
    'id' => $restaurantId,
    'short_description' => 'Итальянская кухня: пиццетта, пицца, паста, супы и классические десерты.',
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

echo 'Updated Fattoria Marian items: ' . $updatedItems . PHP_EOL;
echo 'Hidden old items: ' . $hiddenItems . PHP_EOL;
