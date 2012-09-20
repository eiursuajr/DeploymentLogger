
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadLogEntryStatusByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadLogEntryStatusByPrimaryKey];
GO

CREATE PROCEDURE [LoadLogEntryStatusByPrimaryKey]
(
	@LogEntryStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[LogEntryStatusID],
		[Name],
		[Description]
	FROM [LogEntryStatus]
	WHERE
		([LogEntryStatusID] = @LogEntryStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadLogEntryStatusByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadLogEntryStatusByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllLogEntryStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllLogEntryStatus];
GO

CREATE PROCEDURE [LoadAllLogEntryStatus]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[LogEntryStatusID],
		[Name],
		[Description]
	FROM [LogEntryStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllLogEntryStatus Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllLogEntryStatus Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateLogEntryStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateLogEntryStatus];
GO

CREATE PROCEDURE [UpdateLogEntryStatus]
(
	@LogEntryStatusID int,
	@Name varchar(1024),
	@Description varchar(8000) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [LogEntryStatus]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[LogEntryStatusID] = @LogEntryStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateLogEntryStatus Succeeded'
ELSE PRINT 'Procedure Creation: UpdateLogEntryStatus Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertLogEntryStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertLogEntryStatus];
GO

CREATE PROCEDURE [InsertLogEntryStatus]
(
	@LogEntryStatusID int = NULL output,
	@Name varchar(1024),
	@Description varchar(8000) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [LogEntryStatus]
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

	SELECT @LogEntryStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertLogEntryStatus Succeeded'
ELSE PRINT 'Procedure Creation: InsertLogEntryStatus Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteLogEntryStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteLogEntryStatus];
GO

CREATE PROCEDURE [DeleteLogEntryStatus]
(
	@LogEntryStatusID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [LogEntryStatus]
	WHERE
		[LogEntryStatusID] = @LogEntryStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteLogEntryStatus Succeeded'
ELSE PRINT 'Procedure Creation: DeleteLogEntryStatus Error on Creation'
GO
