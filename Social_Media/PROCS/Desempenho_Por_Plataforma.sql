DROP PROCEDURE IF EXISTS Desempenho_Plataforma;
GO

------------------------------------------------------------------------
CREATE PROCEDURE Desempenho_Plataforma

AS 
BEGIN 

	SELECT	platform,
			SUM(likes) AS [Total likes],
			SUM(comments) AS [Total Comentários],
			SUM(shares) AS [Total Compartilhamentos],
			SUM(likes + comments + shares) AS [Engajamento Total]
	FROM social_media
	GROUP BY platform
	ORDER BY [Total likes] DESC

END;
------------------------------------------------------------------------

-- EXEC Desempenho_Plataforma;

