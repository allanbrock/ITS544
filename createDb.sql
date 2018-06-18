
-- -----------------------------------------------------
-- Version 8  - ALLAN BROCKENBROUGH
-- -----------------------------------------------------

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema its544db
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `its544db` ;

-- -----------------------------------------------------
-- Schema its544db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `its544db` DEFAULT CHARACTER SET utf8 ;
USE `its544db` ;

-- -----------------------------------------------------
-- Table `its544db`.`students`
-- Author: Allan Brockenbrough (for now)
-- -----------------------------------------------------
DROP TABLE IF EXISTS `its544db`.`students` ;

CREATE TABLE IF NOT EXISTS `its544db`.`students` (
  `idNumber` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(128) NULL DEFAULT NULL,
  `collegeId` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`idNumber`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
