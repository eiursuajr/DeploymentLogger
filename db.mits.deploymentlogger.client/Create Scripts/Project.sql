IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadProjectByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadProjectByPrimaryKey];
GO

CREATE PROCEDURE [LoadProjectByPrimaryKey]
(
	@ProjectID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectID],
		[ProjectGroupID],
		[Name],
		[Description],
		[StartDate],
		[FinishDate],
		[ProjectStatusID],
		[ProjectCategoryID],
		[PublicName],
		[OrganizationID]
	FROM [Project]
	WHERE
		([ProjectID] = @ProjectID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadProjectByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadProjectByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllProject') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllProject];
GO

CREATE PROCEDURE [LoadAllProject]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectID],
		[ProjectGroupID],
		[Name],
		[Description],
		[StartDate],
		[FinishDate],
		[ProjectStatusID],
		[ProjectCategoryID],
		[PublicName],
		[OrganizationID]
	FROM [Project]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllProject Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllProject Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateProject') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateProject];
GO

CREATE PROCEDURE [UpdateProject]
(
	@ProjectID int,
	@ProjectGroupID int,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL,
	@StartDate datetime = NULL,
	@FinishDate datetime = NULL,
	@ProjectStatusID int,
	@ProjectCategoryID int,
	@PublicName varchar(255) = NULL,
	@OrganizationID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [Project]
	SET
		[ProjectGroupID] = @ProjectGroupID,
		[Name] = @Name,
		[Description] = @Description,
		[StartDate] = @StartDate,
		[FinishDate] = @FinishDate,
		[ProjectStatusID] = @ProjectStatusID,
		[ProjectCategoryID] = @ProjectCategoryID,
		[PublicName] = @PublicName,
		[OrganizationID] = @OrganizationID
	WHERE
		[ProjectID] = @ProjectID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateProject Succeeded'
ELSE PRINT 'Procedure Creation: UpdateProject Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertProject') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertProject];
GO

CREATE PROCEDURE [InsertProject]
(
	@ProjectID int = NULL output,
	@ProjectGroupID int,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL,
	@StartDate datetime = NULL,
	@FinishDate datetime = NULL,
	@ProjectStatusID int,
	@ProjectCategoryID int,
	@PublicName varchar(255) = NULL,
	@OrganizationID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [Project]
	(
		[ProjectGroupID],
		[Name],
		[Description],
		[StartDate],
		[FinishDate],
		[ProjectStatusID],
		[ProjectCategoryID],
		[PublicName],
		[OrganizationID]
	)
	VALUES
	(
		@ProjectGroupID,
		@Name,
		@Description,
		@StartDate,
		@FinishDate,
		@ProjectStatusID,
		@ProjectCategoryID,
		@PublicName,
		@OrganizationID
	)

	SET @Err = @@Error

	SELECT @ProjectID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertProject Succeeded'
ELSE PRINT 'Procedure Creation: InsertProject Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteProject') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteProject];
GO

CREATE PROCEDURE [DeleteProject]
(
	@ProjectID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [Project]
	WHERE
		[ProjectID] = @ProjectID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteProject Succeeded'
ELSE PRINT 'Procedure Creation: DeleteProject Error on Creation'
GO