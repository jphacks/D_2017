CREATE TABLE IF NOT EXISTS `reader` (
  `mac_address` VARCHAR(100) NOT NULL,
  `user_id` VARCHAR(100) NOT NULL,
  `room_id` INT NOT NULL,
  INDEX `fk_device_user1_idx` (`user_id` ASC),
  INDEX `fk_device_room1_idx` (`room_id` ASC),
  PRIMARY KEY (`mac_address`),
  CONSTRAINT `fk_device_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_device_room1`
    FOREIGN KEY (`room_id`)
    REFERENCES `room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
