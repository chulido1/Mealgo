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

$restaurantId = 12;

$categoryNames = [
    181 => ['Торты', 10],
    182 => ['Эклеры', 20],
    183 => ['Десерты', 30],
];

$items = [
    1183 => [181, 'Наполеон', 'Хрустящие слоёные коржи, пропитанные сливочно-заварным кремом, приготовленные по классическому рецепту.'],
    1184 => [181, 'Наполеон с ягодами', 'Классический «Наполеон», украшенный свежими ягодами: клубникой, малиной и голубикой в различных вариантах декора.'],
    1185 => [181, 'Наполеон и Эстерхази', 'Комбинированный торт: половина — слоёный «Наполеон», половина — ореховый «Эстерхази».'],
    1186 => [181, 'Торт Эстерхази', 'Ореховый бисквит на основе миндальной муки и грецкого ореха с нежным сливочным кремом, ликёром амаретто и бельгийским шоколадом.'],
    1187 => [181, 'Торт Прага', 'Шоколадный торт с насыщенным вкусом какао, шоколада, абрикосового джема и коньяка.'],
    1188 => [181, 'Торт Четыре вкуса', 'Сочетание четырёх классических десертов: Наполеон, Медовик, Опера и Эстерхази в одном торте.'],
    1189 => [182, 'Эклер ванильный', 'Хрустящее заварное тесто с глянцевой глазурью и нежным сливочно-заварным кремом с ароматом ванили.'],
    1190 => [182, 'Эклер шоколадный', 'Заварное тесто с добавлением бельгийского шоколада, лёгкий внутри и хрустящий снаружи.'],
    1191 => [182, 'Эклер солёная карамель', 'Десерт с ярким сочетанием сладкого и солёного вкуса карамели.'],
    1192 => [182, 'Эклер фисташковый', 'Эклер с кремом на основе натуральной фисташки.'],
    1193 => [182, 'Эклер тропики', 'Крем из манго, маракуйи и юдзу с балансом сладости и кислинки.'],
    1195 => [183, 'Пирожное Картошка', 'Десерт из шоколадного бисквита с добавлением какао, арахиса и бельгийского шоколада.'],
    1196 => [183, 'Наполеон (кусочек)', 'Слоёные коржи, пропитанные сливочно-заварным кремом, классический вариант в порции.'],
    1197 => [183, 'Медовик (кусочек)', 'Нежные медовые коржи со сливочно-заварным кремом.'],
    1198 => [183, 'Медовик с варёной сгущёнкой (кусочек)', 'Сметанный медовик с добавлением варёной сгущёнки.'],
    1199 => [183, 'Пирожное Опера', 'Миндальный бисквит «Джоконда» с кофейной пропиткой, кофейно-шоколадный вкус.'],
    1200 => [183, 'Пирожное Прага', 'Шоколадный десерт с нотами какао, абрикосового джема и коньяка.'],
];

$hiddenItemIds = [1194, 1201, 1202, 1203, 1204, 1205, 1206];
$disabledCategoryIds = [184];

$pdo->beginTransaction();

$updateRestaurant = $pdo->prepare(
    'UPDATE restaurants
     SET name = :name,
         short_description = :short_description,
         updated_at = NOW()
     WHERE id = :id'
);

$updateRestaurant->execute([
    'id' => $restaurantId,
    'name' => 'Особенный Наполеон Кондитерская',
    'short_description' => 'Фирменные наполеоны, эклеры, торты и порционные десерты ручной работы.',
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

echo 'Updated Special Napoleon items: ' . $updatedItems . PHP_EOL;
echo 'Hidden old items: ' . $hiddenItems . PHP_EOL;
