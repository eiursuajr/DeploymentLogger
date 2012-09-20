
USE [mits_deploymentlogger_client1_beta]
GO

ALTER PROCEDURE [LoadLogEntryByPrimaryKey]
(
	@LogEntryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[Description],
		[Header],
		[LogEntryID],
		[LogEntryTypeID],
		[ProjectID],
		[PublicDescription],
		[PublicHeader],
		[TimeStamp],
		[UpdateID],
		[LogEntryStatusID],
		[ProjectSectionID],
		[ImpactLevelID]
	FROM [LogEntry]
	WHERE
		([LogEntryID] = @LogEntryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


ALTER PROCEDURE [LoadAllLogEntry]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[Description],
		[Header],
		[LogEntryID],
		[LogEntryTypeID],
		[ProjectID],
		[PublicDescription],
		[PublicHeader],
		[TimeStamp],
		[UpdateID],
		[LogEntryStatusID],
		[ProjectSectionID],
		[ImpactLevelID]
	FROM [LogEntry]

	SET @Err = @@Error

	RETURN @Err
END
GO


ALTER PROCEDURE [UpdateLogEntry]
(
	@Description text = NULL,
	@Header varchar(8000),
	@LogEntryID int,
	@LogEntryTypeID int,
	@ProjectID int,
	@PublicDescription text = NULL,
	@PublicHeader varchar(8000) = NULL,
	@TimeStamp datetime,
	@UpdateID int = NULL,
	@LogEntryStatusID int = NULL,
	@ProjectSectionID int = NULL,
	@ImpactLevelID int = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [LogEntry]
	SET
		[Description] = @Description,
		[Header] = @Header,
		[LogEntryTypeID] = @LogEntryTypeID,
		[ProjectID] = @ProjectID,
		[PublicDescription] = @PublicDescription,
		[PublicHeader] = @PublicHeader,
		[TimeStamp] = @TimeStamp,
		[UpdateID] = @UpdateID,
		[LogEntryStatusID] = @LogEntryStatusID,
		[ProjectSectionID] = @ProjectSectionID,
		[ImpactLevelID] = @ImpactLevelID
	WHERE
		[LogEntryID] = @LogEntryID


	SET @Err = @@Error


	RETURN @Err
END
GO




ALTER PROCEDURE [InsertLogEntry]
(
	@Description text = NULL,
	@Header varchar(8000),
	@LogEntryID int = NULL output,
	@LogEntryTypeID int,
	@ProjectID int,
	@PublicDescription text = NULL,
	@PublicHeader varchar(8000) = NULL,
	@TimeStamp datetime,
	@UpdateID int = NULL,
	@LogEntryStatusID int = NULL,
	@ProjectSectionID int = NULL,
	@ImpactLevelID int = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [LogEntry]
	(
		[Description],
		[Header],
		[LogEntryTypeID],
		[ProjectID],
		[PublicDescription],
		[PublicHeader],
		[TimeStamp],
		[UpdateID],
		[LogEntryStatusID],
		[ProjectSectionID],
		[ImpactLevelID]
	)
	VALUES
	(
		@Description,
		@Header,
		@LogEntryTypeID,
		@ProjectID,
		@PublicDescription,
		@PublicHeader,
		@TimeStamp,
		@UpdateID,
		@LogEntryStatusID,
		@ProjectSectionID,
		@ImpactLevelID
	)

	SET @Err = @@Error

	SELECT @LogEntryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


ALTER PROCEDURE [DeleteLogEntry]
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

