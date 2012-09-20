
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadProjectStatusByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadProjectStatusByPrimaryKey];
GO

CREATE PROCEDURE [LoadProjectStatusByPrimaryKey]
(
	@ProjectStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectStatusID],
		[Name],
		[Description]
	FROM [ProjectStatus]
	WHERE
		([ProjectStatusID] = @ProjectStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadProjectStatusByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadProjectStatusByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllProjectStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllProjectStatus];
GO

CREATE PROCEDURE [LoadAllProjectStatus]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectStatusID],
		[Name],
		[Description]
	FROM [ProjectStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllProjectStatus Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllProjectStatus Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateProjectStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateProjectStatus];
GO

CREATE PROCEDURE [UpdateProjectStatus]
(
	@ProjectStatusID int,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [ProjectStatus]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[ProjectStatusID] = @ProjectStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateProjectStatus Succeeded'
ELSE PRINT 'Procedure Creation: UpdateProjectStatus Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertProjectStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertProjectStatus];
GO

CREATE PROCEDURE [InsertProjectStatus]
(
	@ProjectStatusID int = NULL output,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ProjectStatus]
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

	SELECT @ProjectStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertProjectStatus Succeeded'
ELSE PRINT 'Procedure Creation: InsertProjectStatus Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteProjectStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteProjectStatus];
GO

CREATE PROCEDURE [DeleteProjectStatus]
(
	@ProjectStatusID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ProjectStatus]
	WHERE
		[ProjectStatusID] = @ProjectStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteProjectStatus Succeeded'
ELSE PRINT 'Procedure Creation: DeleteProjectStatus Error on Creation'
GO
