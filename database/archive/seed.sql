USE diplom_foodhub;

SET NAMES utf8mb4;

DELETE FROM admin_logs;
DELETE FROM security_events;
DELETE FROM rate_limits;
DELETE FROM password_reset_tokens;
DELETE FROM email_verification_codes;
DELETE FROM user_addresses;
DELETE FROM order_items;
DELETE FROM orders;
DELETE FROM cart_items;
DELETE FROM carts;
DELETE FROM reviews;
DELETE FROM favorites;
DELETE FROM menu_items;
DELETE FROM menu_categories;
DELETE FROM restaurant_category_links;
DELETE FROM restaurant_categories;
DELETE FROM restaurants;
DELETE FROM users;

INSERT INTO users (id, name, email, phone, password_hash, role, email_verified_at, is_active, created_at, updated_at) VALUES
(1, 'Admin Mealgo', 'admin@foodhub.local', '+7 (999) 111-22-33', '$2y$10$xfPs7X5Mk/C9pHh3n1XOGemEIaoEyaAwUTLO6ha8bmZns0KAtb0cS', 'admin', NOW(), 1, NOW(), NOW()),
(2, 'Ирина Смирнова', 'irina@example.com', '+7 (901) 222-45-67', '$2y$10$v9JNFUPargIeoksDqJb8oOBJFfsYotYxPIxdiKutssBDAPDTHNT8m', 'user', NOW(), 1, NOW(), NOW()),
(3, 'Максим Кузнецов', 'max@example.com', '+7 (905) 333-12-90', '$2y$10$v9JNFUPargIeoksDqJb8oOBJFfsYotYxPIxdiKutssBDAPDTHNT8m', 'user', NOW(), 1, NOW(), NOW());

INSERT INTO restaurant_categories (id, name, slug, is_active) VALUES
(1, 'Бургеры', 'burgers', 1),
(2, 'Суши', 'sushi', 1),
(3, 'Пицца', 'pizza', 1),
(4, 'Десерты', 'desserts', 1),
(5, 'Итальянская кухня', 'italian', 1),
(6, 'Русская кухня', 'russian', 1);

