<?php

declare(strict_types=1);

if (PHP_SAPI !== 'cli') {
    http_response_code(403);
    exit("CLI only.\n");
}

define('ROOT_PATH', dirname(__DIR__));
require_once ROOT_PATH . '/includes/db.php';

const MENU_SOURCE_FILE = ROOT_PATH . '/public/uploads/restaurants/restaurants_menus.txt';
const OUTPUT_SQL_FILE = ROOT_PATH . '/database/menu_replace_from_txt.sql';

try {
    $menusByRestaurant = parseMenusFromText(MENU_SOURCE_FILE);
    if ($menusByRestaurant === []) {
        throw new RuntimeException('Не удалось распарсить меню из файла.');
    }

    $restaurants = db_all('SELECT id, name FROM restaurants ORDER BY id ASC');
    if ($restaurants === []) {
        throw new RuntimeException('В таблице restaurants нет записей.');
    }
    $restaurantMap = buildRestaurantMap($menusByRestaurant, $restaurants);

    $sql = [];
    $sql[] = 'USE diplom_foodhub;';
    $sql[] = 'SET NAMES utf8mb4;';
    $sql[] = 'START TRANSACTION;';
    $sql[] = '';
    $sql[] = '-- Удаляем старые позиции меню';
    $sql[] = 'DELETE FROM menu_items;';
    $sql[] = 'DELETE FROM menu_categories;';
    $sql[] = '';

    $menuRows = [];
    foreach ($menusByRestaurant as $sourceRestaurantName => $categories) {
        $restaurantId = (int) $restaurantMap[$sourceRestaurantName]['id'];
        $restaurantName = (string) $restaurantMap[$sourceRestaurantName]['name'];
        $sortOrder = 10;
        foreach ($categories as $categoryName => $items) {
            $sql[] = sprintf(
                "INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)\n" .
                "VALUES (\n" .
                "  %d,\n" .
                "  '%s',\n" .
                "  %d,\n" .
                "  1,\n" .
                "  NOW(),\n" .
                "  NOW()\n" .
                ");",
                $restaurantId,
                esc($categoryName),
                $sortOrder
            );
            $sortOrder += 10;

            foreach ($items as $itemName) {
                $meta = buildItemMeta($restaurantName, $categoryName, $itemName);
                $menuRows[] = [
                    'restaurant_id' => $restaurantId,
                    'restaurant' => $restaurantName,
                    'category' => $categoryName,
                    'item_name' => $itemName,
                    'description' => $meta['description'],
                    'price' => number_format($meta['price'], 2, '.', ''),
                    'weight' => $meta['weight'],
                    'image' => $meta['image'],
                    'is_popular' => $meta['is_popular'],
                    'is_new' => $meta['is_new'],
                ];
            }
        }
    }

    $sql[] = '';
    $sql[] = '-- Добавляем новые позиции';
    foreach ($menuRows as $row) {
        $sql[] = sprintf(
            "INSERT INTO menu_items (\n" .
            "  restaurant_id, category_id, name, description, price, weight, image,\n" .
            "  is_available, is_popular, is_new, created_at, updated_at\n" .
            ")\n" .
            "VALUES (\n" .
            "  %d,\n" .
            "  (\n" .
            "    SELECT mc.id\n" .
            "    FROM menu_categories mc\n" .
            "    WHERE mc.restaurant_id = %d AND mc.name = '%s'\n" .
            "    LIMIT 1\n" .
            "  ),\n" .
            "  '%s',\n" .
            "  '%s',\n" .
            "  %s,\n" .
            "  '%s',\n" .
            "  '%s',\n" .
            "  1,\n" .
            "  %d,\n" .
            "  %d,\n" .
            "  NOW(),\n" .
            "  NOW()\n" .
            ");",
            (int) $row['restaurant_id'],
            (int) $row['restaurant_id'],
            esc($row['category']),
            esc($row['item_name']),
            esc($row['description']),
            $row['price'],
            esc($row['weight']),
            esc($row['image']),
            (int) $row['is_popular'],
            (int) $row['is_new']
        );
    }

    $sql[] = '';
    $sql[] = 'COMMIT;';
    $sql[] = '';

    $content = implode(PHP_EOL, $sql);
    file_put_contents(OUTPUT_SQL_FILE, $content);

    echo "SQL файл создан: " . OUTPUT_SQL_FILE . PHP_EOL;
    echo "Категорий: " . countCategories($menusByRestaurant) . PHP_EOL;
    echo "Позиции: " . countItems($menusByRestaurant) . PHP_EOL;
} catch (Throwable $e) {
    fwrite(STDERR, "Ошибка: " . $e->getMessage() . PHP_EOL);
    exit(1);
}

