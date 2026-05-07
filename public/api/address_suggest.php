<?php
declare(strict_types=1);

require_once dirname(__DIR__, 2) . '/includes/bootstrap.php';

header('Content-Type: application/json; charset=utf-8');

$q = trim((string) ($_GET['q'] ?? ''));
if (mb_strlen($q) < 2) {
    echo json_encode(['items' => [], 'source' => 'local'], JSON_UNESCAPED_UNICODE);
    exit;
}

$streets = [
    'Тверская улица',
    'Новый Арбат',
    'Пятницкая улица',
    'Никольская улица',
    'Большая Дмитровка',
    'Ленинградский проспект',
    'Кутузовский проспект',
    'Проспект Мира',
    'Большая Садовая улица',
    'Мясницкая улица',
    'Сретенка',
    'Покровка',
    'Большая Ордынка',
    'Петровка',
    'Остоженка',
    'Пречистенка',
    'Малая Бронная улица',
    'Садовая-Кудринская улица',
    'Сиреневый бульвар',
    'Цветной бульвар',
    'Чистопрудный бульвар',
    'Зубовский бульвар',
    'Варшавское шоссе',
    'Каширское шоссе',
    'Ленинский проспект',
    'Вернадского проспект',
    'Профсоюзная улица',
    'Люблинская улица',
    'Таганская улица',
    'Русаковская улица',
    'Шаболовка',
    'Волгоградский проспект',
    'Рязанский проспект',
    'Ярославское шоссе',
    'Алтуфьевское шоссе',
    'Дмитровское шоссе',
];

$moscowRegionCities = [
    'Балашиха',
    'Химки',
    'Мытищи',
    'Королев',
    'Люберцы',
    'Красногорск',
    'Одинцово',
    'Подольск',
    'Реутов',
    'Долгопрудный',
];

$houseNumbers = ['3', '5', '7', '10', '12', '15', '18', '21', '24', '31', '37', '42', '53', '68'];

$normalize = static function (string $value): string {
    $value = mb_strtolower($value);
    return str_replace(['ё', '.', ',', '  '], ['е', '', '', ' '], $value);
};

$localItems = static function (string $query) use ($streets, $moscowRegionCities, $houseNumbers, $normalize): array {
    $queryNormalized = $normalize($query);
    $items = [];

    foreach ($streets as $street) {
        $streetNormalized = $normalize($street);
        if (
            mb_stripos($streetNormalized, $queryNormalized) === false
            && mb_stripos($normalize('Москва ' . $street), $queryNormalized) === false
        ) {
            continue;
        }

        foreach (array_slice($houseNumbers, 0, 3) as $house) {
            $items[] = [
                'label' => 'Москва, ' . $street . ', ' . $house,
                'street' => $street,
                'house' => $house,
                'city' => 'Москва',
                'source' => 'local',
            ];
        }

        if (count($items) >= 8) {
            break;
        }
    }

    foreach ($moscowRegionCities as $city) {
        if (count($items) >= 8) {
            break;
        }

        $cityNormalized = $normalize($city);
        if (
            mb_stripos($cityNormalized, $queryNormalized) === false
            && mb_stripos($normalize('Московская область ' . $city), $queryNormalized) === false
        ) {
            continue;
        }

        foreach (array_slice($houseNumbers, 0, 2) as $house) {
            $items[] = [
                'label' => 'Московская область, ' . $city . ', Центральная улица, ' . $house,
                'street' => 'Центральная улица',
                'house' => $house,
                'city' => $city,
                'source' => 'local',
            ];
        }
    }

    return array_slice($items, 0, 8);
};

$provider = (string) app_config('maps.provider', 'local');

if ($provider === 'dadata') {
    $apiKey = trim((string) app_config('maps.dadata_api_key', ''));
    $endpoint = (string) app_config('maps.dadata_suggest_url');

    if ($apiKey !== '') {
        $payload = json_encode([
            'query' => $q,
            'count' => 8,
            'locations' => [
                ['region' => 'Москва'],
                ['region' => 'Московская'],
            ],
            'from_bound' => ['value' => 'street'],
            'to_bound' => ['value' => 'house'],
        ], JSON_UNESCAPED_UNICODE);

        $ctx = stream_context_create([
            'http' => [
                'method' => 'POST',
                'timeout' => 4,
                'ignore_errors' => true,
                'header' => implode("\r\n", [
                    'Content-Type: application/json',
                    'Accept: application/json',
                    'Authorization: Token ' . $apiKey,
                ]),
                'content' => $payload,
            ],
            'ssl' => [
                'verify_peer' => false,
                'verify_peer_name' => false,
            ],
        ]);

        $raw = @file_get_contents($endpoint, false, $ctx);
        $decoded = is_string($raw) ? json_decode($raw, true) : null;

        if (is_array($decoded) && isset($decoded['suggestions']) && is_array($decoded['suggestions'])) {
            $items = [];
            foreach ($decoded['suggestions'] as $suggestion) {
                if (!is_array($suggestion)) {
                    continue;
                }

                $value = (string) ($suggestion['value'] ?? '');
                if ($value === '') {
                    continue;
                }

                $items[] = [
                    'label' => $value,
                    'city' => (string) ($suggestion['data']['city'] ?? $suggestion['data']['settlement'] ?? 'Москва и Московская область'),
                    'source' => 'dadata',
                ];
            }

            if ($items) {
                echo json_encode(['items' => array_slice($items, 0, 8), 'source' => 'dadata'], JSON_UNESCAPED_UNICODE);
                exit;
            }
        }
    }
}

$items = $localItems($q);
echo json_encode(['items' => $items, 'source' => 'local'], JSON_UNESCAPED_UNICODE);
