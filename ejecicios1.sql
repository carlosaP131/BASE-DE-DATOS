USE tienda;
-- 1 -- 
select distinct nombre from producto;
-- 2 --
select nombre , precio from producto;
-- 3-- 
select * from producto;
-- 4 -- 
select nombre , precio as precio_euros , format(precio*0.99,2) as precio_dolares_USD from producto;
-- 5 --
select nombre as 'nombre de productos',precio as precio_euros, cast(precio*0.99 as decimal(18,2))as dolares from producto;
-- 6 --
select upper(nombre) as 'nombre de productos',precio as precio_euros, cast(precio*0.99 as decimal(18,2))as dolares from producto;
-- 7 --
select lower(nombre) as 'nombre de productos',precio as precio_euros, cast(precio*0.99 as decimal(18,2))as dolares from producto;
-- 8 --
select nombre, substring(nombre,1,2) from fabricante;
-- 9 --
select nombre, round(precio) from producto;
-- 10 --
select nombre, truncate(precio) from producto;
-- 11 --
select codigo_fabricante from producto;
-- 12 --
select distinct  discodigo_fabricante from producto;
-- 13 --
select nombre from fabricante order by nombre;
-- 14 --
select nombre from fabricante order by nombre desc;
-- 15 --
select nombre from producto order by nombre asc , precio desc;
-- 16 --
select * from fabricante limit 5;
with 
	consulta as (select * , row_number() over (order by codigo)as num_linea from fabricante)
 select * from consulta where num_linea between 4 and 5 ;
-- 16 --
select nombre , precio from producto order by precio desc limit 1;
-- 17 --
select nombre from producto where precio<=400;

select nombre from producto where codigo_fabricante=1 or codigo_fabricante=3 or codigo_fabricante=5;
select nombre from fabricante where length(nombre)=4;
select nombre from fabricante where nombre like ('s%');
select nombre from producto where nombre like ('%portatil%');
select fabricante.codigo , fabricante.nombre from fabricante inner join  producto on fabricante.codigo =codigo_fabricante group by fabricante.codigo;
select fabricante.* from fabricante left join  producto on fabricante.codigo=codigo_fabricante where producto.codigo is null;
select fabricante.nombre , count(codigo_fabricante) from (select * from producto where precio>=200)as producto
right join fabricante on fabricante.codigo = codigo_fabricante group by fabricante.nombre , codigo_fabricante;

select fabricante.nombre , sum(precio) from producto inner join fabricante on fabricante.codigo = codigo_fabricante
 group by fabricante.nombre having sum(precio)>1000;
 
 select producto.nombre, precio , fabricante.nombre from 
 (select codigo_fabricante , producto.nombre, max(precio) as precio  from producto group by codigo_fabricante)as producto
 inner join fabricante on codigo_fabricante=fabricante.codigo group by producto.nombre,precio,fabricante.nombre;
select producto.nombre, precio , fabricante.nombre from producto
 right join  fabricante on codigo_fabricante=fabricante.codigo where producto.precio=(select max(precio) from producto
 where codigo_fabricante=fabricante.codigo) order by fabricante.nombre;
-- 1.1.7.2 
-- 1 Devuelve el producto más caro que existe en la tabla producto sin hacer uso de MAX, ORDER BY ni LIMIT.
SELECT * FROM producto a where a.precio >=all (select  b.precio from producto b);
-- 2 Devuelve el producto más barato que existe en la tabla producto sin hacer uso de MIN, ORDER BY ni LIMIT.
SELECT * FROM producto a where a.precio <=all (select  b.precio from producto b);
-- 3 Devuelve los nombres de los fabricantes que tienen productos asociados. (Utilizando ALL o ANY).
							 -- llave primaria           llave foranea 
SELECT nombre FROM fabricante where codigo =any (select  codigo_fabricante from producto);
-- 4 Devuelve los nombres de los fabricantes que no tienen productos asociados. (Utilizando ALL o ANY).
SELECT nombre FROM fabricante where codigo <> all (select  codigo_fabricante from producto);
-- 1.1.7.5
 --   Lista el nombre de cada fabricante con el nombre y el precio de su producto más caro.
select f.nombre , p.precio from fabricante as f , producto as p where  p.precio >=all (select  b.precio from producto b);
 --   Devuelve un listado de todos los productos que tienen un precio mayor o igual a la media de todos los productos de su mismo fabricante.
select nombre from  producto as p where  p.precio >=all (select  avg(b.precio) from producto b);
--    Lista el nombre del producto más caro del fabricante Lenovo.
select nombre  from producto as p where  p.precio >=all (select  b.precio from producto b where nombre='Lenovo')  ;

 
 
 
