DROP DATABASE IF EXISTS EJERCICIO2; 
CREATE database EJERCICIO2;
USE EJERCICIO2;
CREATE TABLE  Pelicula(
 idPelicula int auto_increment primary key, 
Pelicula char (6)

,Titulo varchar (50)

,Descripcion varchar (500)

,Genero char (2)

,Censura char(2));

create table Funcion(
idFuncion int auto_increment primary key, 
Cine char(6),
Pelicula char(6),
horainicio time,
horafin time,
sala char(6)
);
create table Genero (
idgenero int auto_increment primary key, 
Genero char(2),
 descripcion char(30)
);

DELIMITER $$

CREATE PROCEDURE INGRESARDATOS(

Peliculaaux char (6)

,Tituloaux varchar (50)

,Descripcionaux varchar (500)

,Generoaux char (2)

,Censuraaux char(2)
)begin
INSERT INTO PELICULA

(Pelicula, Titulo, Descripcion, Genero, Censura)

VALUES

(@Pelicula, @Titulo, @Descripcion, @Genero, @Censura);
end$$
DELIMITER $$
CREATE PROCEDURE FUNCIONESDEUNCINE
(
CineAUX char(3)
)BEGIN

SELECT F.Pelicula, F.HoraInicio, F.HoraFin, F.Sala
FROM FUNCION F
WHERE F.Cine =CineAUX;

END$$
DELIMITER $$

CREATE PROCEDURE NUEVOGENERO(

Generoaux char(2)
,
Descripcionaux varchar(30)

)BEGIN
INSERT INTO GENERO (Genero, Descripcion)

VALUES

(Generoaux, Descripcionaux);
end$$
