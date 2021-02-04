USE Obligatorio
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SP_TotalAvisosPorCategoria')
	DROP PROC SP_TotalAvisosPorCategoria
GO
CREATE PROC SP_TotalAvisosPorCategoria

AS
	SELECT  C.CodigoCategoria 'C�digo Categor�a', Nombre 'Nombre Categor�a', COUNT(*) 'Cantidad Avisos'
	FROM Avisos inner join Categoria as C on  C.CodigoCategoria = Avisos.CodigoCategoria
	GROUP BY C.CodigoCategoria, Nombre

	
	
GO


EXECUTE SP_TotalAvisosPorCategoria
GO