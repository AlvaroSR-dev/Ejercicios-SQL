create database primitiva;
use primitiva;
create table pronostico (
id int auto_increment primary key,
numero int unsigned);


delimiter $$
create procedure combinacion_ganadora ()
begin
declare numero int;
declare contador int;
set contador = 1;
truncate table pronostico;
etiqueta1:loop
	
	if contador > 6 then
		leave etiqueta1;
	else
		set numero=round(rand()*49,0);
		insert into pronostico (numero) values (numero);
	end if;
	set contador = contador +1;
end loop;

end $$

call combinacion_ganadora();
select * from pronostico;