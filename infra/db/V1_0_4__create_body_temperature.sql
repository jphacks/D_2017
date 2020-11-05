CREATE TABLE IF NOT EXISTS `body_temperature` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `user_id` VARCHAR(100) NOT NULL,
  `temperature` FLOAT NOT NULL,
  `mac_address` VARCHAR(100) NOT NULL,
  `is_trusted` TINYINT NOT NULL DEFAULT 1,
  `created_at` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `fk_body_temperature_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_body_temperature_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
