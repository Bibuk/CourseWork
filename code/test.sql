USE pvzbd;

SET FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE `notification`;
TRUNCATE TABLE `payment`;
TRUNCATE TABLE `order_item`;
TRUNCATE TABLE `order`;
TRUNCATE TABLE `cart_item`;
TRUNCATE TABLE `cart`;
TRUNCATE TABLE `product`;
TRUNCATE TABLE `brand`;
TRUNCATE TABLE `category`;
TRUNCATE TABLE `site_config`;
TRUNCATE TABLE `tenant_admin`;
TRUNCATE TABLE `user_profile`;
TRUNCATE TABLE `auth_user`;
TRUNCATE TABLE `tenant`;

SET FOREIGN_KEY_CHECKS = 1;

-- 1. TENANTS (магазины)

INSERT INTO `tenant` (name, url, domain, type, address, city, postal_code, region, email, phone, working_hours, features, is_active) VALUES
('TechMart',       'techmart',       'techmart.ru',       'premium',  'ул. Арбат, 12',            'Москва',          '119002', 'Московская область',    'hello@techmart.ru',      '+74951110011', '{"mon-fri":"9:00-21:00","sat-sun":"10:00-20:00"}',  '{"reviews":true,"wishlist":true}',  1),
('GadgetZone',     'gadgetzone',     'gadgetzone.ru',     'standard', 'пр. Невский, 88',           'Санкт-Петербург', '191025', 'Ленинградская область', 'support@gadgetzone.ru',  '+78122223344', '{"mon-fri":"10:00-20:00","sat":"11:00-19:00"}',     '{"reviews":true,"wishlist":false}', 1),
('HomeAppliances', 'homeappliances', 'homeappliances.ru', 'standard', 'ул. Красная, 5',            'Краснодар',       '350000', 'Краснодарский край',    'info@homeappliances.ru', '+78612334455', '{"mon-sat":"9:00-20:00"}',                         '{"reviews":true,"wishlist":true}',  1),
('SportPro',       'sportpro',       'sportpro.ru',       'standard', 'ул. Вайнера, 9',            'Екатеринбург',    '620014', 'Свердловская область',  'info@sportpro.ru',       '+73432556677', '{"mon-fri":"10:00-21:00","sat-sun":"10:00-19:00"}', '{"reviews":false,"wishlist":true}', 1),
('KidsWorld',      'kidsworld',      'kidsworld.ru',      'basic',    'ул. Большая Покровская, 3', 'Нижний Новгород', '603000', 'Нижегородская область', 'hello@kidsworld.ru',     '+78312778899', '{"mon-sat":"9:00-20:00","sun":"10:00-18:00"}',      '{"reviews":true,"wishlist":false}', 1);

-- 2. ПОЛЬЗОВАТЕЛИ

INSERT INTO `auth_user` (password, username, first_name, last_name, email, is_staff, is_superuser, is_active, phone, role) VALUES
-- Суперадмин
('pbkdf2_sha256$600000$rEd3kLmN2pQs$V8xWjKz1A+bCdEfGhIjKlMnOpQrStUvWxYzABCDE=', 'superadmin',   'Дмитрий',  'Орлов',     'superadmin@techmart.ru',    1, 1, 1, '+79161000001', 'admin'),
-- Менеджеры магазинов
('pbkdf2_sha256$600000$sAl7tBkM3xYz$H2vNjLp4Q+rStUvWxYzABCDEfGhIjKlMnOpQrSt=', 'mgr_techmart', 'Анна',     'Семёнова',  'manager@techmart.ru',       1, 0, 1, '+79161000002', 'manager'),
('pbkdf2_sha256$600000$uZq9wErF5cVb$J4xPkMr6S+tUvWxYzABCDEfGhIjKlMnOpQrStUv=', 'mgr_gadget',   'Сергей',   'Васильев',  'manager@gadgetzone.ru',     1, 0, 1, '+79161000003', 'manager'),
('pbkdf2_sha256$600000$vXn8yDs4bWc$K5yQlNs7T+uVwXyZaBCDEfGhIjKlMnOpQrStUvW=',  'mgr_home',     'Ольга',    'Титова',    'manager@homeappliances.ru', 1, 0, 1, '+79161000004', 'manager'),
('pbkdf2_sha256$600000$wYo5zEt9cXd$L6zRmOt8U+vWxYzaBCDEfGhIjKlMnOpQrStUvWx=',  'mgr_sport',    'Павел',    'Кузнецов',  'manager@sportpro.ru',       1, 0, 1, '+79161000005', 'manager'),
('pbkdf2_sha256$600000$xZp6aFu0dYe$M7aSnPu9V+wXyZaBCDEfGhIjKlMnOpQrStUvWxY=',  'mgr_kids',     'Татьяна',  'Белова',    'manager@kidsworld.ru',      1, 0, 1, '+79161000006', 'manager'),
-- Покупатели
('pbkdf2_sha256$600000$yAq7bGv1eZf$N8bToQv0W+xYzaBCDEfGhIjKlMnOpQrStUvWxYz=',  'ivan_petrov',  'Иван',     'Петров',    'ivan.petrov@gmail.com',     0, 0, 1, '+79031112233', 'customer'),
('pbkdf2_sha256$600000$zBr8cHw2faG$O9cUpRw1X+yZaBCDEfGhIjKlMnOpQrStUvWxYzA=',  'maria_kozl',   'Мария',    'Козлова',   'maria.kozlova@yandex.ru',   0, 0, 1, '+79052223344', 'customer'),
('pbkdf2_sha256$600000$aCs9dIx3gbH$P0dVqSx2Y+zaBCDEfGhIjKlMnOpQrStUvWxYzAB=',  'alex_nov',     'Александр','Новиков',   'alex.novikov@mail.ru',      0, 0, 1, '+79163334455', 'customer'),
('pbkdf2_sha256$600000$bDt0eJy4hcI$Q1eWrTy3Z+aBCDEfGhIjKlMnOpQrStUvWxYzABC=',  'elena_sorok',  'Елена',    'Сорокина',  'e.sorokina@gmail.com',      0, 0, 1, '+79264445566', 'customer'),
('pbkdf2_sha256$600000$cEu1fKz5idJ$R2fXsUz4a+BCDEfGhIjKlMnOpQrStUvWxYzABCD=',  'nikita_voron', 'Никита',   'Воронов',   'n.voronov@yandex.ru',       0, 0, 1, '+79175556677', 'customer'),
('pbkdf2_sha256$600000$dFv2gLa6jeK$S3gYtVa5b+CDEfGhIjKlMnOpQrStUvWxYzABCDE=',  'olga_mike',    'Ольга',    'Михайлова', 'olga.m@mail.ru',            0, 0, 1, '+79386667788', 'customer'),
('pbkdf2_sha256$600000$eGw3hMb7kfL$T4hZuWb6c+DEfGhIjKlMnOpQrStUvWxYzABCDEf=',  'andrey_leb',   'Андрей',   'Лебедев',   'andrey.leb@gmail.com',      0, 0, 1, '+79097778899', 'customer'),
('pbkdf2_sha256$600000$fHx4iNc8lgM$U5iaVXc7d+EfGhIjKlMnOpQrStUvWxYzABCDEfG=',  'svetlana_fil', 'Светлана', 'Филиппова', 's.filippova@yandex.ru',     0, 0, 1, '+79218889900', 'customer'),
('pbkdf2_sha256$600000$gIy5jOd9mhN$V6jbWYd8e+FfGhIjKlMnOpQrStUvWxYzABCDEfG=',  'roman_stepan', 'Роман',    'Степанов',  'roman.step@mail.ru',        0, 0, 1, '+79129990011', 'customer'),
('pbkdf2_sha256$600000$hJz6kPe0niO$W7kcXZe9f+GhIjKlMnOpQrStUvWxYzABCDEfGhI=',  'daria_kost',   'Дарья',    'Костина',   'd.kostina@gmail.com',       0, 0, 1, '+79030001122', 'customer');

-- 3. ПРОФИЛИ ПОЛЬЗОВАТЕЛЕЙ

