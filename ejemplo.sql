use tiendaHard;

with 

	consulta1 as (Select productos.nombre,fabricante.nombre as nombre_fabricante,precio from productos inner join fabricante on id_fabricante=fabricante.id )
select nombre_fabricante from consulta1 where precio BETWEEN 900 AND 1000 ;
/*select * from tiendaHard.productos;