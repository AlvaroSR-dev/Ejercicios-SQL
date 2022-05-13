/* Creación de la BBDD */

DROP DATABASE IF EXISTS practica2ev;
CREATE DATABASE practica2ev CHARACTER SET utf8mb4;
USE practica2ev;

/* Creación de las tablas */

CREATE TABLE tEQUIPO (
  pknCodigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  cDescripcion ENUM('BUENO','BONITO','BATARO') NOT NULL,
  nPrecio INT NOT NULL CHECK(nPrecio > 0),
  nStock INT NOT NULL
);

CREATE TABLE tCONSTA (
  FOREIGN KEY (fknCodigo_equipo) REFERENCES tEQUIPO(pknCodigo) ON UPDATE CASCADE,
  FOREIGN KEY (fknCodigo_componente) REFERENCES tCOMPONENTE(pknCodigo) ON UPDATE CASCADE,
  nCantidad INT NOT NULL
);

CREATE TABLE tCOMPONENTE (
  pknCodigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  cDescripcion VARCHAR(100) NOT NULL,
  nPrecio INT NOT NULL CHECK(nPrecio > 0),
  nStock INT NOT NULL
);

CREATE TABLE tCOMPRA_EQUIPOS (
  pknId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  FOREIGN KEY (fknCodigo_equipo) REFERENCES tEQUIPO(pknCodigo) ON UPDATE CASCADE,
  FOREIGN KEY (fknId_cliente) REFERENCES tCLIENTE(pknId) ON UPDATE CASCADE,
  FOREIGN KEY (fknId_empleado) REFERENCES tEMPLEADO(pknId) ON UPDATE CASCADE,
  dFecha DATE NOT NULL DEFAULT '09/01/1999',
  cCantidad INT NOT NULL
);

CREATE TABLE tCLIENTE (
	pknId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cNif VARCHAR(20) NOT NULL,
    cNombre VARCHAR(100) NOT NULL,
    cApellido1 VARCHAR(100) NOT NULL,
    cApellido2 VARCHAR(100) NOT NULL,
    nTelefono INT(9) NOT NULL CHECK(nTelefono<1000000000 && nTelefono > 600000000),
    cDomicilio VARCHAR(100) NOT NULL,
    cCiudad VARCHAR(100) NOT NULL,
    cProvincia VARCHAR(100)
);

CREATE TABLE tCOMPRA_COMPONENTES (
	pknId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (fknCodigo_componente) REFERENCES tCOMPONENTE(pknCodigo) ON UPDATE CASCADE,
    FOREIGN KEY (fknId_cliente) REFERENCES tCLIENTE(pknId) ON UPDATE CASCADE,
    FOREIGN KEY (fknId_empleado) REFERENCES tEMPLEADO(pknId) ON UPDATE CASCADE,
    dFecha DATE NOT NULL DEFAULT '09/01/1999',
    cCantidad INT NOT NULL
);

CREATE TABLE tEMPLEADO (
	pknId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    FOREIGN KEY (fknId_seccion) REFERENCES tSECCION(pknId) ON UPDATE CASCADE,
    cNif VARCHAR(100) NOT NULL,
    cNombre VARCHAR(100) NOT NULL,
    cApellido1 VARCHAR(100) NOT NULL,
    cApellido2 VARCHAR(100) NOT NULL
);

CREATE TABLE tSECCION (
	pknId INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cNombre VARCHAR(100) NOT NULL
);

/* Consultas */

/* Insertar 2 EQUIPOS */

INSERT INTO tEQUIPO VALUES (1, 10, 20);
INSERT INTO tEQUIPO VALUES (3, 12, 15);

/* Insertar 2 Empleados */

INSERT INTO tEMPLEADO VALUES ("123456789M", "Marcos", "Martinez", "Sol");
INSERT INTO tEMPLEADO VALUES ("098643122J", "Paula", "Perez", "Puertas");

/* Insertar 2 Clientes */

INSERT INTO tCLIENTE VALUES ("12365346W", "Pablo", "Aguado", "Paredes", 609123876, "Calle las Fuentes 32", "Móstoles", "Madrid");
INSERT INTO tCLIENTE VALUES ("54684634H", "Lucía", "Martínez", "Pérez", 722569874, "Calle Arboleda 87", "Alcorcón", "Madrid");

/* Insertar 2 Componentes */

INSERT INTO tCOMPONENTE VALUES ("Madera", 10, 20);
INSERT INTO tCOMPONENTE VALUES ("Cemento", 16, 30);

/* Insertar 2 Secciones */

INSERT INTO tSECCION VALUES ("Entrada");
INSERT INTO tSECCION VALUES ("Salida");

/* Modificar el campo nombre del empleado para que pueda tener 30 caracteres más. */

ALTER TABLE tEMPLEADO MODIFY  cNombre VARCHAR(130) NOT NULL;

/* Cambiar el nombre de la tabla cliente a “comprador”. */

RENAME TABLE tCLIENTE TO tCOMPRADOR;

/* Borrar el campo provincia en la tabla cliente. */

ALTER TABLE tCLIENTE DROP cProvincia;


