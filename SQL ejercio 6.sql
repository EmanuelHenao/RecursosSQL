create database ejercicio6;
use ejercicio6;

Create table Fabricante(
codigo int auto_increment not null,
nombre varchar(50),
primary key (codigo)
);

create table Articulo(
codigo int auto_increment not null,
nombre varchar(50),
precio int,
fabricante int not null,
primary key(codigo),
constraint c1 foreign key(fabricante) references Fabricante(codigo)
);


DELIMITER $
CREATE procedure `InsertarFabricante`( nom varchar(50))  
begin
insert into Fabricante(nombre) values (nom);
END$


DELIMITER $
create procedure `InsertarArticulo`(nom varchar(50), pre int,fabri int)
begin
insert into Articulo(nombre,precio,fabricante) values (nom,pre,fabri);
end$

DELIMITER $
create procedure `uno`()
begin
select AVG(Articulo.precio)as promedio from Articulo where Articulo.fabricante = 2;
end$

DELIMITER $
create procedure `dosA`()
begin
select nombre,precio from Articulo where Articulo.precio >= 180000 order by Articulo.precio Desc ;

end$

DELIMITER $
create procedure `dosB`()
begin
select nombre,precio from Articulo where Articulo.precio >= 180000 order by Articulo.nombre ASC;
end$

DELIMITER $
create procedure `tres`()
begin
select Fabricante.nombre, AVG(Articulo.precio) as PromedioArticulos from Articulo,Fabricante where Fabricante.codigo = Articulo.fabricante group by Fabricante.codigo ;
end$

DELIMITER $
create procedure `quinto`()
begin
update Articulo set precio = precio-10000  where precio >= 120000000; # no permite ejecutarlo desde workbench, Error, en la bd si lo permite
end$

DELIMITER $
create procedure `show5`()
begin
select codigo,nombre,precio from Articulo  where precio >= 120000000; 
end$

call ejercicio6.InsertarFabricante('HP');
call ejercicio6.InsertarArticulo('Pavilon750',750000,1);

call ejercicio6.uno();
call ejercicio6.dosA();
call ejercicio6.dosB();
call ejercicio6.tres();
call ejercicio6.quinto();

#select AVG(Articulo.precio)as promedio from Articulo,Fabricante where Articulo.fabricante= Fabricante.codigo and Fabricante.codigo = 2 ;
#uno
select AVG(Articulo.precio)as promedio from Articulo where Articulo.fabricante = 2;
#dos
select nombre,precio from Articulo where Articulo.precio >= 180000 order by Articulo.precio Desc ;
select nombre,precio from Articulo where Articulo.precio >= 180000 order by Articulo.nombre ASC;
#tres
select Fabricante.nombre, AVG(Articulo.precio) as PromedioArticulos from Articulo,Fabricante where Fabricante.codigo = Articulo.fabricante group by Fabricante.codigo ;
#cinco
update Articulo set precio = precio-10000  where precio >= 120000000; # no permite ejecutarlo desde workbench, Error, en la bd si lo permite

#no he podido
select Fabricante.nombre,Articulo.nombre, Max(Articulo.precio) as Precio from Articulo,Fabricante where Articulo.codigo in (select Articulo.codigo,Max(Articulo.precio) from Articulo ) ;

