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

$restaurantId = 18;

$categoryNames = [
    195 => ['Блины сытные', 10],
    198 => ['Вторые блюда', 20],
    197 => ['Супы', 30],
    196 => ['Блины сладкие', 40],
    199 => ['Напитки', 50],
];

$items = [
    1267 => [195, 'Блин Золотая рыбка', 'Блин с лососем и сливочным сыром.'],
    1268 => [195, 'Блин E-mail с грибами и сыром', 'Блин с грибной начинкой и сыром.'],
    1269 => [195, 'Блин Жюльен', 'Блин с курицей, грибами и сливочным соусом.'],
    1270 => [195, 'Блин с красной икрой', 'Классический блин с красной икрой.'],
    1271 => [195, 'Блин Хачапури', 'Блин с сырной начинкой в стиле хачапури.'],
    1272 => [195, 'Блин с сёмгой', 'Блин с нежной слабосолёной сёмгой.'],
    1285 => [198, 'Рыбные котлетки с гарниром', 'Рыбные котлеты с гарниром.'],
    1286 => [198, 'Сёмга с гарниром', 'Филе сёмги с гарниром.'],
    1287 => [198, 'Томлёная куриная грудка с гарниром', 'Нежная куриная грудка.'],
    1288 => [198, 'Котлетки куриные с гарниром', 'Домашние куриные котлеты.'],
    1289 => [198, 'Котлеты Домашние с гарниром', 'Классические мясные котлеты.'],
    1290 => [198, 'Сосиски с гарниром на выбор', 'Сосиски с гарниром.'],
    1279 => [197, 'Окрошка Домашняя на квасе', 'Освежающий холодный суп на квасе.'],
    1280 => [197, 'Борщ Теремковский', 'Классический борщ со сметаной.'],
    1281 => [197, 'Лапша куриная с фрикадельками', 'Куриный суп с лапшой и фрикадельками.'],
    1282 => [197, 'Суп гороховый с копчёностями', 'Наваристый гороховый суп.'],
    1283 => [197, 'Суп грибной с чипсами', 'Грибной суп с хрустящими чипсами.'],
    1284 => [197, 'Сырный крем-суп', 'Нежный сливочно-сырный суп.'],
    1273 => [196, 'Блин Лаванда с заварным кремом', 'Блин с ароматным кремом.'],
    1274 => [196, 'Блин Покровский', 'Блин с шоколадной пастой и орехами.'],
    1275 => [196, 'Блин Ватрушка', 'Блин с творожной начинкой.'],
    1276 => [196, 'Блин с шоколадным кремом', 'Блин с насыщенным шоколадом.'],
    1277 => [196, 'Блин сгущёнка', 'Блин со сгущённым молоком.'],
    1278 => [196, 'Блинчик с вишнёвым вареньем', 'Блин с вишнёвым вареньем.'],
    1291 => [199, 'Питень в бутылке', 'Газированный напиток.'],
    1292 => [199, 'Лимонад Кола-ваниль', 'Сладкий газированный напиток.'],
    1293 => [199, 'Лимонад Лаванда', 'Освежающий лимонад с ароматом лаванды.'],
    1294 => [199, 'Лимонад Малина-Брусника', 'Ягодный лимонад.'],
    1295 => [199, 'Квас в бутылке', 'Традиционный хлебный напиток.'],
    1296 => [199, 'Морс в бутылке', 'Ягодный освежающий напиток.'],
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
    'short_description' => 'Сытные и сладкие блины, супы, вторые блюда и русские напитки.',
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

$pdo->commit();

echo 'Updated Teremok items: ' . $updatedItems . PHP_EOL;
