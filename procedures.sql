use tienda 
DELIMITER $$
drop procedure if exists Listar_producto$$
CREATE PROCEDURE listar_producto(in codigo_fabricante int)
begin 
select *
from producto 
where producto.codigo_fabricante=codigo_fabricante;
end
$$
DELIMITER ;
CALL listar_producto('2');
select * from producto;

delimiter $$
drop procedure if exists contar_productos$$
create procedure contar_productos(in codigo_fab int , out total int unsigned)
begin 
	set total=(
	select count(*) 
	from producto
	where producto.codigo_fabricante = codigo_fab);
end 
$$


delimiter ;
call contar_productos('2',@total);
select @total;
delimiter $$
drop procedure if exists contar_productos$$
create procedure contar_productos2(in codigo_fab int , out total int unsigned)
begin 
	
	select count(*) 
    into total
	from producto
	where producto.codigo_fabricante = codigo_fab;
end 
$$


delimiter $$
drop procedure if exists calcular_max_min_media$$
create procedure calcular_max_min_media(
in codigo_fab int,
out maximo decimal(15,2),
out minimo decimal(15,2),
out media decimal(15,2)
)begin 
select 
max(precio),
min(precio),
avg(precio)
from producto
where producto.codigo_fabricante=codigo_fab
into maximo,minimo,media;
end
$$
delimiter ;
call calcular_max_min_media('1',@maximo,@minimo,@media);
select @maximo,@minimo,@media;