INSERT INTO `user_profile` (user_id, avatar_url, bio, address, city, postal_code) VALUES
(1,  NULL,                                         'Суперадмин системы',      'ул. Арбат, 12',              'Москва',          '119002'),
(2,  NULL,                                         'Менеджер TechMart',       'ул. Арбат, 12',              'Москва',          '119002'),
(3,  NULL,                                         'Менеджер GadgetZone',     'пр. Невский, 88',            'Санкт-Петербург', '191025'),
(4,  NULL,                                         'Менеджер HomeAppliances', 'ул. Красная, 5',             'Краснодар',       '350000'),
(5,  NULL,                                         'Менеджер SportPro',       'ул. Вайнера, 9',             'Екатеринбург',    '620014'),
(6,  NULL,                                         'Менеджер KidsWorld',      'ул. Большая Покровская, 3',  'Нижний Новгород', '603000'),
(7,  'https://cdn.example.com/avatars/ivan.jpg',   NULL,                      'ул. Тверская, 14, кв. 22',   'Москва',          '125009'),
(8,  'https://cdn.example.com/avatars/maria.jpg',  NULL,                      'ул. Садовая, 33, кв. 5',     'Санкт-Петербург', '190005'),
(9,  NULL,                                         NULL,                      'ул. Ленина, 7, кв. 18',      'Новосибирск',     '630004'),
(10, 'https://cdn.example.com/avatars/elena.jpg',  NULL,                      'пр. Мира, 41, кв. 9',        'Екатеринбург',    '620000'),
(11, NULL,                                         NULL,                      'ул. Пушкина, 2, кв. 3',      'Казань',          '420000'),
(12, NULL,                                         NULL,                      'ул. Гагарина, 18, кв. 7',    'Самара',          '443001'),
(13, NULL,                                         NULL,                      'ул. Советская, 55, кв. 12',  'Ростов-на-Дону',  '344000'),
(14, NULL,                                         NULL,                      'ул. Коммунистическая, 3',    'Уфа',             '450000'),
(15, NULL,                                         NULL,                      'ул. Чехова, 22, кв. 4',      'Пермь',           '614000'),
(16, NULL,                                         NULL,                      'ул. Октябрьская, 9, кв. 11', 'Воронеж',         '394000');

-- 4. АДМИНИСТРАТОРЫ МАГАЗИНОВ

INSERT INTO `tenant_admin` (tenant_id, user_id) VALUES
(1, 1), (1, 2),
(2, 1), (2, 3),
(3, 1), (3, 4),
(4, 1), (4, 5),
(5, 1), (5, 6);


-- 5. КОНФИГУРАЦИЯ САЙТОВ

INSERT INTO `site_config` (tenant_id, `key`, value, description, is_active) VALUES
(1, 'currency',        '"RUB"', 'Валюта',                         1),
(1, 'free_ship_from',  '5000',  'Бесплатная доставка от (руб.)',  1),
(1, 'default_tax_pct', '20',    'НДС (%)',                        1),
(1, 'max_cart_items',  '50',    'Макс. кол-во позиций в корзине', 1),
(2, 'currency',        '"RUB"', 'Валюта',                         1),
(2, 'free_ship_from',  '4000',  'Бесплатная доставка от (руб.)',  1),
(2, 'default_tax_pct', '20',    'НДС (%)',                        1),
(2, 'max_cart_items',  '30',    'Макс. кол-во позиций в корзине', 1),
(3, 'currency',        '"RUB"', 'Валюта',                         1),
(3, 'free_ship_from',  '6000',  'Бесплатная доставка от (руб.)',  1),
(3, 'default_tax_pct', '20',    'НДС (%)',                        1),
(4, 'currency',        '"RUB"', 'Валюта',                         1),
(4, 'free_ship_from',  '3000',  'Бесплатная доставка от (руб.)',  1),
(4, 'default_tax_pct', '20',    'НДС (%)',                        1),
(5, 'currency',        '"RUB"', 'Валюта',                         1),
(5, 'free_ship_from',  '2500',  'Бесплатная доставка от (руб.)',  1),
(5, 'default_tax_pct', '20',    'НДС (%)',                        1);

-- 6. КАТЕГОРИИ

-- TechMart (tenant 1)
INSERT INTO `category` (tenant_id, parent_id, name, slug, description, is_active, `order`) VALUES
(1, NULL, 'Смартфоны и гаджеты', 'smartphones-gadgets', 'Смартфоны, планшеты и аксессуары', 1, 1),  -- id 1
(1, NULL, 'Ноутбуки и ПК',       'laptops-pc',          'Ноутбуки, компьютеры, мониторы',    1, 2),  -- id 2
(1, NULL, 'Аудиотехника',        'audio',               'Наушники, колонки, усилители',      1, 3),  -- id 3
(1, NULL, 'Фото и видео',        'photo-video',         'Камеры, объективы, штативы',        1, 4),  -- id 4
(1, 1,   'Смартфоны',            'smartphones',         'Смартфоны всех брендов',            1, 1),  -- id 5
(1, 1,   'Планшеты',             'tablets',             'Планшеты и электронные книги',      1, 2),  -- id 6
(1, 1,   'Умные часы',           'smartwatches',        'Умные часы и браслеты',             1, 3),  -- id 7
(1, 2,   'Ноутбуки',             'laptops',             'Ноутбуки для работы и игр',         1, 1),  -- id 8
(1, 2,   'Игровые ПК',           'gaming-pc',           'Готовые игровые компьютеры',        1, 2),  -- id 9
(1, 3,   'Наушники',             'headphones',          'Проводные и беспроводные наушники', 1, 1),  -- id 10
(1, 3,   'Беспроводные колонки', 'bluetooth-speakers',  'Портативные bluetooth-колонки',     1, 2);  -- id 11

-- GadgetZone (tenant 2)
INSERT INTO `category` (tenant_id, parent_id, name, slug, description, is_active, `order`) VALUES
(2, NULL, 'Смартфоны',     'gz-smartphones', 'Смартфоны и телефоны',             1, 1),  -- id 12
(2, NULL, 'Аксессуары',    'gz-accessories', 'Чехлы, кабели, зарядки',           1, 2),  -- id 13
(2, NULL, 'Умный дом',     'gz-smarthome',   'Умные колонки, лампы, розетки',    1, 3);  -- id 14

-- HomeAppliances (tenant 3)
INSERT INTO `category` (tenant_id, parent_id, name, slug, description, is_active, `order`) VALUES
(3, NULL, 'Крупная техника',  'ha-major',    'Холодильники, стиральные машины',   1, 1),  -- id 15
(3, NULL, 'Мелкая техника',   'ha-small',    'Чайники, кофемашины, пылесосы',     1, 2),  -- id 16
(3, NULL, 'Климат',           'ha-climate',  'Кондиционеры, обогреватели',        1, 3);  -- id 17

-- SportPro (tenant 4)
INSERT INTO `category` (tenant_id, parent_id, name, slug, description, is_active, `order`) VALUES
(4, NULL, 'Фитнес',         'fitness',      'Тренажёры и фитнес-оборудование',   1, 1),  -- id 18
(4, NULL, 'Велоспорт',      'cycling',      'Велосипеды и аксессуары',           1, 2),  -- id 19
(4, NULL, 'Командные виды', 'team-sports',  'Футбол, баскетбол, волейбол',       1, 3),  -- id 20
(4, 18,  'Беговые дорожки', 'treadmills',   'Беговые дорожки для дома и зала',   1, 1),  -- id 21
(4, 18,  'Гантели и штанги','weights',      'Свободные веса',                    1, 2);  -- id 22

-- KidsWorld (tenant 5)
INSERT INTO `category` (tenant_id, parent_id, name, slug, description, is_active, `order`) VALUES
(5, NULL, 'Игрушки',        'kw-toys',      'Игрушки для детей всех возрастов',  1, 1),  -- id 23
(5, NULL, 'Книги и игры',   'kw-books',     'Детские книги и настольные игры',   1, 2),  -- id 24
(5, NULL, 'Одежда',         'kw-clothes',   'Детская одежда и обувь',            1, 3),  -- id 25
(5, 23,  'Конструкторы',    'kw-lego',      'Конструкторы и сборные модели',     1, 1),  -- id 26
(5, 23,  'Мягкие игрушки',  'kw-plush',     'Плюшевые медведи и персонажи',      1, 2);  -- id 27

