-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
-- -----------------------------------------------------
-- Schema its544db
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema its544db
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `its544db` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`salary` (
  `salary_id` INT NOT NULL,
  `salary_date_from` DATE NULL,
  `salary_date_to` DATE NULL,
  `salary_amount_yearly` INT NULL,
  PRIMARY KEY (`salary_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`job title`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`job title` (
  `job_title_id` INT NOT NULL,
  `job_title_name` VARCHAR(45) NULL,
  `salary_salary_id` INT NOT NULL,
  PRIMARY KEY (`job_title_id`),
  INDEX `fk_job_title_salary_idx` (`salary_salary_id` ASC),
  CONSTRAINT `fk_job_title_salary`
    FOREIGN KEY (`salary_salary_id`)
    REFERENCES `mydb`.`salary` (`salary_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`departmant credit cost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`departmant credit cost` (
  `cost_id` INT NOT NULL,
  `cost_per_credit` INT NULL,
  PRIMARY KEY (`cost_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`student balance sheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`student balance sheet` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`financial aid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`financial aid` (
  `f_aid_id` INT NOT NULL,
  `f_aid_amount` INT NULL,
  PRIMARY KEY (`f_aid_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`course payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`course payment` (
  `payment_id` INT NOT NULL,
  `payment_amount` DOUBLE NULL,
  `payment_date` DATE NULL,
  PRIMARY KEY (`payment_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`dorm_payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`dorm_payment` (
  `dorm_id` INT NOT NULL,
  `dorm_amount` DOUBLE NULL,
  PRIMARY KEY (`dorm_id`))
ENGINE = InnoDB;

USE `its544db` ;

-- -----------------------------------------------------
-- Table `its544db`.`salary`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`salary` (
  `salaryId` VARCHAR(20) NOT NULL,
  `salarDateFrom` DATE NULL DEFAULT NULL,
  `salaryDateTo` DATE NULL DEFAULT NULL,
  `salaryAmountYearly` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`salaryId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`jobtitle`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`jobtitle` (
  `jobTitleId` INT(11) NOT NULL,
  `jobTitleName` VARCHAR(45) NULL DEFAULT NULL,
  `salaryId` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`jobTitleId`),
  INDEX `fk_jobtitle_salary1_idx` (`salaryId` ASC),
  CONSTRAINT `fk_jobtitle_salary1`
    FOREIGN KEY (`salaryId`)
    REFERENCES `its544db`.`salary` (`salaryId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`facultymember`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`facultymember` (
  `facultyId` INT(11) NOT NULL,
  `facultyMemLname` VARCHAR(45) NULL DEFAULT NULL,
  `facultyMemFname` VARCHAR(45) NULL DEFAULT NULL,
  `departmentId` INT(11) NOT NULL,
  `jobTitleId` INT(11) NOT NULL,
  PRIMARY KEY (`facultyId`),
  INDEX `fk_faculty_member_department1_idx` (`departmentId` ASC),
  INDEX `fk_faculty_member_job_title1_idx` (`jobTitleId` ASC),
  CONSTRAINT `fk_faculty_member_department1`
    FOREIGN KEY (`departmentId`)
    REFERENCES `its544db`.`department` (`departmentId`),
  CONSTRAINT `fk_faculty_member_job_title1`
    FOREIGN KEY (`jobTitleId`)
    REFERENCES `its544db`.`jobtitle` (`jobTitleId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`department`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`department` (
  `departmentId` INT(11) NOT NULL,
  `departmentName` VARCHAR(45) NULL DEFAULT NULL,
  `departmentHead` INT(11) NOT NULL,
  PRIMARY KEY (`departmentId`),
  INDEX `fk_department_facultyMember1_idx` (`departmentHead` ASC),
  CONSTRAINT `fk_department_facultyMember1`
    FOREIGN KEY (`departmentHead`)
    REFERENCES `its544db`.`facultymember` (`facultyId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`class`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`class` (
  `classId` INT(11) NOT NULL,
  `className` VARCHAR(120) NOT NULL,
  `creditHours` DECIMAL(3,2) NOT NULL,
  `maxStudents` INT(11) NOT NULL,
  `requiresLectureRoom` CHAR(1) NOT NULL,
  `requiresLabRoom` INT(11) NOT NULL,
  `departmentId` INT(11) NOT NULL,
  PRIMARY KEY (`classId`),
  INDEX `fk_class_department1_idx` (`departmentId` ASC),
  CONSTRAINT `fk_class_department1`
    FOREIGN KEY (`departmentId`)
    REFERENCES `its544db`.`department` (`departmentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`classroom`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`classroom` (
  `classroomId` INT(11) NOT NULL,
  `roomType` VARCHAR(45) NOT NULL,
  `seats` INT(11) NOT NULL,
  `hasProjector` CHAR(1) NOT NULL,
  PRIMARY KEY (`classroomId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`club`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`club` (
  `clubId` INT(11) NOT NULL,
  `clubName` VARCHAR(45) NULL DEFAULT NULL,
  `ClubMeetingRoom` VARCHAR(45) NULL DEFAULT NULL,
  `clubMeetingDay` VARCHAR(45) NULL DEFAULT NULL,
  `clubMeetingTime` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`clubId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`financial aid`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`financial aid` (
  `fAidId` VARCHAR(20) NOT NULL,
  `fAidAmount` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`fAidId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`students`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`students` (
  `studentId` INT NOT NULL,
  `fname` VARCHAR(128) NOT NULL,
  `lname` VARCHAR(128) NOT NULL,
  `mname` VARCHAR(128) NULL DEFAULT NULL,
  `dateOfBirth` DATE NOT NULL,
  `ssn` CHAR(9) NOT NULL,
  `genderCd` CHAR(1) NOT NULL,
  `foreignAddressIndicator` CHAR(1) NOT NULL,
  `addressLine1` VARCHAR(128) NOT NULL,
  `addressLine2` VARCHAR(128) NULL DEFAULT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` CHAR(2) NULL DEFAULT NULL,
  `zip` CHAR(9) NULL DEFAULT NULL,
  `country` VARCHAR(45) NOT NULL,
  `foreignPostalCode` VARCHAR(20) NULL DEFAULT NULL,
  `foeignTerritory` VARCHAR(90) NULL DEFAULT NULL,
  `phoneNumber` CHAR(10) NOT NULL,
  `emailAddress` VARCHAR(120) NOT NULL,
  `fadvisorFacultyId` INT(11) NOT NULL,
  `fAidId` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`studentId`),
  INDEX `fk_students_facultymember1_idx` (`fadvisorFacultyId` ASC),
  INDEX `fk_students_financial aid1_idx` (`fAidId` ASC),
  CONSTRAINT `fk_students_facultymember1`
    FOREIGN KEY (`fadvisorFacultyId`)
    REFERENCES `its544db`.`facultymember` (`facultyId`),
  CONSTRAINT `fk_students_financial aid1`
    FOREIGN KEY (`fAidId`)
    REFERENCES `its544db`.`financial aid` (`fAidId`))
ENGINE = InnoDB
AUTO_INCREMENT = 2
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`clubassigments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`clubassigments` (
  `clubId` INT(11) NOT NULL,
  `studentId` INT(11) NOT NULL,
  PRIMARY KEY (`clubId`, `studentId`),
  INDEX `fk_club_has_students_students1_idx` (`studentId` ASC),
  INDEX `fk_club_has_students_club1_idx` (`clubId` ASC),
  CONSTRAINT `fk_club_has_students_club1`
    FOREIGN KEY (`clubId`)
    REFERENCES `its544db`.`club` (`clubId`),
  CONSTRAINT `fk_club_has_students_students1`
    FOREIGN KEY (`studentId`)
    REFERENCES `its544db`.`students` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`session`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`session` (
  `sessionID` CHAR(6) NOT NULL,
  `sessionSeason` CHAR(2) NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  PRIMARY KEY (`sessionID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`section`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`section` (
  `sectionID` INT(11) NOT NULL,
  `classId` INT(11) NOT NULL,
  `session_sessionID` CHAR(6) NOT NULL,
  `startDate` DATE NOT NULL,
  `endDate` DATE NOT NULL,
  `meetTimeSun` TIME NULL DEFAULT NULL,
  `meetTimeMon` TIME NULL DEFAULT NULL,
  `meetTimeTue` TIME NULL DEFAULT NULL,
  `meetTimeWed` TIME NULL DEFAULT NULL,
  `meetTimeThu` TIME NULL DEFAULT NULL,
  `meetTimeFri` TIME NULL DEFAULT NULL,
  `meetTimeSat` TIME NULL DEFAULT NULL,
  `classroomId` INT(11) NOT NULL,
  `facultyId` INT(11) NOT NULL,
  PRIMARY KEY (`sectionID`),
  INDEX `fk_section_class_idx` (`classId` ASC),
  INDEX `fk_section_session1_idx` (`session_sessionID` ASC),
  INDEX `fk_section_classroom1_idx` (`classroomId` ASC),
  INDEX `fk_section_facultymember1_idx` (`facultyId` ASC),
  CONSTRAINT `fk_section_class`
    FOREIGN KEY (`classId`)
    REFERENCES `its544db`.`class` (`classId`),
  CONSTRAINT `fk_section_classroom1`
    FOREIGN KEY (`classroomId`)
    REFERENCES `its544db`.`classroom` (`classroomId`),
  CONSTRAINT `fk_section_facultymember1`
    FOREIGN KEY (`facultyId`)
    REFERENCES `its544db`.`facultymember` (`facultyId`),
  CONSTRAINT `fk_section_session1`
    FOREIGN KEY (`session_sessionID`)
    REFERENCES `its544db`.`session` (`sessionID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`registration`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`registration` (
  `sectionID` INT(11) NOT NULL,
  `studentId` INT(11) NOT NULL,
  `grade` DECIMAL(3,2) NULL DEFAULT NULL,
  PRIMARY KEY (`sectionID`, `studentId`),
  INDEX `fk_section_has_students_students1_idx` (`studentId` ASC),
  INDEX `fk_section_has_students_section1_idx` (`sectionID` ASC),
  CONSTRAINT `fk_section_has_students_section1`
    FOREIGN KEY (`sectionID`)
    REFERENCES `its544db`.`section` (`sectionID`),
  CONSTRAINT `fk_section_has_students_students1`
    FOREIGN KEY (`studentId`)
    REFERENCES `its544db`.`students` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`course payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`course payment` (
  `paymentId` INT(11) NOT NULL,
  `paymentAmount` DOUBLE NULL DEFAULT NULL,
  `paymentDate` DATE NULL DEFAULT NULL,
  `registration_sectionID` INT(11) NOT NULL,
  `registration_studentId` INT(11) NOT NULL,
  PRIMARY KEY (`paymentId`),
  INDEX `fk_course payment_registration1_idx` (`registration_sectionID` ASC, `registration_studentId` ASC),
  CONSTRAINT `fk_course payment_registration1`
    FOREIGN KEY (`registration_sectionID` , `registration_studentId`)
    REFERENCES `its544db`.`registration` (`sectionID` , `studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`departmant credit cost`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`departmant credit cost` (
  `costId` VARCHAR(20) NOT NULL,
  `costPerCredit` INT(11) NULL DEFAULT NULL,
  `departmentId` INT(11) NOT NULL,
  PRIMARY KEY (`costId`),
  INDEX `fk_departmant credit cost_department1_idx` (`departmentId` ASC),
  CONSTRAINT `fk_departmant credit cost_department1`
    FOREIGN KEY (`departmentId`)
    REFERENCES `its544db`.`department` (`departmentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`dorm`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`dorm` (
  `dormId` INT(11) NOT NULL,
  `dormName` VARCHAR(45) NULL DEFAULT NULL,
  `dormCapacity` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`dormId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`dorm rooms`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`dorm rooms` (
  `roomNo` VARCHAR(45) NOT NULL,
  `roomCapacity` VARCHAR(45) NULL DEFAULT NULL,
  `dormId` INT(11) NOT NULL,
  PRIMARY KEY (`roomNo`),
  INDEX `fk_dorm rooms_dorm_idx` (`dormId` ASC),
  CONSTRAINT `fk_dorm rooms_dorm`
    FOREIGN KEY (`dormId`)
    REFERENCES `its544db`.`dorm` (`dormId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`roomassignment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`roomassignment` (
  `studentId` INT(11) NOT NULL,
  `roomNo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`studentId`, `roomNo`),
  INDEX `fk_students_has_dorm rooms_dorm rooms1_idx` (`roomNo` ASC),
  INDEX `fk_students_has_dorm rooms_students1_idx` (`studentId` ASC),
  CONSTRAINT `fk_students_has_dorm rooms_dorm rooms1`
    FOREIGN KEY (`roomNo`)
    REFERENCES `its544db`.`dorm rooms` (`roomNo`),
  CONSTRAINT `fk_students_has_dorm rooms_students1`
    FOREIGN KEY (`studentId`)
    REFERENCES `its544db`.`students` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`dorm payment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`dorm payment` (
  `studentId` INT(11) NOT NULL,
  `roomNo` VARCHAR(45) NOT NULL,
  `dormAmount` DOUBLE NOT NULL,
  `paymentDate` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`studentId`, `roomNo`),
  INDEX `fk_dorm payment_roomAssignment1_idx` (`studentId` ASC, `roomNo` ASC),
  CONSTRAINT `fk_dorm payment_roomAssignment1`
    FOREIGN KEY (`studentId` , `roomNo`)
    REFERENCES `its544db`.`roomassignment` (`studentId` , `roomNo`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`major`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`major` (
  `majorId` INT(11) NOT NULL,
  `majorName` VARCHAR(45) NULL DEFAULT NULL,
  `departmentId` INT(11) NOT NULL,
  PRIMARY KEY (`majorId`),
  INDEX `fk_major_department_idx` (`departmentId` ASC),
  CONSTRAINT `fk_major_department`
    FOREIGN KEY (`departmentId`)
    REFERENCES `its544db`.`department` (`departmentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`sportteam`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`sportteam` (
  `sportTeamId` INT(11) NOT NULL,
  `sportTeamName` VARCHAR(45) NULL DEFAULT NULL,
  `sportTeamWins` VARCHAR(45) NULL DEFAULT NULL,
  `sportTeamLoses` VARCHAR(45) NULL DEFAULT NULL,
  `sportTeamMeetingPlace` VARCHAR(45) NULL DEFAULT NULL,
  `sportTeamMeetingDay` VARCHAR(45) NULL DEFAULT NULL,
  `sportTeamMeetingTime` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`sportTeamId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`student balance sheet`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`student balance sheet` (
  `sbsId` INT(11) NOT NULL,
  `studentId` INT(11) NOT NULL,
  `description` VARCHAR(45) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `balance` DOUBLE NULL DEFAULT NULL,
  `sessionID` CHAR(6) NOT NULL,
  PRIMARY KEY (`sbsId`),
  INDEX `fk_student balance sheet_students1_idx` (`studentId` ASC),
  INDEX `fk_student balance sheet_session1_idx` (`sessionID` ASC),
  CONSTRAINT `fk_student balance sheet_session1`
    FOREIGN KEY (`sessionID`)
    REFERENCES `its544db`.`session` (`sessionID`),
  CONSTRAINT `fk_student balance sheet_students1`
    FOREIGN KEY (`studentId`)
    REFERENCES `its544db`.`students` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `its544db`.`teamassignments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `its544db`.`teamassignments` (
  `sportTeamId` INT(11) NOT NULL,
  `studentId` INT(11) NOT NULL,
  PRIMARY KEY (`sportTeamId`, `studentId`),
  INDEX `fk_spotTeam_has_students_students1_idx` (`studentId` ASC),
  INDEX `fk_spotTeam_has_students_spotTeam1_idx` (`sportTeamId` ASC),
  CONSTRAINT `fk_spotTeam_has_students_spotTeam1`
    FOREIGN KEY (`sportTeamId`)
    REFERENCES `its544db`.`sportteam` (`sportTeamId`),
  CONSTRAINT `fk_spotTeam_has_students_students1`
    FOREIGN KEY (`studentId`)
    REFERENCES `its544db`.`students` (`studentId`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


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

-- Elif and Ibrahim
-- INSERT INTO `salary` (`salaryId`,`salarDateFrom`,`salaryDateTo`,`salaryAmountYearly`) VALUES ('SA001','09/04/2017','09/07/2018',65,000.00);
--INSERT INTO `salary` (`salaryId`,`salarDateFrom`,`salaryDateTo`,`salaryAmountYearly`) VALUES ('SA002','09/05/2016','09/07/2018',105,000.00);
