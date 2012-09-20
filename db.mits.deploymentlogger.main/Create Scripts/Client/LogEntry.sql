IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadLogEntryByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadLogEntryByPrimaryKey];
GO

CREATE PROCEDURE [LoadLogEntryByPrimaryKey]
(
	@LogEntryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[LogEntryID],
		[TimeStamp],
		[Header],
		[Description],
		[LogEntryTypeID],
		[UpdateID],
		[ProjectID],
		[LogEntryStatusID],
		[PublicDescription],
		[PublicHeader]
	FROM [LogEntry]
	WHERE
		([LogEntryID] = @LogEntryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadLogEntryByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadLogEntryByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllLogEntry') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllLogEntry];
GO

CREATE PROCEDURE [LoadAllLogEntry]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[LogEntryID],
		[TimeStamp],
		[Header],
		[Description],
		[LogEntryTypeID],
		[UpdateID],
		[ProjectID],
		[LogEntryStatusID],
		[PublicDescription],
		[PublicHeader]
	FROM [LogEntry]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllLogEntry Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllLogEntry Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateLogEntry') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateLogEntry];
GO

CREATE PROCEDURE [UpdateLogEntry]
(
	@LogEntryID int,
	@TimeStamp datetime,
	@Header varchar(8000),
	@Description text = NULL,
	@LogEntryTypeID int,
	@UpdateID int = NULL,
	@ProjectID int,
	@LogEntryStatusID int = NULL,
	@PublicDescription text = NULL,
	@PublicHeader varchar(8000) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [LogEntry]
	SET
		[TimeStamp] = @TimeStamp,
		[Header] = @Header,
		[Description] = @Description,
		[LogEntryTypeID] = @LogEntryTypeID,
		[UpdateID] = @UpdateID,
		[ProjectID] = @ProjectID,
		[LogEntryStatusID] = @LogEntryStatusID,
		[PublicDescription] = @PublicDescription,
		[PublicHeader] = @PublicHeader
	WHERE
		[LogEntryID] = @LogEntryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateLogEntry Succeeded'
ELSE PRINT 'Procedure Creation: UpdateLogEntry Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertLogEntry') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertLogEntry];
GO

CREATE PROCEDURE [InsertLogEntry]
(
	@LogEntryID int = NULL output,
	@TimeStamp datetime,
	@Header varchar(8000),
	@Description text = NULL,
	@LogEntryTypeID int,
	@UpdateID int = NULL,
	@ProjectID int,
	@LogEntryStatusID int = NULL,
	@PublicDescription text = NULL,
	@PublicHeader varchar(8000) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [LogEntry]
	(
		[TimeStamp],
		[Header],
		[Description],
		[LogEntryTypeID],
		[UpdateID],
		[ProjectID],
		[LogEntryStatusID],
		[PublicDescription],
		[PublicHeader]
	)
	VALUES
	(
		@TimeStamp,
		@Header,
		@Description,
		@LogEntryTypeID,
		@UpdateID,
		@ProjectID,
		@LogEntryStatusID,
		@PublicDescription,
		@PublicHeader
	)

	SET @Err = @@Error

	SELECT @LogEntryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertLogEntry Succeeded'
ELSE PRINT 'Procedure Creation: InsertLogEntry Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteLogEntry') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteLogEntry];
GO

CREATE PROCEDURE [DeleteLogEntry]
(
	@LogEntryID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [LogEntry]
	WHERE
		[LogEntryID] = @LogEntryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteLogEntry Succeeded'
ELSE PRINT 'Procedure Creation: DeleteLogEntry Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('[dbo].[LoadAllLogEntryByUpdateID]') AND sysstat & 0xf = 4)
    DROP PROCEDURE [dbo].[LoadAllLogEntryByUpdateID]
GO

CREATE PROCEDURE [dbo].[LoadAllLogEntryByUpdateID]
(
	@UpdateID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		le.[LogEntryID],
		le.[TimeStamp],
		le.[Description],
		le.[Header],
		le.[UpdateID],
		let.[Name] AS LogEntryTypeName,
		les.[Name] AS LogEntryStatusName
	FROM [LogEntry] le
	INNER JOIN LogEntryType let
		ON le.LogEntryTypeID = let.LogEntryTypeID
	INNER JOIN LogEntryStatus les
		ON le.LogEntryStatusID = les.LogEntryStatusID
	WHERE
		le.[UpdateID] = @UpdateID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllLogEntryByUpdateID Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllLogEntryByUpdateID Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('[dbo].[LoadAllPendingLogEntryByProjectID]') AND sysstat & 0xf = 4)
    DROP PROCEDURE [dbo].[LoadAllPendingLogEntryByProjectID]
GO

CREATE PROCEDURE [dbo].[LoadAllPendingLogEntryByProjectID]
(
	@ProjectID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		le.[LogEntryID],
		le.[TimeStamp],
		le.[Description],
		le.[Header],
		le.[UpdateID],
		let.[Name] AS LogEntryTypeName,
		les.[Name] AS LogEntryStatusName
	FROM [LogEntry] le
	INNER JOIN LogEntryType let
		ON le.LogEntryTypeID = let.LogEntryTypeID
	INNER JOIN LogEntryStatus les
		ON le.LogEntryStatusID = les.LogEntryStatusID
	WHERE
		le.ProjectID = @ProjectID AND
		UpdateID IS NULL

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllPendingLogEntryByProjectID Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllPendingLogEntryByProjectID Error on Creation'
GO