-- 7. БРЕНДЫ

-- TechMart (tenant 1)
INSERT INTO `brand` (tenant_id, name, slug, logo_url, is_active) VALUES
(1, 'Apple',   'apple',   'https://cdn.techmart.ru/brands/apple.png',   1),  -- id 1
(1, 'Samsung', 'samsung', 'https://cdn.techmart.ru/brands/samsung.png', 1),  -- id 2
(1, 'Sony',    'sony',    'https://cdn.techmart.ru/brands/sony.png',    1),  -- id 3
(1, 'Xiaomi',  'xiaomi',  'https://cdn.techmart.ru/brands/xiaomi.png',  1),  -- id 4
(1, 'Lenovo',  'lenovo',  'https://cdn.techmart.ru/brands/lenovo.png',  1),  -- id 5
(1, 'ASUS',    'asus',    'https://cdn.techmart.ru/brands/asus.png',    1),  -- id 6
(1, 'JBL',     'jbl',     'https://cdn.techmart.ru/brands/jbl.png',     1),  -- id 7
(1, 'Bose',    'bose',    'https://cdn.techmart.ru/brands/bose.png',    1),  -- id 8
-- GadgetZone (tenant 2)
(2, 'Apple',   'gz-apple',   'https://cdn.gadgetzone.ru/brands/apple.png',   1),  -- id 9
(2, 'Samsung', 'gz-samsung', 'https://cdn.gadgetzone.ru/brands/samsung.png', 1),  -- id 10
(2, 'Xiaomi',  'gz-xiaomi',  'https://cdn.gadgetzone.ru/brands/xiaomi.png',  1),  -- id 11
-- HomeAppliances (tenant 3)
(3, 'Bosch',   'bosch',   'https://cdn.homeappliances.ru/brands/bosch.png',   1),  -- id 12
(3, 'LG',      'lg',      'https://cdn.homeappliances.ru/brands/lg.png',      1),  -- id 13
(3, 'Philips', 'philips', 'https://cdn.homeappliances.ru/brands/philips.png', 1),  -- id 14
-- SportPro (tenant 4)
(4, 'Nike',    'nike',    'https://cdn.sportpro.ru/brands/nike.png',    1),  -- id 15
(4, 'Adidas',  'adidas',  'https://cdn.sportpro.ru/brands/adidas.png',  1),  -- id 16
(4, 'Reebok',  'reebok',  'https://cdn.sportpro.ru/brands/reebok.png',  1),  -- id 17
(4, 'Torneo',  'torneo',  'https://cdn.sportpro.ru/brands/torneo.png',  1),  -- id 18
-- KidsWorld (tenant 5)
(5, 'LEGO',    'lego',    'https://cdn.kidsworld.ru/brands/lego.png',   1),  -- id 19
(5, 'Hasbro',  'hasbro',  'https://cdn.kidsworld.ru/brands/hasbro.png', 1),  -- id 20
(5, 'Chicco',  'chicco',  'https://cdn.kidsworld.ru/brands/chicco.png', 1);  -- id 21

-- 8. ТОВАРЫ

-- ---- TechMart (tenant 1) ----
INSERT INTO `product` (tenant_id, category_id, brand_id, name, slug, description, sku, price, compare_price, stock_quantity, track_inventory, is_active, is_featured) VALUES
-- Смартфоны (category 5)
(1, 5, 1, 'Apple iPhone 15 Pro 256GB',      'apple-iphone-15-pro-256',      'Флагманский смартфон Apple с титановым корпусом, чипом A17 Pro и камерой 48 Мп.',    'APP-IP15P-256',   129990.00, 149990.00, 40,  1, 1, 1),  -- id 1
(1, 5, 1, 'Apple iPhone 15 128GB',          'apple-iphone-15-128',          'Смартфон Apple с Dynamic Island, чипом A16 Bionic и USB-C.',                          'APP-IP15-128',     89990.00,  99990.00, 60,  1, 1, 1),  -- id 2
(1, 5, 2, 'Samsung Galaxy S24 Ultra 256GB', 'samsung-s24-ultra-256',        'Флагман Samsung с S Pen, 200 Мп камерой и Galaxy AI.',                               'SAM-S24U-256',    119990.00, 134990.00, 35,  1, 1, 1),  -- id 3
(1, 5, 2, 'Samsung Galaxy A55 128GB',       'samsung-galaxy-a55-128',       'Стильный смартфон с AMOLED 120 Гц и тройной камерой.',                               'SAM-A55-128',      39990.00,  44990.00, 80,  1, 1, 0),  -- id 4
(1, 5, 4, 'Xiaomi 14 Pro 512GB',            'xiaomi-14-pro-512',            'Флагман Xiaomi с камерой Leica и процессором Snapdragon 8 Gen 3.',                    'XIA-14P-512',      79990.00,  89990.00, 25,  1, 1, 1),  -- id 5
(1, 5, 4, 'Xiaomi Redmi Note 13 Pro 256GB', 'xiaomi-redmi-note-13-pro-256', 'Смартфон с 200 Мп камерой и быстрой зарядкой 67 Вт.',                               'XIA-RN13P-256',    29990.00,  34990.00, 120, 1, 1, 0),  -- id 6
-- ГРАНИЧНЫЙ СЛУЧАЙ: товар снят с продажи
(1, 5, 2, 'Samsung Galaxy S23 128GB',       'samsung-galaxy-s23-128',       'Предыдущее поколение флагмана Samsung. Снят с продажи.',                             'SAM-S23-128',      59990.00,  74990.00, 0,   1, 0, 0),  -- id 7 (is_active=0)
-- Планшеты (category 6)
(1, 6, 1, 'Apple iPad Pro 12.9" M4 256GB', 'apple-ipad-pro-129-m4-256',    'Профессиональный планшет с чипом M4, OLED-дисплеем и Apple Pencil Pro.',             'APP-IPP-M4-256',  109990.00, 119990.00, 20,  1, 1, 1),  -- id 8
(1, 6, 2, 'Samsung Galaxy Tab S9+ 256GB',  'samsung-galaxy-tab-s9-plus-256','Планшет с AMOLED 12.4", S Pen в комплекте и защитой IP68.',                         'SAM-TABS9P-256',   69990.00,  79990.00, 30,  1, 1, 0),  -- id 9
-- ГРАНИЧНЫЙ СЛУЧАЙ: товар в наличии 0
(1, 6, 1, 'Apple iPad mini 7 256GB',       'apple-ipad-mini-7-256',         'Компактный планшет с чипом A17 Pro и экраном 8.3".',                                 'APP-IPMINI7-256',  59990.00,  64990.00, 0,   1, 1, 0),  -- id 10 (stock=0)
-- Умные часы (category 7)
(1, 7, 1, 'Apple Watch Series 9 45mm GPS', 'apple-watch-s9-45-gps',         'Умные часы с чипом S9, двойным касанием и точным мониторингом здоровья.',            'APP-AWS9-45GPS',   39990.00,  44990.00, 55,  1, 1, 1),  -- id 11
(1, 7, 2, 'Samsung Galaxy Watch 6 Classic','samsung-galaxy-watch-6-classic', 'Умные часы с вращающимся безелем, ЭКГ и анализом сна.',                             'SAM-GW6C-47',      29990.00,  33990.00, 45,  1, 1, 0),  -- id 12
-- Ноутбуки (category 8)
(1, 8, 1, 'Apple MacBook Pro 14" M3 Pro',  'apple-macbook-pro-14-m3-pro',   'Профессиональный ноутбук с чипом M3 Pro, 18 ГБ RAM, автономность до 18 ч.',         'APP-MBP14-M3P',   199990.00, 219990.00, 15,  1, 1, 1),  -- id 13
(1, 8, 5, 'Lenovo ThinkPad X1 Carbon G12', 'lenovo-thinkpad-x1-carbon-g12', 'Ультратонкий бизнес-ноутбук с Intel Core Ultra 7, 32 ГБ RAM, вес 1.12 кг.',        'LEN-X1CG12',      149990.00, 164990.00, 12,  1, 1, 0),  -- id 14
(1, 8, 6, 'ASUS ROG Zephyrus G16',         'asus-rog-zephyrus-g16',         'Игровой ноутбук с Ryzen 9, RTX 4080, дисплей 240 Гц, Thunderbolt 4.',               'ASUS-ROGZG16',    189990.00, 209990.00,  8,  1, 1, 1),  -- id 15
-- Наушники (category 10)
(1, 10, 1, 'Apple AirPods Pro 2',          'apple-airpods-pro-2',           'Наушники с ANC, адаптивным аудио и USB-C.',                                          'APP-APP2',         24990.00,  27990.00, 90,  1, 1, 1),  -- id 16
(1, 10, 3, 'Sony WH-1000XM5',              'sony-wh-1000xm5',               'Накладные наушники с лучшим в классе ANC и 30 ч работы.',                            'SNY-WH1000XM5',    29990.00,  34990.00, 40,  1, 1, 1),  -- id 17
(1, 10, 8, 'Bose QuietComfort 45',         'bose-quietcomfort-45',          'Комфортные наушники с ANC, время работы до 24 ч.',                                   'BSE-QC45',         24990.00,  27990.00, 35,  1, 1, 0),  -- id 18
-- Колонки (category 11)
(1, 11, 7, 'JBL Charge 5',                 'jbl-charge-5',                  'Колонка с мощным звуком, IP67, powerbank, 20 ч работы.',                             'JBL-CHG5',          9990.00,  11990.00, 75,  1, 1, 0),  -- id 19
(1, 11, 3, 'Sony SRS-XB43',                'sony-srs-xb43',                 'Мощная колонка с Extra Bass, Live Sound и защитой IP67.',                            'SNY-SRSXB43',      11990.00,  13990.00, 50,  1, 1, 0);  -- id 20

