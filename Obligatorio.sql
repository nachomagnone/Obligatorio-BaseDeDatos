CREATE DATABASE Obligatorio
GO
USE Obligatorio
GO


CREATE TABLE Articulo (

		CodigoArticulo varchar (6) primary key check (len (CodigoArticulo)=6),
		Precio money not null check (Precio >0),
		Descripcion varchar (MAX) not null,

)
GO
CREATE TABLE Categoria (

		CodigoCategoria varchar (3) Primary Key check (len (CodigoCategoria)=3),
		Nombre varchar (50) unique not null,

)
GO

CREATE TABLE Avisos (
		IdAviso int primary key identity(1,1),
		FechaPublicacion SmallDateTime not null check (FechaPublicacion >= getdate()) default getdate(), 
		PrecioBase money not null check (PrecioBase >0),
		CodigoCategoria varchar (3) not null,

				Foreign Key (CodigoCategoria) references Categoria (CodigoCategoria)

)
GO
CREATE TABLE Comun(

		IdAviso Int Primary Key 
				
				Foreign key (IdAviso) references Avisos (IdAviso)
				
)
GO
CREATE TABLE Destacado(

		IdAviso int Primary Key 

				Foreign Key (IdAviso) references Avisos (IdAviso)
)
GO
CREATE TABLE Telefonos (

		IdAviso int,
		Telefono varchar (20) not null ,
		
			Primary Key (IdAviso, Telefono),
			Foreign Key (IdAviso) references Avisos (IdAviso)

)
GO
CREATE TABLE Palabras_Claves (

		IdAviso int,
		PalabrasClaves varchar (200),

			Primary Key (IdAviso, PalabrasClaves),
			Foreign Key (IdAviso) references Comun (IdAviso)

)	
GO

CREATE TABLE Posee (

		IdAviso int,
		CodigoArticulo varchar (6),

			Primary key (IdAviso, CodigoArticulo),
			Foreign Key (IdAviso) references Destacado (IdAviso),
			Foreign Key (CodigoArticulo) references Articulo (Codigoarticulo)
)
GO

INSERT INTO Categoria (CodigoCategoria, Nombre)
	VALUES	('AUT','Automotores'),
			('INM','Inmobiliaria'),
			('COM','Informatica'),
			('JUE','Video Juegos'),
			('CAP','Capacitaciones')

GO

INSERT INTO Articulo (CodigoArticulo, Precio, Descripcion)
VALUES    
				
				('456AAA', 80000, 'Moto Cero KM'),
				('456BBB', 250000, 'Casa Reciclada'),
				('456CCC', 100, 'Mouse Optico'),
				('456DDD', 600, 'Nintendo Switch'),
				('456EEE', 1400, 'Curso Mecanica')

GO

INSERT INTO Avisos (FechaPublicacion, PrecioBase, CodigoCategoria)
VALUES 

					('04/11/2020','100','AUT'),
					('08/11/2020','100','INM'),
					('05/11/2020','120','COM'),
					('06/11/2020','120','JUE'),
					('07/11/2020','140','CAP'),
					('08/11/2020','140','AUT'),
					('09/11/2020','160','INM'),
					('10/11/2020','160','COM'),
					('11/11/2020','180','JUE'),
					('12/11/2020','180','CAP')
GO

INSERT INTO Telefonos (IdAviso,Telefono)

VALUES

					(1,'11111111'),
					(2,'22222222'),
					(3,'33333333'),
					(4,'44444444'),
					(5,'55555555'),
					(6,'66666666'),
					(7,'77777777'),
					(8,'88888888'),
					(9,'99999999'),
					(10,'10101010')
GO

INSERT INTO Comun (IdAviso)
VALUES (1),(3),(5),(7),(9)
GO

INSERT INTO Destacado (IdAviso)
VALUES (2),(4),(6),(8),(10)
GO

INSERT INTO Palabras_Claves (IdAviso, PalabrasClaves)
VALUES
	
					(1,	'Venta Contado'),
					(3,	'Contribucion Cara'),
					(5,	'Modelo 2020'),
					(7,	'No tiene Juegos'),
					(9,	'Presencial')
GO

INSERT INTO Posee (IdAviso, CodigoArticulo)
VALUES
					(2,	'456AAA'),
					(4, '456BBB'),
					(6,	'456CCC'),
					(8,	'456DDD'),
					(10,'456EEE')
GO


