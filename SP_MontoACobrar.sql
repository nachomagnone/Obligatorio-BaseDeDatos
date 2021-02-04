USE Obligatorio
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SP_MontoACobrar')
	DROP PROC SP_MontoACobrar
GO
CREATE PROC SP_MontoACobrar

AS
	SELECT FechaPublicacion 'Fecha de Publicación', SUM (PrecioBase)'Monto a Cobrar' FROM Avisos GROUP BY FechaPublicacion
GO

EXECUTE SP_MontoACobrar
GO