INSERT INTO restaurants (
    id, name, short_description, logo_image, banner_image, address, phone, working_hours, rating,
    delivery_fee, min_order_amount, delivery_time_min, delivery_time_max, is_active, created_at, updated_at
) VALUES
(1, 'Вкусно и Точка', 'Популярные бургеры, роллы и комбо-наборы.', '/assets/img/brands/burgers/vkusno_i_tochka.svg', '/assets/img/brands/burgers/vkusno_i_tochka.svg', 'Москва, Тверская улица, 7', '+7 (495) 101-00-01', '09:00 - 23:00', 4.70, 129.00, 600.00, 25, 40, 1, NOW(), NOW()),
(2, 'Burger King', 'Фирменные бургеры на огне и большие наборы.', '/assets/img/brands/burgers/burger_king.svg', '/assets/img/brands/burgers/burger_king.svg', 'Москва, Новый Арбат, 19', '+7 (495) 101-00-02', '10:00 - 23:30', 4.60, 149.00, 700.00, 30, 45, 1, NOW(), NOW()),
(3, 'Rostic''s', 'Хрустящая курица, бургеры и классические снеки.', '/assets/img/brands/burgers/rostics.png', '/assets/img/brands/burgers/rostics.png', 'Москва, Проспект Мира, 41', '+7 (495) 101-00-03', '09:00 - 00:00', 4.50, 119.00, 550.00, 25, 40, 1, NOW(), NOW()),
(4, 'Tanuki', 'Роллы, сеты и блюда японской кухни.', '/assets/img/brands/sushi/tanuki.png', '/assets/img/brands/sushi/tanuki.png', 'Москва, Большая Никитская, 21', '+7 (495) 101-00-04', '11:00 - 23:30', 4.80, 199.00, 1000.00, 40, 60, 1, NOW(), NOW()),
(5, 'Pinskiy GO', 'Современная паназиатская кухня и роллы.', '/assets/img/brands/sushi/pinskiy_go.png', '/assets/img/brands/sushi/pinskiy_go.png', 'Москва, Кутузовский проспект, 12', '+7 (495) 101-00-05', '11:00 - 23:00', 4.70, 229.00, 1200.00, 40, 65, 1, NOW(), NOW()),
(6, 'Якитория', 'Роллы, гунканы и теплые японские блюда.', '/assets/img/brands/sushi/yakitoriya.png', '/assets/img/brands/sushi/yakitoriya.png', 'Москва, Ленинский проспект, 32', '+7 (495) 101-00-06', '10:30 - 23:30', 4.60, 189.00, 950.00, 35, 55, 1, NOW(), NOW()),
(7, 'Dodo Pizza', 'Большой выбор пиццы, закусок и комбо.', '/assets/img/brands/pizza/dodo_pizza.png', '/assets/img/brands/pizza/dodo_pizza.png', 'Москва, Профсоюзная улица, 15', '+7 (495) 101-00-07', '09:00 - 23:30', 4.80, 99.00, 650.00, 25, 40, 1, NOW(), NOW()),
(8, 'Pizza City', 'Классическая и авторская пицца на тонком тесте.', '/assets/img/brands/pizza/pizza_city.png', '/assets/img/brands/pizza/pizza_city.png', 'Москва, Варшавское шоссе, 74', '+7 (495) 101-00-08', '10:00 - 23:00', 4.40, 139.00, 700.00, 30, 50, 1, NOW(), NOW()),
(9, 'Domino Pizza', 'Много сыра, фирменное тесто и быстрые комбо.', '/assets/img/brands/pizza/domino_pizza.svg', '/assets/img/brands/pizza/domino_pizza.svg', 'Москва, Шаболовка, 23', '+7 (495) 101-00-09', '10:00 - 23:30', 4.50, 149.00, 750.00, 30, 50, 1, NOW(), NOW()),
(10, 'One Love', 'Десерты, торты и сладкие наборы на каждый день.', '/assets/img/brands/dessert/one_love.png', '/assets/img/brands/dessert/one_love.png', 'Москва, Цветной бульвар, 18', '+7 (495) 101-00-10', '09:00 - 22:00', 4.90, 99.00, 500.00, 20, 35, 1, NOW(), NOW()),
(11, '11/47 Bakery', 'Ремесленная выпечка и сезонные десерты.', '/assets/img/brands/dessert/bakery_1147.webp', '/assets/img/brands/dessert/bakery_1147.webp', 'Москва, Покровка, 11', '+7 (495) 101-00-11', '08:00 - 21:00', 4.80, 89.00, 450.00, 20, 35, 1, NOW(), NOW()),
(12, 'Special Napoleon', 'Фирменные торты и десерты ручной работы.', '/assets/img/brands/dessert/special_napoleon.png', '/assets/img/brands/dessert/special_napoleon.png', 'Москва, Мясницкая улица, 37', '+7 (495) 101-00-12', '09:00 - 22:00', 4.70, 99.00, 500.00, 25, 40, 1, NOW(), NOW()),
(13, 'Osteria Amici', 'Итальянская кухня: паста, пицца, антипасти.', '/assets/img/brands/italian/osteria_amici.webp', '/assets/img/brands/italian/osteria_amici.webp', 'Москва, Пятницкая улица, 26', '+7 (495) 101-00-13', '11:00 - 23:00', 4.80, 179.00, 1000.00, 35, 55, 1, NOW(), NOW()),
(14, 'Fattoria Marian', 'Домашняя итальянская кухня и сытные блюда.', '/assets/img/brands/italian/fattoria_marian.png', '/assets/img/brands/italian/fattoria_marian.png', 'Москва, Маросейка, 6', '+7 (495) 101-00-14', '11:00 - 23:00', 4.70, 189.00, 1100.00, 35, 60, 1, NOW(), NOW()),
(15, 'Dolce Far Niente', 'Паста, ризотто и авторские итальянские рецепты.', '/assets/img/brands/italian/dolce_far_niente.png', '/assets/img/brands/italian/dolce_far_niente.png', 'Москва, Пречистенка, 40', '+7 (495) 101-00-15', '11:30 - 23:30', 4.70, 199.00, 1200.00, 40, 60, 1, NOW(), NOW()),
(16, 'Культура Встречи', 'Современная русская кухня и comfort food.', '/assets/img/brands/russian/kultura_vstrechi.svg', '/assets/img/brands/russian/kultura_vstrechi.svg', 'Москва, Большая Дмитровка, 9', '+7 (495) 101-00-16', '09:00 - 23:00', 4.60, 129.00, 700.00, 30, 50, 1, NOW(), NOW()),
(17, 'Кофемания', 'Завтраки весь день, горячие блюда и кофе.', '/assets/img/brands/russian/kofemania.svg', '/assets/img/brands/russian/kofemania.svg', 'Москва, Садовая-Самотечная, 20', '+7 (495) 101-00-17', '08:00 - 23:00', 4.90, 149.00, 800.00, 25, 45, 1, NOW(), NOW()),
(18, 'Теремок', 'Блины, супы и блюда русской домашней кухни.', '/assets/img/brands/russian/teremok.png', '/assets/img/brands/russian/teremok.png', 'Москва, Комсомольский проспект, 28', '+7 (495) 101-00-18', '09:00 - 22:30', 4.50, 99.00, 500.00, 20, 40, 1, NOW(), NOW());

INSERT INTO restaurant_category_links (restaurant_id, category_id) VALUES
(1, 1), (2, 1), (3, 1),
(4, 2), (5, 2), (6, 2),
(7, 3), (8, 3), (9, 3),
(10, 4), (11, 4), (12, 4),
(13, 5), (14, 5), (15, 5),
(16, 6), (17, 6), (18, 6);

INSERT INTO menu_categories (id, restaurant_id, name, sort_order, is_active, created_at, updated_at) VALUES
(1, 1, 'Основное меню', 10, 1, NOW(), NOW()),
(2, 2, 'Основное меню', 10, 1, NOW(), NOW()),
(3, 3, 'Основное меню', 10, 1, NOW(), NOW()),
(4, 4, 'Основное меню', 10, 1, NOW(), NOW()),
(5, 5, 'Основное меню', 10, 1, NOW(), NOW()),
(6, 6, 'Основное меню', 10, 1, NOW(), NOW()),
(7, 7, 'Основное меню', 10, 1, NOW(), NOW()),
(8, 8, 'Основное меню', 10, 1, NOW(), NOW()),
(9, 9, 'Основное меню', 10, 1, NOW(), NOW()),
(10, 10, 'Основное меню', 10, 1, NOW(), NOW()),
(11, 11, 'Основное меню', 10, 1, NOW(), NOW()),
(12, 12, 'Основное меню', 10, 1, NOW(), NOW()),
(13, 13, 'Основное меню', 10, 1, NOW(), NOW()),
(14, 14, 'Основное меню', 10, 1, NOW(), NOW()),
(15, 15, 'Основное меню', 10, 1, NOW(), NOW()),
(16, 16, 'Основное меню', 10, 1, NOW(), NOW()),
(17, 17, 'Основное меню', 10, 1, NOW(), NOW()),
(18, 18, 'Основное меню', 10, 1, NOW(), NOW());

