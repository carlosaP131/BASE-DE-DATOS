drop database if  exists Punto_de_Venta;
CREATE database Punto_de_Venta;
use Punto_de_Venta;
 -- Tabla categoría
create table categoria(
       idcategoria integer primary key auto_increment,
       nombre varchar(50) not null unique,
       descripcion varchar(256) null
      
);


create table articulo(
       idarticulo integer primary key auto_increment,
       idcategoria integer not null,
       codigo varchar(50) null,
       nombre varchar(100) not null unique,
       precio_venta decimal(11,2) not null,
       stock integer not null,
       stock_nuevo integer not null,
       descripcion varchar(256) null,
       FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria)
);

create table borradoarticulo(
       idarticulo integer primary key auto_increment,
       idcategoria integer not null,
       codigo varchar(50) null,
       nombre varchar(100) not null unique,
       precio_venta decimal(11,2) not null,
       stock integer not null,
       descripcion varchar(256) null,
       FOREIGN KEY (idcategoria) REFERENCES categoria(idcategoria)
);


create table persona(
       idpersona integer primary key auto_increment,
       nombre varchar(100) not null,
       direccion varchar(70) null,
       telefono varchar(20) null,
       email varchar(50) null
);
create table borrarpersona(
       idpersona integer primary key auto_increment,
       nombre varchar(100) not null,
       direccion varchar(70) null,
       telefono varchar(20) null,
       email varchar(50) null
);
create table rol(
       idrol integer primary key auto_increment,
       nombre varchar(30) not null,
       descripcion varchar(100) null
);


create table usuario(
       idusuario integer primary key auto_increment,
       idrol integer not null,
       nombre varchar(100) not null,
       direccion varchar(70) null,
       telefono varchar(20) null,
       email varchar(50) not null,
       contraseña varbinary(10) not null,
       FOREIGN KEY (idrol) REFERENCES rol (idrol)
);


create table ingreso(
       idingreso integer primary key auto_increment,
       idproveedor integer not null,
       idusuario integer not null,
       tipo_comprobante varchar(20) not null,
       serie_comprobante varchar(7) null,
       num_comprobante varchar (10) not null,
       fecha datetime not null,
       impuesto decimal (4,2) not null,
       total decimal (11,2) not null,
       estado varchar(20) not null,
       FOREIGN KEY (idproveedor) REFERENCES persona (idpersona),
       FOREIGN KEY (idusuario) REFERENCES usuario (idusuario)
);


create table detalle_ingreso(
       iddetalle_ingreso integer primary key auto_increment,
       idingreso integer not null,
       idarticulo integer not null,
       cantidad integer not null,
       precio decimal(11,2) not null,
       FOREIGN KEY (idingreso) REFERENCES ingreso (idingreso) ON DELETE CASCADE,
       FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo)
);



create table venta(
       idventa integer primary key auto_increment,
       idcliente integer not null,
       idusuario integer not null,
       tipo_comprobante varchar(20) not null,
       serie_comprobante varchar(7) null,
       num_comprobante varchar (10) not null,
       fecha_hora datetime not null,
       impuesto decimal (4,2) not null,
       total decimal (11,2) not null,
       FOREIGN KEY (idcliente) REFERENCES persona (idpersona),
       FOREIGN KEY (idusuario) REFERENCES usuario (idusuario)
);

create table detalle_venta(
       iddetalle_venta integer primary key auto_increment,
       idventa integer not null,
       idarticulo integer not null,
       cantidad integer not null,
       precio decimal(11,2) not null,
       descuento decimal(11,2) not null,
       FOREIGN KEY (idventa) REFERENCES venta (idventa) ON DELETE CASCADE,
       FOREIGN KEY (idarticulo) REFERENCES articulo (idarticulo)
);
delimiter $    
create procedure Guardarcat(in  Nombre varchar(50),Desripcion varchar(256))
begin
    insert into categoria(nombre,descripcion) values (Nombre,Descripcion);
    end $
delimiter $    
create procedure Actualizarcat(in idaux int,nombrenuev varchar(50))
begin
    update categoria set nombre=nombrenuev  where idcategoria=idRolaux;
    end $
    
   delimiter $    
create procedure Eliminarcat(in idaux int)
begin
   DELETE FROM categoria WHERE idcategoria=idaux;
    end $ 
    
   delimiter $    
create procedure Mostrarcat()
begin
   select * from categoria;
    end $ 
 delimiter $    
delimiter $    
create procedure Guardarart(in Codigo varchar(50),Nombre varchar(50), Precio_venta decimal(11,2),Stok integer,Descripcion varchar(256))
begin
    insert into articulo (codigo,nombre,precio_venta,stock,descripcion) values (Codigo,Nombre,Precio_venta,Stock,Descripcion);
    end $
    delimiter $    
create procedure Actualizarart(in idaux int,nombrenuev varchar(50))
begin
    update articulo set nombre=nombrenuev  where idarticulo=idRolaux;
    end $
    
   delimiter $    
create procedure Eliminarart(in idaux int)
begin
   DELETE FROM articulo WHERE idarticulo=idaux;
    end $ 
    
   delimiter $    
create procedure Mostrarart()
begin
   select * from articulo;
    end $ 
 delimiter $    
delimiter $
create procedure Guardarpers(in Nombre varchar(50),Direccion varchar(70),Telefono varchar(20) ,Email varchar(50) )
begin
    insert into persona(nombre,direccion,telefono,email) values (Nombre,Direccion,Telefono,Email);
    end $
    delimiter $    