-- ---- GadgetZone (tenant 2) ----
INSERT INTO `product` (tenant_id, category_id, brand_id, name, slug, description, sku, price, compare_price, stock_quantity, track_inventory, is_active, is_featured) VALUES
(2, 12, 9,  'Apple iPhone 15 128GB',          'gz-iphone-15-128',    'Смартфон Apple с USB-C и Dynamic Island.',               'GZ-APP-IP15-128',   91990.00,  99990.00, 30, 1, 1, 1),  -- id 21
(2, 12, 10, 'Samsung Galaxy S24 128GB',       'gz-samsung-s24-128',  'Флагманский смартфон Samsung с Galaxy AI.',              'GZ-SAM-S24-128',    89990.00,  99990.00, 25, 1, 1, 1),  -- id 22
(2, 12, 11, 'Xiaomi Redmi Note 13 128GB',     'gz-redmi-note-13',    'Смартфон с AMOLED и камерой 108 Мп.',                   'GZ-XIA-RN13-128',   19990.00,  24990.00, 70, 1, 1, 0),  -- id 23
(2, 13, 9,  'Чехол Apple Silicone iPhone 15', 'gz-case-ip15-silicon','Оригинальный силиконовый чехол Apple для iPhone 15.',   'GZ-CASE-IP15-SIL',  4990.00,   5990.00,  150,1, 1, 0),  -- id 24
(2, 14, 11, 'Xiaomi Smart Speaker',           'gz-xiao-speaker',     'Умная колонка с голосовым ассистентом.',                'GZ-XIA-SPEAK',      3990.00,   4990.00,  40, 1, 1, 0);  -- id 25

-- ---- HomeAppliances (tenant 3) ----
INSERT INTO `product` (tenant_id, category_id, brand_id, name, slug, description, sku, price, compare_price, stock_quantity, track_inventory, is_active, is_featured) VALUES
(3, 15, 12, 'Bosch Serie 6 Холодильник 350L',   'bosch-fridge-350l',  'Двухкамерный холодильник с системой NoFrost.',          'HA-BSC-FRDG-350', 69990.00,  79990.00, 12, 1, 1, 1),  -- id 26
(3, 15, 13, 'LG Стиральная машина 9кг F4WV509', 'lg-wm-9kg',          'Стиральная машина с прямым приводом и паром.',          'HA-LG-WM-9KG',    49990.00,  57990.00, 8,  1, 1, 1),  -- id 27
(3, 16, 14, 'Philips Кофемашина 2200 Series',   'philips-coffee-2200','Автоматическая кофемашина с капучинатором.',            'HA-PHL-COF-2200', 24990.00,  29990.00, 20, 1, 1, 0),  -- id 28
(3, 16, 13, 'LG Пылесос A9K-ULTRA2',            'lg-vacuum-a9k',      'Беспроводной пылесос с зарядной станцией.',             'HA-LG-VAC-A9K',   34990.00,  39990.00, 15, 1, 1, 0),  -- id 29
(3, 17, 12, 'Bosch Кондиционер CL3000i 24',     'bosch-ac-cl3000i',   'Инверторный кондиционер 24 BTU с WiFi.',               'HA-BSC-AC-24',    54990.00,  62990.00, 6,  1, 1, 1),  -- id 30
-- ГРАНИЧНЫЙ СЛУЧАЙ: снят с продажи
(3, 16, 14, 'Philips Чайник HD9350',            'philips-kettle-hd9350','Электрический чайник 1.7 л. Снят с продажи.',        'HA-PHL-KET-HD9350',2490.00,  3490.00,  0,  1, 0, 0);  -- id 31 (is_active=0)

-- ---- SportPro (tenant 4) ----
INSERT INTO `product` (tenant_id, category_id, brand_id, name, slug, description, sku, price, compare_price, stock_quantity, track_inventory, is_active, is_featured) VALUES
(4, 21, 18, 'Беговая дорожка Torneo Alfa 2.0', 'torneo-alfa-2',      'Домашняя дорожка 2.5 л.с., полотно 130×45 см, 15 программ.',  'TOR-ALFA2',   34990.00, 39990.00, 10, 1, 1, 1),  -- id 32
(4, 22, 15, 'Гантели Nike 10 кг пара',          'nike-dumbbells-10',  'Неопреновые гантели для дома, пара 10 кг.',                   'NIK-DB10',     2990.00,  3490.00, 60, 1, 1, 0),  -- id 33
(4, 22, 16, 'Штанга Adidas 60 кг набор',        'adidas-barbell-60',  'Гриф 180 см + обрезиненные диски, 60 кг.',                    'ADI-BB60',    14990.00, 17990.00, 15, 1, 1, 1),  -- id 34
(4, 19, 17, 'Велосипед Reebok One GT40S',        'reebok-gt40s',       'Горный велосипед 27.5", 21 скорость, дисковые тормоза.',      'REE-GT40S',   29990.00, 34990.00, 20, 1, 1, 0),  -- id 35
(4, 20, 15, 'Мяч Nike Premier League',           'nike-football-pl',   'Официальный мяч Английской Премьер-лиги, размер 5.',          'NIK-FB-PL5',   3490.00,  4490.00, 80, 1, 1, 0);  -- id 36

