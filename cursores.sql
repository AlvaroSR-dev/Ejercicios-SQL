# Creación BBDD y tabla
create database test;
use test;

create table nombres (
id int AUTO_INCREMENT primary key,
nombre varchar(100),
apellido1 varchar(100),
apellido2 varchar(100),
fecha_nacimiento date
);

select * from nombres;

# Insertar datos

insert into nombres (nombre, apellido1, apellido2, fecha_nacimiento) values ("Álvaro", "Sánchez", "Ruiz", "2002-12-06");
insert into nombres (nombre, apellido1, apellido2, fecha_nacimiento) values ("Jorge", "González", "Pérez", "2003-05-06");
insert into nombres (nombre, apellido1, apellido2, fecha_nacimiento) values ("Fernando", "de la Fuente", "Gómez", "2002-03-17");
insert into nombres (nombre, apellido1, apellido2, fecha_nacimiento) values ("Luis Miguel", "Pérez", "Hita", "2002-09-06");

# Añadir columna edad

ALTER TABLE nombres ADD edad int;

# Función calcular edad

-- SET GLOBAL log_bin_trust_function_creators = 1; EJECUTAR SI FALLA LA FUNCION

DELIMITER $$

CREATE FUNCTION calcular_edad(fecha date) RETURNS INT

BEGIN
declare edad int;

set edad=(
 TIMESTAMPDIFF(YEAR,fecha,now())
);
RETURN edad;

END

$$

DELIMITER ;

SELECT calcular_edad('2002-12-06');

# Procedimiento añadir edad a la tabla

DELIMITER $$

CREATE PROCEDURE actualizar_columna_edad()
BEGIN



SELECT calcular_edad(fecha);

END

$$