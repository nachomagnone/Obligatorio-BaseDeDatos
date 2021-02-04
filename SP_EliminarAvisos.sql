USE Obligatorio
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SP_EliminarAviso') 
	DROP PROC SP_EliminarAviso
GO

CREATE PROCEDURE SP_EliminarAviso
		@IdAviso int
AS
	BEGIN TRY
		IF NOT EXISTS (SELECT * FROM Avisos WHERE IdAviso = @IdAviso)
			return -1
	
	BEGIN TRANSACTION

		IF EXISTS (SELECT * FROM Posee WHERE IdAviso = @IdAviso)
		DELETE Posee WHERE IdAviso = @IdAviso
		DELETE Articulo WHERE CodigoArticulo NOT IN (SELECT CodigoArticulo FROM Posee)
		IF EXISTS (SELECT * FROM Palabras_Claves WHERE IdAviso = @IdAviso)
		DELETE Palabras_Claves WHERE IdAviso = @IdAviso
		DELETE Destacado WHERE IdAviso = @IdAviso
		DELETE Comun WHERE IdAViso = @IdAviso
		DELETE Telefonos WHERE IdAviso = @IdAviso		
		DELETE Avisos WHERE IdAviso = @IdAviso
		DELETE Articulo WHERE CodigoArticulo NOT IN (SELECT CodigoArticulo FROM Posee)
		DELETE Palabras_Claves WHERE IdAviso = @IdAviso
				
	COMMIT TRANSACTION
	return 1
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION
		return -2
	END CATCH

GO

-----------------------------------------------------------------
--EXECUTE

declare @id int, @r int
set @Id = 2

exec @r = SP_EliminarAviso @id

SELECT @r
--print @r


