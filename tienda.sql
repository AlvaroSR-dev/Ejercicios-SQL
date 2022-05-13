DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;

CREATE TABLE ventas (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  cantidad_comprada INT UNSIGNED NOT NULL,
  precio_por_elemento DECIMAL(7,2) NOT NULL 
);

INSERT INTO ventas VALUES (1, 2, 1.50);
INSERT INTO ventas VALUES (2, 5, 1.75);
INSERT INTO ventas VALUES (3, 7, 2.00);
INSERT INTO ventas VALUES (4, 9, 3.50);
INSERT INTO ventas VALUES (5, 6, 9.99);

select id, round(precio_por_elemento) as numero_redondeado from ventas;

/* Ejercicios 19/01/2022 */

 select nombre from producto;
 select nombre, precio from producto;
 select * from producto;
 select nombre, precio, truncate((precio * 1.20),0) as dolar from producto;