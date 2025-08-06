DROP PROCEDURE IF EXISTS Performance_Especifica;
GO

------------------------------------------------------------------------
CREATE PROCEDURE Performance_Especifica

@Plataforma VARCHAR(15) = NULL,
@TipoPost	VARCHAR(10) = NULL,
@DiaSemana	VARCHAR(10) = NULL,
@Sentimento	VARCHAR(10) = NULL

AS
BEGIN

	SELECT	platform,
			post_type,
			post_day,
			sentiment_score,
			COUNT(post_id)	AS [Quantidade de Posts],
			AVG(likes)		AS [Média Likes],
			AVG(comments)	AS [Média Comentários],
			AVG(shares)		AS [Média Compartilhamentos],
			AVG(likes + comments + shares) AS [Média Engajamento]
	FROM social_media
	WHERE	(@Plataforma	IS NULL OR platform			= @Plataforma)
	AND		(@TipoPost		IS NULL OR post_type		= @TipoPost)
	AND		(@DiaSemana		IS NULL OR post_day			= @DiaSemana)
	AND		(@Sentimento	IS NULL OR sentiment_score	= @Sentimento)
	GROUP BY platform, post_type, post_day, sentiment_score
	ORDER BY [Média Engajamento] DESC

END;
------------------------------------------------------------------------
-- EXEC Performance_Especifica @Sentimento = 'positive', @DiaSemana = 'friday';