-- ---- KidsWorld (tenant 5) ----
INSERT INTO `product` (tenant_id, category_id, brand_id, name, slug, description, sku, price, compare_price, stock_quantity, track_inventory, is_active, is_featured) VALUES
(5, 26, 19, 'LEGO City Полицейский участок',    'lego-city-police',   'Конструктор 668 деталей, для детей от 7 лет.',               'KW-LEGO-CIT-POL', 4990.00,  5990.00, 50, 1, 1, 1),  -- id 37
(5, 26, 19, 'LEGO Technic Bugatti Chiron',      'lego-technic-bugatti','Конструктор 3599 деталей, детальная модель суперкара.',      'KW-LEGO-TEC-BUG',14990.00, 17990.00, 15, 1, 1, 1),  -- id 38
(5, 27, 20, 'Мягкая игрушка Hasbro FurReal',    'hasbro-furreal-bear','Интерактивный плюшевый медведь, реагирует на касание.',      'KW-HAS-FUR-BEAR', 2490.00,  2990.00, 40, 1, 1, 0),  -- id 39
(5, 24, 20, 'Монополия Hasbro классика',         'hasbro-monopoly',    'Классическая настольная игра для всей семьи.',              'KW-HAS-MONO-RU',  1990.00,  2490.00, 60, 1, 1, 0),  -- id 40
(5, 25, 21, 'Комбинезон Chicco 74см',            'chicco-overalls-74', 'Тёплый детский комбинезон на молнии, размер 74.',           'KW-CHI-OVER-74',   990.00,  1490.00, 35, 1, 1, 0),  -- id 41
-- ГРАНИЧНЫЙ СЛУЧАЙ: stock=0
(5, 26, 19, 'LEGO Star Wars Тысячелетний сокол','lego-sw-falcon',     'Легендарная модель 7541 деталь, для коллекционеров.',        'KW-LEGO-SW-FAL', 49990.00, 59990.00,  0, 1, 1, 0);  -- id 42 (stock=0)

-- 9. КОРЗИНЫ И ПОЗИЦИИ КОРЗИН

INSERT INTO `cart` (tenant_id, user_id, session_key) VALUES
-- TechMart
(1, 7,  NULL),                      -- id 1  ivan_petrov
(1, 8,  NULL),                      -- id 2  maria_kozl
(1, 9,  NULL),                      -- id 3  alex_nov
(1, 10, NULL),                      -- id 4  elena_sorok
(1, 11, NULL),                      -- id 5  nikita_voron
(1, NULL, 'sess_anon_a1b2c3d4e5f6'),-- id 6  анонимный
-- GadgetZone
(2, 12, NULL),                      -- id 7  olga_mike
(2, 13, NULL),                      -- id 8  andrey_leb
-- HomeAppliances
(3, 14, NULL),                      -- id 9  svetlana_fil
(3, 15, NULL),                      -- id 10 roman_stepan
-- SportPro
(4, 12, NULL),                      -- id 11 olga_mike
(4, 16, NULL),                      -- id 12 daria_kost
-- KidsWorld
(5, 7,  NULL),                      -- id 13 ivan_petrov
(5, 8,  NULL);                      -- id 14 maria_kozl

INSERT INTO `cart_item` (cart_id, product_id, quantity, price) VALUES
-- TechMart корзины
(1, 1,  1, 129990.00),   -- iPhone 15 Pro
(1, 16, 1,  24990.00),   -- AirPods Pro 2
(2, 3,  1, 119990.00),   -- Galaxy S24 Ultra
(3, 13, 1, 199990.00),   -- MacBook Pro
(3, 17, 1,  29990.00),   -- Sony WH-1000XM5
(4, 4,  2,  39990.00),   -- Galaxy A55 x2
(4, 19, 1,   9990.00),   -- JBL Charge 5
(5, 5,  1,  79990.00),   -- Xiaomi 14 Pro
(6, 12, 1,  29990.00),   -- Galaxy Watch 6 Classic (анонимный)
(6, 18, 2,  24990.00),   -- Bose QC45 x2
-- GadgetZone корзины
(7, 21, 1,  91990.00),   -- iPhone 15 (GZ)
(7, 24, 1,   4990.00),   -- Чехол Apple
(8, 22, 1,  89990.00),   -- Galaxy S24
(8, 25, 1,   3990.00),   -- Xiaomi Speaker
-- HomeAppliances корзины
(9,  26, 1, 69990.00),   -- Bosch холодильник
(9,  28, 1, 24990.00),   -- Philips кофемашина
(10, 27, 1, 49990.00),   -- LG стиральная машина
-- SportPro корзины
(11, 32, 1, 34990.00),   -- Беговая дорожка
(11, 34, 1, 14990.00),   -- Штанга Adidas
(12, 33, 2,  2990.00),   -- Гантели Nike x2
-- KidsWorld корзины
(13, 37, 1,  4990.00),   -- LEGO City
(13, 39, 1,  2490.00),   -- Hasbro FurReal
(14, 38, 1, 14990.00),   -- LEGO Technic Bugatti
(14, 40, 1,  1990.00);   -- Монополия

-- 10. ЗАКАЗЫ

INSERT INTO `order` (tenant_id, user_id, order_number, customer_name, customer_email, customer_phone,
                     shipping_address, shipping_city, shipping_postal_code,
                     subtotal, shipping_cost, total, status, created_at, updated_at, paid_at) VALUES
-- ===== TechMart =====
-- ORD-01: 1×iPhone15Pro(129990) → subtotal=129990, ship=0, total=129990
(1, 7,  'ORD-20240301-00001', 'Иван Петров',       'ivan.petrov@gmail.com',    '+79031112233', 'ул. Тверская, 14, кв. 22',   'Москва',          '125009', 129990.00,    0.00, 129990.00, 'completed', '2024-03-01 10:22:14', '2024-03-05 14:00:00', '2024-03-01 10:30:00'),
-- ORD-02: 1×AirPods(24990)+1×JBL(9990)+1×GalaxyA55(39990) → subtotal=74970, ship=350, total=75320
(1, 8,  'ORD-20240315-00002', 'Мария Козлова',     'maria.kozlova@yandex.ru',  '+79052223344', 'ул. Садовая, 33, кв. 5',     'Санкт-Петербург', '190005',  74970.00,  350.00,  75320.00, 'completed', '2024-03-15 14:05:33', '2024-03-20 11:00:00', '2024-03-15 14:15:00'),
-- ORD-03: 1×MacBookPro(199990) → subtotal=199990, ship=500, total=200490
(1, 9,  'ORD-20240402-00003', 'Александр Новиков', 'alex.novikov@mail.ru',     '+79163334455', 'ул. Ленина, 7, кв. 18',      'Новосибирск',     '630004', 199990.00,  500.00, 200490.00, 'completed', '2024-04-02 09:10:00', '2024-04-08 16:00:00', '2024-04-02 09:20:00'),
-- ORD-04: 1×GalaxyA55(39990) → subtotal=39990, ship=300, total=40290
(1, 10, 'ORD-20240418-00004', 'Елена Сорокина',    'e.sorokina@gmail.com',     '+79264445566', 'пр. Мира, 41, кв. 9',        'Екатеринбург',    '620000',  39990.00,  300.00,  40290.00, 'completed', '2024-04-18 17:45:22', '2024-04-23 10:00:00', '2024-04-18 17:55:00'),
-- ORD-05: 1×iPhone15(89990) → subtotal=89990, ship=0, total=89990
(1, 11, 'ORD-20240510-00005', 'Никита Воронов',    'n.voronov@yandex.ru',      '+79175556677', 'ул. Пушкина, 2, кв. 3',      'Казань',          '420000',  89990.00,    0.00,  89990.00, 'completed', '2024-05-10 12:00:00', '2024-05-16 12:00:00', '2024-05-10 12:10:00'),
-- ORD-06: 1×Xiaomi14Pro(79990) → subtotal=79990, ship=0, total=79990
(1, 7,  'ORD-20240602-00006', 'Иван Петров',       'ivan.petrov@gmail.com',    '+79031112233', 'ул. Тверская, 14, кв. 22',   'Москва',          '125009',  79990.00,    0.00,  79990.00, 'delivered', '2024-06-02 11:30:00', '2024-06-06 15:00:00', '2024-06-02 11:40:00'),
-- ORD-07: 1×SonyWH(29990)+1×RedmiNote13Pro(29990) → subtotal=59980, ship=350, total=60330
(1, 12, 'ORD-20240620-00007', 'Ольга Михайлова',   'olga.m@mail.ru',           '+79386667788', 'ул. Гагарина, 18, кв. 7',    'Самара',          '443001',  59980.00,  350.00,  60330.00, 'delivered', '2024-06-20 08:15:00', '2024-06-25 13:00:00', '2024-06-20 08:25:00'),
-- ORD-08: 1×ThinkPad(149990) → subtotal=149990, ship=500, total=150490
(1, 13, 'ORD-20240710-00008', 'Андрей Лебедев',    'andrey.leb@gmail.com',     '+79097778899', 'ул. Советская, 55, кв. 12',  'Ростов-на-Дону',  '344000', 149990.00,  500.00, 150490.00, 'shipped',   '2024-07-10 15:00:00', '2024-07-12 09:00:00', '2024-07-10 15:10:00'),
-- ORD-09: 1×AirPodsPro2(24990) → subtotal=24990, ship=300, total=25290
(1, 14, 'ORD-20240718-00009', 'Светлана Филиппова','s.filippova@yandex.ru',    '+79218889900', 'ул. Коммунистическая, 3',    'Уфа',             '450000',  24990.00,  300.00,  25290.00, 'shipped',   '2024-07-18 10:22:00', '2024-07-19 11:00:00', '2024-07-18 10:32:00'),
-- ORD-10: 1×GalaxyWatch6(29990) → subtotal=29990, ship=300, total=30290
(1, 15, 'ORD-20240720-00010', 'Роман Степанов',    'roman.step@mail.ru',       '+79129990011', 'ул. Чехова, 22, кв. 4',      'Пермь',           '614000',  29990.00,  300.00,  30290.00, 'confirmed', '2024-07-20 09:00:00', '2024-07-20 10:00:00', '2024-07-20 09:10:00'),
-- ORD-11: 1×iPadPro(109990) → subtotal=109990, ship=0, total=109990
(1, 16, 'ORD-20240721-00011', 'Дарья Костина',     'd.kostina@gmail.com',      '+79030001122', 'ул. Октябрьская, 9, кв. 11', 'Воронеж',         '394000', 109990.00,    0.00, 109990.00, 'confirmed', '2024-07-21 14:00:00', '2024-07-21 15:00:00', '2024-07-21 14:10:00'),
-- ORD-12: 1×SonySRS-XB43(11990) → subtotal=11990, ship=0, total=11990 (pending, не оплачен)
(1, 7,  'ORD-20240722-00012', 'Иван Петров',       'ivan.petrov@gmail.com',    '+79031112233', 'ул. Тверская, 14, кв. 22',   'Москва',          '125009',  11990.00,    0.00,  11990.00, 'pending',   '2024-07-22 08:00:00', '2024-07-22 08:00:00', NULL),
-- ORD-13: 1×GalaxyA55(39990) → subtotal=39990, ship=350, total=40340 (pending)
(1, 8,  'ORD-20240722-00013', 'Мария Козлова',     'maria.kozlova@yandex.ru',  '+79052223344', 'ул. Садовая, 33, кв. 5',     'Санкт-Петербург', '190005',  39990.00,  350.00,  40340.00, 'pending',   '2024-07-22 09:30:00', '2024-07-22 09:30:00', NULL),
-- ORD-14: 1×GalaxyWatch6(29990) → subtotal=29990, ship=300, total=30290 (cancelled)
(1, 9,  'ORD-20240501-00014', 'Александр Новиков', 'alex.novikov@mail.ru',     '+79163334455', 'ул. Ленина, 7, кв. 18',      'Новосибирск',     '630004',  29990.00,  300.00,  30290.00, 'cancelled', '2024-05-01 11:00:00', '2024-05-01 13:00:00', NULL),

