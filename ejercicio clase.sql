DROP DATABASE IF EXISTS ventas;
CREATE DATABASE ventas CHARACTER SET utf8mb4;
USE ventas;

CREATE TABLE cliente (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  ciudad VARCHAR(100),
  categoría INT UNSIGNED
);

CREATE TABLE comercial (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  apellido1 VARCHAR(100) NOT NULL,
  apellido2 VARCHAR(100),
  comisión FLOAT
);

CREATE TABLE pedido (
  id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  total DOUBLE NOT NULL,
  fecha DATE,
  id_cliente INT UNSIGNED NOT NULL,
  id_comercial INT UNSIGNED NOT NULL,
  FOREIGN KEY (id_cliente) REFERENCES cliente(id),
  FOREIGN KEY (id_comercial) REFERENCES comercial(id)
);

INSERT INTO cliente VALUES(1, 'Aarón', 'Rivero', 'Gómez', 'Almería', 100);
INSERT INTO cliente VALUES(2, 'Adela', 'Salas', 'Díaz', 'Granada', 200);
INSERT INTO cliente VALUES(3, 'Adolfo', 'Rubio', 'Flores', 'Sevilla', NULL);
INSERT INTO cliente VALUES(4, 'Adrián', 'Suárez', NULL, 'Jaén', 300);
INSERT INTO cliente VALUES(5, 'Marcos', 'Loyola', 'Méndez', 'Almería', 200);
INSERT INTO cliente VALUES(6, 'María', 'Santana', 'Moreno', 'Cádiz', 100);
INSERT INTO cliente VALUES(7, 'Pilar', 'Ruiz', NULL, 'Sevilla', 300);
INSERT INTO cliente VALUES(8, 'Pepe', 'Ruiz', 'Santana', 'Huelva', 200);
INSERT INTO cliente VALUES(9, 'Guillermo', 'López', 'Gómez', 'Granada', 225);
INSERT INTO cliente VALUES(10, 'Daniel', 'Santana', 'Loyola', 'Sevilla', 125);

INSERT INTO comercial VALUES(1, 'Daniel', 'Sáez', 'Vega', 0.15);
INSERT INTO comercial VALUES(2, 'Juan', 'Gómez', 'López', 0.13);
INSERT INTO comercial VALUES(3, 'Diego','Flores', 'Salas', 0.11);
INSERT INTO comercial VALUES(4, 'Marta','Herrera', 'Gil', 0.14);
INSERT INTO comercial VALUES(5, 'Antonio','Carretero', 'Ortega', 0.12);
INSERT INTO comercial VALUES(6, 'Manuel','Domínguez', 'Hernández', 0.13);
INSERT INTO comercial VALUES(7, 'Antonio','Vega', 'Hernández', 0.11);
INSERT INTO comercial VALUES(8, 'Alfredo','Ruiz', 'Flores', 0.05);

INSERT INTO pedido VALUES(1, 150.5, '2017-10-05', 5, 2);
INSERT INTO pedido VALUES(2, 270.65, '2016-09-10', 1, 5);
INSERT INTO pedido VALUES(3, 65.26, '2017-10-05', 2, 1);
INSERT INTO pedido VALUES(4, 110.5, '2016-08-17', 8, 3);
INSERT INTO pedido VALUES(5, 948.5, '2017-09-10', 5, 2);
INSERT INTO pedido VALUES(6, 2400.6, '2016-07-27', 7, 1);
INSERT INTO pedido VALUES(7, 5760, '2015-09-10', 2, 1);
INSERT INTO pedido VALUES(8, 1983.43, '2017-10-10', 4, 6);
INSERT INTO pedido VALUES(9, 2480.4, '2016-10-10', 8, 3);
INSERT INTO pedido VALUES(10, 250.45, '2015-06-27', 8, 2);
INSERT INTO pedido VALUES(11, 75.29, '2016-08-17', 3, 7);
INSERT INTO pedido VALUES(12, 3045.6, '2017-04-25', 2, 1);
INSERT INTO pedido VALUES(13, 545.75, '2019-01-25', 6, 1);
INSERT INTO pedido VALUES(14, 145.82, '2017-02-02', 6, 1);
INSERT INTO pedido VALUES(15, 370.85, '2019-03-11', 1, 5);
INSERT INTO pedido VALUES(16, 2389.23, '2019-03-11', 1, 5);




-- 1Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
select sum(total) from pedido;

