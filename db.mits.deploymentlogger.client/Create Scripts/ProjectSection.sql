IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadProjectSectionByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadProjectSectionByPrimaryKey];
GO

CREATE PROCEDURE [LoadProjectSectionByPrimaryKey]
(
	@ProjectSectionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectSectionID],
		[ProjectID],
		[Name],
		[Description]
	FROM [ProjectSection]
	WHERE
		([ProjectSectionID] = @ProjectSectionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadProjectSectionByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadProjectSectionByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllProjectSection') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllProjectSection];
GO

CREATE PROCEDURE [LoadAllProjectSection]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectSectionID],
		[ProjectID],
		[Name],
		[Description]
	FROM [ProjectSection]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllProjectSection Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllProjectSection Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateProjectSection') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateProjectSection];
GO

CREATE PROCEDURE [UpdateProjectSection]
(
	@ProjectSectionID int,
	@ProjectID int,
	@Name varchar(255),
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [ProjectSection]
	SET
		[ProjectID] = @ProjectID,
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[ProjectSectionID] = @ProjectSectionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateProjectSection Succeeded'
ELSE PRINT 'Procedure Creation: UpdateProjectSection Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertProjectSection') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertProjectSection];
GO

CREATE PROCEDURE [InsertProjectSection]
(
	@ProjectSectionID int = NULL output,
	@ProjectID int,
	@Name varchar(255),
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ProjectSection]
	(
		[ProjectID],
		[Name],
		[Description]
	)
	VALUES
	(
		@ProjectID,
		@Name,
		@Description
	)

	SET @Err = @@Error

	SELECT @ProjectSectionID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertProjectSection Succeeded'
ELSE PRINT 'Procedure Creation: InsertProjectSection Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteProjectSection') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteProjectSection];
GO

CREATE PROCEDURE [DeleteProjectSection]
(
	@ProjectSectionID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ProjectSection]
	WHERE
		[ProjectSectionID] = @ProjectSectionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteProjectSection Succeeded'
ELSE PRINT 'Procedure Creation: DeleteProjectSection Error on Creation'
GO