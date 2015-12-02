ALTER TABLE `books` 
  DROP COLUMN `has_image`,
  MODIFY      `isbn` CHAR(13) NOT NULL,
  ADD UNIQUE  `isbn_nbn` (`isbn`, `nbn`);