-- ===== GadgetZone =====
-- ORD-15: 1×iPhone15GZ(91990)+1×CaseIP15(4990) → subtotal=96980, ship=350, total=97330
(2, 12, 'ORD-20240610-00015', 'Ольга Михайлова',   'olga.m@mail.ru',           '+79386667788', 'ул. Гагарина, 18, кв. 7',    'Самара',          '443001',  96980.00,  350.00,  97330.00, 'completed', '2024-06-10 11:00:00', '2024-06-15 14:00:00', '2024-06-10 11:10:00'),
-- ORD-16: 1×GalaxyS24GZ(89990) → subtotal=89990, ship=350, total=90340
(2, 13, 'ORD-20240715-00016', 'Андрей Лебедев',    'andrey.leb@gmail.com',     '+79097778899', 'ул. Советская, 55, кв. 12',  'Ростов-на-Дону',  '344000',  89990.00,  350.00,  90340.00, 'shipped',   '2024-07-15 10:00:00', '2024-07-17 09:00:00', '2024-07-15 10:15:00'),

-- ===== HomeAppliances =====
-- ORD-17: 1×BoschFridge(69990)+1×PhilipsCoffee(24990) → subtotal=94980, ship=500, total=95480
(3, 14, 'ORD-20240620-00017', 'Светлана Филиппова','s.filippova@yandex.ru',    '+79218889900', 'ул. Коммунистическая, 3',    'Уфа',             '450000',  94980.00,  500.00,  95480.00, 'completed', '2024-06-20 14:00:00', '2024-06-28 12:00:00', '2024-06-20 14:10:00'),
-- ORD-18: 1×LGWasher(49990) → subtotal=49990, ship=500, total=50490
(3, 15, 'ORD-20240710-00018', 'Роман Степанов',    'roman.step@mail.ru',       '+79129990011', 'ул. Чехова, 22, кв. 4',      'Пермь',           '614000',  49990.00,  500.00,  50490.00, 'confirmed', '2024-07-10 09:00:00', '2024-07-10 10:00:00', '2024-07-10 09:15:00'),

-- ===== SportPro =====
-- ORD-19: 1×TorneoAlfa(34990) → subtotal=34990, ship=500, total=35490
(4, 12, 'ORD-20240625-00019', 'Ольга Михайлова',   'olga.m@mail.ru',           '+79386667788', 'ул. Гагарина, 18, кв. 7',    'Самара',          '443001',  34990.00,  500.00,  35490.00, 'completed', '2024-06-25 12:00:00', '2024-07-02 14:00:00', '2024-06-25 12:10:00'),
-- ORD-20: 1×ReebokGT40S(29990) → subtotal=29990, ship=500, total=30490
(4, 13, 'ORD-20240710-00020', 'Андрей Лебедев',    'andrey.leb@gmail.com',     '+79097778899', 'ул. Советская, 55, кв. 12',  'Ростов-на-Дону',  '344000',  29990.00,  500.00,  30490.00, 'shipped',   '2024-07-10 16:00:00', '2024-07-12 10:00:00', '2024-07-10 16:10:00'),
-- ORD-21: 2×NikeDumbbells(2990×2=5980)+1×AdidasBarbell(14990) → subtotal=20970, ship=300, total=21270
(4, 16, 'ORD-20240718-00021', 'Дарья Костина',     'd.kostina@gmail.com',      '+79030001122', 'ул. Октябрьская, 9, кв. 11', 'Воронеж',         '394000',  20970.00,  300.00,  21270.00, 'pending',   '2024-07-18 15:00:00', '2024-07-18 15:00:00', NULL),

-- ===== KidsWorld =====
-- ORD-22: 1×LEGOCity(4990)+1×HabroFurReal(2490) → subtotal=7480, ship=0, total=7480
(5, 7,  'ORD-20240701-00022', 'Иван Петров',       'ivan.petrov@gmail.com',    '+79031112233', 'ул. Тверская, 14, кв. 22',   'Москва',          '125009',   7480.00,    0.00,   7480.00, 'completed', '2024-07-01 10:00:00', '2024-07-05 12:00:00', '2024-07-01 10:10:00'),
-- ORD-23: 1×LEGOTechnic(14990)+1×Monopoly(1990) → subtotal=16980, ship=350, total=17330
(5, 8,  'ORD-20240715-00023', 'Мария Козлова',     'maria.kozlova@yandex.ru',  '+79052223344', 'ул. Садовая, 33, кв. 5',     'Санкт-Петербург', '190005',  16980.00,  350.00,  17330.00, 'shipped',   '2024-07-15 11:00:00', '2024-07-17 10:00:00', '2024-07-15 11:15:00');

-- 11. ПОЗИЦИИ ЗАКАЗОВ

SET FOREIGN_KEY_CHECKS = 0;

