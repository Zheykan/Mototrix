-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema tallermototrix
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema tallermototrix
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `tallermototrix` DEFAULT CHARACTER SET utf8 ;
USE `tallermototrix` ;

-- -----------------------------------------------------
-- Table `tallermototrix`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermototrix`.`cliente` (
  `idcliente` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tallermototrix`.`vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermototrix`.`vehiculos` (
  `idvehiculos` INT NOT NULL AUTO_INCREMENT,
  `placa` VARCHAR(45) NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `referencia` VARCHAR(45) NOT NULL,
  `modelo` INT NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `kilometros_rec` INT NOT NULL,
  `idcliente` INT NOT NULL,
  PRIMARY KEY (`idvehiculos`),
  INDEX `Vehiculo_Cliente_fk_idx` (`idcliente` ASC) VISIBLE,
  CONSTRAINT `Vehiculo_Cliente_fk`
    FOREIGN KEY (`idcliente`)
    REFERENCES `tallermototrix`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tallermototrix`.`proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermototrix`.`proveedor` (
  `idproveedor` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idproveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tallermototrix`.`refacciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermototrix`.`refacciones` (
  `idrefacciones` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_c` DOUBLE NOT NULL,
  `precio_v` DOUBLE NOT NULL,
  `idproveedor` INT NOT NULL,
  PRIMARY KEY (`idrefacciones`),
  INDEX `Refaccion_Provedor_fk_idx` (`idproveedor` ASC) VISIBLE,
  CONSTRAINT `Refaccion_Provedor_fk`
    FOREIGN KEY (`idproveedor`)
    REFERENCES `tallermototrix`.`proveedor` (`idproveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tallermototrix`.`insumos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermototrix`.`insumos` (
  `idinsumos` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_c` DOUBLE NOT NULL,
  `precio_v` DOUBLE NOT NULL,
  PRIMARY KEY (`idinsumos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tallermototrix`.`servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermototrix`.`servicios` (
  `idservicios` INT NOT NULL AUTO_INCREMENT,
  `nombre_serv` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `tiene_insumos` TINYINT NOT NULL,
  `tiene_refacciones` TINYINT NOT NULL,
  `idrefacciones` INT NOT NULL,
  `idinsumos` INT NOT NULL,
  PRIMARY KEY (`idservicios`),
  INDEX `Servicio_Refaccion_fk_idx` (`idrefacciones` ASC) VISIBLE,
  INDEX `Servicio_Insumo_fk_idx` (`idinsumos` ASC) VISIBLE,
  CONSTRAINT `Servicio_Refaccion_fk`
    FOREIGN KEY (`idrefacciones`)
    REFERENCES `tallermototrix`.`refacciones` (`idrefacciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Servicio_Insumo_fk`
    FOREIGN KEY (`idinsumos`)
    REFERENCES `tallermototrix`.`insumos` (`idinsumos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tallermototrix`.`empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermototrix`.`empleado` (
  `idempleado` INT NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `salario` DOUBLE NOT NULL,
  PRIMARY KEY (`idempleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tallermototrix`.`ficha_de_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermototrix`.`ficha_de_servicio` (
  `idficha_servicios` INT NOT NULL AUTO_INCREMENT,
  `idcliente` INT NOT NULL,
  `idempleado` INT NOT NULL,
  `idvehiculo` INT NOT NULL,
  `fecha_servicio` DATETIME NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `costo` DOUBLE NOT NULL,
  PRIMARY KEY (`idficha_servicios`),
  INDEX `Ficha_Cliente_fk_idx` (`idcliente` ASC) VISIBLE,
  INDEX `Ficha_Empleado_fk_idx` (`idempleado` ASC) VISIBLE,
  INDEX `Ficha_Vehiculo_fk_idx` (`idvehiculo` ASC) VISIBLE,
  CONSTRAINT `Ficha_Cliente_fk`
    FOREIGN KEY (`idcliente`)
    REFERENCES `tallermototrix`.`cliente` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Ficha_Empleado_fk`
    FOREIGN KEY (`idempleado`)
    REFERENCES `tallermototrix`.`empleado` (`idempleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Ficha_Vehiculo_fk`
    FOREIGN KEY (`idvehiculo`)
    REFERENCES `tallermototrix`.`vehiculos` (`idvehiculos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `tallermototrix`.`vinculo_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `tallermototrix`.`vinculo_servicio` (
  `idficha_servicios` INT NOT NULL,
  `idservicios` INT NOT NULL,
  PRIMARY KEY (`idficha_servicios`, `idservicios`),
  INDEX `VinculoS_Servicio_fk_idx` (`idservicios` ASC) VISIBLE,
  UNIQUE INDEX `idFicha_Servicios_UNIQUE` (`idficha_servicios` ASC) VISIBLE,
  UNIQUE INDEX `idServicios_UNIQUE` (`idservicios` ASC) VISIBLE,
  CONSTRAINT `VinculoS_Ficha_fk`
    FOREIGN KEY (`idficha_servicios`)
    REFERENCES `tallermototrix`.`ficha_de_servicio` (`idficha_servicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VinculoS_Servicio_fk`
    FOREIGN KEY (`idservicios`)
    REFERENCES `tallermototrix`.`servicios` (`idservicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
