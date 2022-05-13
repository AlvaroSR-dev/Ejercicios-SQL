create database libros_ventas;
use libros_ventas;

create table libros(
  codigo int auto_increment,
  titulo varchar(50),
  autor varchar(50),
  editorial varchar(30),
  precio float, 
  stock int,
  primary key (codigo)
 );

 create table ventas(
  numero int auto_increment,
  codigolibro int,
  precio float,
  cantidad int,
  primary key (numero)
 );

insert into libros(titulo, autor, editorial, precio, stock)
  values('Uno','Richard Bach','Planeta',15,100);   
 insert into libros(titulo, autor, editorial, precio, stock)
  values('Ilusiones','Richard Bach','Planeta',18,50);
 insert into libros(titulo, autor, editorial, precio, stock)
  values('El aleph','Borges','Emece',25,200);
 insert into libros(titulo, autor, editorial, precio, stock)
  values('Aprenda PHP','Mario Molina','Emece',45,200);