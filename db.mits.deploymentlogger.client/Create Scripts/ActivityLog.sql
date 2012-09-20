
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadActivityLogByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadActivityLogByPrimaryKey];
GO

CREATE PROCEDURE [LoadActivityLogByPrimaryKey]
(
	@ActivityLogID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ActivityLogID],
		[ActivityTypeID],
		[ObjectID],
		[ObjectReferenceID],
		[UserID],
		[UserName],
		[Description],
		[DateLog]
	FROM [ActivityLog]
	WHERE
		([ActivityLogID] = @ActivityLogID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadActivityLogByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadActivityLogByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllActivityLog') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllActivityLog];
GO

CREATE PROCEDURE [LoadAllActivityLog]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ActivityLogID],
		[ActivityTypeID],
		[ObjectID],
		[ObjectReferenceID],
		[UserID],
		[UserName],
		[Description],
		[DateLog]
	FROM [ActivityLog]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllActivityLog Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllActivityLog Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateActivityLog') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateActivityLog];
GO

CREATE PROCEDURE [UpdateActivityLog]
(
	@ActivityLogID int,
	@ActivityTypeID int,
	@ObjectID int = NULL,
	@ObjectReferenceID int = NULL,
	@UserID int,
	@UserName varchar(100),
	@Description varchar(8000) = NULL,
	@DateLog datetime
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [ActivityLog]
	SET
		[ActivityTypeID] = @ActivityTypeID,
		[ObjectID] = @ObjectID,
		[ObjectReferenceID] = @ObjectReferenceID,
		[UserID] = @UserID,
		[UserName] = @UserName,
		[Description] = @Description,
		[DateLog] = @DateLog
	WHERE
		[ActivityLogID] = @ActivityLogID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateActivityLog Succeeded'
ELSE PRINT 'Procedure Creation: UpdateActivityLog Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertActivityLog') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertActivityLog];
GO

CREATE PROCEDURE [InsertActivityLog]
(
	@ActivityLogID int = NULL output,
	@ActivityTypeID int,
	@ObjectID int = NULL,
	@ObjectReferenceID int = NULL,
	@UserID int,
	@UserName varchar(100),
	@Description varchar(8000) = NULL,
	@DateLog datetime
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ActivityLog]
	(
		[ActivityTypeID],
		[ObjectID],
		[ObjectReferenceID],
		[UserID],
		[UserName],
		[Description],
		[DateLog]
	)
	VALUES
	(
		@ActivityTypeID,
		@ObjectID,
		@ObjectReferenceID,
		@UserID,
		@UserName,
		@Description,
		getdate()
	)

	SET @Err = @@Error

	SELECT @ActivityLogID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertActivityLog Succeeded'
ELSE PRINT 'Procedure Creation: InsertActivityLog Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteActivityLog') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteActivityLog];
GO

CREATE PROCEDURE [DeleteActivityLog]
(
	@ActivityLogID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ActivityLog]
	WHERE
		[ActivityLogID] = @ActivityLogID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteActivityLog Succeeded'
ELSE PRINT 'Procedure Creation: DeleteActivityLog Error on Creation'
GO
