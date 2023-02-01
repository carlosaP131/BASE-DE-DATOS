DROP database  if exists nave_espacial;
create database nave_espacial;
use nave_espacial;
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
    edad int,
    sexo varchar(10),
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
    privilegio varchar(30),
    jugador_id int ,
    constraint foreign key (jugador_id) references jugador (id_jugador) ON DELETE CASCADE ON UPDATE CASCADE ,
fechacreacion datetime,
fechaactualizacion datetime,
fechareliminacion datetime
);
create table usuario_rol(
	usuario_id int not null,
    rol_id int not null,
	constraint  foreign key (usuario_id) REFERENCES usuario (id_usuario) ON DELETE CASCADE ON UPDATE CASCADE ,
	constraint foreign key  (rol_id) REFERENCES rol(idRol) ON DELETE CASCADE ON UPDATE CASCADE ,
fechacreacion datetime,
fechaactualizacion datetime,
fechareliminacion datetime
);
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
end$
delimiter$
create procedure ActualizarPuntaje(in idjugaux int )
begin
select id_jugador from jugador where id_jugador =  idjugaux;

end$