INSERT INTO menu_items (
    restaurant_id, category_id, name, description, price, weight, image,
    is_available, is_popular, is_new, created_at, updated_at
) VALUES
-- Вкусно и Точка
(1, 1, 'Биг Спешл', 'Двойная говяжья котлета, сыр, фирменный соус и овощи.', 369.00, '290 г', '/uploads/menu/burger-bbq.svg', 1, 1, 0, NOW(), NOW()),
(1, 1, 'Чикен Премьер', 'Куриное филе в панировке, салат и соус.', 319.00, '250 г', '/uploads/menu/burger-truffle.svg', 1, 0, 1, NOW(), NOW()),
(1, 1, 'Картофель фри', 'Хрустящий картофель с солью.', 149.00, '150 г', '/uploads/menu/fries.svg', 1, 1, 0, NOW(), NOW()),

-- Burger King
(2, 2, 'Воппер', 'Котлета на огне, томаты, лук, салат и фирменный соус.', 419.00, '330 г', '/uploads/menu/burger-bbq.svg', 1, 1, 0, NOW(), NOW()),
(2, 2, 'Дабл Чизбургер', 'Две говяжьи котлеты, двойной сыр и маринованные огурцы.', 359.00, '260 г', '/uploads/menu/burger-truffle.svg', 1, 0, 0, NOW(), NOW()),
(2, 2, 'Кинг фри', 'Большая порция картофеля с соусом на выбор.', 179.00, '170 г', '/uploads/menu/fries.svg', 1, 0, 1, NOW(), NOW()),

-- Rostic's
(3, 3, 'Шефбургер', 'Куриное филе, свежие овощи и сливочный соус.', 329.00, '270 г', '/uploads/menu/burger-bbq.svg', 1, 1, 0, NOW(), NOW()),
(3, 3, 'Боксмастер', 'Лепешка, курица, салат и соус.', 349.00, '280 г', '/uploads/menu/burger-truffle.svg', 1, 0, 1, NOW(), NOW()),
(3, 3, 'Картофель по-деревенски', 'Дольки картофеля со специями.', 169.00, '160 г', '/uploads/menu/fries.svg', 1, 0, 0, NOW(), NOW()),

-- Tanuki
(4, 4, 'Филадельфия', 'Лосось, сливочный сыр и огурец.', 690.00, '250 г', '/uploads/menu/philadelphia.svg', 1, 1, 0, NOW(), NOW()),
(4, 4, 'Калифорния с крабом', 'Краб, авокадо, огурец и тобико.', 640.00, '240 г', '/uploads/menu/california.svg', 1, 0, 0, NOW(), NOW()),
(4, 4, 'Сет Тануки', 'Набор из 24 роллов с лососем и креветкой.', 1790.00, '820 г', '/uploads/menu/set-premium.svg', 1, 1, 1, NOW(), NOW()),

-- Pinskiy GO
(5, 5, 'Филадельфия лайт', 'Лосось, сыр креметте и кунжут.', 720.00, '250 г', '/uploads/menu/philadelphia.svg', 1, 1, 0, NOW(), NOW()),
(5, 5, 'Ролл креветка темпура', 'Креветка темпура, соус спайси, авокадо.', 680.00, '260 г', '/uploads/menu/california.svg', 1, 0, 1, NOW(), NOW()),
(5, 5, 'Сет Pinskiy', 'Ассорти из 28 роллов.', 1950.00, '900 г', '/uploads/menu/set-premium.svg', 1, 1, 0, NOW(), NOW()),

-- Якитория
(6, 6, 'Ролл с угрем', 'Угорь, сливочный сыр, огурец.', 650.00, '230 г', '/uploads/menu/philadelphia.svg', 1, 1, 0, NOW(), NOW()),
(6, 6, 'Калифорния с лососем', 'Лосось, авокадо, огурец.', 620.00, '230 г', '/uploads/menu/california.svg', 1, 0, 1, NOW(), NOW()),
(6, 6, 'Сет Якитория', 'Популярные роллы, 24 шт.', 1690.00, '780 г', '/uploads/menu/set-premium.svg', 1, 1, 0, NOW(), NOW()),

-- Dodo Pizza
(7, 7, 'Пепперони', 'Тесто, томатный соус, сыр моцарелла, пепперони.', 589.00, '460 г', '/uploads/menu/pizza-margherita.svg', 1, 1, 0, NOW(), NOW()),
(7, 7, 'Четыре сыра', 'Моцарелла, дорблю, пармезан и чеддер.', 699.00, '470 г', '/uploads/menu/pizza-4cheese.svg', 1, 1, 1, NOW(), NOW()),
(7, 7, 'Додстер', 'Тортилья с курицей и сыром.', 279.00, '190 г', '/uploads/menu/bruschetta.svg', 1, 0, 0, NOW(), NOW()),

-- Pizza City
(8, 8, 'Маргарита', 'Томатный соус, моцарелла и базилик.', 549.00, '430 г', '/uploads/menu/pizza-margherita.svg', 1, 1, 0, NOW(), NOW()),
(8, 8, 'Мясная', 'Говядина, бекон, ветчина и сыр.', 749.00, '500 г', '/uploads/menu/pizza-4cheese.svg', 1, 0, 1, NOW(), NOW()),
(8, 8, 'Сырные палочки', 'Запеченные палочки с сыром и чесночным соусом.', 299.00, '210 г', '/uploads/menu/bruschetta.svg', 1, 0, 0, NOW(), NOW()),

