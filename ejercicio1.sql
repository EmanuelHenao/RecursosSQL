#el enlace se realiza en el de "muchos"
Create database ejercicio;
use ejercicio;

create table Cliente(
codigo int not null,
nombre varchar(100),
domicilio varchar(50),
provincia varchar(50),
primary key(codigo)
);

create table Ventas(
n_factura int not null,
codigo_cliente int,
fecha date,
primary key(n_factura),
constraint c1 foreign key(codigo_cliente) references Cliente(codigo)#"muchos"
);

create table Producto(
codigo_producto int not null,
nom_producto varchar(50),
primary key(codigo_producto)
);

create table Item_Ventas(
n_factura int,
codigo_producto int,
cantidad int,
precio int,
constraint c2 foreign key(n_factura) references Ventas(n_factura),
constraint c3 foreign key (codigo_producto) references Producto(codigo_producto)
);