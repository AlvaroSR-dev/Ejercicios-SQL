/*
1. Consulte cuáles son los índices que hay en la
tabla producto utilizando las instrucciones SQL que nos permiten
obtener esta información de la tabla.
*/

show index from producto;

/*
2. Haga uso de EXPLAIN para obtener información sobre cómo se están
realizando las consultas y diga cuál de las dos consultas realizará
menos comparaciones para encontrar el producto que estamos
buscando.
*/

explain SELECT * FROM producto WHERE codigo_producto = 'OR-114'; -- Más óptima, consulta menos filas
explain SELECT * FROM producto WHERE nombre = 'Evonimus Pulchellus';

/*
3. Suponga que estamos trabajando con la base de datos jardineria y
queremos saber optimizar las siguientes consultas. ¿Cuál de las
dos sería más eficiente?. Se recomienda hacer uso de EXPLAIN para
obtener información sobre cómo se están realizando las consultas.
*/

explain SELECT AVG(total) FROM pago WHERE YEAR(fecha_pago) = 2008;
explain SELECT AVG(total) FROM pago WHERE fecha_pago >= '2008-01-01' AND fecha_pago <= '2008-12-31'; -- Utiliza 11.11%, es más óptima

/*
6. Crea un índice de tipo FULLTEXT sobre las
columnas nombre y descripcion de la tabla producto.
*/

create fulltext index indicefulltext on producto(nombre,descripcion);

/*

*/