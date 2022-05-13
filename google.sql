DROP DATABASE IF EXISTS google;
CREATE DATABASE google CHARACTER SET utf8mb4;
USE google;

CREATE TABLE resultado (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  descripcion VARCHAR(200) NOT NULL,
  url VARCHAR(512) NOT NULL
);

INSERT INTO resultado VALUES (1, 'Resultado 1', 'Descripción 1', 'http://....');
INSERT INTO resultado VALUES (2, 'Resultado 2', 'Descripción 2', 'http://....');
INSERT INTO resultado VALUES (3, 'Resultado 3', 'Descripción 3', 'http://....');
INSERT INTO resultado VALUES (4, 'Resultado 4', 'Descripción 4', 'http://....');
INSERT INTO resultado VALUES (5, 'Resultado 5', 'Descripción 5', 'http://....');
INSERT INTO resultado VALUES (6, 'Resultado 6', 'Descripción 6', 'http://....');
INSERT INTO resultado VALUES (7, 'Resultado 7', 'Descripción 7', 'http://....');
INSERT INTO resultado VALUES (8, 'Resultado 8', 'Descripción 8', 'http://....');
INSERT INTO resultado VALUES (9, 'Resultado 9', 'Descripción 9', 'http://....');
INSERT INTO resultado VALUES (10, 'Resultado 10', 'Descripción 10', 'http://....');
INSERT INTO resultado VALUES (11, 'Resultado 11', 'Descripción 11', 'http://....');
INSERT INTO resultado VALUES (12, 'Resultado 12', 'Descripción 12', 'http://....');
INSERT INTO resultado VALUES (13, 'Resultado 13', 'Descripción 13', 'http://....');
INSERT INTO resultado VALUES (14, 'Resultado 14', 'Descripción 14', 'http://....');
INSERT INTO resultado VALUES (15, 'Resultado 15', 'Descripción 15', 'http://....');

/* crear tabla personas */

drop table if exists personas;
create table if not exists personas (
id int unsigned auto_increment primary key,
foreign key (id) references resultado(id),
nombre varchar(100) not null,
apellido varchar(100) not null,
edad int
);

/* consultar 5 primeros resultados */

select * from resultado where id <= 5;

/* consultar 5 resultados intermedios */

select * from resultado where id > 5 && id <= 10;

/* consultar 5 primeros resultados */

select * from resultado where id > 10;