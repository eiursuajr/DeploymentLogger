
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadProjectCategoryByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadProjectCategoryByPrimaryKey];
GO

CREATE PROCEDURE [LoadProjectCategoryByPrimaryKey]
(
	@ProjectCategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectCategoryID],
		[Name],
		[Description]
	FROM [ProjectCategory]
	WHERE
		([ProjectCategoryID] = @ProjectCategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadProjectCategoryByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadProjectCategoryByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllProjectCategory') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllProjectCategory];
GO

CREATE PROCEDURE [LoadAllProjectCategory]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectCategoryID],
		[Name],
		[Description]
	FROM [ProjectCategory]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllProjectCategory Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllProjectCategory Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateProjectCategory') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateProjectCategory];
GO

CREATE PROCEDURE [UpdateProjectCategory]
(
	@ProjectCategoryID int,
	@Name varchar(255),
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [ProjectCategory]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[ProjectCategoryID] = @ProjectCategoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateProjectCategory Succeeded'
ELSE PRINT 'Procedure Creation: UpdateProjectCategory Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertProjectCategory') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertProjectCategory];
GO

CREATE PROCEDURE [InsertProjectCategory]
(
	@ProjectCategoryID int = NULL output,
	@Name varchar(255),
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ProjectCategory]
	(
		[Name],
		[Description]
	)
	VALUES
	(
		@Name,
		@Description
	)

	SET @Err = @@Error

	SELECT @ProjectCategoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertProjectCategory Succeeded'
ELSE PRINT 'Procedure Creation: InsertProjectCategory Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteProjectCategory') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteProjectCategory];
GO

CREATE PROCEDURE [DeleteProjectCategory]
(
	@ProjectCategoryID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ProjectCategory]
	WHERE
		[ProjectCategoryID] = @ProjectCategoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteProjectCategory Succeeded'
ELSE PRINT 'Procedure Creation: DeleteProjectCategory Error on Creation'
GO
