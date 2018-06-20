-- -----------------------------------------------------
-- Schema its544db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `its544db` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `its544db`.`students`
-- Author: Adam and Ken
-- -----------------------------------------------------
DROP TABLE IF EXISTS `its544db`.`students` ;

CREATE TABLE IF NOT EXISTS `its544db`.`students` (
  `studentId` INT(11) NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(128) NOT NULL,
  `lname` VARCHAR(128) NOT NULL,
  `mname` VARCHAR(128) NULL,
  `dateOfBirth` DATE NOT NULL,
  `ssn` CHAR(9) NOT NULL,
  `genderCd` CHAR(1) NOT NULL,
  `foreignAddressIndicator` CHAR(1) NOT NULL,
  `addressLine1` VARCHAR(128) NOT NULL,
  `addressLine2` VARCHAR(128) NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` CHAR(2) NULL,
  `zip` CHAR(9) NULL,
  `country` VARCHAR(45) NOT NULL,
  `foreignPostalCode` VARCHAR(20) NULL,
  `foeignTerritory` VARCHAR(90) NULL,
  `phoneNumber` CHAR(10) NOT NULL,
  `emailAddress` VARCHAR(120) NOT NULL,
  `FK_advisorFacultyId` VARCHAR(45) NULL,
  PRIMARY KEY (`studentId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;

-- -----------------------------------------------------
-- Table `its544db`.`class`
-- Author: Adam and Ken
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`class` (
  `classId` INT NOT NULL,
  `className` VARCHAR(120) NOT NULL,
  `FK_deptartmentId` VARCHAR(45) NOT NULL,
  `creditHours` DECIMAL(3,2) NOT NULL,
  `maxStudents` INT NOT NULL,
  `requiresLectureRoom` CHAR(1) NOT NULL,
  `requiresLabRoom` INT NOT NULL,
  PRIMARY KEY (`classId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `its544db`.`section`
-- Author: Adam and Ken
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`section` (
  `sectionID` INT NOT NULL,
  `classId` INT NOT NULL,
  `FK_facultyId` VARCHAR(45) NOT NULL,
  `FK_sessionID` VARCHAR(45) NULL,
  `FK_roomId` VARCHAR(45) NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `meetTimeSun` TIME NULL,
  `meetTimeMon` TIME NULL,
  `meetTimeTue` TIME NULL,
  `meetTimeWed` TIME NULL,
  `meetTimeThu` TIME NULL,
  `meetTimeFri` TIME NULL,
  `meetTimeSat` TIME NULL,
  INDEX `fk_section_class_idx` (`classId` ASC),
  PRIMARY KEY (`sectionID`),
  CONSTRAINT `fk_section_class`
    FOREIGN KEY (`classId`)
    REFERENCES `its544db`.`class` (`classId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `its544db`.`registration`
-- Author: Adam and Ken
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`registration` (
  `sectionID` INT NOT NULL,
  `studentId` INT(11) NOT NULL,
  `grade` DECIMAL(3,2) NULL,
  PRIMARY KEY (`sectionID`, `studentId`),
  INDEX `fk_section_has_students_students1_idx` (`studentId` ASC),
  INDEX `fk_section_has_students_section1_idx` (`sectionID` ASC),
  CONSTRAINT `fk_section_has_students_section1`
    FOREIGN KEY (`sectionID`)
    REFERENCES `its544db`.`section` (`sectionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_has_students_students1`
    FOREIGN KEY (`studentId`)
    REFERENCES `its544db`.`students` (`studentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
               
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
-- -----------------------------------------------------
-- Deniz and Mustafa
-- Table `its544db`.`club`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`club` (
  `clubId` INT NOT NULL,
  `clubName` VARCHAR(45) NULL,
  `studentId` INT(11) NOT NULL,
  PRIMARY KEY (`clubId`),
  INDEX `fk_club_students1_idx` (`studentId` ASC),
  CONSTRAINT `fk_club_students1`
    FOREIGN KEY (`studentId`)
    REFERENCES `its544db`.`students` (`studentId`)
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
