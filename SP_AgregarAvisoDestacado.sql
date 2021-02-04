USE Obligatorio
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SP_AgregarAvisoDestacado')
	DROP PROC SP_AgregarAvisoDestacado
GO
CREATE PROC SP_AgregarAvisoDestacado
@CodigoCategoria varchar (3), @FechaPublicacion SmallDateTime, @PrecioBase money,
@Telefono varchar (20), @CodigoArticulo varchar (6), @Precio int , @Descripcion varchar (MAX)

AS

			IF Not Exists (SELECT * FROM Categoria WHERE CodigoCategoria = @CodigoCategoria)
			BEGIN
			print 'La categoria para ingresar el Aviso no existe'
			Return -1
			END
			
			IF exists (SELECT * FROM Articulo WHERE CodigoArticulo = @CodigoArticulo)
			BEGIN
			Print 'El Articulo ya se encuentra publicado en otro Aviso'
			Return -2
			END
						
			BEGIN TRY
				declare @IdNuevoAviso int
				BEGIN TRANSACTION 
					INSERT INTO Articulo (CodigoArticulo, Precio, Descripcion)
						VALUES (@CodigoArticulo, @Precio, @Descripcion)

					INSERT INTO Avisos (FechaPublicacion, PrecioBase, CodigoCategoria)
						VALUES (@FechaPublicacion, @PrecioBase, @CodigoCategoria)
					SET @IdNuevoAviso = @@IDENTITY
					INSERT INTO Destacado (IdAviso)
						VALUES (@IdNuevoAviso)
					
					INSERT INTO Telefonos (IdAviso,Telefono)
						VALUES (@IdNuevoAviso, @Telefono)
					
					INSERT INTO Posee (IdAviso, CodigoArticulo)
						VALUES (@IdNuevoAviso, @CodigoArticulo)

						

				COMMIT Transaction
				RETURN @IdNuevoAviso
			END TRY

			BEGIN CATCH
					RollBack Transaction
					Return @@Error
			END CATCH
GO

-------------------------------------------------------------------------------
--EXECUTE 

declare @r int
EXECUTE @r = SP_AgregarAvisoDestacado 'INM', '11-10-2020 19:00:00', 160, '87546985', '999AAA', 1200, ' Mono Ambiente'
SELECT @r
GO

----------------------------------------------------------------------------------


