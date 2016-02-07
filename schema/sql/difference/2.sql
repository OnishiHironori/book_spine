ALTER TABLE `books` 
  ADD COLUMN `published_at` DATETIME NOT NULL DEFAULT '0000-00-00 00:00:00',
  ADD UNIQUE `isbn_published_at` (`isbn`, `published_at`);