-- 2Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
select avg(total) from pedido;
-- 3Calcula el número total de comerciales distintos que aparecen en la tabla pedido.
select count(id_comercial) from pedido;
-- 4Calcula el número total de clientes que aparecen en la tabla cliente.
select count(id) from cliente;
-- 5Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
select max(total) as mayor_cantidad from pedido;
-- 6Calcula cuál es la menor cantidad que aparece en la tabla pedido.
select min(total) as menor_cantidad from pedido;
-- 7Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
select ciudad, max(categoría) from cliente group by ciudad;
-- 8Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellidos, la fecha y el valor de la cantidad.
select pedido.id,pedido.fecha,pedido.total,cliente.nombre,cliente.apellido1,cliente.apellido2 from pedido inner join cliente on pedido.id_cliente=cliente.id order by nombre,fecha;
select pedido.fecha,max(pedido.total),cliente.id,cliente.nombre,cliente.apellido1,cliente.apellido2 from pedido inner join cliente on pedido.id_cliente=cliente.id group by id,fecha,nombre,apellido1,apellido2 order by nombre,fecha; 
select distinct cliente.id,cliente.nombre,cliente.apellido1,cliente.apellido2,pedido.fecha,pedido.total from pedido inner join cliente where cliente.id=pedido.id_cliente; 
-- 9Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de 2000 €.
select pedido.fecha,max(pedido.total),cliente.id,cliente.nombre,cliente.apellido1,cliente.apellido2 from pedido inner join cliente on pedido.id_cliente=cliente.id group by id,fecha,nombre,apellido1,apellido2  having max(total)>2000 order by nombre,fecha; 
-- 10Calcula el máximo valor de los pedidos realizados para cada uno de los comerciales durante la fecha 2016-08-17. Muestra el identificador del comercial, nombre, apellidos y total.
select pedido.fecha,max(pedido.total),comercial.id,comercial.nombre,comercial.apellido1,comercial.apellido2 from pedido inner join comercial on pedido.id_comercial=comercial.id group by id,fecha,nombre,apellido1,apellido2 having fecha='2016-08-17' order by nombre,fecha;
-- 11Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
select c.id,c.nombre,c.apellido1,c.apellido2,p.fecha,p.total from cliente as c ,pedido as p where c.id=p.id_cliente; 
-- 12Devuelve un listado con el identificador de cliente, nombre y apellidos y el número total de pedidos que ha realizado cada uno de clientes durante el año 2017.
select cliente.id,cliente.nombre,cliente.apellido1,cliente.apellido2,count(pedido.id)as Num_Pedidos from cliente left join(select * from pedido where year(fecha)=2017) as pedido on pedido.id_cliente=cliente.id    
group by cliente.id,cliente.nombre,cliente.apellido1,cliente.apellido2 ; 
-- 13Devuelve un listado que muestre el identificador de cliente, nombre, primer apellido y el valor de la máxima cantidad del pedido realizado por cada uno de los clientes. El resultado debe mostrar aquellos clientes que no han realizado ningún pedido indicando que la máxima cantidad de sus pedidos realizados es 0. Puede hacer uso de la función IFNULL.
select distinct cliente.id,pedido.fecha,max(pedido.total),cliente.nombre,cliente.apellido1,cliente.apellido2 from pedido inner join cliente on pedido.id_cliente=cliente.id where fecha>'2016-01-01' AND fecha <'2019-12-31'  group by id,fecha,nombre,apellido1,apellido2 having fecha>'2016-01-01' AND fecha <'2019-12-31' order by nombre,fecha; 

-- 14Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
select year(fecha), max(pedido.total) from pedido group by year(fecha); 
-- 15Devuelve el número total de pedidos que se han realizado cada año.
select year(fecha) as año,count(id) as N_pedido from pedido group by year(fecha);


-- Devuelve un listado con todos los pedidos que ha realizado Adela Salas Díaz
with
x as(select cliente.nombre,cliente.apellido1,cliente.apellido2,pedido.* from pedido, cliente where cliente.id=pedido.id_cliente)
select *  from x where concat(nombre,' ',apellido1,' ',apellido2)='Adela Salas Díaz';
-- Devuelve el número de pedidos en los que ha participado el comercial Daniel Sáez Vega. (Sin utilizar INNER JOIN)
with
x as(select comercial.nombre,comercial.apellido1,comercial.apellido2,pedido.* from pedido, comercial where comercial.id=pedido.id_comercial)
select *  from x where concat(nombre,' ',apellido1,' ',apellido2)='Daniel Sáez Vega';
-- Devuelve los datos del cliente que realizó el pedido más caro en el año 2019
with
x as(select cliente.nombre,cliente.apellido1,cliente.apellido2,pedido.* from pedido, cliente where cliente.id=pedido.id_cliente)
select *  from x where total=(select max(total) from pedido);
