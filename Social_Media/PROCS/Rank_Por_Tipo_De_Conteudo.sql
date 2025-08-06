DROP PROCEDURE IF EXISTS TipoDeConteudo;
GO
------------------------------------------------------------------------
CREATE PROCEDURE TipoDeConteudo

@Plataforma VARCHAR(15) = NULL,
@Dia		VARCHAR(10) = NULL

AS
BEGIN

	SELECT	post_type,
			platform,
			AVG(likes + comments + shares) AS [Média de Engajamento],
			post_day
	FROM social_media
	WHERE	(@Plataforma	IS NULL OR platform = @Plataforma)
	AND		(@Dia			IS NULL OR post_day = @Dia)
	GROUP BY post_type, platform, post_day
	ORDER BY [Média de Engajamento] DESC
	
END;
------------------------------------------------------------------------
-- EXEC TipoDeConteudo 'facebook', 'monday';

