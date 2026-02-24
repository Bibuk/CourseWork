-- Таблица: tenant
CREATE TABLE `tenant` (
  `id`            bigint        NOT NULL AUTO_INCREMENT,
  `name`          varchar(255)  NOT NULL,
  `url`           varchar(255)  NOT NULL,
  `domain`        varchar(255)  DEFAULT NULL,
  `type`          varchar(20)   DEFAULT 'standard',
  `address`       varchar(500)  DEFAULT NULL,
  `city`          varchar(100)  DEFAULT NULL,
  `postal_code`   varchar(20)   DEFAULT NULL,
  `region`        varchar(100)  DEFAULT NULL,
  `email`         varchar(254)  DEFAULT NULL,
  `phone`         varchar(20)   DEFAULT NULL,
  `working_hours` json          DEFAULT NULL,
  `features`      json          DEFAULT NULL,
  `is_active`     tinyint(1)    DEFAULT '1',
  `created_at`    datetime(6)   DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at`    datetime(6)   DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  UNIQUE KEY `slug` (`url`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: auth_user
CREATE TABLE `auth_user` (
  `id`           bigint       NOT NULL AUTO_INCREMENT,
  `password`     varchar(128) NOT NULL,
  `last_login`   datetime(6)  DEFAULT NULL,
  `is_superuser` tinyint(1)   DEFAULT '0',
  `username`     varchar(150) NOT NULL,
  `first_name`   varchar(150) DEFAULT NULL,
  `last_name`    varchar(150) DEFAULT NULL,
  `email`        varchar(254) NOT NULL,
  `is_staff`     tinyint(1)   DEFAULT '0',
  `is_active`    tinyint(1)   DEFAULT '1',
  `date_joined`  datetime(6)  DEFAULT CURRENT_TIMESTAMP(6),
  `phone`        varchar(20)  DEFAULT NULL,
  `role`         varchar(20)  DEFAULT 'customer',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: user_profile
CREATE TABLE `user_profile` (
  `id`         bigint       NOT NULL AUTO_INCREMENT,
  `user_id`    bigint       NOT NULL,
  `avatar_url` varchar(500) DEFAULT NULL,
  `bio`        text         DEFAULT NULL,
  `address`    varchar(500) DEFAULT NULL,
  `city`       varchar(100) DEFAULT NULL,
  `postal_code` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  CONSTRAINT `fk_profile_user` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: tenant_admin
CREATE TABLE `tenant_admin` (
  `id`        bigint NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint NOT NULL,
  `user_id`   bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_tadmin_tenant` (`tenant_id`),
  KEY `fk_tadmin_user`   (`user_id`),
  CONSTRAINT `fk_tadmin_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_tadmin_user`   FOREIGN KEY (`user_id`)   REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: site_config
CREATE TABLE `site_config` (
  `id`          bigint       NOT NULL AUTO_INCREMENT,
  `tenant_id`   bigint       NOT NULL,
  `key`         varchar(255) NOT NULL,
  `value`       json         DEFAULT NULL,
  `description` text         DEFAULT NULL,
  `is_active`   tinyint(1)   DEFAULT '1',
  `updated_at`  datetime(6)  DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `fk_siteconfig_tenant` (`tenant_id`),
  CONSTRAINT `fk_siteconfig_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: category
CREATE TABLE `category` (
  `id`          bigint       NOT NULL AUTO_INCREMENT,
  `tenant_id`   bigint       NOT NULL,
  `parent_id`   bigint       DEFAULT NULL,
  `name`        varchar(255) NOT NULL,
  `slug`        varchar(255) NOT NULL,
  `description` text         DEFAULT NULL,
  `icon`        varchar(250) DEFAULT NULL,
  `is_active`   tinyint(1)   DEFAULT '1',
  `created_at`  datetime(6)  DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at`  datetime(6)  DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `order`       int          DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `fk_cat_tenant` (`tenant_id`),
  KEY `fk_cat_parent` (`parent_id`),
  CONSTRAINT `fk_cat_tenant`  FOREIGN KEY (`tenant_id`) REFERENCES `tenant`   (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cat_parent`  FOREIGN KEY (`parent_id`) REFERENCES `category` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: brand
CREATE TABLE `brand` (
  `id`        bigint       NOT NULL AUTO_INCREMENT,
  `tenant_id` bigint       NOT NULL,
  `name`      varchar(255) NOT NULL,
  `slug`      varchar(255) NOT NULL,
  `logo_url`  varchar(255) DEFAULT NULL,
  `is_active` tinyint(1)   DEFAULT '1',
  PRIMARY KEY (`id`),
  KEY `fk_brand_tenant` (`tenant_id`),
  CONSTRAINT `fk_brand_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: product
CREATE TABLE `product` (
  `id`              bigint       NOT NULL AUTO_INCREMENT,
  `tenant_id`       bigint       NOT NULL,
  `category_id`     bigint       DEFAULT NULL,
  `brand_id`        bigint       DEFAULT NULL,
  `name`            varchar(255) NOT NULL,
  `slug`            varchar(255) NOT NULL,
  `description`     text         DEFAULT NULL,
  `sku`             varchar(100) DEFAULT NULL,
  `price`           decimal(10,2) NOT NULL DEFAULT '0.00',
  `compare_price`   decimal(10,2) DEFAULT NULL,
  `stock_quantity`  int          DEFAULT '0',
  `track_inventory` tinyint(1)   DEFAULT '1',
  `images`          json         DEFAULT NULL,
  `attributes`      json         DEFAULT NULL,
  `is_active`       tinyint(1)   DEFAULT '1',
  `is_featured`     tinyint(1)   DEFAULT '0',
  `created_at`      datetime(6)  DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at`      datetime(6)  DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `fk_prod_tenant` (`tenant_id`),
  KEY `fk_prod_cat`    (`category_id`),
  KEY `fk_prod_brand`  (`brand_id`),
  CONSTRAINT `fk_prod_tenant` FOREIGN KEY (`tenant_id`)   REFERENCES `tenant`   (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_prod_cat`    FOREIGN KEY (`category_id`) REFERENCES `category` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_prod_brand`  FOREIGN KEY (`brand_id`)    REFERENCES `brand`    (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: cart
CREATE TABLE `cart` (
  `id`          bigint       NOT NULL AUTO_INCREMENT,
  `tenant_id`   bigint       NOT NULL,
  `user_id`     bigint       DEFAULT NULL,
  `session_key` varchar(255) DEFAULT NULL,
  `created_at`  datetime(6)  DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at`  datetime(6)  DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `fk_cart_tenant` (`tenant_id`),
  KEY `fk_cart_user`   (`user_id`),
  CONSTRAINT `fk_cart_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`    (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cart_user`   FOREIGN KEY (`user_id`)   REFERENCES `auth_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: cart_item
CREATE TABLE `cart_item` (
  `id`         bigint        NOT NULL AUTO_INCREMENT,
  `cart_id`    bigint        NOT NULL,
  `product_id` bigint        NOT NULL,
  `quantity`   int           NOT NULL DEFAULT '1',
  `price`      decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_cartitem_cart` (`cart_id`),
  KEY `fk_cartitem_prod` (`product_id`),
  CONSTRAINT `fk_cartitem_cart` FOREIGN KEY (`cart_id`)    REFERENCES `cart`    (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_cartitem_prod` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: order
CREATE TABLE `order` (
  `id`                   bigint        NOT NULL AUTO_INCREMENT,
  `tenant_id`            bigint        NOT NULL,
  `user_id`              bigint        DEFAULT NULL,
  `order_number`         varchar(50)   NOT NULL,
  `customer_name`        varchar(255)  DEFAULT NULL,
  `customer_email`       varchar(255)  DEFAULT NULL,
  `customer_phone`       varchar(20)   DEFAULT NULL,
  `shipping_address`     varchar(500)  DEFAULT NULL,
  `shipping_city`        varchar(100)  DEFAULT NULL,
  `shipping_postal_code` varchar(20)   DEFAULT NULL,
  `subtotal`             decimal(10,2) DEFAULT '0.00',
  `shipping_cost`        decimal(10,2) DEFAULT '0.00',
  `total`                decimal(10,2) DEFAULT '0.00',
  `status`               varchar(20)   DEFAULT 'pending',
  `created_at`           datetime(6)   DEFAULT CURRENT_TIMESTAMP(6),
  `updated_at`           datetime(6)   DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  `paid_at`              datetime(6)   DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_number` (`order_number`),
  KEY `fk_order_tenant` (`tenant_id`),
  KEY `fk_order_user`   (`user_id`),
  CONSTRAINT `fk_order_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`    (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_order_user`   FOREIGN KEY (`user_id`)   REFERENCES `auth_user` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: order_item
CREATE TABLE `order_item` (
  `id`           bigint        NOT NULL AUTO_INCREMENT,
  `order_id`     bigint        NOT NULL,
  `product_id`   bigint        DEFAULT NULL,
  `product_name` varchar(255)  NOT NULL,
  `product_sku`  varchar(100)  DEFAULT NULL,
  `quantity`     int           NOT NULL,
  `price`        decimal(10,2) NOT NULL,
  `subtotal`     decimal(10,2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_oi_order`   (`order_id`),
  KEY `fk_oi_product` (`product_id`),
  CONSTRAINT `fk_oi_order`   FOREIGN KEY (`order_id`)   REFERENCES `order`   (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_oi_product` FOREIGN KEY (`product_id`) REFERENCES `product` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: payment
CREATE TABLE `payment` (
  `id`             bigint        NOT NULL AUTO_INCREMENT,
  `tenant_id`      bigint        NOT NULL,
  `order_id`       bigint        NOT NULL,
  `payment_method` varchar(20)   DEFAULT NULL,
  `status`         varchar(20)   DEFAULT 'pending',
  `amount`         decimal(10,2) NOT NULL,
  `transaction_id` varchar(255)  DEFAULT NULL,
  `created_at`     datetime(6)   DEFAULT CURRENT_TIMESTAMP(6),
  `completed_at`   datetime(6)   DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `order_id` (`order_id`),
  KEY `fk_payment_tenant` (`tenant_id`),
  CONSTRAINT `fk_payment_order`  FOREIGN KEY (`order_id`)  REFERENCES `order`  (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_payment_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- Таблица: notification
CREATE TABLE `notification` (
  `id`         bigint       NOT NULL AUTO_INCREMENT,
  `tenant_id`  bigint       NOT NULL,
  `user_id`    bigint       DEFAULT NULL,
  `type`       varchar(20)  NOT NULL,
  `title`      varchar(255) DEFAULT NULL,
  `message`    text         DEFAULT NULL,
  `is_read`    tinyint(1)   DEFAULT '0',
  `created_at` datetime(6)  DEFAULT CURRENT_TIMESTAMP(6),
  PRIMARY KEY (`id`),
  KEY `fk_notif_tenant` (`tenant_id`),
  KEY `fk_notif_user`   (`user_id`),
  CONSTRAINT `fk_notif_tenant` FOREIGN KEY (`tenant_id`) REFERENCES `tenant`    (`id`) ON DELETE CASCADE,
  CONSTRAINT `fk_notif_user`   FOREIGN KEY (`user_id`)   REFERENCES `auth_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
