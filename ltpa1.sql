-- MySQL Script generated by MySQL Workbench
-- Sat Apr  6 16:27:36 2024
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema ltpa1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ltpa1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ltpa1` DEFAULT CHARACTER SET utf8 ;
USE `ltpa1` ;

-- -----------------------------------------------------
-- Table `ltpa1`.`menu`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ltpa1`.`menu` (
  `idMenu` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `link` VARCHAR(100) NOT NULL,
  `icone` VARCHAR(45) NULL,
  `exibir` INT NOT NULL,
  PRIMARY KEY (`idMenu`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ltpa1`.`perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ltpa1`.`perfil` (
  `idPerfil` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idPerfil`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ltpa1`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ltpa1`.`usuario` (
  `idUsuario` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `login` VARCHAR(10) NOT NULL,
  `senha` VARCHAR(10) NOT NULL,
  `status` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  PRIMARY KEY (`idUsuario`),
  INDEX `fk_usuario_perfil1_idx` (`idPerfil` ASC),
  CONSTRAINT `fk_usuario_perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `ltpa1`.`perfil` (`idPerfil`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ltpa1`.`menu_perfil`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ltpa1`.`menu_perfil` (
  `idMenu` INT NOT NULL,
  `idPerfil` INT NOT NULL,
  PRIMARY KEY (`idMenu`, `idPerfil`),
  INDEX `fk_menu_has_perfil_perfil1_idx` (`idPerfil` ASC),
  INDEX `fk_menu_has_perfil_menu_idx` (`idMenu` ASC),
  CONSTRAINT `fk_menu_has_perfil_menu`
    FOREIGN KEY (`idMenu`)
    REFERENCES `ltpa1`.`menu` (`idMenu`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE,
  CONSTRAINT `fk_menu_has_perfil_perfil1`
    FOREIGN KEY (`idPerfil`)
    REFERENCES `ltpa1`.`perfil` (`idPerfil`)
    ON DELETE RESTRICT
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;