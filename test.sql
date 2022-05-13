/*
1.	Crea una base de datos llamada test que contenga una tabla llamada alumnos con las siguientes columnas.
Tabla alumnos:
•	id 
•	nombre (cadena de caracteres)
•	apellido1 (cadena de caracteres)
•	apellido2 (cadena de caracteres)
•	email (cadena de caracteres)
*/
create database test;
use test;
create table alumnos(
id int auto_increment primary key,
nombre varchar (30),
apellido1 varchar (30),
apellido2 varchar (30),
email varchar (30)
);
/*
Escriba un procedimiento llamado crear_email que dados los parámetros de entrada: nombre, apellido1, apellido2 y dominio, cree una dirección de email y la devuelva como salida.
•	Procedimiento: crear_email
•	Entrada:
o	nombre (cadena de caracteres)
o	apellido1 (cadena de caracteres)
o	apellido2 (cadena de caracteres)
o	dominio (cadena de caracteres)
•	Salida:
o	email (cadena de caracteres)
devuelva una dirección de correo electrónico con el siguiente formato:
•	El primer carácter del parámetro nombre.
•	Los tres primeros caracteres del parámetro apellido1.
•	Los tres primeros caracteres del parámetro apellido2.
•	El carácter @.
•	El dominio pasado como parámetro.

*/
delimiter $$
create procedure crear_email(in nombre varchar (30),in apellido1 varchar (30),
in apellido2 varchar (30),in dominio varchar(30),out email varchar(30))
begin
set email = concat(left(nombre,1),left(apellido1,3),left(apellido2,3),'@',dominio);

end $$

/*
Una vez creada la tabla escriba un trigger con las siguientes características:
•	Trigger: trigger_crear_email_before_insert
o	Se ejecuta sobre la tabla alumnos.
o	Se ejecuta antes de una operación de inserción.
o	Si el nuevo valor del email que se quiere insertar es NULL, entonces se le creará automáticamente 
una dirección de email y se insertará en la tabla.
o	Si el nuevo valor del email no es NULL se guardará en la tabla el valor del email.
Nota: Para crear la nueva dirección de email se deberá hacer uso del procedimiento crear_email.

*/
DELIMITER $$
create trigger trigger_crear_email_before_insert
BEFORE INSERT
ON ALUMNOS FOR EACH ROW
BEGIN

IF new.email is null then
	call crear_email(new.nombre, new.apellido1, new.apellido2, 'gmail', @email);
    set new.email = @email;


END IF;

END $$

insert into alumnos (nombre,apellido1,apellido2,email)values ('luis','olmo','garcia','info@gmail.com');

insert into alumnos (nombre,apellido1,apellido2,email)values ('luisa','jimenez','jimenez',null);


select * from alumnos;

-- ejercicio 2

/*
2.	Modifica el ejercicio anterior y añade un nuevo trigger con las siguientes características:
Trigger: trigger_guardar_email_after_update:
•	Se ejecuta sobre la tabla alumnos.
•	Se ejecuta después de una operación de actualización.
•	Cada vez que un alumno modifique su dirección de email se deberá insertar un nuevo registro en 
una tabla llamada log_cambios_email.
La tabla log_cambios_email contiene los siguientes campos:
•	id: clave primaria (entero autonumérico)
•	id_alumno: id del alumno (entero)
•	fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
•	old_email: valor anterior del email (cadena de caracteres)
•	new_email: nuevo valor con el que se ha actualizado

*/
CREATE TABLE log_cambios_email(
id int auto_increment primary key,
id_alumno int unsigned,
fecha_hora datetime,
old_email varchar(30),
new_email varchar (30),
foreign key(id_alumno) references alumnos(id)
);

DELIMITER $$
create trigger trigger_guardar_email_after_update
AFTER UPDATE
ON ALUMNOS FOR EACH ROW
BEGIN
IF old.email not <> new.email THEN
	insert into log_cambios_email (id_alumno,fecha_hora,old_email,new_email) values (old.id,now(),old.email,new.email);
END IF;
END $$

UPDATE alumnos set email = 'nuevomail@gmail.com' where id= 3;
select * from alumnos
select * from log_cambios_email

-- ejercicio 3

/*
3.	Modifica el ejercicio anterior y añade un nuevo trigger que tenga las siguientes características:
Trigger: trigger_guardar_alumnos_eliminados:
•	Se ejecuta sobre la tabla alumnos.
•	Se ejecuta después de una operación de borrado.
•	Cada vez que se elimine un alumno de la tabla alumnos se deberá insertar un nuevo registro en una tabla llamada log_alumnos_eliminados.
La tabla log_alumnos_eliminados contiene los siguientes campos:
•	id: clave primaria (entero autonumérico)
•	id_alumno: id del alumno (entero)
•	fecha_hora: marca de tiempo con el instante del cambio (fecha y hora)
•	nombre: nombre del alumno eliminado (cadena de caracteres)
•	apellido1: primer apellido del alumno eliminado (cadena de caracteres)
•	apellido2: segundo apellido del alumno eliminado (cadena de caracteres)
•	email: email del alumno eliminado (cadena de caracteres)

*/
CREATE TABLE log_alumnos_eliminados(
id int auto_increment primary key,
id_alumno int unsigned,
fecha_hora datetime,
nombre varchar(30),
apellido1 varchar(30),
apellido2 varchar (30),
email varchar (30),
foreign key(id_alumno) references alumnos(id)
);

DELIMITER $$
create trigger trigger_log_alumnos_eliminados
AFTER DELETE
ON ALUMNOS FOR EACH ROW
BEGIN
INSERT INTO log_alumnos_eliminados (id_alumno,fecha_hora,nombre,apellido1,apellido2,email)
 values (old.id,now(),old.nombre,old.apellido1,old.apellido2,old.email);
END $$
 
 SET FOREIGN_KEY_CHECKS = 0;
delete from alumnos where id=3;

select * from alumnos;
select * from log_alumnos_eliminados;