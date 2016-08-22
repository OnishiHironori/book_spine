ALTER TABLE `publishers`
  MODIFY COLUMN `code` VARCHAR(7) NOT NULL DEFAULT '',
  MODIFY COLUMN `has_licensing` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0;

ALTER TABLE `books`
  ADD    COLUMN `name` VARCHAR(255) CHARACTER SET 'utf8mb4' NOT NULL DEFAULT '' AFTER `publisher_id`,
  MODIFY COLUMN `has_licensing` TINYINT(1) UNSIGNED                NOT NULL DEFAULT 0,
  CHANGE COLUMN `size_x_mm` `height_mm` MEDIUMINT UNSIGNED  NOT NULL DEFAULT 0,
  DROP   COLUMN `size_y_mm`;

ALTER TABLE `book_spines`
  MODIFY COLUMN `has_wraparound_band` TINYINT(1) UNSIGNED NOT NULL DEFAULT 0;

CREATE TABLE IF NOT EXISTS `bookshelves` (
  `id`            BINARY(16)          NOT NULL,
  `user_id`       BINARY(16)          NOT NULL,
  `book_spine_id` BINARY(16)          NOT NULL,
  `is_public`     TINYINT(1) UNSIGNED NOT NULL DEFAULT 0,
  `created_at`    DATETIME            NOT NULL DEFAULT '0000-00-00 00:00:00',
  `updated_at`    DATETIME            NOT NULL DEFAULT '0000-00-00 00:00:00',
  PRIMARY KEY (`id`),
  INDEX  `on_user_id` (`user_id`),
  INDEX  `on_book_spine_id` (`book_spine_id`)
) ENGINE = InnoDB;

ALTER TABLE `users`
  DROP INDEX `name`;

