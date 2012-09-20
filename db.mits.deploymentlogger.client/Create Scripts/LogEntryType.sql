
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadLogEntryTypeByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadLogEntryTypeByPrimaryKey];
GO

CREATE PROCEDURE [LoadLogEntryTypeByPrimaryKey]
(
	@LogEntryTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[LogEntryTypeID],
		[Name],
		[Description]
	FROM [LogEntryType]
	WHERE
		([LogEntryTypeID] = @LogEntryTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadLogEntryTypeByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadLogEntryTypeByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllLogEntryType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllLogEntryType];
GO

CREATE PROCEDURE [LoadAllLogEntryType]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[LogEntryTypeID],
		[Name],
		[Description]
	FROM [LogEntryType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllLogEntryType Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllLogEntryType Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateLogEntryType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateLogEntryType];
GO

CREATE PROCEDURE [UpdateLogEntryType]
(
	@LogEntryTypeID int,
	@Name varchar(255),
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [LogEntryType]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[LogEntryTypeID] = @LogEntryTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateLogEntryType Succeeded'
ELSE PRINT 'Procedure Creation: UpdateLogEntryType Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertLogEntryType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertLogEntryType];
GO

CREATE PROCEDURE [InsertLogEntryType]
(
	@LogEntryTypeID int = NULL output,
	@Name varchar(255),
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [LogEntryType]
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

	SELECT @LogEntryTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertLogEntryType Succeeded'
ELSE PRINT 'Procedure Creation: InsertLogEntryType Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteLogEntryType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteLogEntryType];
GO

CREATE PROCEDURE [DeleteLogEntryType]
(
	@LogEntryTypeID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [LogEntryType]
	WHERE
		[LogEntryTypeID] = @LogEntryTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteLogEntryType Succeeded'
ELSE PRINT 'Procedure Creation: DeleteLogEntryType Error on Creation'
GO
