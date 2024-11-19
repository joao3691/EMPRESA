SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE DATABASE IF NOT EXISTS mydb DEFAULT CHARACTER SET utf8mb4;
USE `mydb`;

-- -----------------------------------------------------
-- Table `nome_e_numero`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `nome_e_numero` (
  `id_de_nn` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `numero_telefone` VARCHAR(45) NOT NULL,  -- Ideal para armazenar números de telefone com formatos variados
  PRIMARY KEY (`id_de_nn`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cargo` (
  `id_cargo` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nome_cargo` ENUM('padeiro', 'confeiteiro') NULL,  -- Usado para valores fixos, como cargos limitados
  PRIMARY KEY (`id_cargo`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `empresa`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa` (
  `id_empresa` INT NOT NULL AUTO_INCREMENT,
  `nome_empresa` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB;

-- -----------------------------------------------------
-- Table `empresa_cargo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `empresa_cargo` (
  `id_empresa` INT NOT NULL,
  `id_cargo` INT NOT NULL,
  PRIMARY KEY (`id_empresa`, `id_cargo`),
  FOREIGN KEY (`id_empresa`) REFERENCES `empresa` (`id_empresa`) ON DELETE CASCADE,
  FOREIGN KEY (`id_cargo`) REFERENCES `cargo` (`id_cargo`) ON DELETE CASCADE
) ENGINE=InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
