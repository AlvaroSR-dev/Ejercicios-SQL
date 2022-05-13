DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);

CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);

INSERT INTO fabricante VALUES(1, 'Asus');
INSERT INTO fabricante VALUES(2, 'Lenovo');
INSERT INTO fabricante VALUES(3, 'Hewlett-Packard');
INSERT INTO fabricante VALUES(4, 'Samsung');
INSERT INTO fabricante VALUES(5, 'Seagate');
INSERT INTO fabricante VALUES(6, 'Crucial');
INSERT INTO fabricante VALUES(7, 'Gigabyte');
INSERT INTO fabricante VALUES(8, 'Huawei');
INSERT INTO fabricante VALUES(9, 'Xiaomi');

INSERT INTO producto VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO producto VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO producto VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO producto VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO producto VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO producto VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO producto VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO producto VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO producto VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO producto VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO producto VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);

/* 1. Lista el nombre de todos los productos que hay en la tabla producto. */

select nombre from producto;

/* 2. Lista los nombres y los precios de todos los productos de la
tabla producto. */

select nombre, precio from producto;

/* 3. 3. Lista todas las columnas de la tabla producto. */

select * from producto;

/* 4. Lista el nombre de los productos, el precio en euros y el precio en
dólares estadounidenses (USD). */

select nombre, precio, (precio * 0.88) as dolares from producto;

/* 5. Lista los nombres y los precios de todos los productos de la
tabla producto, convirtiendo los nombres a mayúscula. */

select upper(nombre), precio from producto;

/* 6. Lista los nombres y los precios de todos los productos de la
tabla producto, convirtiendo los nombres a minúscula. */

select lower(nombre), precio from producto;

/* 7. Lista el nombre de todos los fabricantes en una columna, y en otra
columna obtenga en mayúsculas los dos primeros caracteres del
nombre del fabricante. */

select nombre, upper(left(nombre, 2)) as iniciales from fabricante;

/* 8. Lista los nombres y los precios de todos los productos de la
tabla producto, redondeando el valor del precio. */

select nombre, round(precio, 2) from producto;

/* 9. Lista los nombres y los precios de todos los productos de la
tabla producto, truncando el valor del precio para mostrarlo sin
ninguna cifra decimal. */

select nombre, truncate(precio,0) as precio from producto;

/* 10. Lista el código de los fabricantes que tienen productos en la
tabla producto. */

select codigo_fabricante from producto;

/* 11. Lista el código de los fabricantes que tienen productos en la
tabla producto, eliminando los códigos que aparecen repetidos. */

select codigo_fabricante from producto;

-- select upper(nombre), precio from producto
-- select lower(nombre), precio from producto
-- select nombre, upper(left(nombre,2)) as mayus from fabricante
-- select nombre, round(precio) from producto
-- select nombre, truncate(precio,0) from producto
-- select codigo from fabricante having (codigo) is not null
-- select codigo_fabricante from producto 
-- select distinct codigo_fabricante from producto 
-- select nombre from fabricante order by nombre
-- select nombre from fabricante order by nombre DESC
-- select nombre, precio from PRODUCTO order by nombre ASC, precio DESC
-- select * from fabricante limit 5
-- select * from fabricante limit 3,2
-- select nombre, precio from producto order by precio asc limit 1
-- select nombre, precio from producto order by precio desc limit 1
-- select nombre from producto where codigo_fabricante = 2
-- select nombre, precio from producto where precio <= 120
-- select nombre, precio from producto where precio >= 400
-- select nombre, precio from producto where precio <= 400
-- select nombre, precio from producto where precio > 80 and precio < 200;
-- select nombre, precio from producto where precio between 60 and 200
-- select nombre, precio from producto where precio > 200 and codigo_fabricante = 6
-- select nombre, precio, codigo_fabricante from producto where codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante = 5 
-- select nombre, precio, codigo_fabricante from producto where codigo_fabricante IN (1,3,5)
-- select nombre, (precio * 100) as centimos from producto
-- select nombre from fabricante where nombre like 's%'
-- select nombre from fabricante where nombre like '%e'
-- select nombre from fabricante where nombre like '%w%'
-- select nombre from fabricante where nombre like '____'
-- select nombre from producto where nombre like '%Portatíl%'
-- select nombre, precio from producto where nombre like '%Portatíl%' and precio > 215
-- select nombre, precio from producto where precio >= 180 order by precio desc, nombre asc

-- MULTITABLA

select producto.nombre, producto.precio, fabricante.nombre from producto, fabricante where producto.codigo_fabricante = fabricante.codigo;
select producto.nombre, producto.precio, fabricante.nombre from producto, fabricante where producto.codigo_fabricante = fabricante.codigo order by fabricante.nombre;
select producto.codigo, producto.nombre, fabricante.codigo, fabricante.nombre from producto, fabricante where producto.codigo_fabricante = fabricante.codigo;
select producto.nombre, max(producto.precio), fabricante.nombre from producto, fabricante where producto.codigo_fabricante = fabricante.codigo;
select * from producto where codigo_fabricante = 2;
select * from producto where codigo_fabricante = 6 and precio > 200;
select * from producto where codigo_fabricante = 1 or codigo_fabricante = 3 or codigo_fabricante = 5;
select * from producto where codigo_fabricante in (1,3,5);
select producto.nombre, producto.precio from producto, fabricante where producto.codigo_fabricante = fabricante.codigo and fabricante.nombre like "%e";
select producto.nombre, producto.precio from producto, fabricante where producto.codigo_fabricante = fabricante.codigo and fabricante.nombre like "%w%";
select prducto.nombre, producto.precio, producto.codigo_fabricante from producto where producto.precio >= 180;
