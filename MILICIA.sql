Create database Milicia;
use Milicia;

create table Cuerpo(
cod_cuerpo int,
denominacion varchar(200),
primary key(cod_cuerpo)
);

create table Compania(
num_compania int,
actividad varchar(50),
primary key(num_compania)
);

create table Cuartel(
cod_cuartel int ,
nom_cuartel varchar(50),
ubicacion varchar(50),
 primary key(cod_cuartel)
);

create table Soldado(
cod_soldado int not null,
nombre varchar(100),
apellido Varchar(100),
graduacion varchar(50),
cuerpo int,
compania int,
cuartel int,
primary key (cod_soldado),
constraint c1 foreign key (cuerpo) references Cuerpo(cod_cuerpo),
constraint c2 foreign key (compania) references Compania(num_compania),
constraint c3 foreign key (cuartel) references Cuartel(cod_cuartel)
);

create table Servicio(
cod_servicio int,
fecha date,
descripcion varchar(150),
primary key(cod_servicio)
);

create table Detalle_Servicio(
id int auto_increment not null,
codServicio int,
codSoldado int,
primary key(id),
constraint c4 foreign key (codServicio) references Servicio(cod_servicio),
constraint c5 foreign key (codSoldado) references Soldado(cod_soldado)
);

#1
select Soldado.cod_soldado, Cuerpo.denominacion from Soldado,Cuerpo where Soldado.cod_soldado = Cuerpo.cod_cuerpo order by Cuerpo.cod_cuerpo asc ;

#2


#3
select *  from Servicio;

#4
select cod_soldado,nombre, actividad from Soldado,Compania where Soldado.compania = Compania.num_compania;

#5
select cod_soldado,nombre, nom_cuartel,ubicacion from Soldado,Cuartel where  Soldado.cuartel = Cuartel.cod_cuartel;
 
 
 DELIMITER $
 create procedure `consultas`(a int)
 begin
 
 case a
 when  1 then
	#1
	select Soldado.cod_soldado, Cuerpo.denominacion from Soldado,Cuerpo where Soldado.cod_soldado = Cuerpo.cod_cuerpo order by Cuerpo.cod_cuerpo asc ;
when  2 then
	#2
	select*;
when  3 then
	#3
	select *  from Servicio;
when  4 then
	#4
	select cod_soldado,nombre, actividad from Soldado,Compania where Soldado.compania = Compania.num_compania;
when 5 then	
	#5
	select cod_soldado,nombre, nom_cuartel,ubicacion from Soldado,Cuartel where  Soldado.cuartel = Cuartel.cod_cuartel;
end case;
 end$
 
 CALL Milicia.consultas(3);