-- Domino Pizza
(9, 9, 'Суприм', 'Пицца с мясными ингредиентами и овощами.', 789.00, '520 г', '/uploads/menu/pizza-margherita.svg', 1, 1, 0, NOW(), NOW()),
(9, 9, 'Четыре сыра Domino', 'Сырный микс на фирменном тесте.', 759.00, '500 г', '/uploads/menu/pizza-4cheese.svg', 1, 0, 1, NOW(), NOW()),
(9, 9, 'Ветчина и грибы', 'Нежная пицца с ветчиной и шампиньонами.', 699.00, '480 г', '/uploads/menu/bruschetta.svg', 1, 0, 0, NOW(), NOW()),

-- One Love
(10, 10, 'Чизкейк Нью-Йорк', 'Классический чизкейк с ванилью.', 390.00, '170 г', '/uploads/menu/chia-mango.svg', 1, 1, 0, NOW(), NOW()),
(10, 10, 'Тирамису', 'Нежный десерт с маскарпоне и кофе.', 420.00, '180 г', '/uploads/menu/placeholder.svg', 1, 0, 1, NOW(), NOW()),
(10, 10, 'Эклер ваниль', 'Заварное пирожное с ванильным кремом.', 250.00, '90 г', '/uploads/menu/placeholder.svg', 1, 0, 0, NOW(), NOW()),

-- 11/47 Bakery
(11, 11, 'Круассан миндальный', 'Слоеное тесто, миндальный крем.', 280.00, '110 г', '/uploads/menu/placeholder.svg', 1, 1, 0, NOW(), NOW()),
(11, 11, 'Синнабон', 'Булочка с корицей и сливочной глазурью.', 260.00, '130 г', '/uploads/menu/placeholder.svg', 1, 0, 0, NOW(), NOW()),
(11, 11, 'Пирожное картошка', 'Шоколадное пирожное по классическому рецепту.', 210.00, '95 г', '/uploads/menu/placeholder.svg', 1, 0, 1, NOW(), NOW()),

-- Special Napoleon
(12, 12, 'Наполеон классический', 'Многослойный торт с заварным кремом.', 450.00, '180 г', '/uploads/menu/placeholder.svg', 1, 1, 0, NOW(), NOW()),
(12, 12, 'Наполеон малина', 'Наполеон с малиновым соусом.', 490.00, '190 г', '/uploads/menu/chia-mango.svg', 1, 0, 1, NOW(), NOW()),
(12, 12, 'Медовик', 'Медовые коржи и сметанный крем.', 390.00, '170 г', '/uploads/menu/placeholder.svg', 1, 0, 0, NOW(), NOW()),

-- Osteria Amici
(13, 13, 'Паста Карбонара', 'Паста с беконом, пармезаном и сливочным соусом.', 690.00, '320 г', '/uploads/menu/bruschetta.svg', 1, 1, 0, NOW(), NOW()),
(13, 13, 'Пицца Диавола', 'Острая салями, моцарелла и томатный соус.', 790.00, '480 г', '/uploads/menu/pizza-margherita.svg', 1, 0, 1, NOW(), NOW()),
(13, 13, 'Брускетта с томатами', 'Хрустящий хлеб, томаты и оливковое масло.', 340.00, '180 г', '/uploads/menu/bruschetta.svg', 1, 0, 0, NOW(), NOW()),

-- Fattoria Marian
(14, 14, 'Фетучини с грибами', 'Паста в сливочном соусе с грибами.', 710.00, '330 г', '/uploads/menu/bruschetta.svg', 1, 1, 0, NOW(), NOW()),
(14, 14, 'Маргарита Marian', 'Классическая пицца с томатным соусом и моцареллой.', 690.00, '450 г', '/uploads/menu/pizza-margherita.svg', 1, 0, 0, NOW(), NOW()),
(14, 14, 'Минестроне', 'Овощной суп по итальянскому рецепту.', 390.00, '300 г', '/uploads/menu/placeholder.svg', 1, 0, 1, NOW(), NOW()),

-- Dolce Far Niente
(15, 15, 'Ризотто с грибами', 'Кремовое ризотто с шампиньонами и пармезаном.', 730.00, '310 г', '/uploads/menu/placeholder.svg', 1, 1, 0, NOW(), NOW()),
(15, 15, 'Паста Болоньезе', 'Паста с мясным рагу и томатами.', 690.00, '340 г', '/uploads/menu/bruschetta.svg', 1, 0, 1, NOW(), NOW()),
(15, 15, 'Пицца Прошутто', 'Пицца с ветчиной, моцареллой и томатным соусом.', 790.00, '500 г', '/uploads/menu/pizza-4cheese.svg', 1, 0, 0, NOW(), NOW()),

-- Культура Встречи
(16, 16, 'Бефстроганов', 'Говядина в сливочном соусе с картофельным пюре.', 620.00, '360 г', '/uploads/menu/chicken-bowl.svg', 1, 1, 0, NOW(), NOW()),
(16, 16, 'Куриный суп с лапшой', 'Домашний куриный бульон с лапшой.', 340.00, '340 г', '/uploads/menu/placeholder.svg', 1, 0, 0, NOW(), NOW()),
(16, 16, 'Оливье', 'Классический салат с курицей.', 360.00, '220 г', '/uploads/menu/placeholder.svg', 1, 0, 1, NOW(), NOW()),

-- Кофемания
(17, 17, 'Сырники', 'Сырники со сметаной и ягодным соусом.', 420.00, '220 г', '/uploads/menu/chia-mango.svg', 1, 1, 0, NOW(), NOW()),
(17, 17, 'Клаб-сэндвич', 'Курица, бекон, томаты и фирменный соус.', 540.00, '290 г', '/uploads/menu/chicken-bowl.svg', 1, 0, 1, NOW(), NOW()),
(17, 17, 'Борщ', 'Классический борщ со сметаной.', 390.00, '350 г', '/uploads/menu/salmon-bowl.svg', 1, 0, 0, NOW(), NOW()),

