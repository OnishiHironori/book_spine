ALTER TABLE `book_spines` 
  ADD COLUMN `has_wraparound_band` TINYINT UNSIGNED NOT NULL DEFAULT 0,
  ADD UNIQUE `book_id_has_wraparound_band_user_id` (`book_id`, `has_wraparound_band`, `user_id`);

ALTER TABLE `books`
	DROP   COLUMN `nbn`,
	CHANGE COLUMN `size_mm_x` `size_x_mm` MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
	CHANGE COLUMN `size_mm_y` `size_y_mm` MEDIUMINT UNSIGNED NOT NULL DEFAULT 0,
  DROP   INDEX  `isbn_nbn`;
