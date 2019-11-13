-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema course_management_system
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema course_management_system
-- -----------------------------------------------------
DROP database cms;
CREATE SCHEMA IF NOT EXISTS `CMS` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `CMS` ;

-- -----------------------------------------------------
-- Table `course_management_system`.`departments`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`departments` (
  `department_id` INT(11) NOT NULL,
  `title` VARCHAR(40) NOT NULL,
  `hod_id` INT(11) NULL,
  `date_since` DATE NULL DEFAULT NULL,
  `faculty_id` INT(11) NOT NULL,
  PRIMARY KEY (`department_id`, `faculty_id`),
  UNIQUE INDEX `title` (`title` ASC) VISIBLE,
  INDEX `fk_departments_lecturer_idx` (`hod_id` ASC) VISIBLE,
  INDEX `fk_departments_faculty_idx` (`faculty_id` ASC) VISIBLE,
  CONSTRAINT `fk_departments_lectures2`
    FOREIGN KEY (`hod_id`)
    REFERENCES `cms`.`lecturers` (`employee_id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_departments_faculty2`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `cms`.`faculty` (`faculty_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)    
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course_management_system`.`lecturers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`lecturers` (
  `employee_id` INT(11) NOT NULL,
  `fname` VARCHAR(40) NOT NULL,
  `mname` VARCHAR(40) NULL DEFAULT NULL,
  `lname` VARCHAR(40) NOT NULL,
  `department_id` INT(11) NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `fk_lecturers_departments1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_lecturers_departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `cms`.`departments` (`department_id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course_management_system`.`faculty`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`faculty` (
  `faculty_id` INT(11) NOT NULL,
  `title` VARCHAR(40) NOT NULL,
  `date_since` DATE NULL DEFAULT NULL,
  `dean_id` INT(11) NULL,
  PRIMARY KEY (`faculty_id`),
  UNIQUE INDEX `title` (`title` ASC) VISIBLE,
  INDEX `dean_id_idx` (`dean_id` ASC) VISIBLE,
  CONSTRAINT `dean_id`
    FOREIGN KEY (`dean_id`)
    REFERENCES `cms`.`lecturers` (`employee_id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course_management_system`.`specs`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`specs` (
  `spec_id` INT(11) NOT NULL,
  `sub1` VARCHAR(20) NOT NULL,
  `sub2` VARCHAR(20) NOT NULL,
  `sub3` VARCHAR(20) NOT NULL,
  `cp` INT(11) NOT NULL,
  PRIMARY KEY (`spec_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course_management_system`.`courses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`courses` (
  `course_id` INT(11) NOT NULL,
  `title` VARCHAR(40) NOT NULL,
  `duration` INT(11) NULL DEFAULT NULL,
  `fee` DECIMAL(10,2) NOT NULL,
  `faculty_id` INT(11) NOT NULL,
  `spec_id` INT(11) NULL,
  PRIMARY KEY (`course_id`),
  UNIQUE INDEX `title` (`title` ASC) VISIBLE,
  INDEX `fk_courses_faculty1_idx` (`faculty_id` ASC) VISIBLE,
  INDEX `fk_courses_specs1_idx` (`spec_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_faculty1`
    FOREIGN KEY (`faculty_id`)
    REFERENCES `cms`.`faculty` (`faculty_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_specs1`
    FOREIGN KEY (`spec_id`)
    REFERENCES `cms`.`specs` (`spec_id`)
    ON DELETE SET NULL
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course_management_system`.`units`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`units` (
  `unit_code` INT(11) NOT NULL,
  `title` VARCHAR(40) NOT NULL,
  `duration` INT(11) NOT NULL,
  `cf` INT(11) NOT NULL,
  `department_id` INT(11) NOT NULL,
  PRIMARY KEY (`unit_code`),
  UNIQUE INDEX `title` (`title` ASC) VISIBLE,
  INDEX `fk_units_departments1_idx` (`department_id` ASC) VISIBLE,
  CONSTRAINT `fk_units_departments1`
    FOREIGN KEY (`department_id`)
    REFERENCES `cms`.`departments` (`department_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course_management_system`.`courses_has_units`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`courses_has_units` (
  `course_id` INT(11) NOT NULL,
  `unit_code` INT(11) NOT NULL,
  PRIMARY KEY (`course_id`, `unit_code`),
  INDEX `fk_courses_has_units_units1_idx` (`unit_code` ASC) VISIBLE,
  INDEX `fk_courses_has_units_courses_idx` (`course_id` ASC) VISIBLE,
  CONSTRAINT `fk_courses_has_units_courses`
    FOREIGN KEY (`course_id`)
    REFERENCES `cms`.`courses` (`course_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_courses_has_units_units1`
    FOREIGN KEY (`unit_code`)
    REFERENCES `cms`.`units` (`unit_code`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `course_management_system`.`lecturer_lectures_units`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cms`.`lecturer_lectures_units` (
  `employee_id` INT(11) NOT NULL,
  `unit_code` INT(11) NOT NULL,
  PRIMARY KEY (`employee_id`, `unit_code`),
  INDEX `fk_lecturers_has_units_units1_idx` (`unit_code` ASC) VISIBLE,
  INDEX `fk_lecturers_has_units_lecturers1_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `fk_lecturers_has_units_lecturers1`
    FOREIGN KEY (`employee_id`)
    REFERENCES `cms`.`lecturers` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_lecturers_has_units_units1`
    FOREIGN KEY (`unit_code`)
    REFERENCES `cms`.`units` (`unit_code`)
    ON DELETE CASCADE
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