function parseMenusFromText(string $filePath): array
{
    if (!is_file($filePath)) {
        throw new RuntimeException('Файл не найден: ' . $filePath);
    }

    $lines = file($filePath, FILE_IGNORE_NEW_LINES);
    if ($lines === false) {
        throw new RuntimeException('Не удалось прочитать файл меню.');
    }

    $result = [];
    $currentRestaurant = null;
    $currentCategory = null;

    foreach ($lines as $lineRaw) {
        $line = trim((string) $lineRaw);
        if ($line === '') {
            continue;
        }

        if (preg_match('/^=+\s*.+?\s*=+$/u', $line) === 1) {
            $currentRestaurant = null;
            $currentCategory = null;
            continue;
        }

        if (str_starts_with($line, '- ')) {
            if ($currentRestaurant === null || $currentCategory === null) {
                continue;
            }
            $itemName = trim(mb_substr($line, 2));
            if ($itemName !== '') {
                $result[$currentRestaurant][$currentCategory][] = $itemName;
            }
            continue;
        }

        if (str_ends_with($line, ':')) {
            if ($currentRestaurant === null) {
                continue;
            }
            $currentCategory = trim(mb_substr($line, 0, mb_strlen($line) - 1));
            if ($currentCategory !== '' && !isset($result[$currentRestaurant][$currentCategory])) {
                $result[$currentRestaurant][$currentCategory] = [];
            }
            continue;
        }

        $currentRestaurant = $line;
        $currentCategory = null;
        if (!isset($result[$currentRestaurant])) {
            $result[$currentRestaurant] = [];
        }
    }

    foreach ($result as $restaurant => $categories) {
        foreach ($categories as $category => $items) {
            if ($items === []) {
                unset($result[$restaurant][$category]);
            }
        }
        if ($result[$restaurant] === []) {
            unset($result[$restaurant]);
        }
    }

    return $result;
}

function buildRestaurantMap(array $menusByRestaurant, array $restaurants): array
{
    $aliases = [
        normalizeName('Ростикс') => normalizeName("Rostic's"),
        normalizeName('Тануки') => normalizeName('Tanuki'),
        normalizeName('Додо Пицца') => normalizeName('Dodo Pizza'),
        normalizeName('Ванлав') => normalizeName('One Love'),
        normalizeName('Особенный Наполеон') => normalizeName('Special Napoleon'),
        normalizeName('Культура встречи') => normalizeName('Культура Встречи'),
    ];

    $byNormalized = [];
    foreach ($restaurants as $restaurant) {
        $byNormalized[normalizeName((string) $restaurant['name'])] = $restaurant;
    }

    $mapped = [];
    $fallbackRows = array_values($restaurants);
    $restaurantNames = array_keys($menusByRestaurant);

    foreach ($restaurantNames as $index => $menuRestaurantName) {
        $normalizedSource = normalizeName($menuRestaurantName);
        $normalizedTarget = $aliases[$normalizedSource] ?? $normalizedSource;

        if (isset($byNormalized[$normalizedTarget])) {
            $mapped[$menuRestaurantName] = $byNormalized[$normalizedTarget];
            continue;
        }

        if (isset($fallbackRows[$index])) {
            $mapped[$menuRestaurantName] = $fallbackRows[$index];
            continue;
        }

        throw new RuntimeException('Не удалось сопоставить ресторан: ' . $menuRestaurantName);
    }

    return $mapped;
}

function buildItemMeta(string $restaurantName, string $categoryName, string $itemName): array
{
    $seed = abs(crc32(mb_strtolower($restaurantName . '|' . $categoryName . '|' . $itemName)));
    $categoryNorm = normalizeName($categoryName);
    $itemNorm = normalizeName($itemName);

    $isDrink = str_contains($categoryNorm, 'напит') ||
        str_contains($itemNorm, 'cola') ||
        str_contains($itemNorm, 'pepsi') ||
        str_contains($itemNorm, 'чай') ||
        str_contains($itemNorm, 'коф') ||
        str_contains($itemNorm, 'сок') ||
        str_contains($itemNorm, 'вода') ||
        str_contains($itemNorm, 'морс') ||
        str_contains($itemNorm, 'квас') ||
        str_contains($itemNorm, 'лимонад');

    [$priceMin, $priceMax, $weightMin, $weightMax] = getRangesByCategory($categoryNorm, $itemNorm, $isDrink);
    $price = (float) (round(($priceMin + ($seed % ($priceMax - $priceMin + 1))) / 10) * 10);
    $weightValue = $weightMin + ($seed % ($weightMax - $weightMin + 1));
    $weight = $weightValue . ($isDrink ? ' мл' : ' г');

    $description = sprintf('%s из категории "%s" ресторана %s.', $itemName, $categoryName, $restaurantName);
    $image = pickMenuImage($categoryNorm, $itemNorm, $seed);
    $isPopular = ($seed % 5 === 0) ? 1 : 0;
    $isNew = ($seed % 11 === 0) ? 1 : 0;

    return [
        'price' => $price,
        'weight' => $weight,
        'description' => $description,
        'image' => $image,
        'is_popular' => $isPopular,
        'is_new' => $isNew,
    ];
}

