USE Obligatorio
GO

IF EXISTS (SELECT * FROM sysobjects WHERE name = 'SP_TotalAvisosPeriodo')
	DROP PROC SP_TotalAvisosPeriodo
GO
CREATE PROC SP_TotalAvisosPeriodo
		@inicio smalldatetime, @fin smalldatetime, @cantidad int out

 AS 
 Select @cantidad = count (*) FROM Avisos  WHERE FechaPublicacion between @inicio and @fin 
 GO


 --------------------------------------------------------

-- EXECUTE

DECLARE @cant int 
EXEC SP_TotalAvisosPeriodo '11/11/2020', '15/11/2020', @cant out
SELECT @cant as 'Total de avisos'

--------------------------------------------------------
