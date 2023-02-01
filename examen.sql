create database banco ;
use banco ;
create table cliente  (
idcliente int auto_increment primary key not null,
nombre varchar(50) not null,
apellido varchar(100)
);
delimiter $    
create procedure Guardar(in nombre varchar(50), apellido varchar(100))
begin
    insert into cliente (nombre,apellido) values (nombre,apellido);
    end $
    delimiter $    
create procedure Actualizar(in idaux int,nombrenuev varchar(50))
begin
    update cliente set nombre=nombrenuev  where idcliente=idRolaux;
    end $
    
   delimiter $    
create procedure Eliminar(in idaux int)
begin
   DELETE FROM cliente WHERE idcliente=idaux;
    end $ 
    
   delimiter $    
create procedure Mostrar()
begin
   select * from cliente;
    end $ 
 delimiter $    

