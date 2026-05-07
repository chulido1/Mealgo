CREATE DATABASE IF NOT EXISTS diplom_foodhub CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE diplom_foodhub;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

DROP TABLE IF EXISTS admin_logs;
DROP TABLE IF EXISTS security_events;
DROP TABLE IF EXISTS rate_limits;
DROP TABLE IF EXISTS password_reset_tokens;
DROP TABLE IF EXISTS newsletter_subscribers;
DROP TABLE IF EXISTS email_verification_codes;
DROP TABLE IF EXISTS user_addresses;
DROP TABLE IF EXISTS order_items;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS cart_items;
DROP TABLE IF EXISTS carts;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS favorites;
DROP TABLE IF EXISTS menu_items;
DROP TABLE IF EXISTS menu_categories;
DROP TABLE IF EXISTS restaurant_category_links;
DROP TABLE IF EXISTS restaurant_categories;
DROP TABLE IF EXISTS restaurants;
DROP TABLE IF EXISTS users;

SET FOREIGN_KEY_CHECKS = 1;

CREATE TABLE users (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    email VARCHAR(190) NOT NULL UNIQUE,
    phone VARCHAR(30) NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('guest', 'user', 'admin') NOT NULL DEFAULT 'user',
    email_verified_at DATETIME NULL,
    is_active TINYINT(1) NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    INDEX idx_users_role (role),
    INDEX idx_users_active (is_active)
) ENGINE=InnoDB;

CREATE TABLE restaurants (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(180) NOT NULL,
    short_description VARCHAR(400) NULL,
    logo_image VARCHAR(255) NULL,
    banner_image VARCHAR(255) NULL,
    address VARCHAR(255) NULL,
    phone VARCHAR(30) NULL,
    working_hours VARCHAR(120) NULL,
    rating DECIMAL(3,2) NOT NULL DEFAULT 0.00,
    delivery_fee DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    min_order_amount DECIMAL(10,2) NOT NULL DEFAULT 0.00,
    delivery_time_min SMALLINT UNSIGNED NOT NULL DEFAULT 30,
    delivery_time_max SMALLINT UNSIGNED NOT NULL DEFAULT 60,
    is_active TINYINT(1) NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    INDEX idx_restaurants_active (is_active),
    INDEX idx_restaurants_rating (rating)
) ENGINE=InnoDB;

CREATE TABLE restaurant_categories (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(120) NOT NULL,
    slug VARCHAR(140) NOT NULL UNIQUE,
    is_active TINYINT(1) NOT NULL DEFAULT 1,
    INDEX idx_restaurant_categories_active (is_active)
) ENGINE=InnoDB;

