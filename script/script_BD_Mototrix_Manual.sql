create database tallermototrix;
use tallermototrix;

CREATE TABLE cliente(
idcliente INT NOT NULL,
nombre VARCHAR(45) NOT NULL,
telefono VARCHAR(45) NOT NULL,
correo VARCHAR(45) NOT NULL,
PRIMARY KEY (idCliente)
);
CREATE TABLE vehiculos (
  idvehiculos INT NOT NULL,
  marca VARCHAR(45) NOT NULL,
  referencia VARCHAR(45) NOT NULL,
  modelo INT NOT NULL,
  estado VARCHAR(45) NOT NULL,
  kilometros_rec INT NOT NULL,
  PRIMARY KEY (idVehiculos)
  );
  CREATE TABLE empleado (
  idempleado INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  telefono VARCHAR(45) NOT NULL,
  tipo VARCHAR(45) NOT NULL,
  salario DOUBLE NOT NULL,
  PRIMARY KEY (idEmpleado)
  );
  CREATE TABLE servicios (
  idservicios INT NOT NULL,
  nombre_serv VARCHAR(45) NOT NULL,
  precio DOUBLE NOT NULL,
  tiene_insumos TINYINT NOT NULL,
  tiene_refacciones TINYINT NOT NULL,
  PRIMARY KEY (idServicios)
  );
  CREATE TABLE proveedor (
  idproveedor INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  correo VARCHAR(45) NOT NULL,
  telefono VARCHAR(45) NOT NULL,
  PRIMARY KEY (idProveedor)
  );
  CREATE TABLE refacciones (
  idrefacciones INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  cantidad INT NOT NULL,
  precio_c DOUBLE NOT NULL,
  precio_v DOUBLE NOT NULL,
  PRIMARY KEY (idRefacciones)
  );
  CREATE TABLE insumos (
  idinsumos INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  cantidad INT NOT NULL,
  precio_c DOUBLE NOT NULL,
  precio_v DOUBLE NOT NULL,
  PRIMARY KEY (idInsumos)
  );
  CREATE TABLE vinculo_cliente (
  idcliente INT NOT NULL,
  idvehiculo INT NOT NULL,
  PRIMARY KEY (idcliente),
  CONSTRAINT VinculoC_Cliente_fk FOREIGN KEY (idcliente) REFERENCES cliente (idcliente),
  CONSTRAINT VinculoC_Vehiculo_fk FOREIGN KEY (idvehiculo) REFERENCES vehiculos (idvehiculos)
);
CREATE TABLE compra (
  idcompra INT NOT NULL,
  idproveedor INT NOT NULL,
  PRIMARY KEY (idcompra),
  CONSTRAINT Compra_Proveedor_fk FOREIGN KEY (idproveedor) REFERENCES proveedor (idproveedor)
  );
  CREATE TABLE vinculo_compra (
  idcompra INT NOT NULL,
  idrefaccion INT NOT NULL,
  PRIMARY KEY (idcompra),
  CONSTRAINT VinculoC_Compra_fk FOREIGN KEY (idcompra) REFERENCES compra (idcompra),
  CONSTRAINT VinculoC_Refaccion_fk FOREIGN KEY (idrefaccion) REFERENCES refacciones (idrefacciones)
  );
  CREATE TABLE vinculo_refaccion (
  idservicio INT NOT NULL,
  idrefaccion INT NOT NULL,
  PRIMARY KEY (idservicio),
  CONSTRAINT VinculoR_Servicio_fk FOREIGN KEY (idservicio) REFERENCES servicios (idservicios),
  CONSTRAINT VinculoR_Refaccion_fk FOREIGN KEY (idrefaccion) REFERENCES refacciones (idrefacciones)
  );
  CREATE TABLE vinculo_insumo (
  idservicio INT NOT NULL,
  idinsumo INT NOT NULL,
  PRIMARY KEY (idservicio),
  CONSTRAINT VinculoI_Servicios_fk FOREIGN KEY (idservicio) REFERENCES servicios (idservicios),
  CONSTRAINT VinculoI_Insumos_fk FOREIGN KEY (idinsumo) REFERENCES insumos (idinsumos)
  );
  CREATE TABLE ficha_de_servicio (
  idficha_servicios INT NOT NULL AUTO_INCREMENT,
  idcliente INT NOT NULL,
  idempleado INT NOT NULL,
  idvehiculo INT NOT NULL,
  fecha_servicio DATETIME NOT NULL,
  estado VARCHAR(45) NOT NULL,
  costo DOUBLE NOT NULL,
  PRIMARY KEY (idficha_servicios),
  CONSTRAINT Ficha_Cliente_fk FOREIGN KEY (idcliente) REFERENCES cliente (idcliente),
  CONSTRAINT Ficha_Empleado_fk FOREIGN KEY (idempleado) REFERENCES empleado (idempleado),
  CONSTRAINT Ficha_Vehiculo_fk FOREIGN KEY (idvehiculo) REFERENCES vehiculos (idvehiculos)
  );
  CREATE TABLE vinculo_servicio (
  idficha_servicios INT NOT NULL,
  idservicios INT NOT NULL,
  PRIMARY KEY (idficha_servicios),
  CONSTRAINT VinculoS_Ficha_fk FOREIGN KEY (idficha_servicios) REFERENCES ficha_de_servicio (idficha_servicios),
  CONSTRAINT VinculoS_Servicio_fk FOREIGN KEY (idservicios) REFERENCES servicios (idservicios)
  );