-- Теремок
(18, 18, 'Блин Цезарь', 'Блин с курицей, сыром и соусом цезарь.', 340.00, '230 г', '/uploads/menu/chicken-bowl.svg', 1, 1, 0, NOW(), NOW()),
(18, 18, 'Блин с ветчиной и сыром', 'Классический блин с начинкой.', 290.00, '210 г', '/uploads/menu/placeholder.svg', 1, 0, 0, NOW(), NOW()),
(18, 18, 'Грибной суп', 'Суп-пюре из шампиньонов с сухариками.', 320.00, '320 г', '/uploads/menu/salmon-bowl.svg', 1, 0, 1, NOW(), NOW());

INSERT INTO menu_items (
    restaurant_id, category_id, name, description, price, weight, image,
    is_available, is_popular, is_new, created_at, updated_at
) VALUES
-- Вкусно и Точка
(1, 1, 'Чизбургер Гранд', 'Говяжья котлета, сыр чеддер, маринованные огурцы и соус.', 329.00, '250 г', '/uploads/menu/burger-bbq.svg', 1, 1, 0, NOW(), NOW()),
(1, 1, 'Биг Ролл Цезарь', 'Тортилья с курицей, салатом и соусом цезарь.', 279.00, '230 г', '/uploads/menu/burger-truffle.svg', 1, 0, 1, NOW(), NOW()),
(1, 1, 'Наггетсы 9 шт', 'Куриные наггетсы с двумя соусами на выбор.', 249.00, '200 г', '/uploads/menu/chicken-bowl.svg', 1, 1, 0, NOW(), NOW()),
(1, 1, 'Картофель по-деревенски', 'Запеченные картофельные дольки со специями.', 179.00, '170 г', '/uploads/menu/fries.svg', 1, 0, 0, NOW(), NOW()),
(1, 1, 'Молочный коктейль ваниль', 'Классический густой коктейль со сливочным вкусом.', 199.00, '300 мл', '/uploads/menu/chia-mango.svg', 1, 0, 1, NOW(), NOW()),

-- Burger King
(2, 2, 'Чизбургер BBQ', 'Сочная котлета, сыр, бекон и фирменный BBQ-соус.', 379.00, '280 г', '/uploads/menu/burger-bbq.svg', 1, 1, 0, NOW(), NOW()),
(2, 2, 'Кинг Комбо XL', 'Бургер, большая картошка фри и напиток 0.5.', 589.00, '620 г', '/uploads/menu/fries.svg', 1, 1, 1, NOW(), NOW()),
(2, 2, 'Стрипсы острые', 'Хрустящие куриные стрипсы с перчинкой.', 269.00, '190 г', '/uploads/menu/chicken-bowl.svg', 1, 0, 0, NOW(), NOW()),
(2, 2, 'Луковые кольца', 'Золотистые луковые кольца с соусом ранч.', 199.00, '140 г', '/uploads/menu/bruschetta.svg', 1, 0, 1, NOW(), NOW()),
(2, 2, 'Брауни', 'Шоколадный десерт с мягкой серединой.', 179.00, '95 г', '/uploads/menu/chia-mango.svg', 1, 0, 0, NOW(), NOW()),

-- Rostic's
(3, 3, 'Твистер Острый', 'Лепешка с курицей, салатом и острым соусом.', 299.00, '240 г', '/uploads/menu/burger-truffle.svg', 1, 1, 0, NOW(), NOW()),
(3, 3, 'Баскет Дуэт', 'Крылья и ножки в хрустящей панировке.', 649.00, '510 г', '/uploads/menu/chicken-bowl.svg', 1, 1, 1, NOW(), NOW()),
(3, 3, 'Наггетсы 12 шт', 'Куриные наггетсы, два соуса на выбор.', 329.00, '250 г', '/uploads/menu/chicken-bowl.svg', 1, 0, 0, NOW(), NOW()),
(3, 3, 'Картофель фри с сыром', 'Фри под сырным соусом и специями.', 219.00, '180 г', '/uploads/menu/fries.svg', 1, 0, 1, NOW(), NOW()),
(3, 3, 'Маффин шоколадный', 'Нежный кекс с жидкой шоколадной начинкой.', 169.00, '90 г', '/uploads/menu/chia-mango.svg', 1, 0, 0, NOW(), NOW()),

-- Tanuki
(4, 4, 'Ролл Филадельфия люкс', 'Лосось, сливочный сыр и авокадо.', 760.00, '270 г', '/uploads/menu/philadelphia.svg', 1, 1, 0, NOW(), NOW()),
(4, 4, 'Ролл Унаги маки', 'Угорь, огурец, соус унаги и кунжут.', 590.00, '210 г', '/uploads/menu/california.svg', 1, 0, 0, NOW(), NOW()),
(4, 4, 'Сет Дракон', 'Ассорти из запеченных и классических роллов.', 1990.00, '920 г', '/uploads/menu/set-premium.svg', 1, 1, 1, NOW(), NOW()),
(4, 4, 'Том ям с креветками', 'Острый суп на кокосовом молоке.', 640.00, '420 г', '/uploads/menu/salmon-bowl.svg', 1, 0, 1, NOW(), NOW()),
(4, 4, 'Гедза с курицей', 'Японские пельмени с курицей и соусом.', 430.00, '180 г', '/uploads/menu/bruschetta.svg', 1, 0, 0, NOW(), NOW()),

