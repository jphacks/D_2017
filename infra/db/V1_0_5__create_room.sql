CREATE TABLE IF NOT EXISTS `room` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(100) NOT NULL,
  `limit_number` INT NOT NULL,
  `limit_body_temperature` FLOAT NOT NULL,
  `allow_missing` TINYINT NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`));
