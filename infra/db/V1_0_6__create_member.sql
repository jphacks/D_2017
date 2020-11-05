CREATE TABLE IF NOT EXISTS `member` (
  `user_id` VARCHAR(100) NOT NULL,
  `room_id` INT NOT NULL,
  `state` INT NOT NULL DEFAULT 0,
  INDEX `fk_member_user1_idx` (`user_id` ASC),
  INDEX `fk_member_room1_idx` (`room_id` ASC),
  PRIMARY KEY (`user_id`, `room_id`),
  CONSTRAINT `fk_member_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_member_room1`
    FOREIGN KEY (`room_id`)
    REFERENCES `room` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
