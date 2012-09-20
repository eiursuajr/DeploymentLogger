
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadUpdateByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadUpdateByPrimaryKey];
GO

CREATE PROCEDURE [LoadUpdateByPrimaryKey]
(
	@UpdateID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UpdateID],
		[Name],
		[Description],
		[UpdateGroupID],
		[ProjectID],
		[UpdateStatusID],
		[EnteredUserID],
		[EnteredDate],
		[BuildNumber],
		[BuildDate]
	FROM [Update]
	WHERE
		([UpdateID] = @UpdateID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadUpdateByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadUpdateByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllUpdate') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllUpdate];
GO

CREATE PROCEDURE [LoadAllUpdate]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UpdateID],
		[Name],
		[Description],
		[UpdateGroupID],
		[ProjectID],
		[UpdateStatusID],
		[EnteredUserID],
		[EnteredDate],
		[BuildNumber],
		[BuildDate]
	FROM [Update]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllUpdate Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllUpdate Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateUpdate') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateUpdate];
GO

CREATE PROCEDURE [UpdateUpdate]
(
	@UpdateID int,
	@Name varchar(8000) = NULL,
	@Description text = NULL,
	@UpdateGroupID int,
	@ProjectID int,
	@UpdateStatusID int,
	@EnteredUserID int,
	@EnteredDate datetime,
	@BuildNumber varchar(50) = NULL,
	@BuildDate datetime
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [Update]
	SET
		[Name] = @Name,
		[Description] = @Description,
		[UpdateGroupID] = @UpdateGroupID,
		[ProjectID] = @ProjectID,
		[UpdateStatusID] = @UpdateStatusID,
		[EnteredUserID] = @EnteredUserID,
		[EnteredDate] = @EnteredDate,
		[BuildNumber] = @BuildNumber,
		[BuildDate] = @BuildDate
	WHERE
		[UpdateID] = @UpdateID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateUpdate Succeeded'
ELSE PRINT 'Procedure Creation: UpdateUpdate Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertUpdate') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertUpdate];
GO

CREATE PROCEDURE [InsertUpdate]
(
	@UpdateID int,
	@Name varchar(8000) = NULL,
	@Description text = NULL,
	@UpdateGroupID int,
	@ProjectID int,
	@UpdateStatusID int,
	@EnteredUserID int,
	@EnteredDate datetime,
	@BuildNumber varchar(50) = NULL,
	@BuildDate datetime
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [Update]
	(
		[UpdateID],
		[Name],
		[Description],
		[UpdateGroupID],
		[ProjectID],
		[UpdateStatusID],
		[EnteredUserID],
		[EnteredDate],
		[BuildNumber],
		[BuildDate]
	)
	VALUES
	(
		@UpdateID,
		@Name,
		@Description,
		@UpdateGroupID,
		@ProjectID,
		@UpdateStatusID,
		@EnteredUserID,
		@EnteredDate,
		@BuildNumber,
		@BuildDate
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertUpdate Succeeded'
ELSE PRINT 'Procedure Creation: InsertUpdate Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteUpdate') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteUpdate];
GO

CREATE PROCEDURE [DeleteUpdate]
(
	@UpdateID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [Update]
	WHERE
		[UpdateID] = @UpdateID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteUpdate Succeeded'
ELSE PRINT 'Procedure Creation: DeleteUpdate Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('[dbo].[LoadAllUpdateByProjectID]') AND sysstat & 0xf = 4)
    DROP PROCEDURE [dbo].[LoadAllUpdateByProjectID]
GO

CREATE PROCEDURE [dbo].[LoadAllUpdateByProjectID]
(
	@ProjectID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		u.[UpdateID],
		u.[Name],
		u.[UpdateGroupID],
		u.[ProjectID],
		u.[UpdateStatusID],
		u.[EnteredUserID],
		u.[EnteredDate],
		u.[BuildNumber],
		u.[BuildDate],
		ug.[Name] AS UpdateGroupName,
		us.[Name] AS UpdateStatusName
	FROM [Update] u
	INNER JOIN UpdateGroup ug
		ON u.UpdateGroupID = ug.UpdateGroupID
	INNER JOIN UpdateStatus us
		ON u.UpdateStatusID = us.UpdateStatusID
	WHERE
		(u.ProjectID = @ProjectID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllUpdateByProjectID Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllUpdateByProjectID Error on Creation'
GO