-- MySQL dump 10.13  Distrib 8.0.45, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: pvzbd
-- ------------------------------------------------------
-- Server version	8.0.45

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) DEFAULT '0',
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) DEFAULT NULL,
  `last_name` varchar(150) DEFAULT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) DEFAULT '0',
  `is_active` tinyint(1) DEFAULT '1',
  `date_joined` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `phone` varchar(20) DEFAULT NULL,
  `role` varchar(20) DEFAULT 'customer',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$600000$rEd3kLmN2pQs$V8xWjKz1A+bCdEfGhIjKlMnOpQrStUvWxYzABCDE=',NULL,1,'superadmin','Дмитрий','Орлов','superadmin@techmart.ru',1,1,'2026-02-23 19:43:13.267403','+79161000001','admin'),(2,'pbkdf2_sha256$600000$sAl7tBkM3xYz$H2vNjLp4Q+rStUvWxYzABCDEfGhIjKlMnOpQrSt=',NULL,0,'mgr_techmart','Анна','Семёнова','manager@techmart.ru',1,1,'2026-02-23 19:43:13.267403','+79161000002','manager'),(3,'pbkdf2_sha256$600000$uZq9wErF5cVb$J4xPkMr6S+tUvWxYzABCDEfGhIjKlMnOpQrStUv=',NULL,0,'mgr_gadget','Сергей','Васильев','manager@gadgetzone.ru',1,1,'2026-02-23 19:43:13.267403','+79161000003','manager'),(4,'pbkdf2_sha256$600000$vXn8yDs4bWc$K5yQlNs7T+uVwXyZaBCDEfGhIjKlMnOpQrStUvW=',NULL,0,'mgr_home','Ольга','Титова','manager@homeappliances.ru',1,1,'2026-02-23 19:43:13.267403','+79161000004','manager'),(5,'pbkdf2_sha256$600000$wYo5zEt9cXd$L6zRmOt8U+vWxYzaBCDEfGhIjKlMnOpQrStUvWx=',NULL,0,'mgr_sport','Павел','Кузнецов','manager@sportpro.ru',1,1,'2026-02-23 19:43:13.267403','+79161000005','manager'),(6,'pbkdf2_sha256$600000$xZp6aFu0dYe$M7aSnPu9V+wXyZaBCDEfGhIjKlMnOpQrStUvWxY=',NULL,0,'mgr_kids','Татьяна','Белова','manager@kidsworld.ru',1,1,'2026-02-23 19:43:13.267403','+79161000006','manager'),(7,'pbkdf2_sha256$600000$yAq7bGv1eZf$N8bToQv0W+xYzaBCDEfGhIjKlMnOpQrStUvWxYz=',NULL,0,'ivan_petrov','Иван','Петров','ivan.petrov@gmail.com',0,1,'2026-02-23 19:43:13.267403','+79031112233','customer'),(8,'pbkdf2_sha256$600000$zBr8cHw2faG$O9cUpRw1X+yZaBCDEfGhIjKlMnOpQrStUvWxYzA=',NULL,0,'maria_kozl','Мария','Козлова','maria.kozlova@yandex.ru',0,1,'2026-02-23 19:43:13.267403','+79052223344','customer'),(9,'pbkdf2_sha256$600000$aCs9dIx3gbH$P0dVqSx2Y+zaBCDEfGhIjKlMnOpQrStUvWxYzAB=',NULL,0,'alex_nov','Александр','Новиков','alex.novikov@mail.ru',0,1,'2026-02-23 19:43:13.267403','+79163334455','customer'),(10,'pbkdf2_sha256$600000$bDt0eJy4hcI$Q1eWrTy3Z+aBCDEfGhIjKlMnOpQrStUvWxYzABC=',NULL,0,'elena_sorok','Елена','Сорокина','e.sorokina@gmail.com',0,1,'2026-02-23 19:43:13.267403','+79264445566','customer'),(11,'pbkdf2_sha256$600000$cEu1fKz5idJ$R2fXsUz4a+BCDEfGhIjKlMnOpQrStUvWxYzABCD=',NULL,0,'nikita_voron','Никита','Воронов','n.voronov@yandex.ru',0,1,'2026-02-23 19:43:13.267403','+79175556677','customer'),(12,'pbkdf2_sha256$600000$dFv2gLa6jeK$S3gYtVa5b+CDEfGhIjKlMnOpQrStUvWxYzABCDE=',NULL,0,'olga_mike','Ольга','Михайлова','olga.m@mail.ru',0,1,'2026-02-23 19:43:13.267403','+79386667788','customer'),(13,'pbkdf2_sha256$600000$eGw3hMb7kfL$T4hZuWb6c+DEfGhIjKlMnOpQrStUvWxYzABCDEf=',NULL,0,'andrey_leb','Андрей','Лебедев','andrey.leb@gmail.com',0,1,'2026-02-23 19:43:13.267403','+79097778899','customer'),(14,'pbkdf2_sha256$600000$fHx4iNc8lgM$U5iaVXc7d+EfGhIjKlMnOpQrStUvWxYzABCDEfG=',NULL,0,'svetlana_fil','Светлана','Филиппова','s.filippova@yandex.ru',0,1,'2026-02-23 19:43:13.267403','+79218889900','customer'),(15,'pbkdf2_sha256$600000$gIy5jOd9mhN$V6jbWYd8e+FfGhIjKlMnOpQrStUvWxYzABCDEfG=',NULL,0,'roman_stepan','Роман','Степанов','roman.step@mail.ru',0,1,'2026-02-23 19:43:13.267403','+79129990011','customer'),(16,'pbkdf2_sha256$600000$hJz6kPe0niO$W7kcXZe9f+GhIjKlMnOpQrStUvWxYzABCDEfGhI=',NULL,0,'daria_kost','Дарья','Костина','d.kostina@gmail.com',0,1,'2026-02-23 19:43:13.267403','+79030001122','customer');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `brand`
--

DROP TABLE IF EXISTS `brand`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `brand` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `logo_url` varchar(255) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_brand_tenant` (`tenant_id`),
  CONSTRAINT `fk_brand_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `brand`
--

