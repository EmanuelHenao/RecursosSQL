create database ejercicio13;
use ejercicio13;

create table Usuarios(
idx int(11) not null,
usuario varchar(20),
nombre varchar(20),
sexo varchar(1),
nivel tinyint(4),
email varchar(50),
telefono varchar(20),
marca varchar(20),
compañia varchar(20),
saldo float,
activo tinyint(1),
primary key(idx)
);

insert into Usuarios values (123,'antoni123','antoni','m',2,'antoni123@gmail.com','12345678889','compaq','hamblet pacart',500000,1);
insert into Usuarios values (147,'paula147','paula','f',4,'paulita@gmail.com','97654321','asus','Asus',0,1);
insert into Usuarios values (159,'federico159','federico','m',1,'ico@gmail.com','125919631','lg','lg',890000,0);
insert into Usuarios values (852,'magenta852','margarita','f',3,'magenta@gmail.com','7857425','Dell','Dell',7891122,0);


select nombre,saldo,activo from Usuarios where saldo<=0 or activo =0;
call ejercicio13.InsertarRegistro(178,'1','1','m',1,'1@gmail.com','111','1','1',10,1);


DELIMITER $$

CREATE definer=`root`@`localhost`
procedure `InsertarRegistro`(idx int, usuario varchar(20),nombre varchar(20), sexo varchar(1), nivel tinyint(4),email varchar(50),telefono varchar(20), marca varchar(20), compa varchar(20), saldo float, activo tinyint(1))  
begin
insert into Usuarios values (idx,usuario,nombre,sexo,nivel,email,telefono,marca,compa,saldo,activo);
END 

