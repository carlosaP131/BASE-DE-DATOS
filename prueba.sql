drop database Prueba;
create database Prueba;
use Prueba;
create table punto(
id_punto int auto_increment primary key,
punto INT NOT NULL

);
select * from punto;
use Prueba;
DELIMITER //
drop procedure IF EXISTS spInsertarRegistro;
create procedure spInsertarRegistro(in _punto int , out _textosalida varchar (100))
begin 
		if _punto is null then 
		select "punto es nulo" into _textosalida; 
        elseif _punto < 0 then 
        select "puntos es negativo" into _textosalida;
        else 
		insert INTO punto(punto) values(_punto);
		select "registro guardado existosamente" into _textosalida;
        end if;
end//
delimiter ;