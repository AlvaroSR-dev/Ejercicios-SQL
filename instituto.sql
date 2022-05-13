DROP DATABASE IF EXISTS instituto;
CREATE DATABASE instituto CHARACTER SET utf8mb4;
USE instituto;

CREATE TABLE alumno (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  fecha_nacimiento DATE NOT NULL,
  es_repetidor ENUM('sí', 'no') NOT NULL,
  teléfono VARCHAR(9)
);

INSERT INTO alumno VALUES(1, 'María', 'Sánchez', 'Pérez', '1990/12/01', 'no', NULL);
INSERT INTO alumno VALUES(2, 'Juan', 'Sáez', 'Vega', '1998/04/02', 'no', 618253876);
INSERT INTO alumno VALUES(3, 'Pepe', 'Ramírez', 'Gea', '1988/01/03', 'no', NULL);
INSERT INTO alumno VALUES(4, 'Lucía', 'Sánchez', 'Ortega', '1993/06/13', 'sí', 678516294);
INSERT INTO alumno VALUES(5, 'Paco', 'Martínez', 'López', '1995/11/24', 'no', 692735409);
INSERT INTO alumno VALUES(6, 'Irene', 'Gutiérrez', 'Sánchez', '1991/03/28', 'sí', NULL);
INSERT INTO alumno VALUES(7, 'Cristina', 'Fernández', 'Ramírez', '1996/09/17', 'no', 628349590);
INSERT INTO alumno VALUES(8, 'Antonio', 'Carretero', 'Ortega', '1994/05/20', 'sí', 612345633);
INSERT INTO alumno VALUES(9, 'Manuel', 'Domínguez', 'Hernández', '1999/07/08', 'no', NULL);
INSERT INTO alumno VALUES(10, 'Daniel', 'Moreno', 'Ruiz', '1998/02/03', 'no', NULL);

/** select * from alumno;
select id,nombre,apellido1 from alumno;

select upper(nombre) as Nombre_Mayusculas from alumno;

select nombre, substring(nombre,2) as final_nombre from alumno;

select id, now() as hora_actual from alumno;

select nombre,right(nombre,3) from alumno;
select nombre, left(nombre,2) as principio_nombre from alumno; **/

select * from alumno where id = 1;
select * from alumno where teléfono = 692735409;
select * from alumno where es_repetidor = 1;
select * from alumno where es_repetidor = 2;
select * from alumno where fecha_nacimiento < "1993/01/01";
select * from alumno where fecha_nacimiento > "1994/01/01" && es_repetidor = 2;
select * from alumno where fecha_nacimiento between "1997/12/31" and "1999/01/01";
select * from alumno where fecha_nacimiento not between "1997/12/31" and "1999/01/01";

/* Ejercicios funciones 3 */

/* Ejercicio 1 */

select fecha_nacimiento, day(fecha_nacimiento), month(fecha_nacimiento), year(fecha_nacimiento) from alumno;

/* Ejercicio 2 */

select fecha_nacimiento, dayname(fecha_nacimiento), monthname(fecha_nacimiento) from alumno;

/* Ejercicio 3 */

select fecha_nacimiento, datediff(curdate(), fecha_nacimiento) from alumno;

/* Ejercicio 4 */

select fecha_nacimiento, round(datediff(curdate(), fecha_nacimiento) / 365.25) from alumno;