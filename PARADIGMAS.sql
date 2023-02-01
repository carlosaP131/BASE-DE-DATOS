DROP DATABASE JUEGO;
CREATE DATABASE JUEGO;
USE JUEGO;

create table USUARIOS(
ID_USUARIO int auto_increment primary key,
nombre varchar(15) NOT NULL,
apellido varchar(10) NOT NULL,
nombre_usuario varchar(20) NOT NULL,
edad int NOT NULL,
telefono varchar(10) NOT NULL
);

CREATE TABLE ROLES_TIPOS_USUARIO
(
ID_ROL INT auto_increment PRIMARY KEY,
NOMBRE_ROL VARCHAR (50) NOT NULL
);

create table ROLES_USUARIOS(
ID_ROLES_USUARIOS int auto_increment primary key,
ID_USUARIO INT,
foreign key(ID_USUARIO) references USUARIOS(ID_USUARIO),
id_rol int NOT NULL,
foreign key(id_rol) references ROLES_TIPOS_USUARIO(ID_ROL)
);

create table LOGUEO(
ID_LOGUEO int auto_increment primary key,
tipo_user varchar(20) NOT NULL,
contrasena varchar(20) NOT NULL
);

create table PUNTAJE(
ID_PUNTAJE int auto_increment primary key,
puntos varchar(100) NOT NULL,
partidos_jugados int NOT NULL,
partidos_ganados int NOT NULL,
partidos_empatados int NOT NULL,
tiempo_jugado integer NOT NULL
);

create table SONIDO(
ID_SONIDO int auto_increment primary key,
musica text NOT NULL
);
