-- -----------------------------------------------------
-- Schema its544db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `its544db` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `its544db`.`students`
-- Author: 
-- -----------------------------------------------------
DROP TABLE IF EXISTS `its544db`.`students` ;

CREATE TABLE IF NOT EXISTS `its544db`.`students` (
  `studentId` INT(11) NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(128) NULL DEFAULT NULL,
  `lname` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`studentId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `its544db`.`faculty`
-- Author: 
-- -----------------------------------------------------
DROP TABLE IF EXISTS `its544db`.`faculty` ;

CREATE TABLE IF NOT EXISTS `its544db`.`faculty` (
  `facultyId` INT(11) NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(128) NULL DEFAULT NULL,
  `lname` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`facultyId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Deniz and Mustafa
-- Table `its544db`.`dorm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`dorm` (
  `dormId` INT NOT NULL,
  `dormName` VARCHAR(45) NULL,
  `dormCapacity` VARCHAR(45) NULL,
  PRIMARY KEY (`dormId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `its544db`.`dorm rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`dorm rooms` (
  `roomNo` VARCHAR(45) NULL,
  `roomCapacity` VARCHAR(45) NULL,
  `dormId` INT NOT NULL,
  INDEX `fk_dorm rooms_dorm_idx` (`dormId` ASC),
  CONSTRAINT `fk_dorm rooms_dorm`
    FOREIGN KEY (`dormId`)
    REFERENCES `its544db`.`dorm` (`dormId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- ADD YOUR TABLES ABOVE THIS POINT
               -
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- ---------------------------------------------------------
-- Populate the database
-- ---------------------------------------------------------

-- Table: students
-- Author: Allan Brockenbrough
-- insert into students (fname, lname) VALUES ('Sam','Macar');