INSERT INTO `order_item` (order_id, product_id, product_name, product_sku, quantity, price, subtotal) VALUES
-- TechMart ORD-01
(1,  1,  'Apple iPhone 15 Pro 256GB',       'APP-IP15P-256',  1, 129990.00, 129990.00),
-- TechMart ORD-02 (24990+9990+39990 = 74970 ✓)
(2,  16, 'Apple AirPods Pro 2',             'APP-APP2',       1,  24990.00,  24990.00),
(2,  19, 'JBL Charge 5',                   'JBL-CHG5',       1,   9990.00,   9990.00),
(2,  4,  'Samsung Galaxy A55 128GB',        'SAM-A55-128',    1,  39990.00,  39990.00),
-- TechMart ORD-03
(3,  13, 'Apple MacBook Pro 14" M3 Pro',    'APP-MBP14-M3P',  1, 199990.00, 199990.00),
-- TechMart ORD-04
(4,  4,  'Samsung Galaxy A55 128GB',        'SAM-A55-128',    1,  39990.00,  39990.00),
-- TechMart ORD-05
(5,  2,  'Apple iPhone 15 128GB',           'APP-IP15-128',   1,  89990.00,  89990.00),
-- TechMart ORD-06
(6,  5,  'Xiaomi 14 Pro 512GB',             'XIA-14P-512',    1,  79990.00,  79990.00),
-- TechMart ORD-07 (29990+29990 = 59980 ✓)
(7,  17, 'Sony WH-1000XM5',                'SNY-WH1000XM5',  1,  29990.00,  29990.00),
(7,  6,  'Xiaomi Redmi Note 13 Pro 256GB',  'XIA-RN13P-256',  1,  29990.00,  29990.00),
-- TechMart ORD-08
(8,  14, 'Lenovo ThinkPad X1 Carbon G12',  'LEN-X1CG12',     1, 149990.00, 149990.00),
-- TechMart ORD-09
(9,  16, 'Apple AirPods Pro 2',             'APP-APP2',       1,  24990.00,  24990.00),
-- TechMart ORD-10
(10, 12, 'Samsung Galaxy Watch 6 Classic',  'SAM-GW6C-47',    1,  29990.00,  29990.00),
-- TechMart ORD-11
(11, 8,  'Apple iPad Pro 12.9" M4 256GB',  'APP-IPP-M4-256', 1, 109990.00, 109990.00),
-- TechMart ORD-12
(12, 20, 'Sony SRS-XB43',                  'SNY-SRSXB43',    1,  11990.00,  11990.00),
-- TechMart ORD-13
(13, 4,  'Samsung Galaxy A55 128GB',        'SAM-A55-128',    1,  39990.00,  39990.00),
-- TechMart ORD-14 cancelled
(14, 12, 'Samsung Galaxy Watch 6 Classic',  'SAM-GW6C-47',    1,  29990.00,  29990.00),
-- GadgetZone ORD-15 (91990+4990 = 96980 ✓)
(15, 21, 'Apple iPhone 15 128GB (GZ)',      'GZ-APP-IP15-128',1,  91990.00,  91990.00),
(15, 24, 'Чехол Apple Silicone iPhone 15',  'GZ-CASE-IP15-SIL',1, 4990.00,   4990.00),
-- GadgetZone ORD-16
(16, 22, 'Samsung Galaxy S24 128GB (GZ)',   'GZ-SAM-S24-128', 1,  89990.00,  89990.00),
-- HomeAppliances ORD-17 (69990+24990 = 94980 ✓)
(17, 26, 'Bosch Serie 6 Холодильник 350L',  'HA-BSC-FRDG-350',1, 69990.00,  69990.00),
(17, 28, 'Philips Кофемашина 2200 Series',  'HA-PHL-COF-2200',1, 24990.00,  24990.00),
-- HomeAppliances ORD-18
(18, 27, 'LG Стиральная машина 9кг F4WV509','HA-LG-WM-9KG',  1,  49990.00,  49990.00),
-- SportPro ORD-19
(19, 32, 'Беговая дорожка Torneo Alfa 2.0', 'TOR-ALFA2',      1,  34990.00,  34990.00),
-- SportPro ORD-20
(20, 35, 'Велосипед Reebok One GT40S',      'REE-GT40S',      1,  29990.00,  29990.00),
-- SportPro ORD-21 (2×2990+14990 = 20970 ✓)
(21, 33, 'Гантели Nike 10 кг пара',         'NIK-DB10',       2,   2990.00,   5980.00),
(21, 34, 'Штанга Adidas 60 кг набор',       'ADI-BB60',       1,  14990.00,  14990.00),
-- KidsWorld ORD-22 (4990+2490 = 7480 ✓)
(22, 37, 'LEGO City Полицейский участок',   'KW-LEGO-CIT-POL',1,  4990.00,   4990.00),
(22, 39, 'Мягкая игрушка Hasbro FurReal',   'KW-HAS-FUR-BEAR',1,  2490.00,   2490.00),
-- KidsWorld ORD-23 (14990+1990 = 16980 ✓)
(23, 38, 'LEGO Technic Bugatti Chiron',     'KW-LEGO-TEC-BUG',1, 14990.00,  14990.00),
(23, 40, 'Монополия Hasbro классика',        'KW-HAS-MONO-RU', 1,  1990.00,   1990.00);

SET FOREIGN_KEY_CHECKS = 1;

-- 12. ПЛАТЕЖИ

INSERT INTO `payment` (tenant_id, order_id, payment_method, status, amount, transaction_id, created_at, completed_at) VALUES
-- TechMart
(1, 1,  'card', 'completed', 129990.00, 'TXN-2024030100001', '2024-03-01 10:30:00', '2024-03-01 10:30:45'),
(1, 2,  'card', 'completed',  75320.00, 'TXN-2024031500002', '2024-03-15 14:15:00', '2024-03-15 14:15:52'),
(1, 3,  'sbp',  'completed', 200490.00, 'TXN-2024040200003', '2024-04-02 09:20:00', '2024-04-02 09:20:31'),
(1, 4,  'card', 'completed',  40290.00, 'TXN-2024041800004', '2024-04-18 17:55:00', '2024-04-18 17:55:18'),
(1, 5,  'sbp',  'completed',  89990.00, 'TXN-2024051000005', '2024-05-10 12:10:00', '2024-05-10 12:10:22'),
(1, 6,  'card', 'completed',  79990.00, 'TXN-2024060200006', '2024-06-02 11:40:00', '2024-06-02 11:40:09'),
(1, 7,  'cash', 'completed',  60330.00,  NULL,               '2024-06-20 08:25:00', '2024-06-25 13:00:00'),
(1, 8,  'card', 'completed', 150490.00, 'TXN-2024071000008', '2024-07-10 15:10:00', '2024-07-10 15:10:33'),
(1, 9,  'sbp',  'completed',  25290.00, 'TXN-2024071800009', '2024-07-18 10:32:00', '2024-07-18 10:32:14'),
(1, 10, 'card', 'completed',  30290.00, 'TXN-2024072000010', '2024-07-20 09:10:00', '2024-07-20 09:10:05'),
(1, 11, 'sbp',  'completed', 109990.00, 'TXN-2024072100011', '2024-07-21 14:10:00', '2024-07-21 14:10:20'),
(1, 12, 'card', 'pending',    11990.00,  NULL,               '2024-07-22 08:00:00',  NULL),
(1, 13, 'card', 'pending',    40340.00,  NULL,               '2024-07-22 09:30:00',  NULL),
-- GadgetZone
(2, 15, 'card', 'completed',  97330.00, 'TXN-2024061000015', '2024-06-10 11:10:00', '2024-06-10 11:10:40'),
(2, 16, 'sbp',  'completed',  90340.00, 'TXN-2024071500016', '2024-07-15 10:15:00', '2024-07-15 10:15:18'),
-- HomeAppliances
(3, 17, 'card', 'completed',  95480.00, 'TXN-2024062000017', '2024-06-20 14:10:00', '2024-06-20 14:10:55'),
(3, 18, 'sbp',  'completed',  50490.00, 'TXN-2024071000018', '2024-07-10 09:15:00', '2024-07-10 09:15:30'),
-- SportPro
(4, 19, 'card', 'completed',  35490.00, 'TXN-2024062500019', '2024-06-25 12:10:00', '2024-06-25 12:10:40'),
(4, 20, 'sbp',  'completed',  30490.00, 'TXN-2024071000020', '2024-07-10 16:10:00', '2024-07-10 16:10:18'),
(4, 21, 'card', 'pending',    21270.00,  NULL,               '2024-07-18 15:00:00',  NULL),
-- KidsWorld
(5, 22, 'sbp',  'completed',   7480.00, 'TXN-2024070100022', '2024-07-01 10:10:00', '2024-07-01 10:10:22'),
(5, 23, 'card', 'completed',  17330.00, 'TXN-2024071500023', '2024-07-15 11:15:00', '2024-07-15 11:15:35');

