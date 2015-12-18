CREATE DATABASE IF NOT EXISTS spine DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE spine;

CREATE TABLE IF NOT EXISTS `users` (
  `id`         BINARY(16)  NOT NULL,
  `name`       VARCHAR(63) NOT NULL DEFAULT '' COLLATE utf8mb4_unicode_ci,
  `created_at` DATETIME    NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` DATETIME    NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE `name` (`name`)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `books` (
  `id`            BINARY(16)         NOT NULL,
  `publisher_id`  BINARY(16)         NOT NULL,
  `has_licensing` TINYINT UNSIGNED   NOT NULL DEFAULT 0,
  `isbn`          CHAR(13)           NOT NULL,
  `nbn`           CHAR(10)           NOT NULL,
  `size_mm_x`     MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
  `size_mm_y`     MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
  `published_at`  DATETIME           NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at`    DATETIME           NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at`    DATETIME           NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  INDEX  `on_publisher_id` (`publisher_id`),
  INDEX  `on_isbn` (`isbn`),
  INDEX  `on_nbn` (`nbn`),
  INDEX  `on_published_at_isbn` (`published_at`, `isbn`),
  INDEX  `on_published_at_nbn` (`published_at`, `nbn`),
  UNIQUE `isbn_nbn` (`isbn`, `nbn`)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `publishers` (
  `id`            BINARY(16)                           NOT NULL,
  `name`          VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL DEFAULT '',
  `code`          VARCHAR(63)                          NOT NULL DEFAULT '',
  `has_licensing` TINYINT UNSIGNED                     NOT NULL DEFAULT 0,
  `created_at`    DATETIME                             NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at`    DATETIME                             NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  INDEX  `on_has_licensing` (`has_licensing`),
  UNIQUE `code` (`code`)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `user_accounts` (
  `id`              BINARY(16)   NOT NULL,
  `user_id`         BINARY(16)   NOT NULL,
  `mail_address`    VARCHAR(254) NOT NULL DEFAULT '',
  `password_digest` VARCHAR(60)  NOT NULL DEFAULT '',
  `created_at`      DATETIME     NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at`      DATETIME     NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  UNIQUE `user_id` (`user_id`),
  UNIQUE `mail_address` (`mail_address`)
) ENGINE = InnoDB;


CREATE TABLE IF NOT EXISTS `book_spines` (
  `id`         BINARY(16) NOT NULL,
  `user_id`    BINARY(16) NOT NULL,
  `book_id`    BINARY(16) NOT NULL,
  `created_at` DATETIME   NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at` DATETIME   NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  INDEX  `on_user_id_book_id` (`user_id`, `book_id`),
  UNIQUE `book_id_user_id` (`book_id`, `user_id`)
) ENGINE = InnoDB;
