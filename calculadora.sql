create database calculator;
use calculator;
create table calculadora(
id int auto_increment primary key,
resultado decimal (7,2),
operacion varchar (20),
fecha datetime 
);


delimiter $$
create procedure calculadora (in num1 int,in num2 int,in operacion varchar(20))
begin
declare resultado decimal (7,2);
declare registros int;


set registros =(select count(id) from calculadora);

	if operacion = 'Suma' then
		set resultado = num1 +num2;
	elseif operacion = 'Resta' then
		set resultado = num1 - num2;
	elseif operacion = 'Multiplicacion' then
		set resultado = num1 * num2;
	elseif operacion = 'Division' then
		set resultado = num1 / num2;
	else
		set resultado = null;
		set operacion = "Error";
        select "No existe esa operaciรณn!!!";

	end if;
	insert into calculadora (resultado,operacion,fecha) values (resultado,operacion,now());

DELIMITER $$

CREATE FUNCTION limpiar_datos(id int) RETURNS INT

BEGIN -- Paso 1. Declaramos una variable local

DECLARE nregistros INT UNSIGNED;

-- Paso 2. Contamos los productos

SET nregistros = (

SELECT COUNT(id)

FROM calculadora);

-- Paso 3. Devolvemos el resultado
if registros <= 5 then
RETURN total;
truncate table calculadora;
	SELECT 'La tabla ya tiene cinco registros, los borramos!';
end if;
END

$$

DELIMITER ;

SELECT contar_productos('Herramientas');
end $$
delimiter ;

call calculadora (3,5,'Suma');