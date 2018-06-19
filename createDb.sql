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

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- ---------------------------------------------------------
-- Populate the database
-- ---------------------------------------------------------

-- Table: students
-- Author: Allan Brockenbrough
insert into students (fname, lname) VALUES ('Sam','Macar');
