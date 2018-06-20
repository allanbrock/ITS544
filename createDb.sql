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
-- Table `its544db`.`session`
-- Author: Adam and Ken
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`session` (
  `sessionID` CHAR(6) NOT NULL,
  `sessionSeason` CHAR(2) NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  PRIMARY KEY (`sessionID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `its544db`.`classroom`
-- Author: Adam and Ken
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`classroom` (
  `classroomId` INT NOT NULL,
  `roomType` VARCHAR(45) NOT NULL,
  `seats` INT NOT NULL,
  `hasProjector` CHAR(1) NOT NULL,
  PRIMARY KEY (`classroomId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `its544db`.`section`
-- Author: Adam and Ken
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`section` (
  `sectionID` INT NOT NULL,
  `classId` INT NOT NULL,
  `session_sessionID` CHAR(6) NOT NULL,
  `FK_facultyId` VARCHAR(45) NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `meetTimeSun` TIME NULL,
  `meetTimeMon` TIME NULL,
  `meetTimeTue` TIME NULL,
  `meetTimeWed` TIME NULL,
  `meetTimeThu` TIME NULL,
  `meetTimeFri` TIME NULL,
  `meetTimeSat` TIME NULL,
  `classroom_classroomId` INT NOT NULL,
  INDEX `fk_section_class_idx` (`classId` ASC),
  PRIMARY KEY (`sectionID`),
  INDEX `fk_section_session1_idx` (`session_sessionID` ASC),
  INDEX `fk_section_classroom1_idx` (`classroom_classroomId` ASC),
  CONSTRAINT `fk_section_class`
    FOREIGN KEY (`classId`)
    REFERENCES `its544db`.`class` (`classId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_session1`
    FOREIGN KEY (`session_sessionID`)
    REFERENCES `its544db`.`session` (`sessionID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_section_classroom1`
    FOREIGN KEY (`classroom_classroomId`)
    REFERENCES `its544db`.`classroom` (`classroomId`)
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
               
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema its544db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema its544db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `its544db` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `its544db` ;

-- -----------------------------------------------------
-- Table `its544db`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`faculty` (
  `facultyId` INT(11) NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(128) NULL DEFAULT NULL,
  `lname` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`facultyId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`students` (
  `studentId` INT(11) NOT NULL AUTO_INCREMENT,
  `fname` VARCHAR(128) NULL DEFAULT NULL,
  `lname` VARCHAR(128) NULL DEFAULT NULL,
  PRIMARY KEY (`studentId`))
ENGINE = InnoDB
AUTO_INCREMENT = 3
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`jobTitle`
-- Authors: Enime and Tim 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`jobTitle` (
  `jobTitleId` INT NOT NULL,
  `jobTitleName` VARCHAR(45) NULL,
  `FK_salary` VARCHAR(45) NULL,
  PRIMARY KEY (`jobTitleId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `its544db`.`facultyMember`
-- Authors: Enime and Tim 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`facultyMember` (
  `facultyId` INT NOT NULL,
  `facultyMemLname` VARCHAR(45) NULL,
  `facultyMemFname` VARCHAR(45) NULL,
  `departmentId` INT NOT NULL,
  `jobTitleId` INT NOT NULL,
  PRIMARY KEY (`facultyId`),
  INDEX `fk_faculty_member_department1_idx` (`departmentId` ASC),
  INDEX `fk_faculty_member_job_title1_idx` (`jobTitleId` ASC),
  CONSTRAINT `fk_faculty_member_department1`
    FOREIGN KEY (`departmentId`)
    REFERENCES `its544db`.`department` (`departmentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_faculty_member_job_title1`
    FOREIGN KEY (`jobTitleId`)
    REFERENCES `its544db`.`jobTitle` (`jobTitleId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `its544db`.`department`
-- Authors: Enime and Tim 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`department` (
  `departmentId` INT NOT NULL,
  `departmentName` VARCHAR(45) NULL,
  `departmentHead` INT NOT NULL,
  PRIMARY KEY (`departmentId`),
  INDEX `fk_department_facultyMember1_idx` (`departmentHead` ASC),
  CONSTRAINT `fk_department_facultyMember1`
    FOREIGN KEY (`departmentHead`)
    REFERENCES `its544db`.`facultyMember` (`facultyId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `its544db`.`major`
-- Authors: Enime and Tim 
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`major` (
  `majorId` INT NOT NULL,
  `majorName` VARCHAR(45) NULL,
  `departmentId` INT NOT NULL,
  PRIMARY KEY (`majorId`),
  INDEX `fk_major_department_idx` (`departmentId` ASC),
  CONSTRAINT `fk_major_department`
    FOREIGN KEY (`departmentId`)
    REFERENCES `its544db`.`department` (`departmentId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

INSERT INTO its544db.students values
	(1
    ,'Mickey'
    ,'Mouse'
    ,null
    ,'1928-11-18'
    ,'000112222'
    ,'M'
    ,'N'
    ,'Walt Disney World Resort'
    ,null
    ,'Orlando'
    ,'FL'
    ,'32830'
    ,'USA'
    ,null
    ,null
    ,'5553331111'
    ,'mickey@disney.com'
    ,null)
	       ;
	       -- Table: students
            
-- Deniz and Mustafa
-- insert into sportTeams (sportTeamId, sportTeamName) VALUES (1000,'Hockey');
-- insert into teamAssignments (sportTeamsId, studentId) VALUES (1000, 1);

