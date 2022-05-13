-- 1. Escribe un procedimiento que no tenga ningún parámetro de entrada ni de salida y que muestre el texto ¡Hola mundo!.

delimiter $$
create procedure hola_mundo()

begin
select "hola mundo";
end
$$

delimiter ;

call hola_mundo();

-- Con funcion

delimiter $$
create function saludo ()
returns varchar(40)
begin 
declare saludar varchar(40);
set saludar = 'Hola mundodo';
return saludar;

end $$

-- 2. Escribe un procedimiento que reciba un número real de entrada y
-- muestre un mensaje indicando si el número es positivo, negativo o cero.

drop function tipo_numero;

SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER $$

CREATE FUNCTION tipo_numero(

valor int)

RETURNS varchar(20)

BEGIN

DECLARE tipo varchar(20);

IF valor>0 THEN

SET tipo = "positivo";

RETURN tipo;

ELSE

SET tipo = "negativo";

RETURN tipo;

END IF;

END $$

delimiter ;

SELECT tipo_numero(8);

/* 3. Escribe un procedimiento que reciba como parámetro de entrada un
valor numérico que represente un día de la semana y que devuelva una
cadena de caracteres con el nombre del día de la semana
correspondiente. Por ejemplo, para el valor de entrada 1 debería
devolver la cadena lunes. */

DELIMITER $$

CREATE PROCEDURE semana(IN num INT, OUT dia
varchar(20))

BEGIN

IF num=1 THEN

SET dia = "Lunes";

ELSEIF num=2 THEN

SET dia = "Martes";

ELSEIF num=3 THEN

SET dia = "Miércoles";

ELSEIF num=4 THEN

SET dia = "Jueves";

ELSEIF num=5 THEN

SET dia = "Viernes";

ELSEIF num=6 THEN

SET dia = "Sábado";

ELSEIF num=7 THEN

SET dia = "Domingo";

else

set dia = "No existe";

END IF;

END $$

DELIMITER ;

CALL semana(5, @resultado);

 