CREATE TABLE restaurant_category_links (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    restaurant_id BIGINT UNSIGNED NOT NULL,
    category_id BIGINT UNSIGNED NOT NULL,
    UNIQUE KEY uq_restaurant_category (restaurant_id, category_id),
    CONSTRAINT fk_rcl_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
    CONSTRAINT fk_rcl_category FOREIGN KEY (category_id) REFERENCES restaurant_categories(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE menu_categories (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    restaurant_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(120) NOT NULL,
    sort_order INT NOT NULL DEFAULT 0,
    is_active TINYINT(1) NOT NULL DEFAULT 1,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    INDEX idx_menu_categories_restaurant (restaurant_id),
    INDEX idx_menu_categories_active (is_active),
    CONSTRAINT fk_menu_categories_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE menu_items (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    restaurant_id BIGINT UNSIGNED NOT NULL,
    category_id BIGINT UNSIGNED NOT NULL,
    name VARCHAR(170) NOT NULL,
    description TEXT NULL,
    price DECIMAL(10,2) NOT NULL,
    weight VARCHAR(60) NULL,
    image VARCHAR(255) NULL,
    is_available TINYINT(1) NOT NULL DEFAULT 1,
    is_popular TINYINT(1) NOT NULL DEFAULT 0,
    is_new TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    INDEX idx_menu_items_restaurant (restaurant_id),
    INDEX idx_menu_items_category (category_id),
    INDEX idx_menu_items_available (is_available),
    CONSTRAINT fk_menu_items_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE,
    CONSTRAINT fk_menu_items_category FOREIGN KEY (category_id) REFERENCES menu_categories(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE favorites (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    restaurant_id BIGINT UNSIGNED NOT NULL,
    created_at DATETIME NOT NULL,
    UNIQUE KEY uq_favorites (user_id, restaurant_id),
    CONSTRAINT fk_favorites_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_favorites_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE reviews (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    restaurant_id BIGINT UNSIGNED NOT NULL,
    rating TINYINT UNSIGNED NOT NULL,
    comment TEXT NOT NULL,
    is_approved TINYINT(1) NOT NULL DEFAULT 0,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    CHECK (rating BETWEEN 1 AND 5),
    INDEX idx_reviews_restaurant (restaurant_id),
    INDEX idx_reviews_approved (is_approved),
    CONSTRAINT fk_reviews_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_reviews_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE carts (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    restaurant_id BIGINT UNSIGNED NOT NULL,
    status ENUM('active', 'converted', 'abandoned') NOT NULL DEFAULT 'active',
    active_marker TINYINT GENERATED ALWAYS AS (CASE WHEN status = 'active' THEN 1 ELSE NULL END) STORED,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    INDEX idx_carts_user (user_id),
    INDEX idx_carts_status (status),
    UNIQUE KEY uq_user_restaurant_active (user_id, restaurant_id, active_marker),
    CONSTRAINT fk_carts_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_carts_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE cart_items (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cart_id BIGINT UNSIGNED NOT NULL,
    menu_item_id BIGINT UNSIGNED NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    UNIQUE KEY uq_cart_menu_item (cart_id, menu_item_id),
    INDEX idx_cart_items_cart (cart_id),
    CONSTRAINT fk_cart_items_cart FOREIGN KEY (cart_id) REFERENCES carts(id) ON DELETE CASCADE,
    CONSTRAINT fk_cart_items_menu_item FOREIGN KEY (menu_item_id) REFERENCES menu_items(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE orders (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    restaurant_id BIGINT UNSIGNED NOT NULL,
    status ENUM('new', 'confirmed', 'preparing', 'on_the_way', 'delivered', 'cancelled') NOT NULL DEFAULT 'new',
    customer_name VARCHAR(120) NOT NULL,
    customer_email VARCHAR(190) NOT NULL,
    customer_phone VARCHAR(30) NOT NULL,
    delivery_address VARCHAR(255) NOT NULL,
    comment VARCHAR(400) NULL,
    payment_method ENUM('cash', 'card_on_delivery') NOT NULL,
    subtotal_amount DECIMAL(10,2) NOT NULL,
    delivery_fee DECIMAL(10,2) NOT NULL,
    total_amount DECIMAL(10,2) NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    INDEX idx_orders_user (user_id),
    INDEX idx_orders_restaurant (restaurant_id),
    INDEX idx_orders_status (status),
    CONSTRAINT fk_orders_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    CONSTRAINT fk_orders_restaurant FOREIGN KEY (restaurant_id) REFERENCES restaurants(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE order_items (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    order_id BIGINT UNSIGNED NOT NULL,
    menu_item_id BIGINT UNSIGNED NULL,
    item_name VARCHAR(170) NOT NULL,
    item_price DECIMAL(10,2) NOT NULL,
    quantity INT UNSIGNED NOT NULL,
    line_total DECIMAL(10,2) NOT NULL,
    INDEX idx_order_items_order (order_id),
    CONSTRAINT fk_order_items_order FOREIGN KEY (order_id) REFERENCES orders(id) ON DELETE CASCADE,
    CONSTRAINT fk_order_items_menu_item FOREIGN KEY (menu_item_id) REFERENCES menu_items(id) ON DELETE SET NULL
) ENGINE=InnoDB;

CREATE TABLE user_addresses (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    title VARCHAR(70) NOT NULL,
    address_line VARCHAR(255) NOT NULL,
    entrance VARCHAR(20) NULL,
    floor VARCHAR(20) NULL,
    apartment VARCHAR(20) NULL,
    intercom_code VARCHAR(30) NULL,
    comment VARCHAR(255) NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    INDEX idx_user_addresses_user (user_id),
    CONSTRAINT fk_user_addresses_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE email_verification_codes (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    email VARCHAR(190) NOT NULL,
    code VARCHAR(12) NOT NULL,
    expires_at DATETIME NOT NULL,
    verified_at DATETIME NULL,
    created_at DATETIME NOT NULL,
    INDEX idx_email_codes_user (user_id),
    INDEX idx_email_codes_email (email),
    INDEX idx_email_codes_expires (expires_at),
    CONSTRAINT fk_email_codes_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE password_reset_tokens (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    user_id BIGINT UNSIGNED NOT NULL,
    token VARCHAR(128) NOT NULL UNIQUE,
    expires_at DATETIME NOT NULL,
    used_at DATETIME NULL,
    created_at DATETIME NOT NULL,
    INDEX idx_password_tokens_user (user_id),
    INDEX idx_password_tokens_expires (expires_at),
    CONSTRAINT fk_password_tokens_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE newsletter_subscribers (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    email VARCHAR(190) NOT NULL,
    status ENUM('active', 'unsubscribed') NOT NULL DEFAULT 'active',
    source VARCHAR(80) NOT NULL DEFAULT 'footer',
    ip_address VARCHAR(64) NULL,
    user_agent VARCHAR(255) NULL,
    subscribed_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    UNIQUE KEY uq_newsletter_email (email),
    INDEX idx_newsletter_status (status),
    INDEX idx_newsletter_created (subscribed_at)
) ENGINE=InnoDB;

CREATE TABLE admin_logs (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    admin_id BIGINT UNSIGNED NOT NULL,
    action VARCHAR(180) NOT NULL,
    entity_type VARCHAR(80) NOT NULL,
    entity_id BIGINT NULL,
    created_at DATETIME NOT NULL,
    INDEX idx_admin_logs_admin (admin_id),
    INDEX idx_admin_logs_entity (entity_type, entity_id),
    CONSTRAINT fk_admin_logs_admin FOREIGN KEY (admin_id) REFERENCES users(id) ON DELETE CASCADE
) ENGINE=InnoDB;

CREATE TABLE rate_limits (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    limiter_key CHAR(64) NOT NULL UNIQUE,
    action_name VARCHAR(80) NOT NULL,
    attempts INT UNSIGNED NOT NULL DEFAULT 1,
    expires_at DATETIME NOT NULL,
    created_at DATETIME NOT NULL,
    updated_at DATETIME NOT NULL,
    INDEX idx_rate_limits_action (action_name),
    INDEX idx_rate_limits_expires (expires_at)
) ENGINE=InnoDB;

CREATE TABLE security_events (
    id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    action_name VARCHAR(80) NOT NULL,
    event_type VARCHAR(80) NOT NULL,
    ip_address VARCHAR(64) NULL,
    user_agent VARCHAR(255) NULL,
    metadata_json JSON NULL,
    created_at DATETIME NOT NULL,
    INDEX idx_security_events_action (action_name),
    INDEX idx_security_events_created (created_at)
) ENGINE=InnoDB;