create procedure Actualizarpers(in idaux int,nombrenuev varchar(50))
begin
    update persona set nombre=nombrenuev  where idpersona=idRolaux;
    end $
    
   delimiter $    
create procedure Eliminarpers(in idaux int)
begin
   DELETE FROM persona WHERE idpersona=idaux;
    end $ 
    
   delimiter $    
create procedure Mostrarpers()
begin
   select * from persona;
    end $ 
 delimiter $    
delimiter $
create procedure Guardarrol(in Nombre varchar(50),Descripcion varchar(256))
begin
    insert into rol(nombre,descripcion) values (Nombre,Descripcion);
    end $
    delimiter $    
create procedure Actualizarrol(in idaux int,nombrenuev varchar(50))
begin
    update rol set nombre=nombrenuev  where idrol=idRolaux;
    end $
    
   delimiter $    
create procedure Eliminarrol(in idaux int)
begin
   DELETE FROM rol WHERE idrol=idaux;
    end $ 
    
   delimiter $    
create procedure Mostrarrol()
begin
   select * from rol;
    end $ 
 delimiter $    
delimiter $
create procedure Guardarusu(in Nombre varchar(50),Direccion varchar(70),Telefono varchar(20) ,Email varchar(50),Contraseña varbinary(10))
begin
    insert into usuario(nombre,direccion,telefono,email,cantraseña) values (Nombre,Direccion,Telefono,Email,Contraseña);
    end $
    delimiter $    
create procedure Actualizarusu(in idaux int,nombrenuev varchar(50))
begin
    update usuario set nombre=nombrenuev  where idusuario =idRolaux;
    end $
    
   delimiter $    
create procedure Eliminarusu(in idaux int)
begin
   DELETE FROM usuario WHERE idusuario=idaux;
    end $ 
    
   delimiter $    
create procedure Mostrarusu()
begin
   select * from usuario;
    end $ 
 delimiter $    
create procedure Guardarventa(in Tipo_comprobante varchar(20) ,Serie_comprobante varchar(7) ,Num_comprobante varchar (10) ,Fecha_hora datetime,Impuesto decimal (4,2),Total decimal (11,2))
begin
    insert into venta(tipo_comprobante,serie_comprobante,num_comprobante,fecha_hora,impuesto,total) values (Tipo_comprobante,Serie_comprobante,Num_comprobante,Fecha_hora,Impuesto,Total);
    end $
    delimiter $    
create procedure Actualizarventa(in idaux int,Tipo_comprobantenuev varchar(20) ,Serie_comprobantenuev varchar(7) ,Num_comprobantenuev varchar (10) ,Fecha_horanuev datetime,Impuestonuev decimal (4,2),Totalnuev decimal (11,2))
begin
    update venta set tipo_comprobante=Tipo_comprobantenuev  ,serie_comprobante=Serie_comprobantenuev ,num_comprobante=Num_comprobantenuev ,fecha_hora=Fecha_horanuev ,impuesto=Impuestonuev ,total=Totalnuev   where idventa =idRolaux;
    end $
    
   delimiter $    
create procedure Eliminarventa(in idaux int)
begin
   DELETE FROM venta WHERE idventa=idaux;
    end $ 
    
   delimiter $    
create procedure Mostrarvent()
begin
   select * from venta;
    end $ 
 delimiter $    
create procedure Guardaringreso(in tipo_comprobante varchar(20) ,serie_comprobante varchar(7) ,num_comprobante varchar (10) ,fecha_hora datetime,impuesto decimal (4,2),total decimal (11,2))
begin
    insert into ingreso(tipo_comprobante,serie_comprobante,num_comprobante,fecha_hora,impuesto,total) values (tipo_comprobante,serie_comprobante,num_comprobante,fecha_hora,impuesto,total);
    end $
    delimiter $    
create procedure Actualizaringreso(in idaux int,Tipo_comprobantenuev varchar(20) ,Serie_comprobantenuev varchar(7) ,Num_comprobantenuev varchar (10) ,Fecha_horanuev datetime,Impuestonuev decimal (4,2),Totalnuev decimal (11,2))
begin
    update ingreso set tipo_comprobante=Tipo_comprobantenuev  ,serie_comprobante=Serie_comprobantenuev ,num_comprobante=Num_comprobantenuev ,fecha_hora=Fecha_horanuev ,impuesto=Impuestonuev ,total=Totalnuev   where idingreso =idRolaux;
    end $
    
   delimiter $    
create procedure Eliminaringreso(in idaux int)
begin
   DELETE FROM ingreso WHERE idingreso=idaux;
    end $ 
    
   delimiter $    
create procedure Mostraringreso()
begin
   select * from venta;
    end $ 
 delimiter $    

-- primer triger
Delimiter $$
drop trigger if exists borradoDeArticulos$$
create trigger borradoDeArticulos before delete on articulo
for each row
begin
	insert into borradoalumno(codigo,nombre,precio_venta,stock,descripcion) values(old.codigo,old.nombre,old.precio_venta,old.stock,old.descripcion);
End
$$
Delimiter $$

-- segundo triger
Delimiter $$
drop trigger if exists borradoDePersonas$$
create trigger borradoDePersonas before delete on persona
for each row
begin
	insert into borrarpersona(nombre,direccion,telefono,email) values(old.nombre,old.direccion,old.telefono,old.email);
End
$$
Delimiter $$

-- 3 triger
Delimiter $$
drop trigger if exists actualizarstock$$
create trigger actualizarstock after insert on articulo
for each row
begin
	update articulo set stock_nuevo = new.stock;
End
$$
Delimiter $$





