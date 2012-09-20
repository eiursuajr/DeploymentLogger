
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadLogEntryStatusNotificationTypeByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadLogEntryStatusNotificationTypeByPrimaryKey];
GO

CREATE PROCEDURE [LoadLogEntryStatusNotificationTypeByPrimaryKey]
(
	@LogEntryStatusID int,
	@NotificationTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[LogEntryStatusID],
		[NotificationTypeID]
	FROM [LogEntryStatusNotificationType]
	WHERE
		([LogEntryStatusID] = @LogEntryStatusID) AND
		([NotificationTypeID] = @NotificationTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadLogEntryStatusNotificationTypeByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadLogEntryStatusNotificationTypeByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllLogEntryStatusNotificationType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllLogEntryStatusNotificationType];
GO

CREATE PROCEDURE [LoadAllLogEntryStatusNotificationType]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[LogEntryStatusID],
		[NotificationTypeID]
	FROM [LogEntryStatusNotificationType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllLogEntryStatusNotificationType Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllLogEntryStatusNotificationType Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertLogEntryStatusNotificationType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertLogEntryStatusNotificationType];
GO

CREATE PROCEDURE [InsertLogEntryStatusNotificationType]
(
	@LogEntryStatusID int,
	@NotificationTypeID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [LogEntryStatusNotificationType]
	(
		[LogEntryStatusID],
		[NotificationTypeID]
	)
	VALUES
	(
		@LogEntryStatusID,
		@NotificationTypeID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertLogEntryStatusNotificationType Succeeded'
ELSE PRINT 'Procedure Creation: InsertLogEntryStatusNotificationType Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteLogEntryStatusNotificationType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteLogEntryStatusNotificationType];
GO

CREATE PROCEDURE [DeleteLogEntryStatusNotificationType]
(
	@LogEntryStatusID int,
	@NotificationTypeID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [LogEntryStatusNotificationType]
	WHERE
		[LogEntryStatusID] = @LogEntryStatusID AND
		[NotificationTypeID] = @NotificationTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteLogEntryStatusNotificationType Succeeded'
ELSE PRINT 'Procedure Creation: DeleteLogEntryStatusNotificationType Error on Creation'
GO
