create database club;
use club;

create table socios(
  documento varchar(8) not null,
  nombre varchar(30) not null,
  primary key(documento)
 );

 create table deportes(
  codigo int unsigned auto_increment,
  nombre varchar(30),
  primary key(codigo)
 );

 create table inscritos(
  documento varchar(8) not null,
  codigodeporte int unsigned,
  año year not null,
  cuota char(1), /*'s' o 'n', si esta paga o no*/
  primary key(documento,codigodeporte,año)
 );


 insert into socios values('22333444','Juan Perez');
 insert into socios values('23333444','Ana Garcia');
 insert into socios values('24333444','Hector Fuentes');
 insert into socios values('25333444','Marta Molina');

 insert into deportes (nombre) values('tenis');
 insert into deportes (nombre) values('natacion');
 insert into deportes (nombre) values('basquet');
 insert into deportes (nombre) values('voley');

 insert into inscritos values('22333444',1,'2015','s');
 insert into inscritos values('22333444',1,'2016','s');
 insert into inscritos values('22333444',2,'2015','s');
 insert into inscritos values('24333444',1,'2015','s');
 insert into inscritos values('24333444',2,'2016','s');
 insert into inscritos values('25333444',1,'2015','s');
 insert into inscritos values('25333444',1,'2016','s');
 insert into inscritos values('25333444',3,'2016','s');
 
 -- 1- El club desea saber cuántos socios se han inscrito en cada deporte cada año, considerando sólo los deportes que tienen inscripciones.

select deportes.nombre, count(*) as inscrito , inscritos.año as anio  from socios inner join inscritos on socios.documento = inscritos.documento inner join deportes on inscritos.codigodeporte = deportes.codigo group by deportes.nombre, inscritos.año;

-- 2. Cree la tabla utilizando la sentencia del punto anterior:

create table registro;
select deportes.nombre, count(*) as inscrito , inscritos.año as anio  from socios inner join inscritos on socios.documento = inscritos.documento inner join deportes on inscritos.codigodeporte = deportes.codigo group by deportes.nombre, inscritos.año;

-- 3. Muestre todos los registros de la nueva tabla.

select * from registro;

-- 4. El club desea saber cuántas veces se ha inscrito un socio en algún deporte.

select socios.documento, count(inscritos.año) as veces_inscrito from inscritos inner join socios on inscritos.documento = socios.documento group by socios.documento;

-- 5. Guarde la información del punto 4 en una tabla.

create table veces_incrito_socio;
select socios.documento, count(inscritos.año) as veces_inscrito from inscritos inner join socios on inscritos.documento = socios.documento group by socios.documento;