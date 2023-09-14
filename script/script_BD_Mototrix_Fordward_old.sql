-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema TallerMototrix
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema TallerMototrix
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `TallerMototrix` DEFAULT CHARACTER SET utf8 ;
USE `TallerMototrix` ;

-- -----------------------------------------------------
-- Table `TallerMototrix`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Vehiculos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Vehiculos` (
  `idVehiculos` INT NOT NULL,
  `marca` VARCHAR(45) NOT NULL,
  `referencia` VARCHAR(45) NOT NULL,
  `modelo` INT NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `kilometros_rec` INT NOT NULL,
  PRIMARY KEY (`idVehiculos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Servicios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Servicios` (
  `idServicios` INT NOT NULL,
  `nombre_serv` VARCHAR(45) NOT NULL,
  `precio` DOUBLE NOT NULL,
  `tiene_insumos` TINYINT NOT NULL,
  `tiene_refacciones` TINYINT NOT NULL,
  PRIMARY KEY (`idServicios`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Proveedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Proveedor` (
  `idProveedor` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `correo` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idProveedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Refacciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Refacciones` (
  `idRefacciones` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_c` DOUBLE NOT NULL,
  `precio_v` DOUBLE NOT NULL,
  PRIMARY KEY (`idRefacciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Empleado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Empleado` (
  `idEmpleado` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `telefono` VARCHAR(45) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `salario` DOUBLE NOT NULL,
  PRIMARY KEY (`idEmpleado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`ficha_de_servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`ficha_de_servicio` (
  `idficha_servicios` INT NOT NULL AUTO_INCREMENT,
  `idCliente` INT NOT NULL,
  `idEmpleado` INT NOT NULL,
  `idVehiculo` INT NOT NULL,
  `fecha_servicio` DATETIME NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  `costo` DOUBLE NOT NULL,
  PRIMARY KEY (`idficha_servicios`),
  INDEX `Ficha_Cliente_fk_idx` (`idCliente` ASC) VISIBLE,
  INDEX `Ficha_Empleado_fk_idx` (`idEmpleado` ASC) VISIBLE,
  INDEX `Ficha_Vehiculo_fk_idx` (`idVehiculo` ASC) VISIBLE,
  CONSTRAINT `Ficha_Cliente_fk`
    FOREIGN KEY (`idCliente`)
    REFERENCES `TallerMototrix`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Ficha_Empleado_fk`
    FOREIGN KEY (`idEmpleado`)
    REFERENCES `TallerMototrix`.`Empleado` (`idEmpleado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Ficha_Vehiculo_fk`
    FOREIGN KEY (`idVehiculo`)
    REFERENCES `TallerMototrix`.`Vehiculos` (`idVehiculos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Vinculo_Servicio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Vinculo_Servicio` (
  `idFicha_Servicios` INT NOT NULL,
  `idServicios` INT NOT NULL,
  PRIMARY KEY (`idFicha_Servicios`),
  INDEX `VinculoS_Servicio_fk_idx` (`idServicios` ASC) VISIBLE,
  UNIQUE INDEX `idFicha_Servicios_UNIQUE` (`idFicha_Servicios` ASC) VISIBLE,
  UNIQUE INDEX `idServicios_UNIQUE` (`idServicios` ASC) VISIBLE,
  CONSTRAINT `VinculoS_Ficha_fk`
    FOREIGN KEY (`idFicha_Servicios`)
    REFERENCES `TallerMototrix`.`ficha_de_servicio` (`idficha_servicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VinculoS_Servicio_fk`
    FOREIGN KEY (`idServicios`)
    REFERENCES `TallerMototrix`.`Servicios` (`idServicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Vinculo_Refaccion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Vinculo_Refaccion` (
  `idServicio` INT NOT NULL,
  `idRefaccion` INT NOT NULL,
  PRIMARY KEY (`idServicio`),
  INDEX `VinculoR_Refaccion_fk_idx` (`idRefaccion` ASC) VISIBLE,
  CONSTRAINT `VinculoR_Servicio_fk`
    FOREIGN KEY (`idServicio`)
    REFERENCES `TallerMototrix`.`Servicios` (`idServicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VinculoR_Refaccion_fk`
    FOREIGN KEY (`idRefaccion`)
    REFERENCES `TallerMototrix`.`Refacciones` (`idRefacciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Compra` (
  `idCompra` INT NOT NULL,
  `idProveedor` INT NOT NULL,
  PRIMARY KEY (`idCompra`),
  INDEX `Compra_Proveedor_fk_idx` (`idProveedor` ASC) VISIBLE,
  CONSTRAINT `Compra_Proveedor_fk`
    FOREIGN KEY (`idProveedor`)
    REFERENCES `TallerMototrix`.`Proveedor` (`idProveedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Vinculo_Compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Vinculo_Compra` (
  `idCompra` INT NOT NULL,
  `idRefaccion` INT NOT NULL,
  PRIMARY KEY (`idCompra`),
  INDEX `VinculoC_Refaccion_fk_idx` (`idRefaccion` ASC) VISIBLE,
  CONSTRAINT `VinculoC_Compra_fk`
    FOREIGN KEY (`idCompra`)
    REFERENCES `TallerMototrix`.`Compra` (`idCompra`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VinculoC_Refaccion_fk`
    FOREIGN KEY (`idRefaccion`)
    REFERENCES `TallerMototrix`.`Refacciones` (`idRefacciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Insumos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Insumos` (
  `idInsumos` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `cantidad` INT NOT NULL,
  `precio_c` DOUBLE NOT NULL,
  `precio_v` DOUBLE NOT NULL,
  PRIMARY KEY (`idInsumos`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Vinculo_Insumo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Vinculo_Insumo` (
  `idServicio` INT NOT NULL,
  `idInsumo` INT NOT NULL,
  PRIMARY KEY (`idServicio`),
  INDEX `VinculoI_Insumos_fk_idx` (`idInsumo` ASC) VISIBLE,
  CONSTRAINT `VinculoI_Servicios_fk`
    FOREIGN KEY (`idServicio`)
    REFERENCES `TallerMototrix`.`Servicios` (`idServicios`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VinculoI_Insumos_fk`
    FOREIGN KEY (`idInsumo`)
    REFERENCES `TallerMototrix`.`Insumos` (`idInsumos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `TallerMototrix`.`Vinculo_Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `TallerMototrix`.`Vinculo_Cliente` (
  `idCliente` INT NOT NULL,
  `idVehiculo` INT NOT NULL,
  PRIMARY KEY (`idCliente`),
  INDEX `VinculoC_Vehiculo_fk_idx` (`idVehiculo` ASC) VISIBLE,
  CONSTRAINT `VinculoC_Cliente_fk`
    FOREIGN KEY (`idCliente`)
    REFERENCES `TallerMototrix`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `VinculoC_Vehiculo_fk`
    FOREIGN KEY (`idVehiculo`)
    REFERENCES `TallerMototrix`.`Vehiculos` (`idVehiculos`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
