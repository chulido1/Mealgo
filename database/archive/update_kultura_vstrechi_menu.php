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

$restaurantId = 16;

$categoryNames = [
    185 => ['Закуски', 10],
    186 => ['Супы', 20],
    187 => ['Горячее', 30],
    188 => ['Десерты', 40],
];

$items = [
    1207 => [185, 'Парфе из печени индейки с черносливом', 'Нежное парфе с лёгкой сладостью чернослива.'],
    1208 => [185, 'Риет из форели с редисом и пряными огурцами', 'Паштет из форели с хрустящими овощами.'],
    1209 => [185, 'Сырные гужеры с подкопченной форелью', 'Воздушные сырные булочки с рыбой.'],
    1210 => [185, 'Гравлакс из форели со свеклой и кремом из хрена', 'Маринованная форель с пикантным кремом.'],
    1211 => [185, 'Домашний хлеб с медово-сливочным маслом', 'Свежий хлеб с ароматным маслом.'],
    1212 => [185, 'Соленые белые грибы', 'Классическая холодная закуска из грибов.'],
    1213 => [186, 'Борщ говяжий', 'Насыщенный борщ с говядиной.'],
    1214 => [186, 'Куриный бульон с фрикадельками и яйцом', 'Лёгкий бульон с мясными шариками.'],
    1215 => [186, 'Рыбный суп с форелью и сибасом', 'Ароматный суп из нескольких видов рыбы.'],
    1219 => [187, 'Бургер Культура Встречи', 'Сочный бургер с мясной котлетой и соусом.'],
    1220 => [187, 'Котлета из говядины с картофельным пюре', 'Домашняя котлета с нежным пюре.'],
    1221 => [187, 'Голубцы с мясом и грибным соусом', 'Традиционные голубцы с насыщенным соусом.'],
    1222 => [187, 'Пельмени со свининой и говядиной в креме бульоне', 'Классические пельмени в бульоне.'],
    1223 => [187, 'Томленая говяжья щека в винном соусе', 'Мягкое мясо в насыщенном соусе.'],
    1224 => [187, 'Сибас в кляре с соусом тартар', 'Хрустящая рыба с соусом.'],
    1225 => [188, 'Медовик', 'Классический торт с медовыми коржами.'],
    1226 => [188, 'Пари-Брест', 'Французский десерт с кремом и орехами.'],
    1227 => [188, 'Творожные кольца', 'Воздушное тесто с творожной начинкой.'],
    1228 => [188, 'Чизкейк', 'Нежный сливочный десерт.'],
    1229 => [188, 'Конфета с фисташкой', 'Шоколадная конфета с начинкой.'],
    1230 => [188, 'Конфета с трюфельной начинкой', 'Классическая шоколадная конфета.'],
];

$hiddenItemIds = [1216, 1217, 1218];

$newCategoryName = 'Напитки';
$newDrinks = [
    ['Раф кофе', 'Кофе со сливочной текстурой.', 260.00, '300 мл'],
    ['Большой капучино', 'Классический кофейный напиток с молоком.', 280.00, '400 мл'],
    ['Американо', 'Чёрный кофе.', 180.00, '300 мл'],
    ['Латте', 'Кофе с большим количеством молока.', 260.00, '300 мл'],
    ['Лаванда-ваниль', 'Ароматный холодный напиток.', 290.00, '300 мл'],
    ['Coca-Cola', 'Газированный напиток.', 190.00, '330 мл'],
];

$pdo->beginTransaction();

$updateRestaurant = $pdo->prepare(
    'UPDATE restaurants
     SET short_description = :short_description,
         updated_at = NOW()
     WHERE id = :id'
);

$updateRestaurant->execute([
    'id' => $restaurantId,
    'short_description' => 'Современная русская кухня: закуски, супы, горячие блюда, десерты и напитки.',
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

$categoryIdStmt = $pdo->prepare(
    'SELECT id FROM menu_categories WHERE restaurant_id = :restaurant_id AND name = :name LIMIT 1'
);
$categoryIdStmt->execute(['restaurant_id' => $restaurantId, 'name' => $newCategoryName]);
$drinkCategoryId = (int) ($categoryIdStmt->fetchColumn() ?: 0);

if ($drinkCategoryId === 0) {
    $pdo->prepare(
        'INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active)
         VALUES (:restaurant_id, :name, 50, 1)'
    )->execute(['restaurant_id' => $restaurantId, 'name' => $newCategoryName]);
    $drinkCategoryId = (int) $pdo->lastInsertId();
} else {
    $pdo->prepare(
        'UPDATE menu_categories SET sort_order = 50, is_active = 1 WHERE id = :id'
    )->execute(['id' => $drinkCategoryId]);
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

$existingDrinkStmt = $pdo->prepare(
    'SELECT id FROM menu_items
     WHERE restaurant_id = :restaurant_id AND category_id = :category_id AND name = :name
     LIMIT 1'
);
$insertDrink = $pdo->prepare(
    'INSERT INTO menu_items
        (restaurant_id, category_id, name, description, price, weight, image, is_available, is_popular, is_new, created_at, updated_at)
     VALUES
        (:restaurant_id, :category_id, :name, :description, :price, :weight, :image, 1, 0, 0, NOW(), NOW())'
);
$updateDrink = $pdo->prepare(
    'UPDATE menu_items
     SET description = :description, price = :price, weight = :weight, is_available = 1, updated_at = NOW()
     WHERE id = :id'
);

$createdDrinks = 0;
foreach ($newDrinks as [$name, $description, $price, $weight]) {
    $existingDrinkStmt->execute([
        'restaurant_id' => $restaurantId,
        'category_id' => $drinkCategoryId,
        'name' => $name,
    ]);
    $existingId = (int) ($existingDrinkStmt->fetchColumn() ?: 0);

    if ($existingId > 0) {
        $updateDrink->execute([
            'id' => $existingId,
            'description' => $description,
            'price' => $price,
            'weight' => $weight,
        ]);
        continue;
    }

    $insertDrink->execute([
        'restaurant_id' => $restaurantId,
        'category_id' => $drinkCategoryId,
        'name' => $name,
        'description' => $description,
        'price' => $price,
        'weight' => $weight,
        'image' => '/uploads/menu/placeholder.svg',
    ]);
    $createdDrinks++;
}

$pdo->commit();

echo 'Updated Kultura Vstrechi items: ' . $updatedItems . PHP_EOL;
echo 'Hidden old items: ' . $hiddenItems . PHP_EOL;
echo 'Created drinks: ' . $createdDrinks . PHP_EOL;