-- 13. УВЕДОМЛЕНИЯ

INSERT INTO `notification` (tenant_id, user_id, type, title, message, is_read, created_at) VALUES
-- TechMart
(1, 7,  'order',  'Заказ оформлен',              'Ваш заказ ORD-20240301-00001 успешно оформлен.',                   1, '2024-03-01 10:22:14'),
(1, 7,  'order',  'Заказ выполнен',              'Ваш заказ ORD-20240301-00001 доставлен. Спасибо!',                 1, '2024-03-05 14:00:00'),
(1, 8,  'order',  'Заказ оформлен',              'Ваш заказ ORD-20240315-00002 успешно оформлен.',                   1, '2024-03-15 14:05:33'),
(1, 8,  'order',  'Заказ выполнен',              'Ваш заказ ORD-20240315-00002 доставлен. Спасибо!',                 1, '2024-03-20 11:00:00'),
(1, 9,  'order',  'Заказ оформлен',              'Ваш заказ ORD-20240402-00003 успешно оформлен.',                   1, '2024-04-02 09:10:00'),
(1, 9,  'order',  'Заказ выполнен',              'Ваш заказ ORD-20240402-00003 доставлен. Спасибо!',                 1, '2024-04-08 16:00:00'),
(1, 10, 'order',  'Заказ отправлен',             'Ваш заказ ORD-20240418-00004 передан в службу доставки.',          1, '2024-04-20 09:00:00'),
(1, 11, 'order',  'Заказ подтверждён',           'Ваш заказ ORD-20240510-00005 подтверждён, готовится к отправке.',  1, '2024-05-11 10:00:00'),
(1, 9,  'system', 'Отмена заказа',               'Ваш заказ ORD-20240501-00014 был отменён.',                        1, '2024-05-01 13:00:00'),
(1, 13, 'order',  'Заказ отправлен',             'Ваш заказ ORD-20240710-00008 передан в службу доставки.',          0, '2024-07-12 09:00:00'),
(1, 14, 'order',  'Заказ отправлен',             'Ваш заказ ORD-20240718-00009 передан в службу доставки.',          0, '2024-07-19 11:00:00'),
(1, 15, 'order',  'Заказ подтверждён',           'Ваш заказ ORD-20240720-00010 подтверждён.',                        0, '2024-07-20 10:00:00'),
(1, 16, 'order',  'Заказ подтверждён',           'Ваш заказ ORD-20240721-00011 подтверждён.',                        0, '2024-07-21 15:00:00'),
(1, 7,  'promo',  'Скидка 10% на аксессуары',    'Только до конца недели: −10% на все аксессуары Apple.',            0, '2024-07-20 12:00:00'),
(1, 8,  'promo',  'Новинки Samsung в магазине',  'Мы обновили ассортимент смартфонов Samsung. Смотрите!',            0, '2024-07-21 12:00:00'),
-- GadgetZone
(2, 12, 'order',  'Заказ выполнен',              'Ваш заказ ORD-20240610-00015 доставлен. Спасибо!',                 1, '2024-06-15 14:00:00'),
(2, 13, 'order',  'Заказ отправлен',             'Ваш заказ ORD-20240715-00016 передан в службу доставки.',          0, '2024-07-17 09:00:00'),
-- HomeAppliances
(3, 14, 'order',  'Заказ выполнен',              'Ваш заказ ORD-20240620-00017 доставлен. Спасибо!',                 1, '2024-06-28 12:00:00'),
(3, 15, 'order',  'Заказ подтверждён',           'Ваш заказ ORD-20240710-00018 подтверждён.',                        0, '2024-07-10 10:00:00'),
(3, 14, 'promo',  'Летняя распродажа техники',   'Скидки до 20% на климатическую технику. Только в июле!',           0, '2024-07-15 10:00:00'),
-- SportPro
(4, 12, 'order',  'Заказ выполнен',              'Ваш заказ ORD-20240625-00019 доставлен. Спасибо за покупку!',      1, '2024-07-02 14:00:00'),
(4, 13, 'order',  'Заказ отправлен',             'Ваш заказ ORD-20240710-00020 передан в службу доставки.',          0, '2024-07-12 10:00:00'),
(4, 16, 'order',  'Заказ оформлен',              'Ваш заказ ORD-20240718-00021 успешно оформлен.',                   0, '2024-07-18 15:00:00'),
-- KidsWorld
(5, 7,  'order',  'Заказ выполнен',              'Ваш заказ ORD-20240701-00022 доставлен. Спасибо!',                 1, '2024-07-05 12:00:00'),
(5, 8,  'order',  'Заказ отправлен',             'Ваш заказ ORD-20240715-00023 передан в службу доставки.',          0, '2024-07-17 10:00:00'),
(5, 7,  'promo',  'Новинки LEGO уже в магазине', 'Наборы LEGO Technic и Star Wars — пополнение ассортимента!',       0, '2024-07-20 09:00:00');

-- ПРОВЕРКА ДАННЫХ

SELECT 'TENANTS'       AS entity, COUNT(*) AS cnt FROM tenant        UNION ALL
SELECT 'USERS',                   COUNT(*)        FROM auth_user     UNION ALL
SELECT 'PROFILES',                COUNT(*)        FROM user_profile  UNION ALL
SELECT 'TENANT_ADMINS',           COUNT(*)        FROM tenant_admin  UNION ALL
SELECT 'SITE_CONFIGS',            COUNT(*)        FROM site_config   UNION ALL
SELECT 'CATEGORIES',              COUNT(*)        FROM category      UNION ALL
SELECT 'BRANDS',                  COUNT(*)        FROM brand         UNION ALL
SELECT 'PRODUCTS (всего)',        COUNT(*)        FROM product       UNION ALL
SELECT 'PRODUCTS (active)',       COUNT(*)        FROM product WHERE is_active = 1 UNION ALL
SELECT 'PRODUCTS (inactive)',     COUNT(*)        FROM product WHERE is_active = 0 UNION ALL
SELECT 'PRODUCTS (out of stock)', COUNT(*)        FROM product WHERE stock_quantity = 0 UNION ALL
SELECT 'CARTS',                   COUNT(*)        FROM cart          UNION ALL
SELECT 'CART_ITEMS',              COUNT(*)        FROM cart_item     UNION ALL
SELECT 'ORDERS',                  COUNT(*)        FROM `order`       UNION ALL
SELECT 'ORDER_ITEMS',             COUNT(*)        FROM order_item    UNION ALL
SELECT 'PAYMENTS',                COUNT(*)        FROM payment       UNION ALL
SELECT 'NOTIFICATIONS',           COUNT(*)        FROM notification;

SELECT
    o.id                                           AS order_id,
    o.order_number,
    o.subtotal                                     AS subtotal_header,
    SUM(oi.subtotal)                               AS subtotal_items,
    o.subtotal - SUM(oi.subtotal)                  AS diff,
    IF(ABS(o.subtotal - SUM(oi.subtotal)) < 0.01, 'OK', 'MISMATCH') AS check_result
FROM `order` o
JOIN order_item oi ON oi.order_id = o.id
GROUP BY o.id, o.order_number, o.subtotal
ORDER BY o.id;