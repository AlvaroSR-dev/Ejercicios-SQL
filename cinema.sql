CREATE database cinema;
USE cinema;
DROP TABLE if exists peliculas;

-- Creamos la tabla peliculas

CREATE TABLE peliculas(
	codigo int NOT NULL primary key,
	nombre VARCHAR(40) NOT NULL,
	director VARCHAR(30) DEFAULT 'Desconocido',
	fecha_lanzamiento DATE,
	genero VARCHAR(20),
	recaudo int
	
);
INSERT INTO peliculas VALUES(1, 'Los juegos del Hambre', DEFAULT, '2014/08/01', 'Ciencia ficción', 1200000);
INSERT INTO peliculas VALUES(2, 'Harry Potter y el Cáliz de Fuego', DEFAULT, '2016/07/01', 'Ciencia ficción', 6005400);
INSERT INTO peliculas VALUES(3, 'Las Crónicas de Narnia', DEFAULT, '2015/08/01', 'Ciencia ficción', 56000900);
INSERT INTO peliculas VALUES(4, 'La lista de Schindler', 'Steven Spielberg', '2014/08/02', 'Drama', 4500120);
INSERT INTO peliculas VALUES(5, 'La Pasión  de Cristo', 'Steven Spielberg', '2011/05/01', 'Drama', 4560120);
INSERT INTO peliculas VALUES(6, 'Otra de Spielberg', 'Steven Spielberg', '2014/08/01', 'Drama', 4560120);
INSERT INTO peliculas VALUES(7, 'La vida es bella', 'Roberto Benigni', '2014/08/01', 'Drama', 12560000);
INSERT INTO peliculas VALUES(8, 'Las posibles vidas de Mr. Nobody', 'Jaco Van Dormael', '2014/08/01', 'Ciencia ficción', 3400093);
INSERT INTO peliculas VALUES(10, 'Buscando a Nemo', 'Andrew Stanton', '2014/08/01', 'Infantil', 7800400);
INSERT INTO peliculas VALUES(11, 'Toy Story', 'Andrew Stanton', '2014/08/09', 'Infantil', 6790000);
INSERT INTO peliculas VALUES(12, 'Toy Story 2', 'Andrew Stanton', '2014/08/21', 'Infantil', 55003030);
INSERT INTO peliculas VALUES(14, 'Toy Story 3', 'Andrew Stanton', '2014/08/07', 'Infantil', 8807000);
INSERT INTO peliculas VALUES(15, 'Cars', 'Andrew Stanton', '2014/08/01', 'Infantil', 459000200);
INSERT INTO peliculas VALUES(16, 'El viaje de Chihro', 'Hayao Miyazaki', '2014/08/01', 'Infantil', 456000);
INSERT INTO peliculas VALUES(17, 'Mi vecino Totoro', 'Hayao Miyazaki', '2010/07/11', 'Infantil', 55003210);
INSERT INTO peliculas VALUES(18, 'El viento se levanta', 'Hayao Miyazaki', '2014/08/11', 'Infantil', 9976000);
INSERT INTO peliculas VALUES(19, 'Nausica del valle del viento', 'Hayao Miyazaki', '2014/01/31', 'Infantil', 6690000);

select * from peliculas;

/* 1. Listar el nombre de las películas que tengan más de 12 caracteres.
2. Listar los géneros de películas y su recaudación total.
3. Listar los géneros de películas donde la suma de lo recaudado de sus películas sea
superior a la media de recaudación.
4. Listar los géneros de películas que hayan recaudado más de 66606393
5. Listar el nombre de la película con mayor recaudación.
6. Listar el nombre del actor y el número de películas de todos aquellos que han hecho
más de 75. */

select nombre from peliculas group by nombre having char_length(nombre) > 12;

select genero, recaudo from peliculas group by genero;

select genero, sum(recaudo) from peliculas where recaudo > (select avg(recaudo) from peliculas) group by genero;

select nombre from peliculas where recaudo > 66606393;

select nombre from peliculas where recaudo = (select max(recaudo) from peliculas);

select director from peliculas group by direcor having count(nombre) > 75;