USE diplom_foodhub;
SET NAMES utf8mb4;
START TRANSACTION;

-- Удаляем старые позиции меню
DELETE FROM menu_items;
DELETE FROM menu_categories;

INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  1,
  'Бургеры',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  1,
  'Комбо',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  1,
  'Снеки',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  1,
  'Напитки',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  1,
  'Десерты',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  1,
  'Соусы',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  2,
  'Бургеры',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  2,
  'Комбо',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  2,
  'Снеки',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  2,
  'Роллы',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  2,
  'Напитки',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  2,
  'Соусы',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  3,
  'Бургеры',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  3,
  'Роллы',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  3,
  'Курица',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  3,
  'Снеки',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  3,
  'Напитки',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  3,
  'Соусы',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  4,
  'Роллы',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  4,
  'Суши',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  4,
  'Сеты',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  4,
  'Супы',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  4,
  'Закуски',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  4,
  'Десерты',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  5,
  'Боулы',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  5,
  'Салаты',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  5,
  'Супы',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  5,
  'Горячее',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  5,
  'Закуски',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  5,
  'Десерты',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  6,
  'Роллы',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  6,
  'Суши',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  6,
  'Сеты',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  6,
  'Супы',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  6,
  'Горячее',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  6,
  'Соусы',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  7,
  'Пицца',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  7,
  'Закуски',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  7,
  'Додстеры',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  7,
  'Десерты',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  7,
  'Напитки',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  8,
  'Пицца',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  8,
  'Закуски',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  8,
  'Салаты',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  8,
  'Горячее',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  8,
  'Десерты',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  8,
  'Напитки',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  9,
  'Пицца',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  9,
  'Закуски',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  9,
  'Паста',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  9,
  'Десерты',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  9,
  'Напитки',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  9,
  'Соусы',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  10,
  'Трайфлы',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  10,
  'Шоколад',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  10,
  'Эклеры',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  10,
  'Торты',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  11,
  'Десерты',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  11,
  'Круассаны',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  11,
  'Завтраки',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  11,
  'Сэндвичи',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  12,
  'Наполеон',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  12,
  'Медовик',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  12,
  'Торты',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  12,
  'Десерты',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  16,
  'Закуски',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  16,
  'Супы',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  16,
  'Горячее',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  16,
  'Десерты',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  17,
  'Завтраки',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  17,
  'Салаты',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  17,
  'Супы',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  17,
  'Горячее',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  17,
  'Десерты',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  17,
  'Напитки',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  18,
  'Блины',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  18,
  'Сладкие блины',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  18,
  'Супы',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  18,
  'Горячее',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  18,
  'Напитки',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  13,
  'Закуски',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  13,
  'Салаты',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  13,
  'Супы',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  13,
  'Паста',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  13,
  'Пицца',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  13,
  'Горячее',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  13,
  'Десерты',
  70,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  14,
  'Закуски',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  14,
  'Салаты',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  14,
  'Супы',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  14,
  'Паста',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  14,
  'Пицца',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  14,
  'Горячее',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  14,
  'Десерты',
  70,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  15,
  'Закуски',
  10,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  15,
  'Салаты',
  20,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  15,
  'Супы',
  30,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  15,
  'Паста',
  40,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  15,
  'Пицца',
  50,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  15,
  'Горячее',
  60,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_categories (restaurant_id, name, sort_order, is_active, created_at, updated_at)
VALUES (
  15,
  'Десерты',
  70,
  1,
  NOW(),
  NOW()
);

