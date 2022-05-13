create database biblio;
use biblio;

create table socios(
  documento char(8),
  nombre varchar(30),
  domicilio varchar(30),
  primary key(documento)
 );
   
 create table morosos(
  documento char(8),
  fecha date
 );


 insert into socios values(234,'Juan Lopez','Colon 345');
 insert into socios values(345,'Ana Ferrero','Caseros 98');
 insert into socios values(456,'Juan Perez','Urquiza 356');
 insert into socios values(567,'Karina Torres','Peru 743');
 insert into socios values(678,'Juan Lopez','Avellaneda 234');
 insert into socios values(789,'Laura Juarez','Sarmiento 765');

 insert into morosos values(345,'2016-08-10');
 insert into morosos values(567,'2016-09-24');
 insert into morosos values(789,'2016-10-06');
 
 select * from socios;
 
 delete socios FROM socios INNER JOIN morosos ON socios.documento = morosos.documento;