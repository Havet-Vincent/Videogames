

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema videogame
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema videogame
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `videogame` DEFAULT CHARACTER SET utf8 ;
USE `videogame` ;

-- -----------------------------------------------------
-- Table `videogame`.`platform`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videogame`.`platform` ;

CREATE TABLE IF NOT EXISTS `videogame`.`platform` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(32) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `videogame`.`videogame`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `videogame`.`videogame` ;

CREATE TABLE IF NOT EXISTS `videogame`.`videogame` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(64) NOT NULL,
  `editor` VARCHAR(64) NULL,
  `release_date` DATE NULL,
  `platform_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_videogame_platform_idx` (`platform_id` ASC))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `videogame`.`platform`
-- -----------------------------------------------------
START TRANSACTION;
USE `videogame`;
INSERT INTO `videogame`.`platform` (`id`, `name`) VALUES (1, 'PC');
INSERT INTO `videogame`.`platform` (`id`, `name`) VALUES (2, 'MegaDrive');
INSERT INTO `videogame`.`platform` (`id`, `name`) VALUES (3, 'SNES');
INSERT INTO `videogame`.`platform` (`id`, `name`) VALUES (4, 'PlayStation');

COMMIT;


-- -----------------------------------------------------
-- Data for table `videogame`.`videogame`
-- -----------------------------------------------------
START TRANSACTION;
USE `videogame`;
INSERT INTO `videogame`.`videogame` (`id`, `name`, `editor`, `release_date`, `platform_id`) VALUES (1, 'Theme Hospital', 'Bullfrog', '1997-09-10', 1);
INSERT INTO `videogame`.`videogame` (`id`, `name`, `editor`, `release_date`, `platform_id`) VALUES (2, 'NBA Jam', 'Midway', '1993-04-02', 2);
INSERT INTO `videogame`.`videogame` (`id`, `name`, `editor`, `release_date`, `platform_id`) VALUES (3, 'Day of Tentacle', 'LucasArts', '1993-06-20', 1);
INSERT INTO `videogame`.`videogame` (`id`, `name`, `editor`, `release_date`, `platform_id`) VALUES (4, 'Castlevania', 'Konami', '1986-04-06', 3);

COMMIT;
