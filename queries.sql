-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema hw1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hw1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hw1` DEFAULT CHARACTER SET utf8 ;
USE `hw1` ;

-- -----------------------------------------------------
-- Table `hw1`.`Clients`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw1`.`Clients` (
  `id` INT NOT NULL,
  `lastName` VARCHAR(60) NULL,
  `Address` VARCHAR(100) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hw1`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw1`.`Order` (
  `id` INT NOT NULL,
  `OrderDate` DATE NULL,
  `client_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `order-client_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `order-client`
    FOREIGN KEY (`client_id`)
    REFERENCES `hw1`.`Clients` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hw1`.`Products`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw1`.`Products` (
  `id` INT NOT NULL,
  `name` VARCHAR(60) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `hw1`.`OrderItems`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hw1`.`OrderItems` (
  `id` INT NOT NULL,
  `Quantity` INT NULL,
  `order_id` INT NULL,
  `product_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `orderItems-order_idx` (`order_id` ASC) VISIBLE,
  INDEX `orderItems-product_idx` (`product_id` ASC) VISIBLE,
  CONSTRAINT `orderItems-order`
    FOREIGN KEY (`order_id`)
    REFERENCES `hw1`.`Order` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `orderItems-product`
    FOREIGN KEY (`product_id`)
    REFERENCES `hw1`.`Products` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
