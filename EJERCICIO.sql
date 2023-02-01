DROP DATABASE IF EXISTS EJERCICIO; 
CREATE database EJERCICIO;
USE EJERCICIO;
CREATE TABLE  Cliente(
 idCliente int auto_increment primary key, 
Identificacion numeric(18,0) ,
Nombre varchar(30),
Apellido varchar(30) ,
Fijo numeric(18,0),
Celular numeric(18,0) ,
Id_Usuario int ,
NitEmpresa int
);

DELIMITER $$

CREATE PROCEDURE AddCliente(

IdentificacionAUX numeric (18,0)

,NombreAUX varchar (30)

,ApellidoAUX varchar (30)

,FijoAUX numeric (18,0)

,CelularAUX numeric(18,0)

,Id_UsuarioAUX int

,NitEmpresaAUX int

)  BEGIN
INSERT INTO Clientes

(Identificacion ,Nombre ,Apellido ,Fijo ,Celular ,Id_Usuario ,NitEmpresa)

VALUES

(IdentificacionAUX ,NombreAUX ,ApellidoAUX ,FijoAUX ,CelularAUX ,Id_UsuarioAUX ,NitEmpresaAUX);
END $$



DELIMITER $$

CREATE PROCEDURE ConsultarClientexidentificacion
(
Identificacion1 int
)BEGIN

SELECT *
FROM Clientes
WHERE identificacion=Identificacion1;

END $$

DELIMITER $$
CREATE PROCEDURE ConsultarClientes(
ValorIN varchar (15),
Columna1 varchar (15)

)BEGIN

IF (Columna1 = 'Todas') THEN
SELECT * FROM Clientes;

ELSEIF (Columna1 = 'Identificacion'
)THEN 
SELECT * FROM Clientes WHERE identificacion = ValorIN;

ELSEIF (Columna1 = 'Nombre'
)THEN
SELECT * FROM Cliente WHERE Nombre like  concat(ValorIN, '%');
ELSE 
SELECT * FROM Clientes WHERE Apellido like concat(ValorIN ,'%');
 END IF;
END$$
