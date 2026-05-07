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

$restaurantId = 5;
$logoPath = '/assets/img/brands/sushi/why_not_sushi.png';

$categoryNames = [
    144 => ['Роллы', 10],
    145 => ['Запеченные роллы', 20],
    146 => ['Сеты', 30],
    147 => ['Онигири', 40],
    148 => ['Суши', 50],
    149 => ['Напитки', 60],
];

$items = [
    961 => [144, 'Филадельфия', 'Рис, лосось, сливочный сыр, авокадо, огурец, нори'],
    962 => [144, 'Канада', 'Угорь, лосось, сливочный сыр, огурец, соус унаги, кунжут'],
    963 => [144, 'Калифорния', 'Снежный краб, авокадо, огурец, тобико, японский майонез'],
    964 => [144, 'Калифорния с лососем', 'Вариант с добавлением лосося и икры'],
    965 => [144, 'Спайси лосось с авокадо', 'Лосось, авокадо, огурец, сливочный сыр, спайси соус'],
    966 => [144, 'Креветка темпура с лососем', 'Креветка темпура, лосось, сливочный сыр, соус унаги'],
    967 => [145, 'Креветка', 'Запеченный ролл с креветкой и сырной шапкой'],
    968 => [145, 'Лосось-креветка', 'Запеченный ролл с лососем и креветкой под сыром'],
    969 => [145, 'Угорь-снежный краб', 'Ролл с угрем и крабом, запеченный с соусом'],
    970 => [145, 'Лосось в нори', 'Ролл с лососем в нори с горячей сырной шапкой'],
    971 => [145, 'Креветка в нори', 'Запеченный ролл с креветкой'],
    972 => [145, 'Классический запеченный ролл', 'Ролл с сыром и морепродуктами под соусом'],
    973 => [146, 'Set 1', 'Ассорти роллов: классические и запеченные'],
    974 => [146, 'Set 2', 'Калифорния, Филадельфия, роллы с угрем и запеченная креветка'],
    975 => [146, 'Set hot', 'Набор запеченных и горячих роллов'],
    976 => [146, 'Set 4', 'Разнообразный сет с роллами и соусами'],
    977 => [146, 'Set 5', 'Большой набор роллов для компании'],
    978 => [146, 'Set Special', 'Максимальный сет с разными видами роллов'],
    979 => [147, 'Филадельфия', 'Рисовый сэндвич с лососем и сливочным сыром'],
    980 => [147, 'Лосось', 'Онигири с начинкой из лосося'],
    981 => [147, 'Гребешок', 'Рис с морским гребешком и соусом'],
    982 => [147, 'Креветка', 'Онигири с креветкой и сливочным соусом'],
    983 => [147, 'Угорь', 'Рис с угрем и соусом унаги'],
    984 => [147, 'Масляная рыба с трюфелем', 'Нежная рыба с трюфельным ароматом'],
    985 => [148, 'Суши с лососем', 'Рис с ломтиком свежего лосося'],
    986 => [148, 'Суши с креветкой', 'Классические суши с креветкой'],
    987 => [148, 'Суши с угрем', 'Угорь с соусом унаги'],
    988 => [148, 'Суши с тунцом', 'Суши с тунцом'],
    989 => [148, 'Суши с масляной рыбой', 'Нежная белая рыба'],
    990 => [148, 'Опаленный лосось', 'Слегка обожженный лосось с соусом'],
    991 => [149, 'Fanta', 'Газированный напиток'],
    992 => [149, 'Coca-Cola', 'Классическая кола'],
    993 => [149, 'Lapochka Ананас-личи', 'Фруктовый газированный напиток'],
    994 => [149, 'Lapochka Арбуз-мелисса', 'Освежающий напиток с травяными нотами'],
    995 => [149, 'Lapochka Грейпфрут-лимон', 'Цитрусовый напиток'],
    996 => [149, 'Lapochka Манго-чили', 'Сладко-острый фруктовый напиток'],
];

$pdo->beginTransaction();

$updateRestaurant = $pdo->prepare(
    'UPDATE restaurants
     SET name = :name,
         short_description = :short_description,
         logo_image = :logo_image,
         banner_image = :banner_image,
         address = :address,
         phone = :phone,
         working_hours = :working_hours,
         rating = :rating,
         delivery_fee = :delivery_fee,
         min_order_amount = :min_order_amount,
         delivery_time_min = :delivery_time_min,
         delivery_time_max = :delivery_time_max,
         updated_at = NOW()
     WHERE id = :id'
);

$updateRestaurant->execute([
    'id' => $restaurantId,
    'name' => 'Why Not Sushi',
    'short_description' => 'Японская кухня, роллы, суши, сеты и онигири с быстрой доставкой.',
    'logo_image' => $logoPath,
    'banner_image' => $logoPath,
    'address' => 'Москва, Цветной бульвар, 15',
    'phone' => '+7 (495) 120-55-05',
    'working_hours' => '11:00 - 23:30',
    'rating' => 4.9,
    'delivery_fee' => 199,
    'min_order_amount' => 900,
    'delivery_time_min' => 30,
    'delivery_time_max' => 50,
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

echo 'Updated Why Not Sushi items: ' . $updatedItems . PHP_EOL;

