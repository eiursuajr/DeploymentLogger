
USE [mits_deploymentlogger_client1_beta]
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadImpactLevelByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadImpactLevelByPrimaryKey];
GO

CREATE PROCEDURE [LoadImpactLevelByPrimaryKey]
(
	@ImpactLevelID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ImpactLevelID],
		[Name],
		[Description],
		[Level]
	FROM [ImpactLevel]
	WHERE
		([ImpactLevelID] = @ImpactLevelID)

	SET @Err = @@Error

	RETURN @Err
END
GO


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllImpactLevel') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllImpactLevel];
GO

CREATE PROCEDURE [LoadAllImpactLevel]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ImpactLevelID],
		[Name],
		[Description],
		[Level]
	FROM [ImpactLevel]

	SET @Err = @@Error

	RETURN @Err
END
GO


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateImpactLevel') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateImpactLevel];
GO

CREATE PROCEDURE [UpdateImpactLevel]
(
	@ImpactLevelID int,
	@Name varchar(255),
	@Description varchar(1024) = NULL,
	@Level int = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [ImpactLevel]
	SET
		[Name] = @Name,
		[Description] = @Description,
		[Level] = @Level
	WHERE
		[ImpactLevelID] = @ImpactLevelID


	SET @Err = @@Error


	RETURN @Err
END
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertImpactLevel') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertImpactLevel];
GO

CREATE PROCEDURE [InsertImpactLevel]
(
	@ImpactLevelID int = NULL output,
	@Name varchar(255),
	@Description varchar(1024) = NULL,
	@Level int = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ImpactLevel]
	(
		[Name],
		[Description],
		[Level]
	)
	VALUES
	(
		@Name,
		@Description,
		@Level
	)

	SET @Err = @@Error

	SELECT @ImpactLevelID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteImpactLevel') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteImpactLevel];
GO

CREATE PROCEDURE [DeleteImpactLevel]
(
	@ImpactLevelID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ImpactLevel]
	WHERE
		[ImpactLevelID] = @ImpactLevelID
	SET @Err = @@Error

	RETURN @Err
END
GO