-- Добавляем новые позиции
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Биг Спешиал',
  'Биг Спешиал из категории "Бургеры" ресторана Вкусно и Точка.',
  340.00,
  '253 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Биг Хит',
  'Биг Хит из категории "Бургеры" ресторана Вкусно и Точка.',
  580.00,
  '251 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Гранд',
  'Гранд из категории "Бургеры" ресторана Вкусно и Точка.',
  590.00,
  '346 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Фиш Бургер',
  'Фиш Бургер из категории "Бургеры" ресторана Вкусно и Точка.',
  540.00,
  '254 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Атлантик Бургер',
  'Атлантик Бургер из категории "Бургеры" ресторана Вкусно и Точка.',
  510.00,
  '262 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Цезарь Ролл',
  'Цезарь Ролл из категории "Бургеры" ресторана Вкусно и Точка.',
  330.00,
  '338 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Биг Спешиал Комбо',
  'Биг Спешиал Комбо из категории "Комбо" ресторана Вкусно и Точка.',
  940.00,
  '896 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Биг Хит Комбо',
  'Биг Хит Комбо из категории "Комбо" ресторана Вкусно и Точка.',
  520.00,
  '692 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Гранд Комбо',
  'Гранд Комбо из категории "Комбо" ресторана Вкусно и Точка.',
  840.00,
  '641 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Двойной Биг Хит Комбо',
  'Двойной Биг Хит Комбо из категории "Комбо" ресторана Вкусно и Точка.',
  630.00,
  '764 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Комбо с чизкейком',
  'Комбо с чизкейком из категории "Комбо" ресторана Вкусно и Точка.',
  880.00,
  '394 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Комбо с круассаном',
  'Комбо с круассаном из категории "Комбо" ресторана Вкусно и Точка.',
  870.00,
  '480 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Картофель фри',
  'Картофель фри из категории "Снеки" ресторана Вкусно и Точка.',
  150.00,
  '343 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Картофель по-деревенски',
  'Картофель по-деревенски из категории "Снеки" ресторана Вкусно и Точка.',
  310.00,
  '288 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Наггетсы',
  'Наггетсы из категории "Снеки" ресторана Вкусно и Точка.',
  410.00,
  '140 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Стрипсы',
  'Стрипсы из категории "Снеки" ресторана Вкусно и Точка.',
  480.00,
  '159 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Рыбные палочки',
  'Рыбные палочки из категории "Снеки" ресторана Вкусно и Точка.',
  370.00,
  '350 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Салат Цезарь',
  'Салат Цезарь из категории "Снеки" ресторана Вкусно и Точка.',
  240.00,
  '178 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Кола',
  'Кола из категории "Напитки" ресторана Вкусно и Точка.',
  290.00,
  '338 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Фанта',
  'Фанта из категории "Напитки" ресторана Вкусно и Точка.',
  260.00,
  '342 мл',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Спрайт',
  'Спрайт из категории "Напитки" ресторана Вкусно и Точка.',
  220.00,
  '483 мл',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Капучино',
  'Капучино из категории "Напитки" ресторана Вкусно и Точка.',
  180.00,
  '295 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Латте',
  'Латте из категории "Напитки" ресторана Вкусно и Точка.',
  290.00,
  '359 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Чай',
  'Чай из категории "Напитки" ресторана Вкусно и Точка.',
  200.00,
  '336 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Чизкейк',
  'Чизкейк из категории "Десерты" ресторана Вкусно и Точка.',
  270.00,
  '135 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Маффин',
  'Маффин из категории "Десерты" ресторана Вкусно и Точка.',
  260.00,
  '211 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Круассан',
  'Круассан из категории "Десерты" ресторана Вкусно и Точка.',
  390.00,
  '161 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Мороженое',
  'Мороженое из категории "Десерты" ресторана Вкусно и Точка.',
  380.00,
  '217 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Пирожное',
  'Пирожное из категории "Десерты" ресторана Вкусно и Точка.',
  540.00,
  '212 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Тарт шоколадный',
  'Тарт шоколадный из категории "Десерты" ресторана Вкусно и Точка.',
  240.00,
  '160 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Кетчуп',
  'Кетчуп из категории "Соусы" ресторана Вкусно и Точка.',
  70.00,
  '34 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Сырный',
  'Сырный из категории "Соусы" ресторана Вкусно и Точка.',
  120.00,
  '66 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Барбекю',
  'Барбекю из категории "Соусы" ресторана Вкусно и Точка.',
  50.00,
  '56 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Горчичный',
  'Горчичный из категории "Соусы" ресторана Вкусно и Точка.',
  50.00,
  '50 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Терияки',
  'Терияки из категории "Соусы" ресторана Вкусно и Точка.',
  80.00,
  '37 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  1,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 1 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Тар-тар',
  'Тар-тар из категории "Соусы" ресторана Вкусно и Точка.',
  120.00,
  '45 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Воппер',
  'Воппер из категории "Бургеры" ресторана Burger King.',
  350.00,
  '342 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Двойной Воппер',
  'Двойной Воппер из категории "Бургеры" ресторана Burger King.',
  370.00,
  '396 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Биг Кинг',
  'Биг Кинг из категории "Бургеры" ресторана Burger King.',
  430.00,
  '378 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Беконайзер',
  'Беконайзер из категории "Бургеры" ресторана Burger King.',
  290.00,
  '249 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Чеддер Кинг',
  'Чеддер Кинг из категории "Бургеры" ресторана Burger King.',
  530.00,
  '198 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Ангус бургер',
  'Ангус бургер из категории "Бургеры" ресторана Burger King.',
  420.00,
  '346 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Воппер Комбо',
  'Воппер Комбо из категории "Комбо" ресторана Burger King.',
  640.00,
  '570 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Биг Кинг Комбо',
  'Биг Кинг Комбо из категории "Комбо" ресторана Burger King.',
  770.00,
  '539 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Чикен Комбо',
  'Чикен Комбо из категории "Комбо" ресторана Burger King.',
  930.00,
  '817 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Кинг Бокс',
  'Кинг Бокс из категории "Комбо" ресторана Burger King.',
  500.00,
  '720 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Комбо на троих',
  'Комбо на троих из категории "Комбо" ресторана Burger King.',
  920.00,
  '616 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Комбо'
    LIMIT 1
  ),
  'Джуниор Комбо',
  'Джуниор Комбо из категории "Комбо" ресторана Burger King.',
  510.00,
  '551 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Картофель фри',
  'Картофель фри из категории "Снеки" ресторана Burger King.',
  290.00,
  '218 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Наггетсы',
  'Наггетсы из категории "Снеки" ресторана Burger King.',
  510.00,
  '279 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Крылышки',
  'Крылышки из категории "Снеки" ресторана Burger King.',
  260.00,
  '255 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Луковые кольца',
  'Луковые кольца из категории "Снеки" ресторана Burger King.',
  420.00,
  '309 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Креветки',
  'Креветки из категории "Снеки" ресторана Burger King.',
  430.00,
  '280 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Сырные палочки',
  'Сырные палочки из категории "Снеки" ресторана Burger King.',
  420.00,
  '293 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Цезарь ролл',
  'Цезарь ролл из категории "Роллы" ресторана Burger King.',
  900.00,
  '241 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Воппер ролл',
  'Воппер ролл из категории "Роллы" ресторана Burger King.',
  520.00,
  '339 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Шримп ролл',
  'Шримп ролл из категории "Роллы" ресторана Burger King.',
  770.00,
  '224 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Чикен ролл',
  'Чикен ролл из категории "Роллы" ресторана Burger King.',
  360.00,
  '354 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Барбекю ролл',
  'Барбекю ролл из категории "Роллы" ресторана Burger King.',
  410.00,
  '231 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Моцарелла ролл',
  'Моцарелла ролл из категории "Роллы" ресторана Burger King.',
  390.00,
  '331 г',
  '/uploads/menu/california.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Pepsi',
  'Pepsi из категории "Напитки" ресторана Burger King.',
  260.00,
  '423 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  '7UP',
  '7UP из категории "Напитки" ресторана Burger King.',
  180.00,
  '459 мл',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Mirinda',
  'Mirinda из категории "Напитки" ресторана Burger King.',
  240.00,
  '305 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Чай',
  'Чай из категории "Напитки" ресторана Burger King.',
  240.00,
  '377 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Кофе',
  'Кофе из категории "Напитки" ресторана Burger King.',
  160.00,
  '470 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Вода',
  'Вода из категории "Напитки" ресторана Burger King.',
  310.00,
  '495 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Сырный',
  'Сырный из категории "Соусы" ресторана Burger King.',
  60.00,
  '49 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Барбекю',
  'Барбекю из категории "Соусы" ресторана Burger King.',
  100.00,
  '36 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Чесночный',
  'Чесночный из категории "Соусы" ресторана Burger King.',
  130.00,
  '57 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Карри',
  'Карри из категории "Соусы" ресторана Burger King.',
  130.00,
  '36 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Горчичный',
  'Горчичный из категории "Соусы" ресторана Burger King.',
  100.00,
  '35 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  2,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 2 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Терияки',
  'Терияки из категории "Соусы" ресторана Burger King.',
  70.00,
  '44 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Шефбургер',
  'Шефбургер из категории "Бургеры" ресторана Rostic''s.',
  380.00,
  '314 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Шефбургер Де Люкс',
  'Шефбургер Де Люкс из категории "Бургеры" ресторана Rostic''s.',
  350.00,
  '379 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Биг Маэстро',
  'Биг Маэстро из категории "Бургеры" ресторана Rostic''s.',
  540.00,
  '244 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Чикенбургер',
  'Чикенбургер из категории "Бургеры" ресторана Rostic''s.',
  610.00,
  '196 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Лонгер',
  'Лонгер из категории "Бургеры" ресторана Rostic''s.',
  480.00,
  '251 г',
  '/uploads/menu/burger-truffle.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Бургеры'
    LIMIT 1
  ),
  'Чизбургер',
  'Чизбургер из категории "Бургеры" ресторана Rostic''s.',
  460.00,
  '397 г',
  '/uploads/menu/burger-bbq.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Шеф ролл',
  'Шеф ролл из категории "Роллы" ресторана Rostic''s.',
  390.00,
  '245 г',
  '/uploads/menu/california.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Острый ролл',
  'Острый ролл из категории "Роллы" ресторана Rostic''s.',
  880.00,
  '414 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Ай-твистер',
  'Ай-твистер из категории "Роллы" ресторана Rostic''s.',
  930.00,
  '189 г',
  '/uploads/menu/california.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Твистер',
  'Твистер из категории "Роллы" ресторана Rostic''s.',
  480.00,
  '289 г',
  '/uploads/menu/california.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Чикен ролл',
  'Чикен ролл из категории "Роллы" ресторана Rostic''s.',
  820.00,
  '227 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Барбекю ролл',
  'Барбекю ролл из категории "Роллы" ресторана Rostic''s.',
  990.00,
  '417 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Курица'
    LIMIT 1
  ),
  'Крылья',
  'Крылья из категории "Курица" ресторана Rostic''s.',
  390.00,
  '377 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Курица'
    LIMIT 1
  ),
  'Стрипсы',
  'Стрипсы из категории "Курица" ресторана Rostic''s.',
  590.00,
  '307 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Курица'
    LIMIT 1
  ),
  'Байтсы',
  'Байтсы из категории "Курица" ресторана Rostic''s.',
  390.00,
  '374 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Курица'
    LIMIT 1
  ),
  'Ножки',
  'Ножки из категории "Курица" ресторана Rostic''s.',
  600.00,
  '155 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Курица'
    LIMIT 1
  ),
  'Баскет L',
  'Баскет L из категории "Курица" ресторана Rostic''s.',
  220.00,
  '199 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Курица'
    LIMIT 1
  ),
  'Баскет Дуэт',
  'Баскет Дуэт из категории "Курица" ресторана Rostic''s.',
  430.00,
  '347 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Картофель фри',
  'Картофель фри из категории "Снеки" ресторана Rostic''s.',
  200.00,
  '238 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Дольки',
  'Дольки из категории "Снеки" ресторана Rostic''s.',
  160.00,
  '141 г',
  '/uploads/menu/fries.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Наггетсы',
  'Наггетсы из категории "Снеки" ресторана Rostic''s.',
  200.00,
  '117 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Стрипсы',
  'Стрипсы из категории "Снеки" ресторана Rostic''s.',
  440.00,
  '220 г',
  '/uploads/menu/fries.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Крылья',
  'Крылья из категории "Снеки" ресторана Rostic''s.',
  360.00,
  '169 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Снеки'
    LIMIT 1
  ),
  'Сырные закуски',
  'Сырные закуски из категории "Снеки" ресторана Rostic''s.',
  500.00,
  '150 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Cola',
  'Cola из категории "Напитки" ресторана Rostic''s.',
  240.00,
  '487 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Ice Tea',
  'Ice Tea из категории "Напитки" ресторана Rostic''s.',
  150.00,
  '351 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Кофе',
  'Кофе из категории "Напитки" ресторана Rostic''s.',
  290.00,
  '492 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Чай',
  'Чай из категории "Напитки" ресторана Rostic''s.',
  210.00,
  '347 мл',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Лимонад',
  'Лимонад из категории "Напитки" ресторана Rostic''s.',
  230.00,
  '383 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Вода',
  'Вода из категории "Напитки" ресторана Rostic''s.',
  230.00,
  '472 мл',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Сырный',
  'Сырный из категории "Соусы" ресторана Rostic''s.',
  110.00,
  '46 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Барбекю',
  'Барбекю из категории "Соусы" ресторана Rostic''s.',
  140.00,
  '40 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Кисло-сладкий',
  'Кисло-сладкий из категории "Соусы" ресторана Rostic''s.',
  60.00,
  '30 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Чесночный',
  'Чесночный из категории "Соусы" ресторана Rostic''s.',
  130.00,
  '39 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Карри',
  'Карри из категории "Соусы" ресторана Rostic''s.',
  90.00,
  '31 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  3,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 3 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Острый',
  'Острый из категории "Соусы" ресторана Rostic''s.',
  120.00,
  '57 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Филадельфия',
  'Филадельфия из категории "Роллы" ресторана Tanuki.',
  810.00,
  '396 г',
  '/uploads/menu/california.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Калифорния',
  'Калифорния из категории "Роллы" ресторана Tanuki.',
  940.00,
  '225 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Дракон',
  'Дракон из категории "Роллы" ресторана Tanuki.',
  630.00,
  '229 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Аригато',
  'Аригато из категории "Роллы" ресторана Tanuki.',
  760.00,
  '216 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Запеченный краб',
  'Запеченный краб из категории "Роллы" ресторана Tanuki.',
  960.00,
  '322 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Креветка васаби',
  'Креветка васаби из категории "Роллы" ресторана Tanuki.',
  940.00,
  '349 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Лосось',
  'Лосось из категории "Суши" ресторана Tanuki.',
  560.00,
  '363 г',
  '/uploads/menu/california.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Тунец',
  'Тунец из категории "Суши" ресторана Tanuki.',
  900.00,
  '219 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Угорь',
  'Угорь из категории "Суши" ресторана Tanuki.',
  600.00,
  '309 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Креветка',
  'Креветка из категории "Суши" ресторана Tanuki.',
  620.00,
  '205 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Гункан краб',
  'Гункан краб из категории "Суши" ресторана Tanuki.',
  880.00,
  '181 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Гункан тобико',
  'Гункан тобико из категории "Суши" ресторана Tanuki.',
  870.00,
  '353 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Тануки сет',
  'Тануки сет из категории "Сеты" ресторана Tanuki.',
  1750.00,
  '1389 г',
  '/uploads/menu/set-premium.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Филадельфия сет',
  'Филадельфия сет из категории "Сеты" ресторана Tanuki.',
  1560.00,
  '1032 г',
  '/uploads/menu/set-premium.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Калифорния сет',
  'Калифорния сет из категории "Сеты" ресторана Tanuki.',
  1110.00,
  '653 г',
  '/uploads/menu/set-premium.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Запеченный сет',
  'Запеченный сет из категории "Сеты" ресторана Tanuki.',
  2200.00,
  '918 г',
  '/uploads/menu/set-premium.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Премиум сет',
  'Премиум сет из категории "Сеты" ресторана Tanuki.',
  1740.00,
  '1087 г',
  '/uploads/menu/set-premium.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Аригато сет',
  'Аригато сет из категории "Сеты" ресторана Tanuki.',
  2540.00,
  '753 г',
  '/uploads/menu/set-premium.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Мисо',
  'Мисо из категории "Супы" ресторана Tanuki.',
  330.00,
  '394 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Том ям',
  'Том ям из категории "Супы" ресторана Tanuki.',
  510.00,
  '454 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Рамен',
  'Рамен из категории "Супы" ресторана Tanuki.',
  380.00,
  '396 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Удон',
  'Удон из категории "Супы" ресторана Tanuki.',
  430.00,
  '333 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Рис',
  'Рис из категории "Супы" ресторана Tanuki.',
  340.00,
  '308 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Овощной суп',
  'Овощной суп из категории "Супы" ресторана Tanuki.',
  270.00,
  '341 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Эдамамэ',
  'Эдамамэ из категории "Закуски" ресторана Tanuki.',
  170.00,
  '236 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Чука',
  'Чука из категории "Закуски" ресторана Tanuki.',
  170.00,
  '329 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Гедза',
  'Гедза из категории "Закуски" ресторана Tanuki.',
  250.00,
  '293 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Битые огурцы',
  'Битые огурцы из категории "Закуски" ресторана Tanuki.',
  300.00,
  '240 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Салат с курицей',
  'Салат с курицей из категории "Закуски" ресторана Tanuki.',
  260.00,
  '259 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Салат с овощами',
  'Салат с овощами из категории "Закуски" ресторана Tanuki.',
  380.00,
  '329 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Чизкейк',
  'Чизкейк из категории "Десерты" ресторана Tanuki.',
  380.00,
  '182 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Мороженое',
  'Мороженое из категории "Десерты" ресторана Tanuki.',
  400.00,
  '219 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Сладкие роллы',
  'Сладкие роллы из категории "Десерты" ресторана Tanuki.',
  380.00,
  '160 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Десерт Року',
  'Десерт Року из категории "Десерты" ресторана Tanuki.',
  290.00,
  '125 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Фрукты',
  'Фрукты из категории "Десерты" ресторана Tanuki.',
  510.00,
  '160 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  4,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 4 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Пирожные',
  'Пирожные из категории "Десерты" ресторана Tanuki.',
  350.00,
  '159 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Боулы'
    LIMIT 1
  ),
  'Поке с лососем',
  'Поке с лососем из категории "Боулы" ресторана Pinskiy GO.',
  500.00,
  '284 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Боулы'
    LIMIT 1
  ),
  'Поке с тунцом',
  'Поке с тунцом из категории "Боулы" ресторана Pinskiy GO.',
  290.00,
  '269 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Боулы'
    LIMIT 1
  ),
  'Поке с креветками',
  'Поке с креветками из категории "Боулы" ресторана Pinskiy GO.',
  320.00,
  '301 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Боулы'
    LIMIT 1
  ),
  'Боул с курицей',
  'Боул с курицей из категории "Боулы" ресторана Pinskiy GO.',
  250.00,
  '369 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Боулы'
    LIMIT 1
  ),
  'Боул с овощами',
  'Боул с овощами из категории "Боулы" ресторана Pinskiy GO.',
  740.00,
  '363 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Боулы'
    LIMIT 1
  ),
  'Поке с угрем',
  'Поке с угрем из категории "Боулы" ресторана Pinskiy GO.',
  290.00,
  '270 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Греческий',
  'Греческий из категории "Салаты" ресторана Pinskiy GO.',
  270.00,
  '319 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Оливье с лососем',
  'Оливье с лососем из категории "Салаты" ресторана Pinskiy GO.',
  630.00,
  '185 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Зеленый салат',
  'Зеленый салат из категории "Салаты" ресторана Pinskiy GO.',
  360.00,
  '379 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Салат с авокадо',
  'Салат с авокадо из категории "Салаты" ресторана Pinskiy GO.',
  430.00,
  '179 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Салат с курицей',
  'Салат с курицей из категории "Салаты" ресторана Pinskiy GO.',
  620.00,
  '276 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Салат с морепродуктами',
  'Салат с морепродуктами из категории "Салаты" ресторана Pinskiy GO.',
  240.00,
  '323 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Том ям',
  'Том ям из категории "Супы" ресторана Pinskiy GO.',
  350.00,
  '444 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Куриный суп',
  'Куриный суп из категории "Супы" ресторана Pinskiy GO.',
  410.00,
  '380 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Крем-суп грибной',
  'Крем-суп грибной из категории "Супы" ресторана Pinskiy GO.',
  260.00,
  '417 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Овощной суп',
  'Овощной суп из категории "Супы" ресторана Pinskiy GO.',
  350.00,
  '437 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Мисо',
  'Мисо из категории "Супы" ресторана Pinskiy GO.',
  280.00,
  '336 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Рыбный суп',
  'Рыбный суп из категории "Супы" ресторана Pinskiy GO.',
  360.00,
  '340 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Паста карбонара',
  'Паста карбонара из категории "Горячее" ресторана Pinskiy GO.',
  980.00,
  '401 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Паста с морепродуктами',
  'Паста с морепродуктами из категории "Горячее" ресторана Pinskiy GO.',
  360.00,
  '288 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Рис с курицей',
  'Рис с курицей из категории "Горячее" ресторана Pinskiy GO.',
  790.00,
  '289 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Лапша с креветками',
  'Лапша с креветками из категории "Горячее" ресторана Pinskiy GO.',
  990.00,
  '318 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Лапша с курицей',
  'Лапша с курицей из категории "Горячее" ресторана Pinskiy GO.',
  560.00,
  '330 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Рис с овощами',
  'Рис с овощами из категории "Горячее" ресторана Pinskiy GO.',
  670.00,
  '517 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Брускетты',
  'Брускетты из категории "Закуски" ресторана Pinskiy GO.',
  340.00,
  '275 г',
  '/uploads/menu/fries.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Тартар из лосося',
  'Тартар из лосося из категории "Закуски" ресторана Pinskiy GO.',
  460.00,
  '236 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Карпаччо',
  'Карпаччо из категории "Закуски" ресторана Pinskiy GO.',
  490.00,
  '105 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Сырные закуски',
  'Сырные закуски из категории "Закуски" ресторана Pinskiy GO.',
  380.00,
  '201 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Морепродукты',
  'Морепродукты из категории "Закуски" ресторана Pinskiy GO.',
  420.00,
  '213 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Ассорти закусок',
  'Ассорти закусок из категории "Закуски" ресторана Pinskiy GO.',
  270.00,
  '358 мл',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Чизкейк',
  'Чизкейк из категории "Десерты" ресторана Pinskiy GO.',
  460.00,
  '179 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Эклер',
  'Эклер из категории "Десерты" ресторана Pinskiy GO.',
  230.00,
  '186 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Шоколадный десерт',
  'Шоколадный десерт из категории "Десерты" ресторана Pinskiy GO.',
  240.00,
  '211 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Кекс',
  'Кекс из категории "Десерты" ресторана Pinskiy GO.',
  230.00,
  '220 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Мусс',
  'Мусс из категории "Десерты" ресторана Pinskiy GO.',
  400.00,
  '159 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  5,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 5 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Фруктовый десерт',
  'Фруктовый десерт из категории "Десерты" ресторана Pinskiy GO.',
  440.00,
  '220 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Филадельфия',
  'Филадельфия из категории "Роллы" ресторана Якитория.',
  940.00,
  '395 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Калифорния',
  'Калифорния из категории "Роллы" ресторана Якитория.',
  430.00,
  '341 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Драгон',
  'Драгон из категории "Роллы" ресторана Якитория.',
  620.00,
  '230 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Киото',
  'Киото из категории "Роллы" ресторана Якитория.',
  640.00,
  '279 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Бали',
  'Бали из категории "Роллы" ресторана Якитория.',
  570.00,
  '364 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Роллы'
    LIMIT 1
  ),
  'Ниндзя',
  'Ниндзя из категории "Роллы" ресторана Якитория.',
  350.00,
  '234 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Лосось',
  'Лосось из категории "Суши" ресторана Якитория.',
  830.00,
  '211 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Тунец',
  'Тунец из категории "Суши" ресторана Якитория.',
  710.00,
  '328 г',
  '/uploads/menu/philadelphia.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Угорь',
  'Угорь из категории "Суши" ресторана Якитория.',
  450.00,
  '176 г',
  '/uploads/menu/california.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Креветка',
  'Креветка из категории "Суши" ресторана Якитория.',
  860.00,
  '261 г',
  '/uploads/menu/california.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Гункан краб',
  'Гункан краб из категории "Суши" ресторана Якитория.',
  580.00,
  '317 г',
  '/uploads/menu/philadelphia.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Суши'
    LIMIT 1
  ),
  'Гункан спайси',
  'Гункан спайси из категории "Суши" ресторана Якитория.',
  660.00,
  '298 г',
  '/uploads/menu/california.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Филадельфия',
  'Филадельфия из категории "Сеты" ресторана Якитория.',
  1560.00,
  '1030 г',
  '/uploads/menu/set-premium.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Калифорния',
  'Калифорния из категории "Сеты" ресторана Якитория.',
  2400.00,
  '1114 г',
  '/uploads/menu/set-premium.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Драгон',
  'Драгон из категории "Сеты" ресторана Якитория.',
  2250.00,
  '1356 г',
  '/uploads/menu/set-premium.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Киото',
  'Киото из категории "Сеты" ресторана Якитория.',
  2190.00,
  '952 г',
  '/uploads/menu/set-premium.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Тайга',
  'Тайга из категории "Сеты" ресторана Якитория.',
  1450.00,
  '979 г',
  '/uploads/menu/set-premium.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Сеты'
    LIMIT 1
  ),
  'Премиум',
  'Премиум из категории "Сеты" ресторана Якитория.',
  2050.00,
  '841 г',
  '/uploads/menu/set-premium.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Мисо',
  'Мисо из категории "Супы" ресторана Якитория.',
  250.00,
  '355 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Том ям',
  'Том ям из категории "Супы" ресторана Якитория.',
  360.00,
  '449 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Рамен',
  'Рамен из категории "Супы" ресторана Якитория.',
  370.00,
  '388 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Куриный',
  'Куриный из категории "Супы" ресторана Якитория.',
  250.00,
  '302 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Морепродукты',
  'Морепродукты из категории "Супы" ресторана Якитория.',
  280.00,
  '389 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Овощной',
  'Овощной из категории "Супы" ресторана Якитория.',
  390.00,
  '400 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Удон с курицей',
  'Удон с курицей из категории "Горячее" ресторана Якитория.',
  530.00,
  '337 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Рис с овощами',
  'Рис с овощами из категории "Горячее" ресторана Якитория.',
  620.00,
  '517 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Терияки',
  'Терияки из категории "Горячее" ресторана Якитория.',
  470.00,
  '409 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Лосось',
  'Лосось из категории "Горячее" ресторана Якитория.',
  590.00,
  '381 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Вок',
  'Вок из категории "Горячее" ресторана Якитория.',
  760.00,
  '351 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Креветки',
  'Креветки из категории "Горячее" ресторана Якитория.',
  880.00,
  '427 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Соевый',
  'Соевый из категории "Соусы" ресторана Якитория.',
  90.00,
  '65 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Терияки',
  'Терияки из категории "Соусы" ресторана Якитория.',
  100.00,
  '40 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Спайси',
  'Спайси из категории "Соусы" ресторана Якитория.',
  130.00,
  '61 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Унаги',
  'Унаги из категории "Соусы" ресторана Якитория.',
  80.00,
  '37 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Ореховый',
  'Ореховый из категории "Соусы" ресторана Якитория.',
  70.00,
  '57 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  6,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 6 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Васаби',
  'Васаби из категории "Соусы" ресторана Якитория.',
  90.00,
  '52 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Пепперони',
  'Пепперони из категории "Пицца" ресторана Dodo Pizza.',
  940.00,
  '658 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Маргарита',
  'Маргарита из категории "Пицца" ресторана Dodo Pizza.',
  930.00,
  '528 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Четыре сыра',
  'Четыре сыра из категории "Пицца" ресторана Dodo Pizza.',
  800.00,
  '568 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Гавайская',
  'Гавайская из категории "Пицца" ресторана Dodo Pizza.',
  830.00,
  '676 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Мексиканская',
  'Мексиканская из категории "Пицца" ресторана Dodo Pizza.',
  1050.00,
  '513 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Чизбургер',
  'Чизбургер из категории "Пицца" ресторана Dodo Pizza.',
  890.00,
  '574 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Картофель',
  'Картофель из категории "Закуски" ресторана Dodo Pizza.',
  490.00,
  '316 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Крылья',
  'Крылья из категории "Закуски" ресторана Dodo Pizza.',
  170.00,
  '146 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Наггетсы',
  'Наггетсы из категории "Закуски" ресторана Dodo Pizza.',
  220.00,
  '134 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Сырные палочки',
  'Сырные палочки из категории "Закуски" ресторана Dodo Pizza.',
  340.00,
  '278 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Хашбрауны',
  'Хашбрауны из категории "Закуски" ресторана Dodo Pizza.',
  490.00,
  '344 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Чесночный хлеб',
  'Чесночный хлеб из категории "Закуски" ресторана Dodo Pizza.',
  520.00,
  '231 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Додстеры'
    LIMIT 1
  ),
  'С курицей',
  'С курицей из категории "Додстеры" ресторана Dodo Pizza.',
  420.00,
  '198 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Додстеры'
    LIMIT 1
  ),
  'Острый',
  'Острый из категории "Додстеры" ресторана Dodo Pizza.',
  300.00,
  '119 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Додстеры'
    LIMIT 1
  ),
  'Барбекю',
  'Барбекю из категории "Додстеры" ресторана Dodo Pizza.',
  170.00,
  '249 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Додстеры'
    LIMIT 1
  ),
  'С сыром',
  'С сыром из категории "Додстеры" ресторана Dodo Pizza.',
  380.00,
  '226 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Додстеры'
    LIMIT 1
  ),
  'С ветчиной',
  'С ветчиной из категории "Додстеры" ресторана Dodo Pizza.',
  420.00,
  '306 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Додстеры'
    LIMIT 1
  ),
  'Мини',
  'Мини из категории "Додстеры" ресторана Dodo Pizza.',
  390.00,
  '323 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Синнабон',
  'Синнабон из категории "Десерты" ресторана Dodo Pizza.',
  440.00,
  '188 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Маффин',
  'Маффин из категории "Десерты" ресторана Dodo Pizza.',
  550.00,
  '180 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Чизкейк',
  'Чизкейк из категории "Десерты" ресторана Dodo Pizza.',
  320.00,
  '176 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Печенье',
  'Печенье из категории "Десерты" ресторана Dodo Pizza.',
  520.00,
  '121 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Шоколад',
  'Шоколад из категории "Десерты" ресторана Dodo Pizza.',
  240.00,
  '149 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Роллы сладкие',
  'Роллы сладкие из категории "Десерты" ресторана Dodo Pizza.',
  330.00,
  '153 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Coca-Cola',
  'Coca-Cola из категории "Напитки" ресторана Dodo Pizza.',
  130.00,
  '431 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Fanta',
  'Fanta из категории "Напитки" ресторана Dodo Pizza.',
  320.00,
  '497 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Sprite',
  'Sprite из категории "Напитки" ресторана Dodo Pizza.',
  300.00,
  '255 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Соки',
  'Соки из категории "Напитки" ресторана Dodo Pizza.',
  310.00,
  '303 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Кофе',
  'Кофе из категории "Напитки" ресторана Dodo Pizza.',
  220.00,
  '303 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  7,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 7 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Чай',
  'Чай из категории "Напитки" ресторана Dodo Pizza.',
  120.00,
  '256 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Маргарита',
  'Маргарита из категории "Пицца" ресторана Pizza City.',
  530.00,
  '673 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Пепперони',
  'Пепперони из категории "Пицца" ресторана Pizza City.',
  590.00,
  '441 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Гавайская',
  'Гавайская из категории "Пицца" ресторана Pizza City.',
  860.00,
  '525 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Четыре сыра',
  'Четыре сыра из категории "Пицца" ресторана Pizza City.',
  910.00,
  '543 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'BBQ',
  'BBQ из категории "Пицца" ресторана Pizza City.',
  1090.00,
  '616 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Мясная',
  'Мясная из категории "Пицца" ресторана Pizza City.',
  800.00,
  '447 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Картофель фри',
  'Картофель фри из категории "Закуски" ресторана Pizza City.',
  270.00,
  '163 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Крылья',
  'Крылья из категории "Закуски" ресторана Pizza City.',
  440.00,
  '190 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Сырные палочки',
  'Сырные палочки из категории "Закуски" ресторана Pizza City.',
  350.00,
  '337 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Чесночный хлеб',
  'Чесночный хлеб из категории "Закуски" ресторана Pizza City.',
  510.00,
  '315 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Луковые кольца',
  'Луковые кольца из категории "Закуски" ресторана Pizza City.',
  250.00,
  '243 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Наггетсы',
  'Наггетсы из категории "Закуски" ресторана Pizza City.',
  400.00,
  '215 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Греческий',
  'Греческий из категории "Салаты" ресторана Pizza City.',
  200.00,
  '251 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Овощной',
  'Овощной из категории "Салаты" ресторана Pizza City.',
  280.00,
  '300 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С курицей',
  'С курицей из категории "Салаты" ресторана Pizza City.',
  390.00,
  '241 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С тунцом',
  'С тунцом из категории "Салаты" ресторана Pizza City.',
  460.00,
  '310 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Зеленый',
  'Зеленый из категории "Салаты" ресторана Pizza City.',
  670.00,
  '192 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С сыром',
  'С сыром из категории "Салаты" ресторана Pizza City.',
  330.00,
  '179 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Бургер',
  'Бургер из категории "Горячее" ресторана Pizza City.',
  530.00,
  '451 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Донер',
  'Донер из категории "Горячее" ресторана Pizza City.',
  770.00,
  '516 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Кебаб',
  'Кебаб из категории "Горячее" ресторана Pizza City.',
  830.00,
  '421 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Паста',
  'Паста из категории "Горячее" ресторана Pizza City.',
  820.00,
  '264 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Мясные блюда',
  'Мясные блюда из категории "Горячее" ресторана Pizza City.',
  840.00,
  '345 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Курица',
  'Курица из категории "Горячее" ресторана Pizza City.',
  490.00,
  '328 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Чизкейк',
  'Чизкейк из категории "Десерты" ресторана Pizza City.',
  330.00,
  '183 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Донат',
  'Донат из категории "Десерты" ресторана Pizza City.',
  460.00,
  '126 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Торт',
  'Торт из категории "Десерты" ресторана Pizza City.',
  530.00,
  '168 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Мороженое',
  'Мороженое из категории "Десерты" ресторана Pizza City.',
  480.00,
  '179 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Пирожные',
  'Пирожные из категории "Десерты" ресторана Pizza City.',
  500.00,
  '145 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Шоколадный десерт',
  'Шоколадный десерт из категории "Десерты" ресторана Pizza City.',
  420.00,
  '100 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Coca-Cola',
  'Coca-Cola из категории "Напитки" ресторана Pizza City.',
  170.00,
  '499 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Pepsi',
  'Pepsi из категории "Напитки" ресторана Pizza City.',
  220.00,
  '273 мл',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  '7UP',
  '7UP из категории "Напитки" ресторана Pizza City.',
  310.00,
  '303 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Соки',
  'Соки из категории "Напитки" ресторана Pizza City.',
  140.00,
  '272 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Вода',
  'Вода из категории "Напитки" ресторана Pizza City.',
  230.00,
  '319 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  8,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 8 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Энергетики',
  'Энергетики из категории "Напитки" ресторана Pizza City.',
  250.00,
  '279 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Пепперони',
  'Пепперони из категории "Пицца" ресторана Domino Pizza.',
  920.00,
  '424 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Маргарита',
  'Маргарита из категории "Пицца" ресторана Domino Pizza.',
  950.00,
  '475 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'BBQ Chicken',
  'BBQ Chicken из категории "Пицца" ресторана Domino Pizza.',
  960.00,
  '451 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Четыре сыра',
  'Четыре сыра из категории "Пицца" ресторана Domino Pizza.',
  600.00,
  '456 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Ветчина грибы',
  'Ветчина грибы из категории "Пицца" ресторана Domino Pizza.',
  810.00,
  '567 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Мясная',
  'Мясная из категории "Пицца" ресторана Domino Pizza.',
  550.00,
  '485 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Крылья',
  'Крылья из категории "Закуски" ресторана Domino Pizza.',
  290.00,
  '332 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Стрипсы',
  'Стрипсы из категории "Закуски" ресторана Domino Pizza.',
  180.00,
  '209 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Картофель дольки',
  'Картофель дольки из категории "Закуски" ресторана Domino Pizza.',
  210.00,
  '316 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Чесночный хлеб',
  'Чесночный хлеб из категории "Закуски" ресторана Domino Pizza.',
  330.00,
  '210 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Сырные палочки',
  'Сырные палочки из категории "Закуски" ресторана Domino Pizza.',
  210.00,
  '244 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Куриные кусочки',
  'Куриные кусочки из категории "Закуски" ресторана Domino Pizza.',
  340.00,
  '327 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Карбонара',
  'Карбонара из категории "Паста" ресторана Domino Pizza.',
  550.00,
  '274 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Болоньезе',
  'Болоньезе из категории "Паста" ресторана Domino Pizza.',
  650.00,
  '248 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'С курицей',
  'С курицей из категории "Паста" ресторана Domino Pizza.',
  640.00,
  '349 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'С сыром',
  'С сыром из категории "Паста" ресторана Domino Pizza.',
  900.00,
  '499 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Сэндвичи',
  'Сэндвичи из категории "Паста" ресторана Domino Pizza.',
  800.00,
  '347 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Горячие блюда',
  'Горячие блюда из категории "Паста" ресторана Domino Pizza.',
  590.00,
  '298 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Брауни',
  'Брауни из категории "Десерты" ресторана Domino Pizza.',
  500.00,
  '196 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Чизкейк',
  'Чизкейк из категории "Десерты" ресторана Domino Pizza.',
  500.00,
  '133 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Печенье',
  'Печенье из категории "Десерты" ресторана Domino Pizza.',
  470.00,
  '133 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Лава кейк',
  'Лава кейк из категории "Десерты" ресторана Domino Pizza.',
  490.00,
  '91 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Булочки',
  'Булочки из категории "Десерты" ресторана Domino Pizza.',
  520.00,
  '181 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Шоколадный десерт',
  'Шоколадный десерт из категории "Десерты" ресторана Domino Pizza.',
  230.00,
  '196 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Coca-Cola',
  'Coca-Cola из категории "Напитки" ресторана Domino Pizza.',
  130.00,
  '257 мл',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Fanta',
  'Fanta из категории "Напитки" ресторана Domino Pizza.',
  240.00,
  '399 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Sprite',
  'Sprite из категории "Напитки" ресторана Domino Pizza.',
  310.00,
  '353 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Соки',
  'Соки из категории "Напитки" ресторана Domino Pizza.',
  200.00,
  '435 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Вода',
  'Вода из категории "Напитки" ресторана Domino Pizza.',
  320.00,
  '392 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Чай',
  'Чай из категории "Напитки" ресторана Domino Pizza.',
  170.00,
  '496 мл',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Барбекю',
  'Барбекю из категории "Соусы" ресторана Domino Pizza.',
  60.00,
  '41 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Сырный',
  'Сырный из категории "Соусы" ресторана Domino Pizza.',
  120.00,
  '68 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Чесночный',
  'Чесночный из категории "Соусы" ресторана Domino Pizza.',
  90.00,
  '63 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Острый',
  'Острый из категории "Соусы" ресторана Domino Pizza.',
  60.00,
  '61 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Томатный',
  'Томатный из категории "Соусы" ресторана Domino Pizza.',
  60.00,
  '46 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  9,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 9 AND mc.name = 'Соусы'
    LIMIT 1
  ),
  'Кисло-сладкий',
  'Кисло-сладкий из категории "Соусы" ресторана Domino Pizza.',
  80.00,
  '45 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Трайфлы'
    LIMIT 1
  ),
  'Ван Лав',
  'Ван Лав из категории "Трайфлы" ресторана One Love.',
  320.00,
  '203 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Трайфлы'
    LIMIT 1
  ),
  'Сникерлав',
  'Сникерлав из категории "Трайфлы" ресторана One Love.',
  370.00,
  '285 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Трайфлы'
    LIMIT 1
  ),
  'Клубника банан',
  'Клубника банан из категории "Трайфлы" ресторана One Love.',
  580.00,
  '332 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Трайфлы'
    LIMIT 1
  ),
  'Шоколад',
  'Шоколад из категории "Трайфлы" ресторана One Love.',
  230.00,
  '283 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Трайфлы'
    LIMIT 1
  ),
  'Карамель',
  'Карамель из категории "Трайфлы" ресторана One Love.',
  280.00,
  '196 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Трайфлы'
    LIMIT 1
  ),
  'Ягоды',
  'Ягоды из категории "Трайфлы" ресторана One Love.',
  630.00,
  '187 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Шоколад'
    LIMIT 1
  ),
  'Клубника',
  'Клубника из категории "Шоколад" ресторана One Love.',
  460.00,
  '159 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Шоколад'
    LIMIT 1
  ),
  'Банан',
  'Банан из категории "Шоколад" ресторана One Love.',
  540.00,
  '183 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Шоколад'
    LIMIT 1
  ),
  'Ягоды',
  'Ягоды из категории "Шоколад" ресторана One Love.',
  200.00,
  '117 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Шоколад'
    LIMIT 1
  ),
  'Ассорти',
  'Ассорти из категории "Шоколад" ресторана One Love.',
  370.00,
  '191 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Шоколад'
    LIMIT 1
  ),
  'Белый шоколад',
  'Белый шоколад из категории "Шоколад" ресторана One Love.',
  310.00,
  '188 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Шоколад'
    LIMIT 1
  ),
  'Фрукты',
  'Фрукты из категории "Шоколад" ресторана One Love.',
  270.00,
  '169 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Эклеры'
    LIMIT 1
  ),
  'Ваниль',
  'Ваниль из категории "Эклеры" ресторана One Love.',
  390.00,
  '199 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Эклеры'
    LIMIT 1
  ),
  'Шоколад',
  'Шоколад из категории "Эклеры" ресторана One Love.',
  490.00,
  '186 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Эклеры'
    LIMIT 1
  ),
  'Карамель',
  'Карамель из категории "Эклеры" ресторана One Love.',
  360.00,
  '90 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Эклеры'
    LIMIT 1
  ),
  'Клубника',
  'Клубника из категории "Эклеры" ресторана One Love.',
  330.00,
  '187 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Эклеры'
    LIMIT 1
  ),
  'Манго',
  'Манго из категории "Эклеры" ресторана One Love.',
  380.00,
  '119 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Эклеры'
    LIMIT 1
  ),
  'Классика',
  'Классика из категории "Эклеры" ресторана One Love.',
  310.00,
  '105 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Бенто',
  'Бенто из категории "Торты" ресторана One Love.',
  270.00,
  '140 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Шоколадный',
  'Шоколадный из категории "Торты" ресторана One Love.',
  380.00,
  '219 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Ягодный',
  'Ягодный из категории "Торты" ресторана One Love.',
  270.00,
  '133 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Мини',
  'Мини из категории "Торты" ресторана One Love.',
  350.00,
  '112 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Кремовый',
  'Кремовый из категории "Торты" ресторана One Love.',
  500.00,
  '169 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  10,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 10 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Авторский',
  'Авторский из категории "Торты" ресторана One Love.',
  530.00,
  '172 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Прага',
  'Прага из категории "Десерты" ресторана 11/47 Bakery.',
  520.00,
  '202 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Птичье молоко',
  'Птичье молоко из категории "Десерты" ресторана 11/47 Bakery.',
  330.00,
  '216 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Три шоколада',
  'Три шоколада из категории "Десерты" ресторана 11/47 Bakery.',
  340.00,
  '115 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Эклер',
  'Эклер из категории "Десерты" ресторана 11/47 Bakery.',
  210.00,
  '103 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Чизкейк',
  'Чизкейк из категории "Десерты" ресторана 11/47 Bakery.',
  540.00,
  '196 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Сочник',
  'Сочник из категории "Десерты" ресторана 11/47 Bakery.',
  480.00,
  '129 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Круассаны'
    LIMIT 1
  ),
  'Классический',
  'Классический из категории "Круассаны" ресторана 11/47 Bakery.',
  230.00,
  '213 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Круассаны'
    LIMIT 1
  ),
  'С шоколадом',
  'С шоколадом из категории "Круассаны" ресторана 11/47 Bakery.',
  430.00,
  '165 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Круассаны'
    LIMIT 1
  ),
  'С малиной',
  'С малиной из категории "Круассаны" ресторана 11/47 Bakery.',
  210.00,
  '105 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Круассаны'
    LIMIT 1
  ),
  'С карамелью',
  'С карамелью из категории "Круассаны" ресторана 11/47 Bakery.',
  200.00,
  '219 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Круассаны'
    LIMIT 1
  ),
  'С орехами',
  'С орехами из категории "Круассаны" ресторана 11/47 Bakery.',
  230.00,
  '143 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Круассаны'
    LIMIT 1
  ),
  'С кремом',
  'С кремом из категории "Круассаны" ресторана 11/47 Bakery.',
  300.00,
  '90 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Сырники',
  'Сырники из категории "Завтраки" ресторана 11/47 Bakery.',
  560.00,
  '281 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Каша',
  'Каша из категории "Завтраки" ресторана 11/47 Bakery.',
  240.00,
  '159 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Омлет',
  'Омлет из категории "Завтраки" ресторана 11/47 Bakery.',
  570.00,
  '285 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Яичница',
  'Яичница из категории "Завтраки" ресторана 11/47 Bakery.',
  690.00,
  '180 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Бриошь',
  'Бриошь из категории "Завтраки" ресторана 11/47 Bakery.',
  530.00,
  '352 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Яйцо пашот',
  'Яйцо пашот из категории "Завтраки" ресторана 11/47 Bakery.',
  530.00,
  '220 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Сэндвичи'
    LIMIT 1
  ),
  'С беконом',
  'С беконом из категории "Сэндвичи" ресторана 11/47 Bakery.',
  630.00,
  '317 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Сэндвичи'
    LIMIT 1
  ),
  'С лососем',
  'С лососем из категории "Сэндвичи" ресторана 11/47 Bakery.',
  660.00,
  '151 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Сэндвичи'
    LIMIT 1
  ),
  'С говядиной',
  'С говядиной из категории "Сэндвичи" ресторана 11/47 Bakery.',
  710.00,
  '161 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Сэндвичи'
    LIMIT 1
  ),
  'Клаб-сэндвич',
  'Клаб-сэндвич из категории "Сэндвичи" ресторана 11/47 Bakery.',
  730.00,
  '380 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Сэндвичи'
    LIMIT 1
  ),
  'С пастрами',
  'С пастрами из категории "Сэндвичи" ресторана 11/47 Bakery.',
  300.00,
  '377 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  11,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 11 AND mc.name = 'Сэндвичи'
    LIMIT 1
  ),
  'С индейкой',
  'С индейкой из категории "Сэндвичи" ресторана 11/47 Bakery.',
  210.00,
  '195 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Наполеон'
    LIMIT 1
  ),
  'Классический',
  'Классический из категории "Наполеон" ресторана Special Napoleon.',
  580.00,
  '236 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Наполеон'
    LIMIT 1
  ),
  'С клубникой',
  'С клубникой из категории "Наполеон" ресторана Special Napoleon.',
  440.00,
  '228 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Наполеон'
    LIMIT 1
  ),
  'С малиной',
  'С малиной из категории "Наполеон" ресторана Special Napoleon.',
  440.00,
  '293 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Наполеон'
    LIMIT 1
  ),
  'С ягодами',
  'С ягодами из категории "Наполеон" ресторана Special Napoleon.',
  240.00,
  '159 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Наполеон'
    LIMIT 1
  ),
  'Маленький',
  'Маленький из категории "Наполеон" ресторана Special Napoleon.',
  370.00,
  '222 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Наполеон'
    LIMIT 1
  ),
  'Большой',
  'Большой из категории "Наполеон" ресторана Special Napoleon.',
  750.00,
  '267 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Медовик'
    LIMIT 1
  ),
  'Классический',
  'Классический из категории "Медовик" ресторана Special Napoleon.',
  510.00,
  '291 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Медовик'
    LIMIT 1
  ),
  'Со сгущенкой',
  'Со сгущенкой из категории "Медовик" ресторана Special Napoleon.',
  290.00,
  '376 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Медовик'
    LIMIT 1
  ),
  'С ягодами',
  'С ягодами из категории "Медовик" ресторана Special Napoleon.',
  620.00,
  '303 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Медовик'
    LIMIT 1
  ),
  'С клубникой',
  'С клубникой из категории "Медовик" ресторана Special Napoleon.',
  490.00,
  '345 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Медовик'
    LIMIT 1
  ),
  'Сметанный',
  'Сметанный из категории "Медовик" ресторана Special Napoleon.',
  640.00,
  '358 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Медовик'
    LIMIT 1
  ),
  'Порционный',
  'Порционный из категории "Медовик" ресторана Special Napoleon.',
  550.00,
  '336 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Прага',
  'Прага из категории "Торты" ресторана Special Napoleon.',
  360.00,
  '135 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Эстерхази',
  'Эстерхази из категории "Торты" ресторана Special Napoleon.',
  490.00,
  '97 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Опера',
  'Опера из категории "Торты" ресторана Special Napoleon.',
  310.00,
  '116 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Трио',
  'Трио из категории "Торты" ресторана Special Napoleon.',
  550.00,
  '103 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Четыре вкуса',
  'Четыре вкуса из категории "Торты" ресторана Special Napoleon.',
  350.00,
  '215 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Торты'
    LIMIT 1
  ),
  'Комбинированный',
  'Комбинированный из категории "Торты" ресторана Special Napoleon.',
  420.00,
  '194 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Картошка',
  'Картошка из категории "Десерты" ресторана Special Napoleon.',
  540.00,
  '206 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Меренговый рулет',
  'Меренговый рулет из категории "Десерты" ресторана Special Napoleon.',
  430.00,
  '212 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Трубочка',
  'Трубочка из категории "Десерты" ресторана Special Napoleon.',
  490.00,
  '152 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Эклер',
  'Эклер из категории "Десерты" ресторана Special Napoleon.',
  540.00,
  '199 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Пирожное',
  'Пирожное из категории "Десерты" ресторана Special Napoleon.',
  410.00,
  '161 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  12,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 12 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Ассорти',
  'Ассорти из категории "Десерты" ресторана Special Napoleon.',
  450.00,
  '213 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Гравлакс',
  'Гравлакс из категории "Закуски" ресторана Культура Встречи.',
  310.00,
  '115 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Тартар',
  'Тартар из категории "Закуски" ресторана Культура Встречи.',
  240.00,
  '118 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Овощной салат',
  'Овощной салат из категории "Закуски" ресторана Культура Встречи.',
  240.00,
  '102 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Салат с сыром',
  'Салат с сыром из категории "Закуски" ресторана Культура Встречи.',
  320.00,
  '310 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Салат с зеленью',
  'Салат с зеленью из категории "Закуски" ресторана Культура Встречи.',
  450.00,
  '165 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Рыбные закуски',
  'Рыбные закуски из категории "Закуски" ресторана Культура Встречи.',
  380.00,
  '243 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Борщ',
  'Борщ из категории "Супы" ресторана Культура Встречи.',
  440.00,
  '291 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Рыбный суп',
  'Рыбный суп из категории "Супы" ресторана Культура Встречи.',
  480.00,
  '325 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Куриный бульон',
  'Куриный бульон из категории "Супы" ресторана Культура Встречи.',
  450.00,
  '314 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Грибной суп',
  'Грибной суп из категории "Супы" ресторана Культура Встречи.',
  450.00,
  '394 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Овощной суп',
  'Овощной суп из категории "Супы" ресторана Культура Встречи.',
  260.00,
  '282 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Суп дня',
  'Суп дня из категории "Супы" ресторана Культура Встречи.',
  440.00,
  '281 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Голубцы',
  'Голубцы из категории "Горячее" ресторана Культура Встречи.',
  870.00,
  '270 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Вареники',
  'Вареники из категории "Горячее" ресторана Культура Встречи.',
  700.00,
  '338 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Пельмени',
  'Пельмени из категории "Горячее" ресторана Культура Встречи.',
  770.00,
  '395 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Блюда из мяса',
  'Блюда из мяса из категории "Горячее" ресторана Культура Встречи.',
  450.00,
  '227 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Блюда из рыбы',
  'Блюда из рыбы из категории "Горячее" ресторана Культура Встречи.',
  810.00,
  '488 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Тушеные блюда',
  'Тушеные блюда из категории "Горячее" ресторана Культура Встречи.',
  900.00,
  '353 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Медовик',
  'Медовик из категории "Десерты" ресторана Культура Встречи.',
  350.00,
  '210 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Творожный десерт',
  'Творожный десерт из категории "Десерты" ресторана Культура Встречи.',
  440.00,
  '174 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Конфеты',
  'Конфеты из категории "Десерты" ресторана Культура Встречи.',
  350.00,
  '111 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Пирожные',
  'Пирожные из категории "Десерты" ресторана Культура Встречи.',
  440.00,
  '187 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Авторские десерты',
  'Авторские десерты из категории "Десерты" ресторана Культура Встречи.',
  280.00,
  '175 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  16,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 16 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Русские сладости',
  'Русские сладости из категории "Десерты" ресторана Культура Встречи.',
  500.00,
  '97 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Яйца Бенедикт',
  'Яйца Бенедикт из категории "Завтраки" ресторана Кофемания.',
  300.00,
  '215 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Омлет',
  'Омлет из категории "Завтраки" ресторана Кофемания.',
  640.00,
  '293 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Яичница',
  'Яичница из категории "Завтраки" ресторана Кофемания.',
  330.00,
  '178 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Сырники',
  'Сырники из категории "Завтраки" ресторана Кофемания.',
  350.00,
  '172 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Каша',
  'Каша из категории "Завтраки" ресторана Кофемания.',
  390.00,
  '275 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Завтраки'
    LIMIT 1
  ),
  'Блины',
  'Блины из категории "Завтраки" ресторана Кофемания.',
  660.00,
  '314 г',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Оливье',
  'Оливье из категории "Салаты" ресторана Кофемания.',
  640.00,
  '257 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С крабом',
  'С крабом из категории "Салаты" ресторана Кофемания.',
  520.00,
  '304 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С авокадо',
  'С авокадо из категории "Салаты" ресторана Кофемания.',
  440.00,
  '354 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Зеленый салат',
  'Зеленый салат из категории "Салаты" ресторана Кофемания.',
  710.00,
  '164 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Буррата',
  'Буррата из категории "Салаты" ресторана Кофемания.',
  350.00,
  '231 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Хумус',
  'Хумус из категории "Салаты" ресторана Кофемания.',
  210.00,
  '229 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Борщ',
  'Борщ из категории "Супы" ресторана Кофемания.',
  420.00,
  '440 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Окрошка',
  'Окрошка из категории "Супы" ресторана Кофемания.',
  310.00,
  '401 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Грибной суп',
  'Грибной суп из категории "Супы" ресторана Кофемания.',
  260.00,
  '365 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Куриный бульон',
  'Куриный бульон из категории "Супы" ресторана Кофемания.',
  400.00,
  '457 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Томатный суп',
  'Томатный суп из категории "Супы" ресторана Кофемания.',
  330.00,
  '408 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Щавелевый',
  'Щавелевый из категории "Супы" ресторана Кофемания.',
  450.00,
  '300 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Бефстроганов',
  'Бефстроганов из категории "Горячее" ресторана Кофемания.',
  840.00,
  '286 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Котлеты',
  'Котлеты из категории "Горячее" ресторана Кофемания.',
  340.00,
  '296 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Индейка',
  'Индейка из категории "Горячее" ресторана Кофемания.',
  780.00,
  '256 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Рыба',
  'Рыба из категории "Горячее" ресторана Кофемания.',
  530.00,
  '376 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Бургер',
  'Бургер из категории "Горячее" ресторана Кофемания.',
  450.00,
  '460 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Драники',
  'Драники из категории "Горячее" ресторана Кофемания.',
  700.00,
  '461 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Чизкейк',
  'Чизкейк из категории "Десерты" ресторана Кофемания.',
  500.00,
  '202 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Эклер',
  'Эклер из категории "Десерты" ресторана Кофемания.',
  290.00,
  '126 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Штрудель',
  'Штрудель из категории "Десерты" ресторана Кофемания.',
  490.00,
  '125 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Панна котта',
  'Панна котта из категории "Десерты" ресторана Кофемания.',
  280.00,
  '144 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Вареники',
  'Вареники из категории "Десерты" ресторана Кофемания.',
  230.00,
  '156 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Пироги',
  'Пироги из категории "Десерты" ресторана Кофемания.',
  430.00,
  '136 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Капучино',
  'Капучино из категории "Напитки" ресторана Кофемания.',
  140.00,
  '414 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Латте',
  'Латте из категории "Напитки" ресторана Кофемания.',
  140.00,
  '473 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Раф',
  'Раф из категории "Напитки" ресторана Кофемания.',
  260.00,
  '448 мл',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Чай',
  'Чай из категории "Напитки" ресторана Кофемания.',
  230.00,
  '354 мл',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Соки',
  'Соки из категории "Напитки" ресторана Кофемания.',
  200.00,
  '313 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  17,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 17 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Вода',
  'Вода из категории "Напитки" ресторана Кофемания.',
  210.00,
  '331 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Блины'
    LIMIT 1
  ),
  'Алеша Попович',
  'Алеша Попович из категории "Блины" ресторана Теремок.',
  570.00,
  '461 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Блины'
    LIMIT 1
  ),
  'Добрыня',
  'Добрыня из категории "Блины" ресторана Теремок.',
  720.00,
  '332 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Блины'
    LIMIT 1
  ),
  'Илья Муромец',
  'Илья Муромец из категории "Блины" ресторана Теремок.',
  570.00,
  '341 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Блины'
    LIMIT 1
  ),
  'С ветчиной',
  'С ветчиной из категории "Блины" ресторана Теремок.',
  530.00,
  '494 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Блины'
    LIMIT 1
  ),
  'С грибами',
  'С грибами из категории "Блины" ресторана Теремок.',
  370.00,
  '403 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Блины'
    LIMIT 1
  ),
  'С креветками',
  'С креветками из категории "Блины" ресторана Теремок.',
  470.00,
  '323 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Сладкие блины'
    LIMIT 1
  ),
  'Сгущенка',
  'Сгущенка из категории "Сладкие блины" ресторана Теремок.',
  510.00,
  '390 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Сладкие блины'
    LIMIT 1
  ),
  'Шоколад банан',
  'Шоколад банан из категории "Сладкие блины" ресторана Теремок.',
  700.00,
  '235 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Сладкие блины'
    LIMIT 1
  ),
  'Карамель яблоко',
  'Карамель яблоко из категории "Сладкие блины" ресторана Теремок.',
  820.00,
  '449 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Сладкие блины'
    LIMIT 1
  ),
  'Варенье',
  'Варенье из категории "Сладкие блины" ресторана Теремок.',
  390.00,
  '491 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Сладкие блины'
    LIMIT 1
  ),
  'Малина',
  'Малина из категории "Сладкие блины" ресторана Теремок.',
  650.00,
  '430 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Сладкие блины'
    LIMIT 1
  ),
  'Сахар',
  'Сахар из категории "Сладкие блины" ресторана Теремок.',
  720.00,
  '236 г',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Борщ',
  'Борщ из категории "Супы" ресторана Теремок.',
  260.00,
  '368 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Лапша',
  'Лапша из категории "Супы" ресторана Теремок.',
  450.00,
  '295 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Гороховый',
  'Гороховый из категории "Супы" ресторана Теремок.',
  310.00,
  '280 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Грибной',
  'Грибной из категории "Супы" ресторана Теремок.',
  350.00,
  '307 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Куриный',
  'Куриный из категории "Супы" ресторана Теремок.',
  490.00,
  '423 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Овощной',
  'Овощной из категории "Супы" ресторана Теремок.',
  400.00,
  '302 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Пельмени',
  'Пельмени из категории "Горячее" ресторана Теремок.',
  860.00,
  '242 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Вареники',
  'Вареники из категории "Горячее" ресторана Теремок.',
  830.00,
  '496 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Гречка',
  'Гречка из категории "Горячее" ресторана Теремок.',
  920.00,
  '293 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Картофель',
  'Картофель из категории "Горячее" ресторана Теремок.',
  690.00,
  '350 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Мясо',
  'Мясо из категории "Горячее" ресторана Теремок.',
  340.00,
  '281 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Овощи',
  'Овощи из категории "Горячее" ресторана Теремок.',
  710.00,
  '411 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Морс',
  'Морс из категории "Напитки" ресторана Теремок.',
  280.00,
  '425 мл',
  '/uploads/menu/placeholder.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Квас',
  'Квас из категории "Напитки" ресторана Теремок.',
  310.00,
  '449 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Узвар',
  'Узвар из категории "Напитки" ресторана Теремок.',
  290.00,
  '490 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Чай',
  'Чай из категории "Напитки" ресторана Теремок.',
  270.00,
  '379 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Кофе',
  'Кофе из категории "Напитки" ресторана Теремок.',
  200.00,
  '313 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  18,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 18 AND mc.name = 'Напитки'
    LIMIT 1
  ),
  'Вода',
  'Вода из категории "Напитки" ресторана Теремок.',
  270.00,
  '494 мл',
  '/uploads/menu/placeholder.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Антипасти',
  'Антипасти из категории "Закуски" ресторана Osteria Amici.',
  230.00,
  '140 г',
  '/uploads/menu/fries.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Брускетта с томатами',
  'Брускетта с томатами из категории "Закуски" ресторана Osteria Amici.',
  230.00,
  '295 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Брускетта с лососем',
  'Брускетта с лососем из категории "Закуски" ресторана Osteria Amici.',
  500.00,
  '221 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Сырная тарелка',
  'Сырная тарелка из категории "Закуски" ресторана Osteria Amici.',
  400.00,
  '317 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Вителло тоннато',
  'Вителло тоннато из категории "Закуски" ресторана Osteria Amici.',
  290.00,
  '108 г',
  '/uploads/menu/fries.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Тартар из лосося',
  'Тартар из лосося из категории "Закуски" ресторана Osteria Amici.',
  450.00,
  '176 г',
  '/uploads/menu/fries.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Капрезе',
  'Капрезе из категории "Салаты" ресторана Osteria Amici.',
  470.00,
  '349 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Буррата с томатами',
  'Буррата с томатами из категории "Салаты" ресторана Osteria Amici.',
  210.00,
  '157 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Салат с уткой',
  'Салат с уткой из категории "Салаты" ресторана Osteria Amici.',
  510.00,
  '259 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Зеленый салат',
  'Зеленый салат из категории "Салаты" ресторана Osteria Amici.',
  730.00,
  '353 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Салат с морепродуктами',
  'Салат с морепродуктами из категории "Салаты" ресторана Osteria Amici.',
  700.00,
  '352 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Салат с грибами',
  'Салат с грибами из категории "Салаты" ресторана Osteria Amici.',
  730.00,
  '151 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Минестроне',
  'Минестроне из категории "Супы" ресторана Osteria Amici.',
  290.00,
  '388 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Гаспачо',
  'Гаспачо из категории "Супы" ресторана Osteria Amici.',
  280.00,
  '295 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Суп с морепродуктами',
  'Суп с морепродуктами из категории "Супы" ресторана Osteria Amici.',
  290.00,
  '315 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Щавелевый суп',
  'Щавелевый суп из категории "Супы" ресторана Osteria Amici.',
  520.00,
  '310 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Окрошка',
  'Окрошка из категории "Супы" ресторана Osteria Amici.',
  440.00,
  '330 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Суп дня',
  'Суп дня из категории "Супы" ресторана Osteria Amici.',
  280.00,
  '377 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Карбонара',
  'Карбонара из категории "Паста" ресторана Osteria Amici.',
  930.00,
  '481 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Паста с грибами',
  'Паста с грибами из категории "Паста" ресторана Osteria Amici.',
  410.00,
  '517 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Паста с морепродуктами',
  'Паста с морепродуктами из категории "Паста" ресторана Osteria Amici.',
  510.00,
  '505 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Равиоли',
  'Равиоли из категории "Паста" ресторана Osteria Amici.',
  810.00,
  '470 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Ризотто с грибами',
  'Ризотто с грибами из категории "Паста" ресторана Osteria Amici.',
  890.00,
  '302 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Паста с тунцом',
  'Паста с тунцом из категории "Паста" ресторана Osteria Amici.',
  710.00,
  '474 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Пицца с мортаделлой',
  'Пицца с мортаделлой из категории "Пицца" ресторана Osteria Amici.',
  1000.00,
  '477 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Пицца с грибами',
  'Пицца с грибами из категории "Пицца" ресторана Osteria Amici.',
  850.00,
  '604 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Пицца с морепродуктами',
  'Пицца с морепродуктами из категории "Пицца" ресторана Osteria Amici.',
  740.00,
  '635 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Маргарита',
  'Маргарита из категории "Пицца" ресторана Osteria Amici.',
  900.00,
  '425 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Пепперони',
  'Пепперони из категории "Пицца" ресторана Osteria Amici.',
  780.00,
  '430 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Четыре сыра',
  'Четыре сыра из категории "Пицца" ресторана Osteria Amici.',
  710.00,
  '614 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Рибай',
  'Рибай из категории "Горячее" ресторана Osteria Amici.',
  980.00,
  '501 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Филе миньон',
  'Филе миньон из категории "Горячее" ресторана Osteria Amici.',
  930.00,
  '462 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Бефстроганов',
  'Бефстроганов из категории "Горячее" ресторана Osteria Amici.',
  810.00,
  '304 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Лосось на гриле',
  'Лосось на гриле из категории "Горячее" ресторана Osteria Amici.',
  680.00,
  '442 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Осьминог',
  'Осьминог из категории "Горячее" ресторана Osteria Amici.',
  390.00,
  '279 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Морепродукты',
  'Морепродукты из категории "Горячее" ресторана Osteria Amici.',
  410.00,
  '323 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Тирамису',
  'Тирамису из категории "Десерты" ресторана Osteria Amici.',
  260.00,
  '173 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Панна котта',
  'Панна котта из категории "Десерты" ресторана Osteria Amici.',
  380.00,
  '215 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Чизкейк',
  'Чизкейк из категории "Десерты" ресторана Osteria Amici.',
  190.00,
  '99 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Эклер',
  'Эклер из категории "Десерты" ресторана Osteria Amici.',
  530.00,
  '208 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Шоколадный фондан',
  'Шоколадный фондан из категории "Десерты" ресторана Osteria Amici.',
  260.00,
  '215 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  13,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 13 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Авторские десерты',
  'Авторские десерты из категории "Десерты" ресторана Osteria Amici.',
  490.00,
  '94 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Карпаччо',
  'Карпаччо из категории "Закуски" ресторана Fattoria Marian.',
  480.00,
  '336 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Сырная тарелка',
  'Сырная тарелка из категории "Закуски" ресторана Fattoria Marian.',
  170.00,
  '221 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Мясная тарелка',
  'Мясная тарелка из категории "Закуски" ресторана Fattoria Marian.',
  220.00,
  '120 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Брускетта',
  'Брускетта из категории "Закуски" ресторана Fattoria Marian.',
  260.00,
  '331 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Фермерские закуски',
  'Фермерские закуски из категории "Закуски" ресторана Fattoria Marian.',
  260.00,
  '122 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Оливки',
  'Оливки из категории "Закуски" ресторана Fattoria Marian.',
  290.00,
  '199 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С бурратой и грушей',
  'С бурратой и грушей из категории "Салаты" ресторана Fattoria Marian.',
  700.00,
  '222 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Зеленый салат',
  'Зеленый салат из категории "Салаты" ресторана Fattoria Marian.',
  280.00,
  '230 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С овощами',
  'С овощами из категории "Салаты" ресторана Fattoria Marian.',
  560.00,
  '209 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С сыром',
  'С сыром из категории "Салаты" ресторана Fattoria Marian.',
  720.00,
  '302 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С мясом',
  'С мясом из категории "Салаты" ресторана Fattoria Marian.',
  530.00,
  '283 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С морепродуктами',
  'С морепродуктами из категории "Салаты" ресторана Fattoria Marian.',
  500.00,
  '182 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Тыквенный суп',
  'Тыквенный суп из категории "Супы" ресторана Fattoria Marian.',
  280.00,
  '308 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Куриный бульон',
  'Куриный бульон из категории "Супы" ресторана Fattoria Marian.',
  460.00,
  '389 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Овощной суп',
  'Овощной суп из категории "Супы" ресторана Fattoria Marian.',
  410.00,
  '420 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Крем-суп',
  'Крем-суп из категории "Супы" ресторана Fattoria Marian.',
  490.00,
  '447 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Суп с мясом',
  'Суп с мясом из категории "Супы" ресторана Fattoria Marian.',
  370.00,
  '418 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Сезонный суп',
  'Сезонный суп из категории "Супы" ресторана Fattoria Marian.',
  390.00,
  '453 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Паста с креветками',
  'Паста с креветками из категории "Паста" ресторана Fattoria Marian.',
  770.00,
  '391 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Равиоли с говядиной',
  'Равиоли с говядиной из категории "Паста" ресторана Fattoria Marian.',
  430.00,
  '394 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Ризотто с грибами',
  'Ризотто с грибами из категории "Паста" ресторана Fattoria Marian.',
  430.00,
  '371 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Паста с сыром',
  'Паста с сыром из категории "Паста" ресторана Fattoria Marian.',
  590.00,
  '279 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Паста с мясом',
  'Паста с мясом из категории "Паста" ресторана Fattoria Marian.',
  940.00,
  '311 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Паста с овощами',
  'Паста с овощами из категории "Паста" ресторана Fattoria Marian.',
  760.00,
  '411 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Маргарита',
  'Маргарита из категории "Пицца" ресторана Fattoria Marian.',
  680.00,
  '648 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Пепперони',
  'Пепперони из категории "Пицца" ресторана Fattoria Marian.',
  580.00,
  '568 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Пицца с грушей',
  'Пицца с грушей из категории "Пицца" ресторана Fattoria Marian.',
  1050.00,
  '476 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Пицца с грибами',
  'Пицца с грибами из категории "Пицца" ресторана Fattoria Marian.',
  990.00,
  '635 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Пицца с тунцом',
  'Пицца с тунцом из категории "Пицца" ресторана Fattoria Marian.',
  1010.00,
  '527 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Фирменная пицца',
  'Фирменная пицца из категории "Пицца" ресторана Fattoria Marian.',
  650.00,
  '593 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Шницель',
  'Шницель из категории "Горячее" ресторана Fattoria Marian.',
  860.00,
  '224 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Говядина',
  'Говядина из категории "Горячее" ресторана Fattoria Marian.',
  650.00,
  '463 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Курица',
  'Курица из категории "Горячее" ресторана Fattoria Marian.',
  810.00,
  '464 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Блюда на гриле',
  'Блюда на гриле из категории "Горячее" ресторана Fattoria Marian.',
  640.00,
  '324 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Овощные блюда',
  'Овощные блюда из категории "Горячее" ресторана Fattoria Marian.',
  830.00,
  '293 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Фермерские блюда',
  'Фермерские блюда из категории "Горячее" ресторана Fattoria Marian.',
  660.00,
  '508 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Тирамису',
  'Тирамису из категории "Десерты" ресторана Fattoria Marian.',
  340.00,
  '126 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Панна котта',
  'Панна котта из категории "Десерты" ресторана Fattoria Marian.',
  470.00,
  '138 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Крем-брюле',
  'Крем-брюле из категории "Десерты" ресторана Fattoria Marian.',
  340.00,
  '119 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Чизкейк',
  'Чизкейк из категории "Десерты" ресторана Fattoria Marian.',
  350.00,
  '191 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Домашние десерты',
  'Домашние десерты из категории "Десерты" ресторана Fattoria Marian.',
  290.00,
  '186 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  14,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 14 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Сезонные десерты',
  'Сезонные десерты из категории "Десерты" ресторана Fattoria Marian.',
  430.00,
  '205 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Карпаччо',
  'Карпаччо из категории "Закуски" ресторана Dolce Far Niente.',
  280.00,
  '337 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Брускетта',
  'Брускетта из категории "Закуски" ресторана Dolce Far Niente.',
  340.00,
  '136 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Мортаделла',
  'Мортаделла из категории "Закуски" ресторана Dolce Far Niente.',
  300.00,
  '326 г',
  '/uploads/menu/fries.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Сырная тарелка',
  'Сырная тарелка из категории "Закуски" ресторана Dolce Far Niente.',
  270.00,
  '310 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Мясное ассорти',
  'Мясное ассорти из категории "Закуски" ресторана Dolce Far Niente.',
  260.00,
  '203 г',
  '/uploads/menu/bruschetta.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Закуски'
    LIMIT 1
  ),
  'Оливки',
  'Оливки из категории "Закуски" ресторана Dolce Far Niente.',
  350.00,
  '273 г',
  '/uploads/menu/bruschetta.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Цезарь',
  'Цезарь из категории "Салаты" ресторана Dolce Far Niente.',
  370.00,
  '184 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Зеленый салат',
  'Зеленый салат из категории "Салаты" ресторана Dolce Far Niente.',
  730.00,
  '156 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С креветками',
  'С креветками из категории "Салаты" ресторана Dolce Far Niente.',
  610.00,
  '160 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С морепродуктами',
  'С морепродуктами из категории "Салаты" ресторана Dolce Far Niente.',
  410.00,
  '256 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'С томатами',
  'С томатами из категории "Салаты" ресторана Dolce Far Niente.',
  660.00,
  '212 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Салаты'
    LIMIT 1
  ),
  'Овощной',
  'Овощной из категории "Салаты" ресторана Dolce Far Niente.',
  760.00,
  '244 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Крем-суп грибной',
  'Крем-суп грибной из категории "Супы" ресторана Dolce Far Niente.',
  360.00,
  '399 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Похлебка с морепродуктами',
  'Похлебка с морепродуктами из категории "Супы" ресторана Dolce Far Niente.',
  480.00,
  '283 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Гаспачо',
  'Гаспачо из категории "Супы" ресторана Dolce Far Niente.',
  300.00,
  '425 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Овощной суп',
  'Овощной суп из категории "Супы" ресторана Dolce Far Niente.',
  440.00,
  '307 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Суп дня',
  'Суп дня из категории "Супы" ресторана Dolce Far Niente.',
  430.00,
  '408 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Супы'
    LIMIT 1
  ),
  'Итальянский суп',
  'Итальянский суп из категории "Супы" ресторана Dolce Far Niente.',
  470.00,
  '314 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Карбонара',
  'Карбонара из категории "Паста" ресторана Dolce Far Niente.',
  680.00,
  '228 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Болоньезе',
  'Болоньезе из категории "Паста" ресторана Dolce Far Niente.',
  500.00,
  '381 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Равиоли с уткой',
  'Равиоли с уткой из категории "Паста" ресторана Dolce Far Niente.',
  670.00,
  '351 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Ризотто',
  'Ризотто из категории "Паста" ресторана Dolce Far Niente.',
  560.00,
  '476 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Каннеллони',
  'Каннеллони из категории "Паста" ресторана Dolce Far Niente.',
  390.00,
  '379 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Паста'
    LIMIT 1
  ),
  'Паста с морепродуктами',
  'Паста с морепродуктами из категории "Паста" ресторана Dolce Far Niente.',
  780.00,
  '516 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Маргарита',
  'Маргарита из категории "Пицца" ресторана Dolce Far Niente.',
  810.00,
  '531 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Четыре сыра',
  'Четыре сыра из категории "Пицца" ресторана Dolce Far Niente.',
  630.00,
  '599 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Ветчина и грибы',
  'Ветчина и грибы из категории "Пицца" ресторана Dolce Far Niente.',
  730.00,
  '452 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'Мясная',
  'Мясная из категории "Пицца" ресторана Dolce Far Niente.',
  820.00,
  '665 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'С анчоусами',
  'С анчоусами из категории "Пицца" ресторана Dolce Far Niente.',
  570.00,
  '504 г',
  '/uploads/menu/pizza-4cheese.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Пицца'
    LIMIT 1
  ),
  'С грушей',
  'С грушей из категории "Пицца" ресторана Dolce Far Niente.',
  760.00,
  '453 г',
  '/uploads/menu/pizza-margherita.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Ягненок',
  'Ягненок из категории "Горячее" ресторана Dolce Far Niente.',
  830.00,
  '260 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Сибас',
  'Сибас из категории "Горячее" ресторана Dolce Far Niente.',
  660.00,
  '470 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Стейки',
  'Стейки из категории "Горячее" ресторана Dolce Far Niente.',
  560.00,
  '479 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  1,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Рыба на гриле',
  'Рыба на гриле из категории "Горячее" ресторана Dolce Far Niente.',
  760.00,
  '461 г',
  '/uploads/menu/salmon-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Морепродукты',
  'Морепродукты из категории "Горячее" ресторана Dolce Far Niente.',
  780.00,
  '437 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Горячее'
    LIMIT 1
  ),
  'Мясные блюда',
  'Мясные блюда из категории "Горячее" ресторана Dolce Far Niente.',
  930.00,
  '228 г',
  '/uploads/menu/chicken-bowl.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Панна котта',
  'Панна котта из категории "Десерты" ресторана Dolce Far Niente.',
  240.00,
  '215 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Павлова',
  'Павлова из категории "Десерты" ресторана Dolce Far Niente.',
  180.00,
  '98 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Чизкейк',
  'Чизкейк из категории "Десерты" ресторана Dolce Far Niente.',
  210.00,
  '152 г',
  '/uploads/menu/chia-mango.svg',
  1,
  1,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Тирамису',
  'Тирамису из категории "Десерты" ресторана Dolce Far Niente.',
  530.00,
  '208 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Шоколадный десерт',
  'Шоколадный десерт из категории "Десерты" ресторана Dolce Far Niente.',
  330.00,
  '148 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  1,
  NOW(),
  NOW()
);
INSERT INTO menu_items (
  restaurant_id, category_id, name, description, price, weight, image,
  is_available, is_popular, is_new, created_at, updated_at
)
VALUES (
  15,
  (
    SELECT mc.id
    FROM menu_categories mc
    WHERE mc.restaurant_id = 15 AND mc.name = 'Десерты'
    LIMIT 1
  ),
  'Итальянские десерты',
  'Итальянские десерты из категории "Десерты" ресторана Dolce Far Niente.',
  230.00,
  '142 г',
  '/uploads/menu/chia-mango.svg',
  1,
  0,
  0,
  NOW(),
  NOW()
);

COMMIT;
