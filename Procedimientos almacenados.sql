DROP database  if exists juego;
create database juego ;
use juego;
create table rol(
idRol int auto_increment primary key, 
rol varchar(20));


insert into rol(rol)values('INVITADO'); 
SELECT * from rol;
-- update rol set  rol='jose' where rol.idRol='getzemani';
SET SQL_SAFE_UPDATES = 0;

delimiter $    
    create procedure Guardar(in rol varchar(20))
begin
    insert into rol (rol) values (rol);
    end $
    
delimiter $    
    create procedure Actualizar(in idRolaux int,rolnuev varchar(20))
begin
    update rol set rol=rolnuev  where rol.idRol=idRolaux;
    end $
    
   delimiter $    
    create procedure Eliminar(in idRolaux int)
begin
   DELETE FROM rol WHERE idRol=idRolaux;
    end $ 
    
   delimiter $    
    create procedure Mostrar()
begin
   select * from rol;
    end $ 
 delimiter $    
    create procedure Buscar(in idRolaux int)
begin
  select * from rol where idrol=idRolaux;
    end $     
    
call actualizar(3,'invitado2');