LOCK TABLES `brand` WRITE;
/*!40000 ALTER TABLE `brand` DISABLE KEYS */;
INSERT INTO `brand` VALUES (1,1,'Apple','apple','https://cdn.techmart.ru/brands/apple.png',1),(2,1,'Samsung','samsung','https://cdn.techmart.ru/brands/samsung.png',1),(3,1,'Sony','sony','https://cdn.techmart.ru/brands/sony.png',1),(4,1,'Xiaomi','xiaomi','https://cdn.techmart.ru/brands/xiaomi.png',1),(5,1,'Lenovo','lenovo','https://cdn.techmart.ru/brands/lenovo.png',1),(6,1,'ASUS','asus','https://cdn.techmart.ru/brands/asus.png',1),(7,1,'JBL','jbl','https://cdn.techmart.ru/brands/jbl.png',1),(8,1,'Bose','bose','https://cdn.techmart.ru/brands/bose.png',1),(9,2,'Apple','gz-apple','https://cdn.gadgetzone.ru/brands/apple.png',1),(10,2,'Samsung','gz-samsung','https://cdn.gadgetzone.ru/brands/samsung.png',1),(11,2,'Xiaomi','gz-xiaomi','https://cdn.gadgetzone.ru/brands/xiaomi.png',1),(12,3,'Bosch','bosch','https://cdn.homeappliances.ru/brands/bosch.png',1),(13,3,'LG','lg','https://cdn.homeappliances.ru/brands/lg.png',1),(14,3,'Philips','philips','https://cdn.homeappliances.ru/brands/philips.png',1),(15,4,'Nike','nike','https://cdn.sportpro.ru/brands/nike.png',1),(16,4,'Adidas','adidas','https://cdn.sportpro.ru/brands/adidas.png',1),(17,4,'Reebok','reebok','https://cdn.sportpro.ru/brands/reebok.png',1),(18,4,'Torneo','torneo','https://cdn.sportpro.ru/brands/torneo.png',1),(19,5,'LEGO','lego','https://cdn.kidsworld.ru/brands/lego.png',1),(20,5,'Hasbro','hasbro','https://cdn.kidsworld.ru/brands/hasbro.png',1),(21,5,'Chicco','chicco','https://cdn.kidsworld.ru/brands/chicco.png',1);
/*!40000 ALTER TABLE `brand` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `session_key` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `fk_cart_tenant` (`tenant_id`),
  KEY `fk_cart_user` (`user_id`),
  CONSTRAINT `fk_cart_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (1,1,7,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(2,1,8,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(3,1,9,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(4,1,10,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(5,1,11,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(6,1,NULL,'sess_anon_a1b2c3d4e5f6','2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(7,2,12,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(8,2,13,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(9,3,14,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(10,3,15,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(11,4,12,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(12,4,16,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(13,5,7,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663'),(14,5,8,NULL,'2026-02-23 19:43:13.321663','2026-02-23 19:43:13.321663');
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_item`
--

DROP TABLE IF EXISTS `cart_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `cart_id` bigint NOT NULL,
  `product_id` bigint NOT NULL,
  `quantity` int NOT NULL DEFAULT '1',
  `price` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartitem_cart` (`cart_id`),
  KEY `fk_cartitem_prod` (`product_id`),
  CONSTRAINT `fk_cartitem_cart` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cartitem_prod` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_item`
--

LOCK TABLES `cart_item` WRITE;
/*!40000 ALTER TABLE `cart_item` DISABLE KEYS */;
INSERT INTO `cart_item` VALUES (1,1,1,1,129990.00),(2,1,16,1,24990.00),(3,2,3,1,119990.00),(4,3,13,1,199990.00),(5,3,17,1,29990.00),(6,4,4,2,39990.00),(7,4,19,1,9990.00),(8,5,5,1,79990.00),(9,6,12,1,29990.00),(10,6,18,2,24990.00),(11,7,21,1,91990.00),(12,7,24,1,4990.00),(13,8,22,1,89990.00),(14,8,25,1,3990.00),(15,9,26,1,69990.00),(16,9,28,1,24990.00),(17,10,27,1,49990.00),(18,11,32,1,34990.00),(19,11,34,1,14990.00),(20,12,33,2,2990.00),(21,13,37,1,4990.00),(22,13,39,1,2490.00),(23,14,38,1,14990.00),(24,14,40,1,1990.00);
/*!40000 ALTER TABLE `cart_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `category`
--

DROP TABLE IF EXISTS `category`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `category` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL,
  `parent_id` bigint DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `icon` varchar(250) DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `order` int DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cat_tenant` (`tenant_id`),
  KEY `fk_cat_parent` (`parent_id`),
  CONSTRAINT `fk_cat_parent` FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_cat_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `category`
--

LOCK TABLES `category` WRITE;
/*!40000 ALTER TABLE `category` DISABLE KEYS */;
INSERT INTO `category` VALUES (1,1,NULL,'Смартфоны и гаджеты','smartphones-gadgets','Смартфоны, планшеты и аксессуары',NULL,1,'2026-02-23 19:43:13.283461','2026-02-23 19:43:13.283461',1),(2,1,NULL,'Ноутбуки и ПК','laptops-pc','Ноутбуки, компьютеры, мониторы',NULL,1,'2026-02-23 19:43:13.283461','2026-02-23 19:43:13.283461',2),(3,1,NULL,'Аудиотехника','audio','Наушники, колонки, усилители',NULL,1,'2026-02-23 19:43:13.283461','2026-02-23 19:43:13.283461',3),(4,1,NULL,'Фото и видео','photo-video','Камеры, объективы, штативы',NULL,1,'2026-02-23 19:43:13.283461','2026-02-23 19:43:13.283461',4),(5,1,1,'Смартфоны','smartphones','Смартфоны всех брендов',NULL,1,'2026-02-23 19:43:13.283461','2026-02-23 19:43:13.283461',1),(6,1,1,'Планшеты','tablets','Планшеты и электронные книги',NULL,1,'2026-02-23 19:43:13.283461','2026-02-23 19:43:13.283461',2),(7,1,1,'Умные часы','smartwatches','Умные часы и браслеты',NULL,1,'2026-02-23 19:43:13.283461','2026-02-23 19:43:13.283461',3),(8,1,2,'Ноутбуки','laptops','Ноутбуки для работы и игр',NULL,1,'2026-02-23 19:43:13.283461','2026-02-23 19:43:13.283461',1),(9,1,2,'Игровые ПК','gaming-pc','Готовые игровые компьютеры',NULL,1,'2026-02-23 19:43:13.283461','2026-02-23 19:43:13.283461',2),(10,1,3,'Наушники','headphones','Проводные и беспроводные наушники',NULL,1,'2026-02-23 19:43:13.283461','2026-02-23 19:43:13.283461',1),(11,1,3,'Беспроводные колонки','bluetooth-speakers','Портативные bluetooth-колонки',NULL,1,'2026-02-23 19:43:13.283461','2026-02-23 19:43:13.283461',2),(12,2,NULL,'Смартфоны','gz-smartphones','Смартфоны и телефоны',NULL,1,'2026-02-23 19:43:13.289978','2026-02-23 19:43:13.289978',1),(13,2,NULL,'Аксессуары','gz-accessories','Чехлы, кабели, зарядки',NULL,1,'2026-02-23 19:43:13.289978','2026-02-23 19:43:13.289978',2),(14,2,NULL,'Умный дом','gz-smarthome','Умные колонки, лампы, розетки',NULL,1,'2026-02-23 19:43:13.289978','2026-02-23 19:43:13.289978',3),(15,3,NULL,'Крупная техника','ha-major','Холодильники, стиральные машины',NULL,1,'2026-02-23 19:43:13.293020','2026-02-23 19:43:13.293020',1),(16,3,NULL,'Мелкая техника','ha-small','Чайники, кофемашины, пылесосы',NULL,1,'2026-02-23 19:43:13.293020','2026-02-23 19:43:13.293020',2),(17,3,NULL,'Климат','ha-climate','Кондиционеры, обогреватели',NULL,1,'2026-02-23 19:43:13.293020','2026-02-23 19:43:13.293020',3),(18,4,NULL,'Фитнес','fitness','Тренажёры и фитнес-оборудование',NULL,1,'2026-02-23 19:43:13.295921','2026-02-23 19:43:13.295921',1),(19,4,NULL,'Велоспорт','cycling','Велосипеды и аксессуары',NULL,1,'2026-02-23 19:43:13.295921','2026-02-23 19:43:13.295921',2),(20,4,NULL,'Командные виды','team-sports','Футбол, баскетбол, волейбол',NULL,1,'2026-02-23 19:43:13.295921','2026-02-23 19:43:13.295921',3),(21,4,18,'Беговые дорожки','treadmills','Беговые дорожки для дома и зала',NULL,1,'2026-02-23 19:43:13.295921','2026-02-23 19:43:13.295921',1),(22,4,18,'Гантели и штанги','weights','Свободные веса',NULL,1,'2026-02-23 19:43:13.295921','2026-02-23 19:43:13.295921',2),(23,5,NULL,'Игрушки','kw-toys','Игрушки для детей всех возрастов',NULL,1,'2026-02-23 19:43:13.298599','2026-02-23 19:43:13.298599',1),(24,5,NULL,'Книги и игры','kw-books','Детские книги и настольные игры',NULL,1,'2026-02-23 19:43:13.298599','2026-02-23 19:43:13.298599',2),(25,5,NULL,'Одежда','kw-clothes','Детская одежда и обувь',NULL,1,'2026-02-23 19:43:13.298599','2026-02-23 19:43:13.298599',3),(26,5,23,'Конструкторы','kw-lego','Конструкторы и сборные модели',NULL,1,'2026-02-23 19:43:13.298599','2026-02-23 19:43:13.298599',1),(27,5,23,'Мягкие игрушки','kw-plush','Плюшевые медведи и персонажи',NULL,1,'2026-02-23 19:43:13.298599','2026-02-23 19:43:13.298599',2);
/*!40000 ALTER TABLE `category` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notification`
--

DROP TABLE IF EXISTS `notification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notification` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `type` varchar(20) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `message` text,
  `is_read` tinyint(1) DEFAULT '0',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `fk_notif_tenant` (`tenant_id`),
  KEY `fk_notif_user` (`user_id`),
  CONSTRAINT `fk_notif_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_notif_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notification`
--

LOCK TABLES `notification` WRITE;
/*!40000 ALTER TABLE `notification` DISABLE KEYS */;
INSERT INTO `notification` VALUES (1,1,7,'order','Заказ оформлен','Ваш заказ ORD-20240301-00001 успешно оформлен.',1,'2024-03-01 10:22:14.000000'),(2,1,7,'order','Заказ выполнен','Ваш заказ ORD-20240301-00001 доставлен. Спасибо!',1,'2024-03-05 14:00:00.000000'),(3,1,8,'order','Заказ оформлен','Ваш заказ ORD-20240315-00002 успешно оформлен.',1,'2024-03-15 14:05:33.000000'),(4,1,8,'order','Заказ выполнен','Ваш заказ ORD-20240315-00002 доставлен. Спасибо!',1,'2024-03-20 11:00:00.000000'),(5,1,9,'order','Заказ оформлен','Ваш заказ ORD-20240402-00003 успешно оформлен.',1,'2024-04-02 09:10:00.000000'),(6,1,9,'order','Заказ выполнен','Ваш заказ ORD-20240402-00003 доставлен. Спасибо!',1,'2024-04-08 16:00:00.000000'),(7,1,10,'order','Заказ отправлен','Ваш заказ ORD-20240418-00004 передан в службу доставки.',1,'2024-04-20 09:00:00.000000'),(8,1,11,'order','Заказ подтверждён','Ваш заказ ORD-20240510-00005 подтверждён, готовится к отправке.',1,'2024-05-11 10:00:00.000000'),(9,1,9,'system','Отмена заказа','Ваш заказ ORD-20240501-00014 был отменён.',1,'2024-05-01 13:00:00.000000'),(10,1,13,'order','Заказ отправлен','Ваш заказ ORD-20240710-00008 передан в службу доставки.',0,'2024-07-12 09:00:00.000000'),(11,1,14,'order','Заказ отправлен','Ваш заказ ORD-20240718-00009 передан в службу доставки.',0,'2024-07-19 11:00:00.000000'),(12,1,15,'order','Заказ подтверждён','Ваш заказ ORD-20240720-00010 подтверждён.',0,'2024-07-20 10:00:00.000000'),(13,1,16,'order','Заказ подтверждён','Ваш заказ ORD-20240721-00011 подтверждён.',0,'2024-07-21 15:00:00.000000'),(14,1,7,'promo','Скидка 10% на аксессуары','Только до конца недели: −10% на все аксессуары Apple.',0,'2024-07-20 12:00:00.000000'),(15,1,8,'promo','Новинки Samsung в магазине','Мы обновили ассортимент смартфонов Samsung. Смотрите!',0,'2024-07-21 12:00:00.000000'),(16,2,12,'order','Заказ выполнен','Ваш заказ ORD-20240610-00015 доставлен. Спасибо!',1,'2024-06-15 14:00:00.000000'),(17,2,13,'order','Заказ отправлен','Ваш заказ ORD-20240715-00016 передан в службу доставки.',0,'2024-07-17 09:00:00.000000'),(18,3,14,'order','Заказ выполнен','Ваш заказ ORD-20240620-00017 доставлен. Спасибо!',1,'2024-06-28 12:00:00.000000'),(19,3,15,'order','Заказ подтверждён','Ваш заказ ORD-20240710-00018 подтверждён.',0,'2024-07-10 10:00:00.000000'),(20,3,14,'promo','Летняя распродажа техники','Скидки до 20% на климатическую технику. Только в июле!',0,'2024-07-15 10:00:00.000000'),(21,4,12,'order','Заказ выполнен','Ваш заказ ORD-20240625-00019 доставлен. Спасибо за покупку!',1,'2024-07-02 14:00:00.000000'),(22,4,13,'order','Заказ отправлен','Ваш заказ ORD-20240710-00020 передан в службу доставки.',0,'2024-07-12 10:00:00.000000'),(23,4,16,'order','Заказ оформлен','Ваш заказ ORD-20240718-00021 успешно оформлен.',0,'2024-07-18 15:00:00.000000'),(24,5,7,'order','Заказ выполнен','Ваш заказ ORD-20240701-00022 доставлен. Спасибо!',1,'2024-07-05 12:00:00.000000'),(25,5,8,'order','Заказ отправлен','Ваш заказ ORD-20240715-00023 передан в службу доставки.',0,'2024-07-17 10:00:00.000000'),(26,5,7,'promo','Новинки LEGO уже в магазине','Наборы LEGO Technic и Star Wars — пополнение ассортимента!',0,'2024-07-20 09:00:00.000000');
/*!40000 ALTER TABLE `notification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `order_number` varchar(50) NOT NULL,
  `customer_name` varchar(255) DEFAULT NULL,
  `customer_email` varchar(255) DEFAULT NULL,
  `customer_phone` varchar(20) DEFAULT NULL,
  `shipping_address` varchar(500) DEFAULT NULL,
  `shipping_city` varchar(100) DEFAULT NULL,
  `shipping_postal_code` varchar(20) DEFAULT NULL,
  `subtotal` decimal(10,2) DEFAULT '0.00',
  `shipping_cost` decimal(10,2) DEFAULT '0.00',
  `total` decimal(10,2) DEFAULT '0.00',
  `status` varchar(20) DEFAULT 'pending',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `paid_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `fk_order_tenant` (`tenant_id`),
  KEY `fk_order_user` (`user_id`),
  CONSTRAINT `fk_order_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (1,1,7,'ORD-20240301-00001','Иван Петров','ivan.petrov@gmail.com','+79031112233','ул. Тверская, 14, кв. 22','Москва','125009',129990.00,0.00,129990.00,'completed','2024-03-01 10:22:14.000000','2024-03-05 14:00:00.000000','2024-03-01 10:30:00.000000'),(2,1,8,'ORD-20240315-00002','Мария Козлова','maria.kozlova@yandex.ru','+79052223344','ул. Садовая, 33, кв. 5','Санкт-Петербург','190005',74970.00,350.00,75320.00,'completed','2024-03-15 14:05:33.000000','2024-03-20 11:00:00.000000','2024-03-15 14:15:00.000000'),(3,1,9,'ORD-20240402-00003','Александр Новиков','alex.novikov@mail.ru','+79163334455','ул. Ленина, 7, кв. 18','Новосибирск','630004',199990.00,500.00,200490.00,'completed','2024-04-02 09:10:00.000000','2024-04-08 16:00:00.000000','2024-04-02 09:20:00.000000'),(4,1,10,'ORD-20240418-00004','Елена Сорокина','e.sorokina@gmail.com','+79264445566','пр. Мира, 41, кв. 9','Екатеринбург','620000',39990.00,300.00,40290.00,'completed','2024-04-18 17:45:22.000000','2024-04-23 10:00:00.000000','2024-04-18 17:55:00.000000'),(5,1,11,'ORD-20240510-00005','Никита Воронов','n.voronov@yandex.ru','+79175556677','ул. Пушкина, 2, кв. 3','Казань','420000',89990.00,0.00,89990.00,'completed','2024-05-10 12:00:00.000000','2024-05-16 12:00:00.000000','2024-05-10 12:10:00.000000'),(6,1,7,'ORD-20240602-00006','Иван Петров','ivan.petrov@gmail.com','+79031112233','ул. Тверская, 14, кв. 22','Москва','125009',79990.00,0.00,79990.00,'delivered','2024-06-02 11:30:00.000000','2024-06-06 15:00:00.000000','2024-06-02 11:40:00.000000'),(7,1,12,'ORD-20240620-00007','Ольга Михайлова','olga.m@mail.ru','+79386667788','ул. Гагарина, 18, кв. 7','Самара','443001',59980.00,350.00,60330.00,'delivered','2024-06-20 08:15:00.000000','2024-06-25 13:00:00.000000','2024-06-20 08:25:00.000000'),(8,1,13,'ORD-20240710-00008','Андрей Лебедев','andrey.leb@gmail.com','+79097778899','ул. Советская, 55, кв. 12','Ростов-на-Дону','344000',149990.00,500.00,150490.00,'shipped','2024-07-10 15:00:00.000000','2024-07-12 09:00:00.000000','2024-07-10 15:10:00.000000'),(9,1,14,'ORD-20240718-00009','Светлана Филиппова','s.filippova@yandex.ru','+79218889900','ул. Коммунистическая, 3','Уфа','450000',24990.00,300.00,25290.00,'shipped','2024-07-18 10:22:00.000000','2024-07-19 11:00:00.000000','2024-07-18 10:32:00.000000'),(10,1,15,'ORD-20240720-00010','Роман Степанов','roman.step@mail.ru','+79129990011','ул. Чехова, 22, кв. 4','Пермь','614000',29990.00,300.00,30290.00,'confirmed','2024-07-20 09:00:00.000000','2024-07-20 10:00:00.000000','2024-07-20 09:10:00.000000'),(11,1,16,'ORD-20240721-00011','Дарья Костина','d.kostina@gmail.com','+79030001122','ул. Октябрьская, 9, кв. 11','Воронеж','394000',109990.00,0.00,109990.00,'confirmed','2024-07-21 14:00:00.000000','2024-07-21 15:00:00.000000','2024-07-21 14:10:00.000000'),(12,1,7,'ORD-20240722-00012','Иван Петров','ivan.petrov@gmail.com','+79031112233','ул. Тверская, 14, кв. 22','Москва','125009',11990.00,0.00,11990.00,'pending','2024-07-22 08:00:00.000000','2024-07-22 08:00:00.000000',NULL),(13,1,8,'ORD-20240722-00013','Мария Козлова','maria.kozlova@yandex.ru','+79052223344','ул. Садовая, 33, кв. 5','Санкт-Петербург','190005',39990.00,350.00,40340.00,'pending','2024-07-22 09:30:00.000000','2024-07-22 09:30:00.000000',NULL),(14,1,9,'ORD-20240501-00014','Александр Новиков','alex.novikov@mail.ru','+79163334455','ул. Ленина, 7, кв. 18','Новосибирск','630004',29990.00,300.00,30290.00,'cancelled','2024-05-01 11:00:00.000000','2024-05-01 13:00:00.000000',NULL),(15,2,12,'ORD-20240610-00015','Ольга Михайлова','olga.m@mail.ru','+79386667788','ул. Гагарина, 18, кв. 7','Самара','443001',96980.00,350.00,97330.00,'completed','2024-06-10 11:00:00.000000','2024-06-15 14:00:00.000000','2024-06-10 11:10:00.000000'),(16,2,13,'ORD-20240715-00016','Андрей Лебедев','andrey.leb@gmail.com','+79097778899','ул. Советская, 55, кв. 12','Ростов-на-Дону','344000',89990.00,350.00,90340.00,'shipped','2024-07-15 10:00:00.000000','2024-07-17 09:00:00.000000','2024-07-15 10:15:00.000000'),(17,3,14,'ORD-20240620-00017','Светлана Филиппова','s.filippova@yandex.ru','+79218889900','ул. Коммунистическая, 3','Уфа','450000',94980.00,500.00,95480.00,'completed','2024-06-20 14:00:00.000000','2024-06-28 12:00:00.000000','2024-06-20 14:10:00.000000'),(18,3,15,'ORD-20240710-00018','Роман Степанов','roman.step@mail.ru','+79129990011','ул. Чехова, 22, кв. 4','Пермь','614000',49990.00,500.00,50490.00,'confirmed','2024-07-10 09:00:00.000000','2024-07-10 10:00:00.000000','2024-07-10 09:15:00.000000'),(19,4,12,'ORD-20240625-00019','Ольга Михайлова','olga.m@mail.ru','+79386667788','ул. Гагарина, 18, кв. 7','Самара','443001',34990.00,500.00,35490.00,'completed','2024-06-25 12:00:00.000000','2024-07-02 14:00:00.000000','2024-06-25 12:10:00.000000'),(20,4,13,'ORD-20240710-00020','Андрей Лебедев','andrey.leb@gmail.com','+79097778899','ул. Советская, 55, кв. 12','Ростов-на-Дону','344000',29990.00,500.00,30490.00,'shipped','2024-07-10 16:00:00.000000','2024-07-12 10:00:00.000000','2024-07-10 16:10:00.000000'),(21,4,16,'ORD-20240718-00021','Дарья Костина','d.kostina@gmail.com','+79030001122','ул. Октябрьская, 9, кв. 11','Воронеж','394000',20970.00,300.00,21270.00,'pending','2024-07-18 15:00:00.000000','2024-07-18 15:00:00.000000',NULL),(22,5,7,'ORD-20240701-00022','Иван Петров','ivan.petrov@gmail.com','+79031112233','ул. Тверская, 14, кв. 22','Москва','125009',7480.00,0.00,7480.00,'completed','2024-07-01 10:00:00.000000','2024-07-05 12:00:00.000000','2024-07-01 10:10:00.000000'),(23,5,8,'ORD-20240715-00023','Мария Козлова','maria.kozlova@yandex.ru','+79052223344','ул. Садовая, 33, кв. 5','Санкт-Петербург','190005',16980.00,350.00,17330.00,'shipped','2024-07-15 11:00:00.000000','2024-07-17 10:00:00.000000','2024-07-15 11:15:00.000000');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_item`
--

DROP TABLE IF EXISTS `order_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_id` bigint NOT NULL,
  `product_id` bigint DEFAULT NULL,
  `product_name` varchar(255) NOT NULL,
  `product_sku` varchar(100) DEFAULT NULL,
  `quantity` int NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `subtotal` decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_oi_order` (`order_id`),
  KEY `fk_oi_product` (`product_id`),
  CONSTRAINT `fk_oi_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oi_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_item`
--

LOCK TABLES `order_item` WRITE;
/*!40000 ALTER TABLE `order_item` DISABLE KEYS */;
INSERT INTO `order_item` VALUES (1,1,1,'Apple iPhone 15 Pro 256GB','APP-IP15P-256',1,129990.00,129990.00),(2,2,16,'Apple AirPods Pro 2','APP-APP2',1,24990.00,24990.00),(3,2,19,'JBL Charge 5','JBL-CHG5',1,9990.00,9990.00),(4,2,4,'Samsung Galaxy A55 128GB','SAM-A55-128',1,39990.00,39990.00),(5,3,13,'Apple MacBook Pro 14\" M3 Pro','APP-MBP14-M3P',1,199990.00,199990.00),(6,4,4,'Samsung Galaxy A55 128GB','SAM-A55-128',1,39990.00,39990.00),(7,5,2,'Apple iPhone 15 128GB','APP-IP15-128',1,89990.00,89990.00),(8,6,5,'Xiaomi 14 Pro 512GB','XIA-14P-512',1,79990.00,79990.00),(9,7,17,'Sony WH-1000XM5','SNY-WH1000XM5',1,29990.00,29990.00),(10,7,6,'Xiaomi Redmi Note 13 Pro 256GB','XIA-RN13P-256',1,29990.00,29990.00),(11,8,14,'Lenovo ThinkPad X1 Carbon G12','LEN-X1CG12',1,149990.00,149990.00),(12,9,16,'Apple AirPods Pro 2','APP-APP2',1,24990.00,24990.00),(13,10,12,'Samsung Galaxy Watch 6 Classic','SAM-GW6C-47',1,29990.00,29990.00),(14,11,8,'Apple iPad Pro 12.9\" M4 256GB','APP-IPP-M4-256',1,109990.00,109990.00),(15,12,20,'Sony SRS-XB43','SNY-SRSXB43',1,11990.00,11990.00),(16,13,4,'Samsung Galaxy A55 128GB','SAM-A55-128',1,39990.00,39990.00),(17,14,12,'Samsung Galaxy Watch 6 Classic','SAM-GW6C-47',1,29990.00,29990.00),(18,15,21,'Apple iPhone 15 128GB (GZ)','GZ-APP-IP15-128',1,91990.00,91990.00),(19,15,24,'Чехол Apple Silicone iPhone 15','GZ-CASE-IP15-SIL',1,4990.00,4990.00),(20,16,22,'Samsung Galaxy S24 128GB (GZ)','GZ-SAM-S24-128',1,89990.00,89990.00),(21,17,26,'Bosch Serie 6 Холодильник 350L','HA-BSC-FRDG-350',1,69990.00,69990.00),(22,17,28,'Philips Кофемашина 2200 Series','HA-PHL-COF-2200',1,24990.00,24990.00),(23,18,27,'LG Стиральная машина 9кг F4WV509','HA-LG-WM-9KG',1,49990.00,49990.00),(24,19,32,'Беговая дорожка Torneo Alfa 2.0','TOR-ALFA2',1,34990.00,34990.00),(25,20,35,'Велосипед Reebok One GT40S','REE-GT40S',1,29990.00,29990.00),(26,21,33,'Гантели Nike 10 кг пара','NIK-DB10',2,2990.00,5980.00),(27,21,34,'Штанга Adidas 60 кг набор','ADI-BB60',1,14990.00,14990.00),(28,22,37,'LEGO City Полицейский участок','KW-LEGO-CIT-POL',1,4990.00,4990.00),(29,22,39,'Мягкая игрушка Hasbro FurReal','KW-HAS-FUR-BEAR',1,2490.00,2490.00),(30,23,38,'LEGO Technic Bugatti Chiron','KW-LEGO-TEC-BUG',1,14990.00,14990.00),(31,23,40,'Монополия Hasbro классика','KW-HAS-MONO-RU',1,1990.00,1990.00);
/*!40000 ALTER TABLE `order_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment`
--

DROP TABLE IF EXISTS `payment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `payment` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL,
  `order_id` bigint NOT NULL,
  `payment_method` varchar(20) DEFAULT NULL,
  `status` varchar(20) DEFAULT 'pending',
  `amount` decimal(10,2) NOT NULL,
  `transaction_id` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `completed_at` datetime(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `fk_payment_tenant` (`tenant_id`),
  CONSTRAINT `fk_payment_order` FOREIGN KEY (`order_id`) REFERENCES `order` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_payment_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment`
--

LOCK TABLES `payment` WRITE;
/*!40000 ALTER TABLE `payment` DISABLE KEYS */;
INSERT INTO `payment` VALUES (1,1,1,'card','completed',129990.00,'TXN-2024030100001','2024-03-01 10:30:00.000000','2024-03-01 10:30:45.000000'),(2,1,2,'card','completed',75320.00,'TXN-2024031500002','2024-03-15 14:15:00.000000','2024-03-15 14:15:52.000000'),(3,1,3,'sbp','completed',200490.00,'TXN-2024040200003','2024-04-02 09:20:00.000000','2024-04-02 09:20:31.000000'),(4,1,4,'card','completed',40290.00,'TXN-2024041800004','2024-04-18 17:55:00.000000','2024-04-18 17:55:18.000000'),(5,1,5,'sbp','completed',89990.00,'TXN-2024051000005','2024-05-10 12:10:00.000000','2024-05-10 12:10:22.000000'),(6,1,6,'card','completed',79990.00,'TXN-2024060200006','2024-06-02 11:40:00.000000','2024-06-02 11:40:09.000000'),(7,1,7,'cash','completed',60330.00,NULL,'2024-06-20 08:25:00.000000','2024-06-25 13:00:00.000000'),(8,1,8,'card','completed',150490.00,'TXN-2024071000008','2024-07-10 15:10:00.000000','2024-07-10 15:10:33.000000'),(9,1,9,'sbp','completed',25290.00,'TXN-2024071800009','2024-07-18 10:32:00.000000','2024-07-18 10:32:14.000000'),(10,1,10,'card','completed',30290.00,'TXN-2024072000010','2024-07-20 09:10:00.000000','2024-07-20 09:10:05.000000'),(11,1,11,'sbp','completed',109990.00,'TXN-2024072100011','2024-07-21 14:10:00.000000','2024-07-21 14:10:20.000000'),(12,1,12,'card','pending',11990.00,NULL,'2024-07-22 08:00:00.000000',NULL),(13,1,13,'card','pending',40340.00,NULL,'2024-07-22 09:30:00.000000',NULL),(14,2,15,'card','completed',97330.00,'TXN-2024061000015','2024-06-10 11:10:00.000000','2024-06-10 11:10:40.000000'),(15,2,16,'sbp','completed',90340.00,'TXN-2024071500016','2024-07-15 10:15:00.000000','2024-07-15 10:15:18.000000'),(16,3,17,'card','completed',95480.00,'TXN-2024062000017','2024-06-20 14:10:00.000000','2024-06-20 14:10:55.000000'),(17,3,18,'sbp','completed',50490.00,'TXN-2024071000018','2024-07-10 09:15:00.000000','2024-07-10 09:15:30.000000'),(18,4,19,'card','completed',35490.00,'TXN-2024062500019','2024-06-25 12:10:00.000000','2024-06-25 12:10:40.000000'),(19,4,20,'sbp','completed',30490.00,'TXN-2024071000020','2024-07-10 16:10:00.000000','2024-07-10 16:10:18.000000'),(20,4,21,'card','pending',21270.00,NULL,'2024-07-18 15:00:00.000000',NULL),(21,5,22,'sbp','completed',7480.00,'TXN-2024070100022','2024-07-01 10:10:00.000000','2024-07-01 10:10:22.000000'),(22,5,23,'card','completed',17330.00,'TXN-2024071500023','2024-07-15 11:15:00.000000','2024-07-15 11:15:35.000000');
/*!40000 ALTER TABLE `payment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL,
  `category_id` bigint DEFAULT NULL,
  `brand_id` bigint DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `description` text,
  `sku` varchar(100) DEFAULT NULL,
  `price` decimal(10,2) NOT NULL DEFAULT '0.00',
  `compare_price` decimal(10,2) DEFAULT NULL,
  `stock_quantity` int DEFAULT '0',
  `track_inventory` tinyint(1) DEFAULT '1',
  `images` json DEFAULT NULL,
  `attributes` json DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_featured` tinyint(1) DEFAULT '0',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `fk_prod_tenant` (`tenant_id`),
  KEY `fk_prod_cat` (`category_id`),
  KEY `fk_prod_brand` (`brand_id`),
  CONSTRAINT `fk_prod_brand` FOREIGN KEY (`brand_id`) REFERENCES `brand` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_prod_cat` FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_prod_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (1,1,5,1,'Apple iPhone 15 Pro 256GB','apple-iphone-15-pro-256','Флагманский смартфон Apple с титановым корпусом, чипом A17 Pro и камерой 48 Мп.','APP-IP15P-256',129990.00,149990.00,40,1,NULL,NULL,1,1,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(2,1,5,1,'Apple iPhone 15 128GB','apple-iphone-15-128','Смартфон Apple с Dynamic Island, чипом A16 Bionic и USB-C.','APP-IP15-128',89990.00,99990.00,60,1,NULL,NULL,1,1,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(3,1,5,2,'Samsung Galaxy S24 Ultra 256GB','samsung-s24-ultra-256','Флагман Samsung с S Pen, 200 Мп камерой и Galaxy AI.','SAM-S24U-256',119990.00,134990.00,35,1,NULL,NULL,1,1,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(4,1,5,2,'Samsung Galaxy A55 128GB','samsung-galaxy-a55-128','Стильный смартфон с AMOLED 120 Гц и тройной камерой.','SAM-A55-128',39990.00,44990.00,80,1,NULL,NULL,1,0,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(5,1,5,4,'Xiaomi 14 Pro 512GB','xiaomi-14-pro-512','Флагман Xiaomi с камерой Leica и процессором Snapdragon 8 Gen 3.','XIA-14P-512',79990.00,89990.00,25,1,NULL,NULL,1,1,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(6,1,5,4,'Xiaomi Redmi Note 13 Pro 256GB','xiaomi-redmi-note-13-pro-256','Смартфон с 200 Мп камерой и быстрой зарядкой 67 Вт.','XIA-RN13P-256',29990.00,34990.00,120,1,NULL,NULL,1,0,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(7,1,5,2,'Samsung Galaxy S23 128GB','samsung-galaxy-s23-128','Предыдущее поколение флагмана Samsung. Снят с продажи.','SAM-S23-128',59990.00,74990.00,0,1,NULL,NULL,0,0,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(8,1,6,1,'Apple iPad Pro 12.9\" M4 256GB','apple-ipad-pro-129-m4-256','Профессиональный планшет с чипом M4, OLED-дисплеем и Apple Pencil Pro.','APP-IPP-M4-256',109990.00,119990.00,20,1,NULL,NULL,1,1,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(9,1,6,2,'Samsung Galaxy Tab S9+ 256GB','samsung-galaxy-tab-s9-plus-256','Планшет с AMOLED 12.4\", S Pen в комплекте и защитой IP68.','SAM-TABS9P-256',69990.00,79990.00,30,1,NULL,NULL,1,0,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(10,1,6,1,'Apple iPad mini 7 256GB','apple-ipad-mini-7-256','Компактный планшет с чипом A17 Pro и экраном 8.3\".','APP-IPMINI7-256',59990.00,64990.00,0,1,NULL,NULL,1,0,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(11,1,7,1,'Apple Watch Series 9 45mm GPS','apple-watch-s9-45-gps','Умные часы с чипом S9, двойным касанием и точным мониторингом здоровья.','APP-AWS9-45GPS',39990.00,44990.00,55,1,NULL,NULL,1,1,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(12,1,7,2,'Samsung Galaxy Watch 6 Classic','samsung-galaxy-watch-6-classic','Умные часы с вращающимся безелем, ЭКГ и анализом сна.','SAM-GW6C-47',29990.00,33990.00,45,1,NULL,NULL,1,0,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(13,1,8,1,'Apple MacBook Pro 14\" M3 Pro','apple-macbook-pro-14-m3-pro','Профессиональный ноутбук с чипом M3 Pro, 18 ГБ RAM, автономность до 18 ч.','APP-MBP14-M3P',199990.00,219990.00,15,1,NULL,NULL,1,1,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(14,1,8,5,'Lenovo ThinkPad X1 Carbon G12','lenovo-thinkpad-x1-carbon-g12','Ультратонкий бизнес-ноутбук с Intel Core Ultra 7, 32 ГБ RAM, вес 1.12 кг.','LEN-X1CG12',149990.00,164990.00,12,1,NULL,NULL,1,0,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(15,1,8,6,'ASUS ROG Zephyrus G16','asus-rog-zephyrus-g16','Игровой ноутбук с Ryzen 9, RTX 4080, дисплей 240 Гц, Thunderbolt 4.','ASUS-ROGZG16',189990.00,209990.00,8,1,NULL,NULL,1,1,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(16,1,10,1,'Apple AirPods Pro 2','apple-airpods-pro-2','Наушники с ANC, адаптивным аудио и USB-C.','APP-APP2',24990.00,27990.00,90,1,NULL,NULL,1,1,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(17,1,10,3,'Sony WH-1000XM5','sony-wh-1000xm5','Накладные наушники с лучшим в классе ANC и 30 ч работы.','SNY-WH1000XM5',29990.00,34990.00,40,1,NULL,NULL,1,1,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(18,1,10,8,'Bose QuietComfort 45','bose-quietcomfort-45','Комфортные наушники с ANC, время работы до 24 ч.','BSE-QC45',24990.00,27990.00,35,1,NULL,NULL,1,0,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(19,1,11,7,'JBL Charge 5','jbl-charge-5','Колонка с мощным звуком, IP67, powerbank, 20 ч работы.','JBL-CHG5',9990.00,11990.00,75,1,NULL,NULL,1,0,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(20,1,11,3,'Sony SRS-XB43','sony-srs-xb43','Мощная колонка с Extra Bass, Live Sound и защитой IP67.','SNY-SRSXB43',11990.00,13990.00,50,1,NULL,NULL,1,0,'2026-02-23 19:43:13.305530','2026-02-23 19:43:13.305530'),(21,2,12,9,'Apple iPhone 15 128GB','gz-iphone-15-128','Смартфон Apple с USB-C и Dynamic Island.','GZ-APP-IP15-128',91990.00,99990.00,30,1,NULL,NULL,1,1,'2026-02-23 19:43:13.310927','2026-02-23 19:43:13.310927'),(22,2,12,10,'Samsung Galaxy S24 128GB','gz-samsung-s24-128','Флагманский смартфон Samsung с Galaxy AI.','GZ-SAM-S24-128',89990.00,99990.00,25,1,NULL,NULL,1,1,'2026-02-23 19:43:13.310927','2026-02-23 19:43:13.310927'),(23,2,12,11,'Xiaomi Redmi Note 13 128GB','gz-redmi-note-13','Смартфон с AMOLED и камерой 108 Мп.','GZ-XIA-RN13-128',19990.00,24990.00,70,1,NULL,NULL,1,0,'2026-02-23 19:43:13.310927','2026-02-23 19:43:13.310927'),(24,2,13,9,'Чехол Apple Silicone iPhone 15','gz-case-ip15-silicon','Оригинальный силиконовый чехол Apple для iPhone 15.','GZ-CASE-IP15-SIL',4990.00,5990.00,150,1,NULL,NULL,1,0,'2026-02-23 19:43:13.310927','2026-02-23 19:43:13.310927'),(25,2,14,11,'Xiaomi Smart Speaker','gz-xiao-speaker','Умная колонка с голосовым ассистентом.','GZ-XIA-SPEAK',3990.00,4990.00,40,1,NULL,NULL,1,0,'2026-02-23 19:43:13.310927','2026-02-23 19:43:13.310927'),(26,3,15,12,'Bosch Serie 6 Холодильник 350L','bosch-fridge-350l','Двухкамерный холодильник с системой NoFrost.','HA-BSC-FRDG-350',69990.00,79990.00,12,1,NULL,NULL,1,1,'2026-02-23 19:43:13.314120','2026-02-23 19:43:13.314120'),(27,3,15,13,'LG Стиральная машина 9кг F4WV509','lg-wm-9kg','Стиральная машина с прямым приводом и паром.','HA-LG-WM-9KG',49990.00,57990.00,8,1,NULL,NULL,1,1,'2026-02-23 19:43:13.314120','2026-02-23 19:43:13.314120'),(28,3,16,14,'Philips Кофемашина 2200 Series','philips-coffee-2200','Автоматическая кофемашина с капучинатором.','HA-PHL-COF-2200',24990.00,29990.00,20,1,NULL,NULL,1,0,'2026-02-23 19:43:13.314120','2026-02-23 19:43:13.314120'),(29,3,16,13,'LG Пылесос A9K-ULTRA2','lg-vacuum-a9k','Беспроводной пылесос с зарядной станцией.','HA-LG-VAC-A9K',34990.00,39990.00,15,1,NULL,NULL,1,0,'2026-02-23 19:43:13.314120','2026-02-23 19:43:13.314120'),(30,3,17,12,'Bosch Кондиционер CL3000i 24','bosch-ac-cl3000i','Инверторный кондиционер 24 BTU с WiFi.','HA-BSC-AC-24',54990.00,62990.00,6,1,NULL,NULL,1,1,'2026-02-23 19:43:13.314120','2026-02-23 19:43:13.314120'),(31,3,16,14,'Philips Чайник HD9350','philips-kettle-hd9350','Электрический чайник 1.7 л. Снят с продажи.','HA-PHL-KET-HD9350',2490.00,3490.00,0,1,NULL,NULL,0,0,'2026-02-23 19:43:13.314120','2026-02-23 19:43:13.314120'),(32,4,21,18,'Беговая дорожка Torneo Alfa 2.0','torneo-alfa-2','Домашняя дорожка 2.5 л.с., полотно 130×45 см, 15 программ.','TOR-ALFA2',34990.00,39990.00,10,1,NULL,NULL,1,1,'2026-02-23 19:43:13.316688','2026-02-23 19:43:13.316688'),(33,4,22,15,'Гантели Nike 10 кг пара','nike-dumbbells-10','Неопреновые гантели для дома, пара 10 кг.','NIK-DB10',2990.00,3490.00,60,1,NULL,NULL,1,0,'2026-02-23 19:43:13.316688','2026-02-23 19:43:13.316688'),(34,4,22,16,'Штанга Adidas 60 кг набор','adidas-barbell-60','Гриф 180 см + обрезиненные диски, 60 кг.','ADI-BB60',14990.00,17990.00,15,1,NULL,NULL,1,1,'2026-02-23 19:43:13.316688','2026-02-23 19:43:13.316688'),(35,4,19,17,'Велосипед Reebok One GT40S','reebok-gt40s','Горный велосипед 27.5\", 21 скорость, дисковые тормоза.','REE-GT40S',29990.00,34990.00,20,1,NULL,NULL,1,0,'2026-02-23 19:43:13.316688','2026-02-23 19:43:13.316688'),(36,4,20,15,'Мяч Nike Premier League','nike-football-pl','Официальный мяч Английской Премьер-лиги, размер 5.','NIK-FB-PL5',3490.00,4490.00,80,1,NULL,NULL,1,0,'2026-02-23 19:43:13.316688','2026-02-23 19:43:13.316688'),(37,5,26,19,'LEGO City Полицейский участок','lego-city-police','Конструктор 668 деталей, для детей от 7 лет.','KW-LEGO-CIT-POL',4990.00,5990.00,50,1,NULL,NULL,1,1,'2026-02-23 19:43:13.319203','2026-02-23 19:43:13.319203'),(38,5,26,19,'LEGO Technic Bugatti Chiron','lego-technic-bugatti','Конструктор 3599 деталей, детальная модель суперкара.','KW-LEGO-TEC-BUG',14990.00,17990.00,15,1,NULL,NULL,1,1,'2026-02-23 19:43:13.319203','2026-02-23 19:43:13.319203'),(39,5,27,20,'Мягкая игрушка Hasbro FurReal','hasbro-furreal-bear','Интерактивный плюшевый медведь, реагирует на касание.','KW-HAS-FUR-BEAR',2490.00,2990.00,40,1,NULL,NULL,1,0,'2026-02-23 19:43:13.319203','2026-02-23 19:43:13.319203'),(40,5,24,20,'Монополия Hasbro классика','hasbro-monopoly','Классическая настольная игра для всей семьи.','KW-HAS-MONO-RU',1990.00,2490.00,60,1,NULL,NULL,1,0,'2026-02-23 19:43:13.319203','2026-02-23 19:43:13.319203'),(41,5,25,21,'Комбинезон Chicco 74см','chicco-overalls-74','Тёплый детский комбинезон на молнии, размер 74.','KW-CHI-OVER-74',990.00,1490.00,35,1,NULL,NULL,1,0,'2026-02-23 19:43:13.319203','2026-02-23 19:43:13.319203'),(42,5,26,19,'LEGO Star Wars Тысячелетний сокол','lego-sw-falcon','Легендарная модель 7541 деталь, для коллекционеров.','KW-LEGO-SW-FAL',49990.00,59990.00,0,1,NULL,NULL,1,0,'2026-02-23 19:43:13.319203','2026-02-23 19:43:13.319203');
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `site_config`
--

DROP TABLE IF EXISTS `site_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `site_config` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` json DEFAULT NULL,
  `description` text,
  `is_active` tinyint(1) DEFAULT '1',
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `fk_siteconfig_tenant` (`tenant_id`),
  CONSTRAINT `fk_siteconfig_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `site_config`
--

LOCK TABLES `site_config` WRITE;
/*!40000 ALTER TABLE `site_config` DISABLE KEYS */;
INSERT INTO `site_config` VALUES (1,1,'currency','\"RUB\"','Валюта',1,'2026-02-23 19:43:13.279725'),(2,1,'free_ship_from','5000','Бесплатная доставка от (руб.)',1,'2026-02-23 19:43:13.279725'),(3,1,'default_tax_pct','20','НДС (%)',1,'2026-02-23 19:43:13.279725'),(4,1,'max_cart_items','50','Макс. кол-во позиций в корзине',1,'2026-02-23 19:43:13.279725'),(5,2,'currency','\"RUB\"','Валюта',1,'2026-02-23 19:43:13.279725'),(6,2,'free_ship_from','4000','Бесплатная доставка от (руб.)',1,'2026-02-23 19:43:13.279725'),(7,2,'default_tax_pct','20','НДС (%)',1,'2026-02-23 19:43:13.279725'),(8,2,'max_cart_items','30','Макс. кол-во позиций в корзине',1,'2026-02-23 19:43:13.279725'),(9,3,'currency','\"RUB\"','Валюта',1,'2026-02-23 19:43:13.279725'),(10,3,'free_ship_from','6000','Бесплатная доставка от (руб.)',1,'2026-02-23 19:43:13.279725'),(11,3,'default_tax_pct','20','НДС (%)',1,'2026-02-23 19:43:13.279725'),(12,4,'currency','\"RUB\"','Валюта',1,'2026-02-23 19:43:13.279725'),(13,4,'free_ship_from','3000','Бесплатная доставка от (руб.)',1,'2026-02-23 19:43:13.279725'),(14,4,'default_tax_pct','20','НДС (%)',1,'2026-02-23 19:43:13.279725'),(15,5,'currency','\"RUB\"','Валюта',1,'2026-02-23 19:43:13.279725'),(16,5,'free_ship_from','2500','Бесплатная доставка от (руб.)',1,'2026-02-23 19:43:13.279725'),(17,5,'default_tax_pct','20','НДС (%)',1,'2026-02-23 19:43:13.279725');
/*!40000 ALTER TABLE `site_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant`
--

DROP TABLE IF EXISTS `tenant`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `domain` varchar(255) DEFAULT NULL,
  `type` varchar(20) DEFAULT 'standard',
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  `region` varchar(100) DEFAULT NULL,
  `email` varchar(254) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `working_hours` json DEFAULT NULL,
  `features` json DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `created_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at` datetime(6) DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`url`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant`
--

LOCK TABLES `tenant` WRITE;
/*!40000 ALTER TABLE `tenant` DISABLE KEYS */;
INSERT INTO `tenant` VALUES (1,'TechMart','techmart','techmart.ru','premium','ул. Арбат, 12','Москва','119002','Московская область','hello@techmart.ru','+74951110011','{\"mon-fri\": \"9:00-21:00\", \"sat-sun\": \"10:00-20:00\"}','{\"reviews\": true, \"wishlist\": true}',1,'2026-02-23 19:43:13.262640','2026-02-23 19:43:13.262640'),(2,'GadgetZone','gadgetzone','gadgetzone.ru','standard','пр. Невский, 88','Санкт-Петербург','191025','Ленинградская область','support@gadgetzone.ru','+78122223344','{\"sat\": \"11:00-19:00\", \"mon-fri\": \"10:00-20:00\"}','{\"reviews\": true, \"wishlist\": false}',1,'2026-02-23 19:43:13.262640','2026-02-23 19:43:13.262640'),(3,'HomeAppliances','homeappliances','homeappliances.ru','standard','ул. Красная, 5','Краснодар','350000','Краснодарский край','info@homeappliances.ru','+78612334455','{\"mon-sat\": \"9:00-20:00\"}','{\"reviews\": true, \"wishlist\": true}',1,'2026-02-23 19:43:13.262640','2026-02-23 19:43:13.262640'),(4,'SportPro','sportpro','sportpro.ru','standard','ул. Вайнера, 9','Екатеринбург','620014','Свердловская область','info@sportpro.ru','+73432556677','{\"mon-fri\": \"10:00-21:00\", \"sat-sun\": \"10:00-19:00\"}','{\"reviews\": false, \"wishlist\": true}',1,'2026-02-23 19:43:13.262640','2026-02-23 19:43:13.262640'),(5,'KidsWorld','kidsworld','kidsworld.ru','basic','ул. Большая Покровская, 3','Нижний Новгород','603000','Нижегородская область','hello@kidsworld.ru','+78312778899','{\"sun\": \"10:00-18:00\", \"mon-sat\": \"9:00-20:00\"}','{\"reviews\": true, \"wishlist\": false}',1,'2026-02-23 19:43:13.262640','2026-02-23 19:43:13.262640');
/*!40000 ALTER TABLE `tenant` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tenant_admin`
--

DROP TABLE IF EXISTS `tenant_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tenant_admin` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL,
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tadmin_tenant` (`tenant_id`),
  KEY `fk_tadmin_user` (`user_id`),
  CONSTRAINT `fk_tadmin_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tadmin_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tenant_admin`
--

LOCK TABLES `tenant_admin` WRITE;
/*!40000 ALTER TABLE `tenant_admin` DISABLE KEYS */;
INSERT INTO `tenant_admin` VALUES (1,1,1),(2,1,2),(3,2,1),(4,2,3),(5,3,1),(6,3,4),(7,4,1),(8,4,5),(9,5,1),(10,5,6);
/*!40000 ALTER TABLE `tenant_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_profile`
--

DROP TABLE IF EXISTS `user_profile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_profile` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `avatar_url` varchar(500) DEFAULT NULL,
  `bio` text,
  `address` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_profile`
--

LOCK TABLES `user_profile` WRITE;
/*!40000 ALTER TABLE `user_profile` DISABLE KEYS */;
INSERT INTO `user_profile` VALUES (1,1,NULL,'Суперадмин системы','ул. Арбат, 12','Москва','119002'),(2,2,NULL,'Менеджер TechMart','ул. Арбат, 12','Москва','119002'),(3,3,NULL,'Менеджер GadgetZone','пр. Невский, 88','Санкт-Петербург','191025'),(4,4,NULL,'Менеджер HomeAppliances','ул. Красная, 5','Краснодар','350000'),(5,5,NULL,'Менеджер SportPro','ул. Вайнера, 9','Екатеринбург','620014'),(6,6,NULL,'Менеджер KidsWorld','ул. Большая Покровская, 3','Нижний Новгород','603000'),(7,7,'https://cdn.example.com/avatars/ivan.jpg',NULL,'ул. Тверская, 14, кв. 22','Москва','125009'),(8,8,'https://cdn.example.com/avatars/maria.jpg',NULL,'ул. Садовая, 33, кв. 5','Санкт-Петербург','190005'),(9,9,NULL,NULL,'ул. Ленина, 7, кв. 18','Новосибирск','630004'),(10,10,'https://cdn.example.com/avatars/elena.jpg',NULL,'пр. Мира, 41, кв. 9','Екатеринбург','620000'),(11,11,NULL,NULL,'ул. Пушкина, 2, кв. 3','Казань','420000'),(12,12,NULL,NULL,'ул. Гагарина, 18, кв. 7','Самара','443001'),(13,13,NULL,NULL,'ул. Советская, 55, кв. 12','Ростов-на-Дону','344000'),(14,14,NULL,NULL,'ул. Коммунистическая, 3','Уфа','450000'),(15,15,NULL,NULL,'ул. Чехова, 22, кв. 4','Пермь','614000'),(16,16,NULL,NULL,'ул. Октябрьская, 9, кв. 11','Воронеж','394000');
/*!40000 ALTER TABLE `user_profile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vw_pvz_parcels`
--

DROP TABLE IF EXISTS `vw_pvz_parcels`;
/*!50001 DROP VIEW IF EXISTS `vw_pvz_parcels`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_pvz_parcels` AS SELECT 
 1 AS `id`,
 1 AS `order_number`,
 1 AS `пвз`,
 1 AS `адрес`,
 1 AS `город`,
 1 AS `customer_name`,
 1 AS `customer_phone`,
 1 AS `customer_email`,
 1 AS `total`,
 1 AS `статус`,
 1 AS `статус_описание`,
 1 AS `дней_на_пвз`,
 1 AS `просрочка_хранения`,
 1 AS `payment_method`,
 1 AS `статус_оплаты`,
 1 AS `время_создания`,
 1 AS `время_изменения`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vw_pvz_parcels`
--

/*!50001 DROP VIEW IF EXISTS `vw_pvz_parcels`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_pvz_parcels` AS select `o`.`id` AS `id`,`o`.`order_number` AS `order_number`,`t`.`name` AS `пвз`,`t`.`address` AS `адрес`,`t`.`city` AS `город`,`o`.`customer_name` AS `customer_name`,`o`.`customer_phone` AS `customer_phone`,`o`.`customer_email` AS `customer_email`,`o`.`total` AS `total`,`o`.`status` AS `статус`,(case `o`.`status` when 'pending' then 'Ожидает поступления' when 'confirmed' then 'Принята в обработку' when 'shipped' then 'В пути на ПВЗ' when 'delivered' then 'На ПВЗ — ожидает клиента' when 'completed' then 'Выдана клиенту' when 'cancelled' then 'Отменена / Возврат' else `o`.`status` end) AS `статус_описание`,(case when (`o`.`status` = 'delivered') then (to_days(curdate()) - to_days(cast(`o`.`updated_at` as date))) else NULL end) AS `дней_на_пвз`,(case when ((`o`.`status` = 'delivered') and ((to_days(curdate()) - to_days(cast(`o`.`updated_at` as date))) > 7)) then 1 else 0 end) AS `просрочка_хранения`,`pay`.`payment_method` AS `payment_method`,`pay`.`status` AS `статус_оплаты`,`o`.`created_at` AS `время_создания`,`o`.`updated_at` AS `время_изменения` from ((`order` `o` join `tenant` `t` on((`o`.`tenant_id` = `t`.`id`))) left join `payment` `pay` on((`o`.`id` = `pay`.`order_id`))) where (`t`.`is_active` = 1) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-02-24 11:06:14
