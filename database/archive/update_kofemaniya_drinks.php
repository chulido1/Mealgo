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

$drinks = [
    1261 => ['Raf Moss', 'Нежный кофейный напиток на основе эспрессо, сливок и сахара с кремовой текстурой.'],
    1262 => ['Латте Матча', 'Напиток на основе зелёного чая матча с молоком, мягкий и слегка сладковатый.'],
    1263 => ['Бамбл', 'Освежающий кофе с апельсиновым соком и льдом, яркий и бодрящий вкус.'],
    1264 => ['Айс-латте', 'Классический холодный кофе с молоком и льдом.'],
    1265 => ['Эрл Грей', 'Чёрный чай с характерным ароматом бергамота.'],
    1266 => ['Имбирный чай', 'Горячий напиток с имбирём, обладает согревающим и пряным вкусом.'],
];

$stmt = $pdo->prepare(
    'UPDATE menu_items
     SET name = :name,
         description = :description,
         is_available = 1,
         updated_at = NOW()
     WHERE id = :id AND restaurant_id = 17'
);

$updated = 0;
foreach ($drinks as $id => [$name, $description]) {
    $stmt->execute([
        'id' => $id,
        'name' => $name,
        'description' => $description,
    ]);
    $updated += $stmt->rowCount();
}

echo 'Updated Kofemaniya drinks: ' . $updated . PHP_EOL;