-- Pinskiy GO
(5, 5, 'Ролл Лосось терияки', 'Лосось, сливочный сыр, соус терияки.', 730.00, '260 г', '/uploads/menu/philadelphia.svg', 1, 1, 0, NOW(), NOW()),
(5, 5, 'Сет Fusion', 'Премиальный сет из 32 роллов.', 2290.00, '980 г', '/uploads/menu/set-premium.svg', 1, 1, 1, NOW(), NOW()),
(5, 5, 'Поке с тунцом', 'Рис, тунец, эдамаме, авокадо, соус понзу.', 790.00, '360 г', '/uploads/menu/salmon-bowl.svg', 1, 0, 1, NOW(), NOW()),
(5, 5, 'Бао с креветкой', 'Паровые булочки с креветкой темпура.', 520.00, '210 г', '/uploads/menu/bruschetta.svg', 1, 0, 0, NOW(), NOW()),
(5, 5, 'Моти манго', 'Японский десерт с кремовой начинкой.', 320.00, '110 г', '/uploads/menu/chia-mango.svg', 1, 0, 0, NOW(), NOW()),

-- Якитория
(6, 6, 'Ролл Филадельфия', 'Лосось, сыр, огурец и рис премиум.', 690.00, '250 г', '/uploads/menu/philadelphia.svg', 1, 1, 0, NOW(), NOW()),
(6, 6, 'Сет Самурай', 'Набор из 28 роллов и гунканов.', 1850.00, '860 г', '/uploads/menu/set-premium.svg', 1, 1, 1, NOW(), NOW()),
(6, 6, 'Удон с курицей', 'Лапша удон с овощами и соусом терияки.', 620.00, '370 г', '/uploads/menu/chicken-bowl.svg', 1, 0, 0, NOW(), NOW()),
(6, 6, 'Мисо суп', 'Классический японский суп с тофу.', 320.00, '300 г', '/uploads/menu/salmon-bowl.svg', 1, 0, 1, NOW(), NOW()),
(6, 6, 'Темпура креветки', 'Хрустящие креветки в легком кляре.', 540.00, '190 г', '/uploads/menu/bruschetta.svg', 1, 0, 0, NOW(), NOW()),

-- Dodo Pizza
(7, 7, 'Пицца Карбонара', 'Бекон, моцарелла, сливочный соус.', 729.00, '490 г', '/uploads/menu/pizza-4cheese.svg', 1, 1, 1, NOW(), NOW()),
(7, 7, 'Пицца Гавайская', 'Курица, ананас, соус и сыр.', 679.00, '470 г', '/uploads/menu/pizza-margherita.svg', 1, 0, 0, NOW(), NOW()),
(7, 7, 'Крылышки BBQ', 'Куриные крылья с соусом BBQ.', 399.00, '260 г', '/uploads/menu/chicken-bowl.svg', 1, 1, 0, NOW(), NOW()),
(7, 7, 'Картофельные дольки', 'Запеченные дольки с травами.', 199.00, '170 г', '/uploads/menu/fries.svg', 1, 0, 0, NOW(), NOW()),
(7, 7, 'Чизкейк Нью-Йорк', 'Сливочный десерт с песочной основой.', 289.00, '130 г', '/uploads/menu/chia-mango.svg', 1, 0, 1, NOW(), NOW()),

-- Pizza City
(8, 8, 'Пицца Пепперони', 'Острая колбаса пепперони и моцарелла.', 699.00, '490 г', '/uploads/menu/pizza-margherita.svg', 1, 1, 0, NOW(), NOW()),
(8, 8, 'Пицца 4 сыра', 'Моцарелла, дорблю, чеддер и пармезан.', 759.00, '500 г', '/uploads/menu/pizza-4cheese.svg', 1, 1, 1, NOW(), NOW()),
(8, 8, 'Цезарь ролл', 'Лепешка с курицей и соусом цезарь.', 319.00, '230 г', '/uploads/menu/chicken-bowl.svg', 1, 0, 0, NOW(), NOW()),
(8, 8, 'Куриные крылья', 'Острые крылья с фирменным соусом.', 379.00, '240 г', '/uploads/menu/chicken-bowl.svg', 1, 0, 1, NOW(), NOW()),
(8, 8, 'Чесночные хлебцы', 'Хрустящие хлебцы с сырным дипом.', 219.00, '160 г', '/uploads/menu/bruschetta.svg', 1, 0, 0, NOW(), NOW()),

-- Domino Pizza
(9, 9, 'Пицца Пепперони классика', 'Пепперони, томатный соус, сыр.', 719.00, '500 г', '/uploads/menu/pizza-margherita.svg', 1, 1, 0, NOW(), NOW()),
(9, 9, 'Пицца Мясной микс', 'Три вида мяса и двойной сыр.', 829.00, '540 г', '/uploads/menu/pizza-4cheese.svg', 1, 1, 1, NOW(), NOW()),
(9, 9, 'Додстер BBQ', 'Ролл с курицей, сыром и соусом BBQ.', 319.00, '210 г', '/uploads/menu/burger-truffle.svg', 1, 0, 0, NOW(), NOW()),
(9, 9, 'Картофель фри XL', 'Большая порция хрустящего картофеля.', 229.00, '220 г', '/uploads/menu/fries.svg', 1, 0, 0, NOW(), NOW()),
(9, 9, 'Куриные кусочки', 'Куриные байтсы с чесночным соусом.', 349.00, '210 г', '/uploads/menu/chicken-bowl.svg', 1, 0, 1, NOW(), NOW()),

