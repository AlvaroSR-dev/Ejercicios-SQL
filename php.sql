create database php;
use php;
create table productos(
	id int auto_increment primary key,
    nombre varchar(40),
    precio decimal (7,2)
);

select * from productos;

