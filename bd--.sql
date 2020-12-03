#Ejercicio 1- tienda

create table Cliente(
codigo int not null,
nombre varchar(100),
apellido varchar(100),
direccion varchar(50),
telefono varchar(50),
primary key(codigo)
);

create table Producto(
codigo int not null,
descripcion varchar(100),
precio int,
stock int,
primary key(codigo)
);

create table Proveedor(
codigo int not null,
nombre varchar(100),
apellido varchar(100),
direccion varchar(50),
telefono varchar(50),
provincia varchar(50),
primary key(codigo)
);

create table Compra(
codigo_cliente int,
codigo_producto int,
fechaCompra date,
constraint c1 foreign key(codigo_cliente) references Cliente(codigo),
constraint c2 foreign key (codigo_producto) references Producto(codigo)
);

create table Suministra(
codigo_cliente int,
codigo_proveedor int,
constraint c3 foreign key(codigo_cliente) references Cliente(codigo),
constraint c4 foreign key (codigo_proveedor) references Proveedor(codigo)
);


#ejercicio 2 anuncios

create table Cliente(
codigo int not null,
nombre varchar(100),
email varchar(50),
dirPost varchar(50),
telefono varchar(50),
primary key(codigo)
);

create table Tipo(
codigo int not null,
nombre varchar(100),
primary key(codigo)
);

create table Categoria(
codigo int not null,
nombre varchar(100),
primary key(codigo)
);

create table Anuncio(
codigo int not null,
nombre varchar(100),
tipo int,
titulo varchar(50),
categoria int,
precio int,
primary key(codigo),
constraint c5 foreign key(tipo) references Tipo(codigo),
constraint c6 foreign key (categoria) references Categoria(codigo)
);

create table Web(
nombre varchar(45) not null,
url varchar(100),
topico varchar(50),
primary key(nombre)
);

create table Contrata(
codigo_anuncio int ,
codigo_cliente int,
constraint c7 foreign key(codigo_anuncio) references Anuncio(codigo),
constraint c8 foreign key (codigo_cliente) references Cliente(codigo)
);

create table aparece(
codigo_anuncio int ,
web_nombre varchar(45),
fechaIni date,
fechaFin date,
constraint c8 foreign key(codigo_anuncio) references Anuncio(codigo),
constraint c9 foreign key (web_nombre) references Web(nombre)
);


#ejercicio 3 mueble

create table mueble(
nombre varchar(45) not null,
precio int,
primary key(nombre)
);

create table Pieza(
idPieza int not null,
nombre varchar(45) not null,
primary key(idPieza)
);

create table Almacen(
idAlmacen int not null,
pasillo varchar(45),
altura int,
primary key(idAlmacen)
);

create table parte(
pieza_id int ,
Mueble_nombre varchar(45),
cantidad int,
constraint c9 foreign key(pieza_id) references Pieza(idPieza),
constraint c10 foreign key (Mueble_nombre) references mueble(nombre)
);

create table Almacenada(
pieza_id int ,
Almacen_id int,
cantidad int,
constraint c11 foreign key(pieza_id) references Pieza(idPieza),
constraint c12 foreign key (Almacen_id) references Alacen(idAlmacen)
);