function getRangesByCategory(string $categoryNorm, string $itemNorm, bool $isDrink): array
{
    if ($isDrink) {
        return [120, 320, 250, 500];
    }
    if (str_contains($categoryNorm, 'соус')) {
        return [40, 140, 30, 70];
    }
    if (str_contains($categoryNorm, 'комбо')) {
        return [450, 990, 350, 900];
    }
    if (str_contains($categoryNorm, 'бургер')) {
        return [270, 690, 180, 420];
    }
    if (str_contains($categoryNorm, 'пицц')) {
        return [520, 1090, 420, 700];
    }
    if (str_contains($categoryNorm, 'сет') || str_contains($itemNorm, 'сет')) {
        return [1100, 2590, 600, 1400];
    }
    if (str_contains($categoryNorm, 'ролл') || str_contains($categoryNorm, 'суши')) {
        return [350, 990, 160, 420];
    }
    if (str_contains($categoryNorm, 'суп')) {
        return [250, 520, 280, 460];
    }
    if (str_contains($categoryNorm, 'десерт') ||
        str_contains($categoryNorm, 'торт') ||
        str_contains($categoryNorm, 'эклер') ||
        str_contains($categoryNorm, 'шоколад') ||
        str_contains($categoryNorm, 'круассан')) {
        return [180, 560, 90, 220];
    }
    if (str_contains($categoryNorm, 'закуск') || str_contains($categoryNorm, 'снек') || str_contains($categoryNorm, 'додстер')) {
        return [150, 520, 100, 350];
    }
    if (str_contains($categoryNorm, 'паста') || str_contains($categoryNorm, 'горяч') || str_contains($categoryNorm, 'блины')) {
        return [320, 990, 220, 520];
    }

    return [200, 760, 150, 380];
}

function pickMenuImage(string $categoryNorm, string $itemNorm, int $seed): string
{
    if (str_contains($categoryNorm, 'пицц')) {
        return ($seed % 2 === 0) ? '/uploads/menu/pizza-margherita.svg' : '/uploads/menu/pizza-4cheese.svg';
    }
    if (str_contains($categoryNorm, 'бургер') || str_contains($categoryNorm, 'комбо')) {
        return ($seed % 2 === 0) ? '/uploads/menu/burger-bbq.svg' : '/uploads/menu/burger-truffle.svg';
    }
    if (str_contains($categoryNorm, 'ролл') || str_contains($categoryNorm, 'суши')) {
        return ($seed % 2 === 0) ? '/uploads/menu/philadelphia.svg' : '/uploads/menu/california.svg';
    }
    if (str_contains($categoryNorm, 'сет') || str_contains($itemNorm, 'сет')) {
        return '/uploads/menu/set-premium.svg';
    }
    if (str_contains($categoryNorm, 'суп')) {
        return '/uploads/menu/salmon-bowl.svg';
    }
    if (str_contains($categoryNorm, 'десерт') ||
        str_contains($categoryNorm, 'эклер') ||
        str_contains($categoryNorm, 'торт') ||
        str_contains($categoryNorm, 'круассан')) {
        return '/uploads/menu/chia-mango.svg';
    }
    if (str_contains($categoryNorm, 'закуск') || str_contains($categoryNorm, 'снек')) {
        return ($seed % 2 === 0) ? '/uploads/menu/bruschetta.svg' : '/uploads/menu/fries.svg';
    }
    if (str_contains($categoryNorm, 'паста') || str_contains($categoryNorm, 'горяч')) {
        return ($seed % 2 === 0) ? '/uploads/menu/chicken-bowl.svg' : '/uploads/menu/salmon-bowl.svg';
    }
    if (str_contains($categoryNorm, 'салат') || str_contains($categoryNorm, 'боул')) {
        return '/uploads/menu/salmon-bowl.svg';
    }

    return '/uploads/menu/placeholder.svg';
}

function normalizeName(string $value): string
{
    $value = mb_strtolower(trim($value));
    $value = str_replace(['ё', '’', '\'', '—', '-', '“', '”', '«', '»', '.', ','], ['е', '', '', '', '', '', '', '', '', '', ''], $value);
    $value = preg_replace('/\s+/u', '', $value) ?? '';
    $value = preg_replace('/[^\p{L}\p{N}]+/u', '', $value) ?? '';
    return $value;
}

function esc(string $value): string
{
    return str_replace("'", "''", $value);
}

function countCategories(array $menus): int
{
    $count = 0;
    foreach ($menus as $categories) {
        $count += count($categories);
    }
    return $count;
}

function countItems(array $menus): int
{
    $count = 0;
    foreach ($menus as $categories) {
        foreach ($categories as $items) {
            $count += count($items);
        }
    }
    return $count;
}
