DROP database  if exists juego;
create database juego ;
use juego;
create table rol(
idRol int auto_increment primary key, 
rol varchar(20),
fechacreacion datetime,
fechaactualizacion datetime,
fechareliminacion datetime

);
create table jugador(
	id_jugador int auto_increment primary key,
    nombre varchar(20),
    edad date,
    sexo varchar(1),
    telefono varchar(10),
    correo varchar(20),
    direccion varchar(20),
    puntos int ,
fechacreacion datetime,
fechaactualizacion datetime,
fechareliminacion datetime
);
create table usuario(
	id_usuario int  auto_increment primary key,
    usuario varchar(20),
    pdw varchar(20),
    jugador_id int not null,
    constraint foreign key (jugador_id) references jugador (id_jugador),
fechacreacion datetime,
fechaactualizacion datetime,
fechareliminacion datetime
);
create table usuario_rol(
	usuario_id int not null,
    rol_id int not null,
	constraint  foreign key (usuario_id) REFERENCES usuario (id_usuario),
	constraint foreign key  (rol_id) REFERENCES rol(idRol),
fechacreacion datetime,
fechaactualizacion datetime,
fechareliminacion datetime
);
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
-- alter table jugador add edad int;     
-- call actualizar(3,'invitado2');
-- insert into jugador(nombre,edad,sexo,telefono,correo,direccion,puntos)values ('juan',20,'n','null','null','null',0);
-- select * from jugador;
 -- select * from rol;	
-- insert into usuario (usuario,pdw,jugador_id) values ('juan','1234','1');
-- select * from usuario;
-- ALTER TABLE jugador DROP COLUMN edad;
-- USE juego;
 with
x as(select usuario.*, rol.rol from usuario inner join usuario_rol inner join rol on usuario.id_usuario=usuario_rol.usuario_id
and usuario_rol.rol_id=rol.idRol)
select * from jugador inner join x on x.jugador_id=jugador.id_jugador;



