DROP PROCEDURE IF EXISTS Sentimento;
GO

------------------------------------------------------------------------
CREATE PROCEDURE Sentimento

AS 
BEGIN

	SELECT	sentiment_score,
			COUNT(post_id) AS [Número de Posts],
			AVG(likes + shares + comments) AS [Média de Engajamento]
	FROM social_media
	GROUP BY sentiment_score
	ORDER BY [Média de Engajamento] DESC

END;
------------------------------------------------------------------------

-- EXEC Sentimento;
