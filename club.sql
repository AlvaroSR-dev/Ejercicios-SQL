create database club2;
use club2;

 drop table if exists inscriptos;
 drop table if exists socios;
 drop table if exists profesores; 
 drop table if exists cursos;

 create table socios(
  documento char(8) not null,
  nombre varchar(40),
  domicilio varchar(30),
  primary key (documento)
 );

 create table profesores(
  documento char(8) not null,
  nombre varchar(40),
  domicilio varchar(30),
  primary key (documento)
 );

 create table cursos(
  numero integer auto_increment,
  deporte varchar(20),
  dia varchar(15),
  documentoprofesor char(8),
  primary key (numero)
 );

 create table inscritos(
  documentosocio char(8) not null,
  numero integer not null,
  matricula char(1),
  primary key (documentosocio,numero)
 );



 insert into socios values('30000000','Fabian Fuentes','Caseros 987');
 insert into socios values('31111111','Gaston Garcia','Guemes 65');
 insert into socios values('32222222','Hector Huerta','Sucre 534');
 insert into socios values('33333333','Ines Irala','Bulnes 345');

 insert into profesores values('22222222','Ana Acosta','Avellaneda 231');
 insert into profesores values('23333333','Carlos Caseres','Colon 245');
 insert into profesores values('24444444','Daniel Duarte','Sarmiento 987');
 insert into profesores values('25555555','Esteban Lopez','Sucre 1204');

 insert into cursos(deporte,dia,documentoprofesor) 
  values('tenis','lunes','22222222');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('tenis','martes','22222222');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('natacion','miercoles','22222222');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('natacion','jueves','23333333');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('natacion','viernes','23333333');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('futbol','sabado','24444444');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('futbol','lunes','24444444');
 insert into cursos(deporte,dia,documentoprofesor) 
  values('basquet','martes','24444444');

 insert into inscritos values('30000000',1,'s');
 insert into inscritos values('30000000',3,'n');
 insert into inscritos values('30000000',6,null);
 insert into inscritos values('31111111',1,'s');
 insert into inscritos values('31111111',4,'s');
 insert into inscritos values('32222222',8,'s');
 
 -- 1. Elimine la vista &quot;vista_club&quot; si existe:

drop view if exists vista_club;

-- 2. Cree una vista en la que aparezca el nombre y documento del socio, el deporte, el día y el nombre
-- del profesor (no mostrar datos de los socios que no están inscriptos en deportes)

CREATE OR REPLACE VIEW nombre_y_documento AS

SELECT pedido.codigo_pedido, pedido.fecha_pedido, cliente.nombre_cliente,
SUM(detalle_pedido.cantidad * detalle_pedido.precio_unidad) AS total

FROM

cliente INNER JOIN pedido

ON cliente.codigo_cliente = pedido.codigo_cliente

INNER JOIN detalle_pedido

ON pedido.codigo_pedido = detalle_pedido.codigo_pedido

GROUP BY pedido.codigo_pedido

-- 3. Muestre la información contenida en la vista.

-- 4. Realice una consulta a la vista donde muestre la cantidad de socios inscritos en cada deporte ordenados por cantidad.

-- 5. Muestre (consultando la vista) el nombre y documento de los socios que deben matrículas.

-- 6. Consulte la vista y muestre los nombres de los profesores y los días en que asisten al club para dictar sus clases.

-- 7. Muestre todos los socios que son compañeros en tenis los lunes.

-- 8. Cree una nueva vista llamada &#39;vista_inscritos&#39; que muestre la cantidad de
-- inscriptos por curso, incluyendo el nombre del deporte y el día. Elimine la vista
-- previamente si ya existe.

-- 9. Consulte la vista &#39;vista_inscritos&#39;: