drop database LA_MICHOACANA;
CREATE DATABASE LA_MICHOACANA;

USE LA_MICHOACANA;

CREATE TABLE SUCURSAL
(ID_SUCURSAL int auto_increment primary key,
nombre_sucursal varchar (100) not null,
direccion text not null,
telefono varchar (10) not null,
razon_social text not null,
RFC varchar (13) not null
);

CREATE TABLE PROVEEDOR
(ID_PROVEEDOR int auto_increment primary key,
nombre_proveedor varchar (100) not null,
telefono varchar (20) not null,
E_MAIL varchar (100) not null,
Razon_social text not null,
RFC varchar (13) not null
);

CREATE TABLE PRODUCTOS
(ID_PRODUCTO int auto_increment primary key,
nombre varchar (100) NOT NULL,
descripcion text NOT NULL,
marca varchar (45) NOT NULL,
precio decimal(12,2) NOT NULL,
costo decimal(12,2) NOT NULL,
Stok_minimo int NOT NULL,
Stok_actual int NOT NULL,
idproveedor int NOT NULL ,FOREIGN KEY (idproveedor) REFERENCES PROVEEDOR(ID_PROVEEDOR)
);

CREATE TABLE USUARIOS
(ID_USUARIO INT auto_increment PRIMARY KEY,
NOMBRE_USUARIO VARCHAR (20) NOT NULL,
CONTRASENIA_USUARIO VARCHAR (15) NOT NULL,
E_MAIL_USUARIO varchar (100) not NULL
);


CREATE TABLE ALMACEN
(ID_ALMACEN INT auto_increment PRIMARY KEY,
NOMBRE_ALMACEN VARCHAR (100) NOT NULL
);

CREATE TABLE ALMACENAJE
(ID_ALMACENAJE INT auto_increment PRIMARY KEY,
ID_PRODUCTO_ALMACENADO INT ,FOREIGN KEY(ID_PRODUCTO_ALMACENADO) REFERENCES PRODUCTOS (ID_PRODUCTO),
ID_ALMACEN INT , FOREIGN KEY (ID_ALMACEN) REFERENCES ALMACEN (ID_ALMACEN),
PRODUCTO_CANTIDAD INT NOT NULL
);

CREATE TABLE ROLES_TIPOS_USUARIO
(
ID_ROL INT auto_increment PRIMARY KEY,
NOMBRE_ROL VARCHAR (50) NOT NULL
);

create table ROLES_USUARIOS
(

ID_ROLES_USUARIOS INT auto_increment PRIMARY KEY,
ID_USUARIO INT, FOREIGN KEY(ID_USUARIO) REFERENCES USUARIOS(ID_USUARIO),
id_rol int,foreign key (id_rol) references ROLES_TIPOS_USUARIO(ID_ROL)
);

create table  CARGOS
(
ID_CARGO INT auto_increment PRIMARY KEY,
NOMBRE_CARGO VARCHAR (100) NOT NULL
);

CREATE TABLE EMPLEADOS
(ID_EMPLEADO INT auto_increment NOT NULL PRIMARY KEY,
NOMBRE VARCHAR(255) NOT NULL,
DIRECCION VARCHAR (20) NOT NULL,
TELEFONO VARCHAR(20) NOT NULL,
USUARIO VARCHAR(100) NOT NULL,
CONTRASENIA VARCHAR(100) NOT NULL,
SEXO CHAR(2) NOT NULL,
FECHA_NACIMIENTO DATE NOT NULL,
ID_CARGO INT, FOREIGN KEY(ID_CARGO) REFERENCES CARGOS(ID_CARGO)
);

CREATE TABLE CLIENTE
(ID_CLIENTE int auto_increment primary key,
nombre_CLIENTE varchar (100) not null,
telefono varchar (20) not null,
E_MAIL varchar (100) not null,
Razon_social text not null,
RFC varchar (13) not null
);

CREATE TABLE COMPRAS
(
ID_COMPRAS INT auto_increment PRIMARY KEY,
CANTIDAD_PROD_TOTAL INT NOT NULL,
SUBTOTAL DECIMAL (12,2) NULL,
FECHA DATE NULL
);

CREATE TABLE DETALLE_COMPRAS(
ID_DET_COMPRA INT auto_increment PRIMARY KEY,
CANTIDAD_PRO INT NULL,
TOTAL DECIMAL (12,2) NULL,
ID_PRODUCTO_COM INT NOT NULL, FOREIGN KEY (ID_PRODUCTO_COM) references PRODUCTOS(ID_PRODUCTO),
PRECIO DECIMAL (12,2) NULL,
IDCOMPRA INT , FOREIGN KEY (IDCOMPRA) REFERENCES COMPRAS(ID_COMPRAS)
);

CREATE TABLE VENTAS(
ID_VENTA INT auto_increment PRIMARY KEY,
FECHA DATE NOT NULL,
CANTIDAD_TOTAL INT NOT NULL,
SUBTOTAL DECIMAL (12,2) NOT NULL,
TOTAL DECIMAL (12,2) NOT NULL,
ID_CLIENTE INT NOT NULL, FOREIGN KEY(ID_CLIENTE) references CLIENTE (ID_CLIENTE),
ID_EMPLEADO INT NOT NULL ,FOREIGN KEY (ID_EMPLEADO) REFERENCES EMPLEADOS (ID_EMPLEADO)
);

CREATE TABLE VENTAS_DETALLE(
ID_VENTAS_DETALLE INT auto_increment PRIMARY KEY,
 FOREIGN KEY (ID_VENTA) REFERENCES PRODUCTOS (ID_PRODUCTO),
CANTIDAD INT NULL,
PRECIO DECIMAL (12,2) NULL,
SUBTOTAL DECIMAL(12,2) NULL,
ID_VENTA int not null,
FOREIGN KEY (ID_VENTA) REFERENCES VENTAS (ID_VENTA) 
);
create table factura(
id_factura int auto_increment primary key,
sello_digital text not null,
id_venta int not null,
foreign key (id_venta) references VENTAS(ID_VENTA)
);
DELIMITER $$
CREATE PROCEDURE añadirusuario(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    insert into USUARIOS values (@nombre,@contrasenia,@email);
    end$$

   CREATE PROCEDURE borrar_usuario(
    in nombre varchar(20))
    begin
    delete from  USUARIOS where NOMBRE_USUARIO=@nombre;
    end$$

   CREATE PROCEDURE actualizar_usuario(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    update   USUARIOS set  NOMBRE_USUARIO=@nombre,CONTRASENIA_USUARIO=@CONTRASENIA,E_MAIL_USUARIO=@EMAIL;
    end$$
    CREATE PROCEDURE añadiralmacen(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    insert into USUARIOS values (@nombre,@contrasenia,@email);
    end$$

   CREATE PROCEDURE borraralmacen(
    in nombre varchar(20))
    begin
    delete from  USUARIOS where NOMBRE_USUARIO=@nombre;
    end$$

   CREATE PROCEDURE actualizaralmacen(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    update   USUARIOS set  NOMBRE_USUARIO=@nombre,CONTRASENIA_USUARIO=@CONTRASENIA,E_MAIL_USUARIO=@EMAIL;
    end$$
CREATE PROCEDURE añadiralmacenaje(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    insert into USUARIOS values (@nombre,@contrasenia,@email);
    end$$

   CREATE PROCEDURE borraralmacenaje(
    in nombre varchar(20))
    begin
    delete from  USUARIOS where NOMBRE_USUARIO=@nombre;
    end$$

   CREATE PROCEDURE actualizaralmacenaje(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    update   USUARIOS set  NOMBRE_USUARIO=@nombre,CONTRASENIA_USUARIO=@CONTRASENIA,E_MAIL_USUARIO=@EMAIL;
    end$$
    CREATE PROCEDURE añadircargo(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    insert into USUARIOS values (@nombre,@contrasenia,@email);
    end$$

   CREATE PROCEDURE borrarcargador(
    in nombre varchar(20))
    begin
    delete from  USUARIOS where NOMBRE_USUARIO=@nombre;
    end$$

   CREATE PROCEDURE actualizarcargo(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    update   USUARIOS set  NOMBRE_USUARIO=@nombre,CONTRASENIA_USUARIO=@CONTRASENIA,E_MAIL_USUARIO=@EMAIL;
    end$$
    CREATE PROCEDURE añadircliente(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    insert into USUARIOS values (@nombre,@contrasenia,@email);
    end$$

   CREATE PROCEDURE borrarcliente(
    in nombre varchar(20))
    begin
    delete from  USUARIOS where NOMBRE_USUARIO=@nombre;
    end$$

   CREATE PROCEDURE actualizarcliente(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    update   USUARIOS set  NOMBRE_USUARIO=@nombre,CONTRASENIA_USUARIO=@CONTRASENIA,E_MAIL_USUARIO=@EMAIL;
    end$$
    CREATE PROCEDURE añadircompras(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    insert into USUARIOS values (@nombre,@contrasenia,@email);
    end$$

   CREATE PROCEDURE borrar_compras(
    in nombre varchar(20))
    begin
    delete from  USUARIOS where NOMBRE_USUARIO=@nombre;
    end$$

   CREATE PROCEDURE actualizar_compras(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    update   USUARIOS set  NOMBRE_USUARIO=@nombre,CONTRASENIA_USUARIO=@CONTRASENIA,E_MAIL_USUARIO=@EMAIL;
    end$$
    CREATE PROCEDURE añadirdetallescom(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    insert into USUARIOS values (@nombre,@contrasenia,@email);
    end$$

   CREATE PROCEDURE borrardetallescomp(
    in nombre varchar(20))
    begin
    delete from  USUARIOS where NOMBRE_USUARIO=@nombre;
    end$$

   CREATE PROCEDURE actualizardetallescom(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    update   USUARIOS set  NOMBRE_USUARIO=@nombre,CONTRASENIA_USUARIO=@CONTRASENIA,E_MAIL_USUARIO=@EMAIL;
    end$$
    CREATE PROCEDURE añadirempleados(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    insert into USUARIOS values (@nombre,@contrasenia,@email);
    end$$

   CREATE PROCEDURE borrarempleados(
    in nombre varchar(20))
    begin
    delete from  USUARIOS where NOMBRE_USUARIO=@nombre;
    end$$

   CREATE PROCEDURE actualizarempleados(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    update   USUARIOS set  NOMBRE_USUARIO=@nombre,CONTRASENIA_USUARIO=@CONTRASENIA,E_MAIL_USUARIO=@EMAIL;
    end$$
    CREATE PROCEDURE añadirusuario(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    insert into USUARIOS values (@nombre,@contrasenia,@email);
    end$$

   CREATE PROCEDURE borrar_usuario(
    in nombre varchar(20))
    begin
    delete from  USUARIOS where NOMBRE_USUARIO=@nombre;
    end$$

   CREATE PROCEDURE actualizar_factura(
    in nombre varchar(20),
    in contrasenia varchar(15),
    in email varchar(100))
    begin
    update   USUARIOS set  NOMBRE_USUARIO=@nombre,CONTRASENIA_USUARIO=@CONTRASENIA,E_MAIL_USUARIO=@EMAIL;
    end$$
    
    
    
    
    