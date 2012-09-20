
USE [DeploymentLogger_MASTER]
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadDatabaseByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadDatabaseByPrimaryKey];
GO

CREATE PROCEDURE [LoadDatabaseByPrimaryKey]
(
	@DatabaseID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DatabaseID],
		[Name],
		[ConnectionString],
		[Description],
		[IsInactive]
	FROM [Database]
	WHERE
		([DatabaseID] = @DatabaseID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadDatabaseByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadDatabaseByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllDatabase') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllDatabase];
GO

CREATE PROCEDURE [LoadAllDatabase]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DatabaseID],
		[Name],
		[ConnectionString],
		[Description],
		[IsInactive]
	FROM [Database]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllDatabase Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllDatabase Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateDatabase') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateDatabase];
GO

CREATE PROCEDURE [UpdateDatabase]
(
	@DatabaseID int,
	@Name varchar(255),
	@ConnectionString varchar(1024),
	@Description varchar(8000) = NULL,
	@IsInactive bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [Database]
	SET
		[Name] = @Name,
		[ConnectionString] = @ConnectionString,
		[Description] = @Description,
		[IsInactive] = @IsInactive
	WHERE
		[DatabaseID] = @DatabaseID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateDatabase Succeeded'
ELSE PRINT 'Procedure Creation: UpdateDatabase Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertDatabase') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertDatabase];
GO

CREATE PROCEDURE [InsertDatabase]
(
	@DatabaseID int = NULL output,
	@Name varchar(255),
	@ConnectionString varchar(1024),
	@Description varchar(8000) = NULL,
	@IsInactive bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [Database]
	(
		[Name],
		[ConnectionString],
		[Description],
		[IsInactive]
	)
	VALUES
	(
		@Name,
		@ConnectionString,
		@Description,
		@IsInactive
	)

	SET @Err = @@Error

	SELECT @DatabaseID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertDatabase Succeeded'
ELSE PRINT 'Procedure Creation: InsertDatabase Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteDatabase') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteDatabase];
GO

CREATE PROCEDURE [DeleteDatabase]
(
	@DatabaseID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [Database]
	WHERE
		[DatabaseID] = @DatabaseID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteDatabase Succeeded'
ELSE PRINT 'Procedure Creation: DeleteDatabase Error on Creation'
GO
