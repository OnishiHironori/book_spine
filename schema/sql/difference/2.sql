ALTER TABLE `books` 
  ADD COLUMN `published_on` DATE NOT NULL DEFAULT '0000-00-00',
  ADD UNIQUE `isbn_published_on` (`isbn`, `published_on`);
