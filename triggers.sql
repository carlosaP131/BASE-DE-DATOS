create database base_ejemplo;
use base_ejemplo;
create table productos (
id_productos int not null auto_increment,
nombre varchar(29) not null,
coste double not null default 0.00,
precio double not null default 0.00,
primary key(id_productos)
);


insert into productos(nombre,coste,precio) values ('producto A',4,8),('productob',2,4),('productoc',40,80); 
select * from productos;
Delimiter $$
create trigger ActualizarPrecioProducto
before update on productos
for each row 
begin 
	if new.coste<> old.coste
		then
		set new.precio=new.coste*2;
    end if;
end $$
Delimiter ;
update productos set status=0 where id_productos=1;
select * from productos where status=1;
update productos set coste =12 where id_productos=2; 
select * from productos;
DROP trigger ActualizarPrecioProducto;
drop table controlmitabla;
 create table controlmitabla
 (
 id int not null auto_increment,
 id_registro int,
 anteriornombre varchar(50),
 nuevonombre varchar(50),
 anteriorcoste double,
 nuevocoste double,
 usuario varchar(40),
 modificado datetime,
 primary key(id)
 );
 alter table productos add column status bool not null default 1; 
 
 Delimiter //
 create trigger Productos_bu after update on productos 
 for each row 
 begin 
 insert into controlmitabla (id_registro,anteriornombre,nuevonombre,anteriorcoste,nuevocoste,usuario,modificado)
 values(old.id_productos,old.nombre,new.nombre,old.coste,new.coste,current_user(),now());
 end //
 
 
 delimiter //
 create trigger productos_borrado_logico before delete on productos
 for each row 
 begin
	update productos set status=0 where id_productos=old.id_productos;
    end//
 select * from controlmitabla ;  
    
    