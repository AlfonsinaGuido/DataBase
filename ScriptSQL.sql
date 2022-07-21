-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema my-portfolio
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema my-portfolio
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `my-portfolio` DEFAULT CHARACTER SET utf8 ;
USE `my-portfolio` ;

-- -----------------------------------------------------
-- Table `my-portfolio`.`PERSONA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my-portfolio`.`PERSONA` (
  `Id` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellido` VARCHAR(45) NOT NULL,
  `domicilio` VARCHAR(45) NULL,
  `fechaNac` DATE NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `sobre_mi` VARCHAR(200) NOT NULL,
  `url_foto` VARCHAR(100) NULL,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my-portfolio`.`EDUCACION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my-portfolio`.`EDUCACION` (
  `id` INT NOT NULL,
  `institucion` VARCHAR(45) NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `esCarreraGrado` TINYINT NOT NULL,
  `fechaInicio` DATE NOT NULL,
  `fechaFin` DATE NULL,
  `PERSONA_Id` INT NOT NULL,
  PRIMARY KEY (`id`, `PERSONA_Id`),
  INDEX `fk_EDUCACION_PERSONA_idx` (`PERSONA_Id` ASC) VISIBLE,
  CONSTRAINT `fk_EDUCACION_PERSONA`
    FOREIGN KEY (`PERSONA_Id`)
    REFERENCES `my-portfolio`.`PERSONA` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my-portfolio`.`PROYECTO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my-portfolio`.`PROYECTO` (
  `id` INT NOT NULL,
  `descripcion` VARCHAR(200) NOT NULL,
  `PERSONA_Id` INT NOT NULL,
  PRIMARY KEY (`id`, `PERSONA_Id`),
  INDEX `fk_PROYECTO_PERSONA1_idx` (`PERSONA_Id` ASC) VISIBLE,
  CONSTRAINT `fk_PROYECTO_PERSONA1`
    FOREIGN KEY (`PERSONA_Id`)
    REFERENCES `my-portfolio`.`PERSONA` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my-portfolio`.`USUARIO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my-portfolio`.`USUARIO` (
  `id` INT NOT NULL,
  `nombreUsuario` VARCHAR(12) NOT NULL,
  `clave` VARCHAR(12) NOT NULL,
  `PERSONA_Id` INT NOT NULL,
  PRIMARY KEY (`id`, `PERSONA_Id`),
  INDEX `fk_USUARIO_PERSONA1_idx` (`PERSONA_Id` ASC) VISIBLE,
  CONSTRAINT `fk_USUARIO_PERSONA1`
    FOREIGN KEY (`PERSONA_Id`)
    REFERENCES `my-portfolio`.`PERSONA` (`Id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `my-portfolio`.`TECNOLOGIA`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `my-portfolio`.`TECNOLOGIA` (
  `id` INT NOT NULL,
  `nombreTecno` VARCHAR(20) NOT NULL,
  `PROYECTO_id` INT NOT NULL,
  PRIMARY KEY (`id`, `PROYECTO_id`),
  INDEX `fk_TECNOLOGIA_PROYECTO1_idx` (`PROYECTO_id` ASC) VISIBLE,
  CONSTRAINT `fk_TECNOLOGIA_PROYECTO1`
    FOREIGN KEY (`PROYECTO_id`)
    REFERENCES `my-portfolio`.`PROYECTO` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
