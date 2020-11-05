CREATE TABLE IF NOT EXISTS `card` (
  `idm` VARCHAR(16) NOT NULL,
  `user_id` VARCHAR(100) NOT NULL,
  INDEX `fk_card_user_idx` (`user_id` ASC),
  INDEX `card_index1` (`idm` ASC),
  PRIMARY KEY (`idm`),
  CONSTRAINT `fk_card_user`
    FOREIGN KEY (`user_id`)
    REFERENCES `user` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);
