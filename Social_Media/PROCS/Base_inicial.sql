DROP PROCEDURE IF EXISTS BaseInicial;
GO

----------------------------------------------------------------------------
CREATE PROCEDURE BaseInicial

@Plataforma	VARCHAR(15) = NULL,
@Likes		INT			= NULL

AS
BEGIN

	SELECT * 
	FROM social_media
	WHERE	(@Plataforma IS NULL OR platform = @Plataforma)
	AND		(@Likes IS NULL OR likes >= @Likes)
	ORDER BY likes DESC

END;
----------------------------------------------------------------------------

-- EXEC BaseInicial 'facebook', 200;

