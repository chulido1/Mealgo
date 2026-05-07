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

$restaurantId = 10;

$categoryNames = [
    173 => ['Трайфлы', 10],
    174 => ['Десерты в шоколаде', 20],
    175 => ['Эклеры', 30],
    176 => ['Торты', 40],
];

$items = [
    1135 => [173, 'Трайфл «Сникерлав»', 'Шоколадный бисквит с нежным сырным кремом, солёной карамелью и хрустящим арахисом. Полит шоколадным ганашем.'],
    1136 => [173, 'Трайфл «Наполеон»', 'Нежное слоёное тесто с кремом, пропитанное сливочной основой и посыпанное сахарной пудрой.'],
    1137 => [173, 'Трайфл «Дубай»', 'Сочетание бисквита, теста катаифи, фисташковой пасты и крем-чиза с молочным ганашем.'],
    1138 => [173, 'Трайфл «Пинчер»', 'Шоколадный бисквит со сливочным кремом и сгущённым молоком, дополненный шоколадной глазурью.'],
    1139 => [173, 'Трайфл «Банановая улица»', 'Заварной крем патисьер, шоколадная бисквитная крошка, банановая прослойка и ганаш с хрустящими шариками.'],
    1140 => [173, 'Трайфл с вишней', 'Шоколадный бисквит, нежный творожный крем и сочная вишнёвая начинка.'],
    1141 => [174, 'Десерт «Банан в шоколаде»', 'Спелый банан, покрытый слоем молочного бельгийского шоколада.'],
    1142 => [174, 'Десерт «Клубника в шоколаде»', 'Свежая клубника в молочном бельгийском шоколаде.'],
    1143 => [174, 'Десерт «Малина в шоколаде»', 'Спелая малина в белом и молочном бельгийском шоколаде.'],
    1147 => [175, 'Эклер «Шоколадный»', 'Заварное тесто с шоколадным кремом, покрыто молочным шоколадом.'],
    1148 => [175, 'Эклер «Кракелин ваниль»', 'Эклер с хрустящей корочкой и нежной сливочной начинкой.'],
    1153 => [176, 'Торт «Милка Лав»', 'Шоколадный бисквит, крем-чиз и молочный ганаш, украшен шоколадным декором.'],
    1154 => [176, 'Торт «Шоколадный Ванлав»', 'Шоколадный бисквит с сырным кремом, прослойкой из малины и банана, покрыт ганашем.'],
    1155 => [176, 'Торт Бенто «Love»', 'Ванильный бисквит, сырный крем, банан и карамель.'],
    1156 => [176, 'Торт Бенто «Весенний»', 'Морковный бисквит, сырный крем и карамель с грецким орехом.'],
    1157 => [176, 'Торт Бенто «Конструктор»', 'Нежный бисквит с кремом и фруктовой начинкой. Вариативный состав.'],
];

$hiddenItemIds = [1144, 1145, 1146, 1149, 1150, 1151, 1152, 1158, 1423];

$pdo->beginTransaction();

$updateRestaurant = $pdo->prepare(
    'UPDATE restaurants
     SET short_description = :short_description,
         updated_at = NOW()
     WHERE id = :id'
);

$updateRestaurant->execute([
    'id' => $restaurantId,
    'short_description' => 'Трайфлы, эклеры, торты и десерты в шоколаде для сладкой доставки.',
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

echo 'Updated One Love items: ' . $updatedItems . PHP_EOL;
echo 'Hidden old items: ' . $hiddenItems . PHP_EOL;