-- One Love
(10, 10, 'Павлова с ягодами', 'Воздушный десерт с кремом и ягодами.', 450.00, '170 г', '/uploads/menu/chia-mango.svg', 1, 1, 1, NOW(), NOW()),
(10, 10, 'Торт Красный бархат', 'Нежный бисквит и сливочный крем.', 490.00, '190 г', '/uploads/menu/placeholder.svg', 1, 1, 0, NOW(), NOW()),
(10, 10, 'Тарт лимонный', 'Песочная основа и лимонный курд.', 360.00, '140 г', '/uploads/menu/placeholder.svg', 1, 0, 0, NOW(), NOW()),
(10, 10, 'Макарон ассорти', 'Набор из 6 макарон разных вкусов.', 390.00, '120 г', '/uploads/menu/placeholder.svg', 1, 0, 1, NOW(), NOW()),
(10, 10, 'Синнабон мини', 'Булочка с корицей и кремом.', 250.00, '110 г', '/uploads/menu/placeholder.svg', 1, 0, 0, NOW(), NOW()),

-- 11/47 Bakery
(11, 11, 'Круассан с шоколадом', 'Слоеный круассан с шоколадной начинкой.', 290.00, '115 г', '/uploads/menu/placeholder.svg', 1, 1, 0, NOW(), NOW()),
(11, 11, 'Эклер фисташковый', 'Нежное заварное пирожное с кремом.', 280.00, '95 г', '/uploads/menu/placeholder.svg', 1, 0, 1, NOW(), NOW()),
(11, 11, 'Тарталетка ягодная', 'Песочная тарталетка с сезонными ягодами.', 340.00, '130 г', '/uploads/menu/chia-mango.svg', 1, 0, 0, NOW(), NOW()),
(11, 11, 'Даниш с яблоком', 'Слоеная выпечка с яблочной начинкой.', 260.00, '120 г', '/uploads/menu/placeholder.svg', 1, 0, 0, NOW(), NOW()),
(11, 11, 'Латте ваниль', 'Кофейный напиток с ванильным сиропом.', 230.00, '320 мл', '/uploads/menu/chia-mango.svg', 1, 0, 1, NOW(), NOW()),

-- Special Napoleon
(12, 12, 'Наполеон классика XL', 'Увеличенная порция фирменного наполеона.', 520.00, '230 г', '/uploads/menu/placeholder.svg', 1, 1, 0, NOW(), NOW()),
(12, 12, 'Наполеон клубника', 'Слоеный десерт с клубничным кремом.', 510.00, '210 г', '/uploads/menu/chia-mango.svg', 1, 1, 1, NOW(), NOW()),
(12, 12, 'Торт Прага', 'Шоколадный торт с кремом и глазурью.', 470.00, '190 г', '/uploads/menu/placeholder.svg', 1, 0, 0, NOW(), NOW()),
(12, 12, 'Медовик карамель', 'Медовые коржи и карамельный крем.', 430.00, '180 г', '/uploads/menu/placeholder.svg', 1, 0, 0, NOW(), NOW()),
(12, 12, 'Пирожное картошка', 'Классическое пирожное по домашнему рецепту.', 220.00, '90 г', '/uploads/menu/placeholder.svg', 1, 0, 1, NOW(), NOW()),

-- Osteria Amici
(13, 13, 'Паста Болоньезе', 'Тальятелле с мясным рагу и пармезаном.', 720.00, '340 г', '/uploads/menu/bruschetta.svg', 1, 1, 0, NOW(), NOW()),
(13, 13, 'Пицца Маргарита', 'Томатный соус, моцарелла и базилик.', 690.00, '470 г', '/uploads/menu/pizza-margherita.svg', 1, 0, 0, NOW(), NOW()),
(13, 13, 'Ризотто с грибами', 'Кремовое ризотто с белыми грибами.', 760.00, '320 г', '/uploads/menu/salmon-bowl.svg', 1, 1, 1, NOW(), NOW()),
(13, 13, 'Салат Капрезе', 'Моцарелла, томаты, базилик и песто.', 520.00, '230 г', '/uploads/menu/salmon-bowl.svg', 1, 0, 0, NOW(), NOW()),
(13, 13, 'Тирамису', 'Классический итальянский десерт.', 420.00, '160 г', '/uploads/menu/chia-mango.svg', 1, 0, 1, NOW(), NOW()),

-- Fattoria Marian
(14, 14, 'Паста с морепродуктами', 'Спагетти с мидиями и креветками.', 810.00, '350 г', '/uploads/menu/salmon-bowl.svg', 1, 1, 1, NOW(), NOW()),
(14, 14, 'Лазанья болоньезе', 'Слоеная паста с мясным соусом.', 740.00, '360 г', '/uploads/menu/bruschetta.svg', 1, 1, 0, NOW(), NOW()),
(14, 14, 'Пицца 4 сыра', 'Сырная пицца на тонком тесте.', 770.00, '500 г', '/uploads/menu/pizza-4cheese.svg', 1, 0, 0, NOW(), NOW()),
(14, 14, 'Брускетта с томатами', 'Поджаренный хлеб с томатами и базиликом.', 360.00, '170 г', '/uploads/menu/bruschetta.svg', 1, 0, 0, NOW(), NOW()),
(14, 14, 'Панакота', 'Нежный сливочный десерт с ягодным соусом.', 390.00, '150 г', '/uploads/menu/chia-mango.svg', 1, 0, 1, NOW(), NOW()),

