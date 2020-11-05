CREATE TABLE IF NOT EXISTS `admin` (
  `user_id` VARCHAR(100) NOT NULL,
  `room_id` INT NOT NULL,
  INDEX `fk_admin_room1_idx` (`room_id` ASC),
  INDEX `fk_admin_user1_idx` (`user_id` ASC),
  PRIMARY KEY (`user_id`, `room_id`),
  CONSTRAINT `fk_admin_room1`
    FOREIGN KEY (`room_id`)
    REFERENCES `room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_admin_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
