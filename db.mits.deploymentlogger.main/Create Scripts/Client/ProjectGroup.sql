
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadProjectGroupByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadProjectGroupByPrimaryKey];
GO

CREATE PROCEDURE [LoadProjectGroupByPrimaryKey]
(
	@ProjectGroupID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectGroupID],
		[Name],
		[Description]
	FROM [ProjectGroup]
	WHERE
		([ProjectGroupID] = @ProjectGroupID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadProjectGroupByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadProjectGroupByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllProjectGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllProjectGroup];
GO

CREATE PROCEDURE [LoadAllProjectGroup]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectGroupID],
		[Name],
		[Description]
	FROM [ProjectGroup]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllProjectGroup Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllProjectGroup Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateProjectGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateProjectGroup];
GO

CREATE PROCEDURE [UpdateProjectGroup]
(
	@ProjectGroupID int,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [ProjectGroup]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[ProjectGroupID] = @ProjectGroupID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateProjectGroup Succeeded'
ELSE PRINT 'Procedure Creation: UpdateProjectGroup Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertProjectGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertProjectGroup];
GO

CREATE PROCEDURE [InsertProjectGroup]
(
	@ProjectGroupID int = NULL output,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ProjectGroup]
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

	SELECT @ProjectGroupID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertProjectGroup Succeeded'
ELSE PRINT 'Procedure Creation: InsertProjectGroup Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteProjectGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteProjectGroup];
GO

CREATE PROCEDURE [DeleteProjectGroup]
(
	@ProjectGroupID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ProjectGroup]
	WHERE
		[ProjectGroupID] = @ProjectGroupID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteProjectGroup Succeeded'
ELSE PRINT 'Procedure Creation: DeleteProjectGroup Error on Creation'
GO