-- Dolce Far Niente
(15, 15, 'Паста Альфредо', 'Фетучини в сливочном соусе с курицей.', 740.00, '340 г', '/uploads/menu/chicken-bowl.svg', 1, 1, 0, NOW(), NOW()),
(15, 15, 'Ризотто с креветками', 'Ризотто с креветками и пармезаном.', 790.00, '330 г', '/uploads/menu/salmon-bowl.svg', 1, 1, 1, NOW(), NOW()),
(15, 15, 'Пицца Пепперони', 'Острая салями, сыр и томатный соус.', 760.00, '500 г', '/uploads/menu/pizza-margherita.svg', 1, 0, 0, NOW(), NOW()),
(15, 15, 'Минестроне', 'Легкий овощной суп по классическому рецепту.', 420.00, '320 г', '/uploads/menu/salmon-bowl.svg', 1, 0, 0, NOW(), NOW()),
(15, 15, 'Канноли', 'Хрустящие трубочки с рикоттой.', 360.00, '130 г', '/uploads/menu/chia-mango.svg', 1, 0, 1, NOW(), NOW()),

-- Культура Встречи
(16, 16, 'Пельмени домашние', 'Пельмени из говядины и свинины со сметаной.', 490.00, '340 г', '/uploads/menu/chicken-bowl.svg', 1, 1, 0, NOW(), NOW()),
(16, 16, 'Солянка мясная', 'Насыщенный суп с копченостями.', 430.00, '360 г', '/uploads/menu/salmon-bowl.svg', 1, 1, 1, NOW(), NOW()),
(16, 16, 'Котлета по-киевски', 'Куриная котлета с маслом и травами.', 540.00, '300 г', '/uploads/menu/chicken-bowl.svg', 1, 0, 0, NOW(), NOW()),
(16, 16, 'Салат Оливье', 'Классический рецепт с нежной курицей.', 370.00, '230 г', '/uploads/menu/salmon-bowl.svg', 1, 0, 0, NOW(), NOW()),
(16, 16, 'Морс клюквенный', 'Домашний ягодный морс без консервантов.', 180.00, '300 мл', '/uploads/menu/chia-mango.svg', 1, 0, 1, NOW(), NOW()),

-- Кофемания
(17, 17, 'Скрэмбл с лососем', 'Нежный скрэмбл, тост и слабосоленый лосось.', 690.00, '290 г', '/uploads/menu/salmon-bowl.svg', 1, 1, 1, NOW(), NOW()),
(17, 17, 'Паста с индейкой', 'Теплая паста с индейкой и сливочным соусом.', 760.00, '350 г', '/uploads/menu/chicken-bowl.svg', 1, 1, 0, NOW(), NOW()),
(17, 17, 'Капучино большой', 'Классический капучино на зерне specialty.', 290.00, '350 мл', '/uploads/menu/chia-mango.svg', 1, 0, 0, NOW(), NOW()),
(17, 17, 'Эклер ванильный', 'Воздушный эклер с ванильным кремом.', 280.00, '100 г', '/uploads/menu/placeholder.svg', 1, 0, 0, NOW(), NOW()),
(17, 17, 'Блинчики с творогом', 'Теплые блинчики с нежной творожной начинкой.', 420.00, '250 г', '/uploads/menu/chicken-bowl.svg', 1, 0, 1, NOW(), NOW()),

-- Теремок
(18, 18, 'Блин с курицей и грибами', 'Сытный блин с нежной начинкой.', 360.00, '240 г', '/uploads/menu/chicken-bowl.svg', 1, 1, 0, NOW(), NOW()),
(18, 18, 'Блин с семгой', 'Блин с творожным сыром и слабосоленой семгой.', 450.00, '220 г', '/uploads/menu/salmon-bowl.svg', 1, 1, 1, NOW(), NOW()),
(18, 18, 'Щи деревенские', 'Классические щи с капустой и зеленью.', 330.00, '350 г', '/uploads/menu/salmon-bowl.svg', 1, 0, 0, NOW(), NOW()),
(18, 18, 'Каша гречневая с грибами', 'Домашняя гречка с грибным соусом.', 310.00, '300 г', '/uploads/menu/chicken-bowl.svg', 1, 0, 0, NOW(), NOW()),
(18, 18, 'Компот ягодный', 'Домашний компот из сезонных ягод.', 160.00, '300 мл', '/uploads/menu/chia-mango.svg', 1, 0, 1, NOW(), NOW());

INSERT INTO reviews (user_id, restaurant_id, rating, comment, is_approved, created_at, updated_at) VALUES
(2, 7, 5, 'Очень быстрая доставка и горячая пицца.', 1, NOW(), NOW()),
(3, 4, 5, 'Роллы свежие, привезли аккуратно.', 1, NOW(), NOW()),
(2, 1, 4, 'Хорошее комбо, удобный заказ через сайт.', 1, NOW(), NOW()),
(3, 13, 5, 'Отличная паста и приятная упаковка.', 1, NOW(), NOW()),
(2, 10, 5, 'Десерты отличные, особенно чизкейк.', 1, NOW(), NOW()),
(3, 18, 4, 'Блины вкусные, доставка вовремя.', 1, NOW(), NOW());

INSERT INTO user_addresses (
    user_id, title, address_line, entrance, floor, apartment, intercom_code, comment, created_at, updated_at
) VALUES
(2, 'Дом', 'Москва, улица Пушкинская, дом 10, кв 15', '2', '5', '15', '45K', 'Позвонить за 5 минут', NOW(), NOW()),
(3, 'Офис', 'Москва, проспект Мира, 54', '1', '3', '12', NULL, 'Охрана пропускает по звонку', NOW(), NOW());

-- Пароли для теста:
-- admin@foodhub.local / admin123
-- irina@example.com / user12345
-- max@example.com / user12345
