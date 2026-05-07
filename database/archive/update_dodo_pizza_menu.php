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

$restaurantId = 7;

$items = [
    1033 => ['Пепперони', 'Пицца с пикантной колбасой пепперони, моцареллой и фирменным томатным соусом'],
    1034 => ['Четыре сыра', 'Пицца с моцареллой, чеддером, пармезаном и сливочным соусом'],
    1035 => ['Ветчина и грибы', 'Пицца с ветчиной, шампиньонами и моцареллой'],
    1036 => ['Карбонара', 'Пицца с беконом, сыром, луком и сливочным соусом альфредо'],
    1037 => ['Аррива', 'Острая пицца с курицей, чоризо, овощами и соусом ранч'],
    1038 => ['Креветки и песто', 'Пицца с креветками, томатами и соусом песто'],
    1039 => ['Картофель из печи', 'Запеченный картофель с хрустящей корочкой'],
    1040 => ['Куриные кусочки', 'Кусочки курицы в панировке'],
    1041 => ['Наггетсы', 'Куриное филе в хрустящей оболочке'],
    1042 => ['Сырный стартер', 'Сырные палочки с расплавленным сыром'],
    1043 => ['Грибной стартер', 'Закуска с грибами и сыром'],
    1044 => ['Салат Цезарь', 'Салат с курицей, сыром и соусом Цезарь'],
    1045 => ['Додстер', 'Легендарная горячая закуска с цыпленком, томатами, моцареллой и соусом ранч в тонкой пшеничной лепешке'],
    1046 => ['Додстер Масала', 'Горячая закуска с цыпленком, соусом масала, томатами и моцареллой'],
    1047 => ['Додстер с ветчиной', 'Горячий завтрак с ветчиной, томатами, моцареллой и соусом ранч в тонкой пшеничной лепешке'],
    1048 => ['Додстер Чилл Грилл', 'Горячая закуска с цыпленком и соусом гриль с луком, маринованными огурчиками и моцареллой'],
    1049 => ['Супермясной Додстер', 'Горячая закуска, в которой много мяса: цыпленок, чоризо и пряная говядина с моцареллой и соусом бургер'],
    1050 => ['Холодный чикен ролл', 'Холодная закуска для легкого перекуса: ролл с цыпленком, свежим салатом, томатами, чеддером и пармезаном с соусом ранч'],
    1051 => ['Торт Рикотта с грушей', 'Нежная сырная начинка, сочные кусочки груши и хруст миндальных лепестков'],
    1052 => ['Чизкейк Дубайский', 'Мягкий чизкейк с насыщенным фисташковым вкусом и глазурью'],
    1053 => ['Додобоны', 'Сладкие булочки с корицей и глазурью'],
    1054 => ['Тирамису', 'Многослойный десерт в лучших итальянских традициях с ароматом какао, кофе и нежным кремом'],
    1055 => ['Маффин Три шоколада', 'Кекс из натурального какао с начинкой из кубиков белого и молочного шоколада'],
    1056 => ['Фондан', 'Французский шоколадный десерт с хрустящей корочкой и жидкой начинкой'],
    1057 => ['Добрый Кола', 'Газированный напиток с классическим вкусом'],
    1058 => ['Добрый Апельсин', 'Сладкий газированный напиток с апельсиновым вкусом'],
    1059 => ['Добрый Лимон-Лайм', 'Освежающий лимонно-лаймовый напиток'],
    1060 => ['Сок Добрый Яблоко', 'Натуральный фруктовый напиток'],
    1061 => ['Вода', 'Питьевая вода без газа или с газом'],
    1062 => ['Rich Tea Черный с лимоном', 'Освежающий негазированный холодный чай'],
];

$pdo->beginTransaction();

$updateItem = $pdo->prepare(
    'UPDATE menu_items
     SET name = :name, description = :description, updated_at = NOW()
     WHERE id = :id AND restaurant_id = :restaurant_id'
);

$updatedItems = 0;
foreach ($items as $id => [$name, $description]) {
    $updateItem->execute([
        'id' => $id,
        'name' => $name,
        'description' => $description,
        'restaurant_id' => $restaurantId,
    ]);
    $updatedItems += $updateItem->rowCount();
}

$rows = $pdo->query(
    'SELECT id, description
     FROM menu_items
     WHERE restaurant_id IN (1, 2, 3, 7)
       AND description IS NOT NULL
       AND TRIM(description) <> ""'
)->fetchAll();

$capitalize = static function (string $text): string {
    $text = trim($text);
    if ($text === '') {
        return $text;
    }

    if (function_exists('mb_substr') && function_exists('mb_strtoupper')) {
        return mb_strtoupper(mb_substr($text, 0, 1, 'UTF-8'), 'UTF-8') . mb_substr($text, 1, null, 'UTF-8');
    }

    return strtoupper(substr($text, 0, 1)) . substr($text, 1);
};

$updateDescription = $pdo->prepare(
    'UPDATE menu_items SET description = :description, updated_at = NOW() WHERE id = :id'
);

$capitalizedRows = 0;
foreach ($rows as $row) {
    $capitalized = $capitalize((string) $row['description']);
    if ($capitalized === $row['description']) {
        continue;
    }

    $updateDescription->execute(['id' => (int) $row['id'], 'description' => $capitalized]);
    $capitalizedRows += $updateDescription->rowCount();
}

$pdo->commit();

echo 'Updated Dodo items: ' . $updatedItems . PHP_EOL;
echo 'Capitalized descriptions: ' . $capitalizedRows . PHP_EOL;

