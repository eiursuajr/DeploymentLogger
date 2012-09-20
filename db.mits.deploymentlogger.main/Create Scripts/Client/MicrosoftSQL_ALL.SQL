
USE [DeploymentLogger]
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAddressBookByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAddressBookByPrimaryKey];
GO

CREATE PROCEDURE [LoadAddressBookByPrimaryKey]
(
	@EntryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[EntryID],
		[FirstName],
		[LastName],
		[MiddleName],
		[HomePhone],
		[WorkPhone],
		[PrimaryEmail],
		[SecondaryEmail],
		[UserID],
		[IsShared]
	FROM [AddressBook]
	WHERE
		([EntryID] = @EntryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAddressBookByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadAddressBookByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllAddressBook') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllAddressBook];
GO

CREATE PROCEDURE [LoadAllAddressBook]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[EntryID],
		[FirstName],
		[LastName],
		[MiddleName],
		[HomePhone],
		[WorkPhone],
		[PrimaryEmail],
		[SecondaryEmail],
		[UserID],
		[IsShared]
	FROM [AddressBook]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllAddressBook Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllAddressBook Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateAddressBook') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateAddressBook];
GO

CREATE PROCEDURE [UpdateAddressBook]
(
	@EntryID int,
	@FirstName varchar(255),
	@LastName varchar(255) = NULL,
	@MiddleName varchar(50) = NULL,
	@HomePhone varchar(50) = NULL,
	@WorkPhone varchar(50) = NULL,
	@PrimaryEmail varchar(50),
	@SecondaryEmail varchar(50) = NULL,
	@UserID int = NULL,
	@IsShared bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [AddressBook]
	SET
		[FirstName] = @FirstName,
		[LastName] = @LastName,
		[MiddleName] = @MiddleName,
		[HomePhone] = @HomePhone,
		[WorkPhone] = @WorkPhone,
		[PrimaryEmail] = @PrimaryEmail,
		[SecondaryEmail] = @SecondaryEmail,
		[UserID] = @UserID,
		[IsShared] = @IsShared
	WHERE
		[EntryID] = @EntryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateAddressBook Succeeded'
ELSE PRINT 'Procedure Creation: UpdateAddressBook Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertAddressBook') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertAddressBook];
GO

CREATE PROCEDURE [InsertAddressBook]
(
	@EntryID int = NULL output,
	@FirstName varchar(255),
	@LastName varchar(255) = NULL,
	@MiddleName varchar(50) = NULL,
	@HomePhone varchar(50) = NULL,
	@WorkPhone varchar(50) = NULL,
	@PrimaryEmail varchar(50),
	@SecondaryEmail varchar(50) = NULL,
	@UserID int = NULL,
	@IsShared bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [AddressBook]
	(
		[FirstName],
		[LastName],
		[MiddleName],
		[HomePhone],
		[WorkPhone],
		[PrimaryEmail],
		[SecondaryEmail],
		[UserID],
		[IsShared]
	)
	VALUES
	(
		@FirstName,
		@LastName,
		@MiddleName,
		@HomePhone,
		@WorkPhone,
		@PrimaryEmail,
		@SecondaryEmail,
		@UserID,
		@IsShared
	)

	SET @Err = @@Error

	SELECT @EntryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertAddressBook Succeeded'
ELSE PRINT 'Procedure Creation: InsertAddressBook Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteAddressBook') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteAddressBook];
GO

CREATE PROCEDURE [DeleteAddressBook]
(
	@EntryID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [AddressBook]
	WHERE
		[EntryID] = @EntryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteAddressBook Succeeded'
ELSE PRINT 'Procedure Creation: DeleteAddressBook Error on Creation'
GO

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
		[LogEntryStatusID]
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
		[LogEntryStatusID]
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
	@LogEntryStatusID int
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
		[LogEntryStatusID] = @LogEntryStatusID
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
	@LogEntryStatusID int
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
		[LogEntryStatusID]
	)
	VALUES
	(
		@TimeStamp,
		@Header,
		@Description,
		@LogEntryTypeID,
		@UpdateID,
		@ProjectID,
		@LogEntryStatusID
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

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadNotificationByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadNotificationByPrimaryKey];
GO

CREATE PROCEDURE [LoadNotificationByPrimaryKey]
(
	@NotificationTypeID int,
	@RoleID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[NotificationTypeID],
		[RoleID]
	FROM [Notification]
	WHERE
		([NotificationTypeID] = @NotificationTypeID) AND
		([RoleID] = @RoleID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadNotificationByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadNotificationByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllNotification') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllNotification];
GO

CREATE PROCEDURE [LoadAllNotification]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[NotificationTypeID],
		[RoleID]
	FROM [Notification]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllNotification Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllNotification Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertNotification') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertNotification];
GO

CREATE PROCEDURE [InsertNotification]
(
	@NotificationTypeID int,
	@RoleID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [Notification]
	(
		[NotificationTypeID],
		[RoleID]
	)
	VALUES
	(
		@NotificationTypeID,
		@RoleID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertNotification Succeeded'
ELSE PRINT 'Procedure Creation: InsertNotification Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteNotification') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteNotification];
GO

CREATE PROCEDURE [DeleteNotification]
(
	@NotificationTypeID int,
	@RoleID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [Notification]
	WHERE
		[NotificationTypeID] = @NotificationTypeID AND
		[RoleID] = @RoleID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteNotification Succeeded'
ELSE PRINT 'Procedure Creation: DeleteNotification Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadNotificationTypeByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadNotificationTypeByPrimaryKey];
GO

CREATE PROCEDURE [LoadNotificationTypeByPrimaryKey]
(
	@NotificationTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[NotificationTypeID],
		[Name],
		[Description]
	FROM [NotificationType]
	WHERE
		([NotificationTypeID] = @NotificationTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadNotificationTypeByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadNotificationTypeByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllNotificationType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllNotificationType];
GO

CREATE PROCEDURE [LoadAllNotificationType]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[NotificationTypeID],
		[Name],
		[Description]
	FROM [NotificationType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllNotificationType Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllNotificationType Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateNotificationType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateNotificationType];
GO

CREATE PROCEDURE [UpdateNotificationType]
(
	@NotificationTypeID int,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [NotificationType]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[NotificationTypeID] = @NotificationTypeID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateNotificationType Succeeded'
ELSE PRINT 'Procedure Creation: UpdateNotificationType Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertNotificationType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertNotificationType];
GO

CREATE PROCEDURE [InsertNotificationType]
(
	@NotificationTypeID int = NULL output,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [NotificationType]
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

	SELECT @NotificationTypeID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertNotificationType Succeeded'
ELSE PRINT 'Procedure Creation: InsertNotificationType Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteNotificationType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteNotificationType];
GO

CREATE PROCEDURE [DeleteNotificationType]
(
	@NotificationTypeID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [NotificationType]
	WHERE
		[NotificationTypeID] = @NotificationTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteNotificationType Succeeded'
ELSE PRINT 'Procedure Creation: DeleteNotificationType Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadOrganizationByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadOrganizationByPrimaryKey];
GO

CREATE PROCEDURE [LoadOrganizationByPrimaryKey]
(
	@OrganizationID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[OrganizationID],
		[Name],
		[Description]
	FROM [Organization]
	WHERE
		([OrganizationID] = @OrganizationID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadOrganizationByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadOrganizationByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllOrganization') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllOrganization];
GO

CREATE PROCEDURE [LoadAllOrganization]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[OrganizationID],
		[Name],
		[Description]
	FROM [Organization]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllOrganization Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllOrganization Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateOrganization') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateOrganization];
GO

CREATE PROCEDURE [UpdateOrganization]
(
	@OrganizationID int,
	@Name varchar(255) = NULL,
	@Description varchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [Organization]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[OrganizationID] = @OrganizationID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateOrganization Succeeded'
ELSE PRINT 'Procedure Creation: UpdateOrganization Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertOrganization') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertOrganization];
GO

CREATE PROCEDURE [InsertOrganization]
(
	@OrganizationID int = NULL output,
	@Name varchar(255) = NULL,
	@Description varchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [Organization]
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

	SELECT @OrganizationID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertOrganization Succeeded'
ELSE PRINT 'Procedure Creation: InsertOrganization Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteOrganization') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteOrganization];
GO

CREATE PROCEDURE [DeleteOrganization]
(
	@OrganizationID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [Organization]
	WHERE
		[OrganizationID] = @OrganizationID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteOrganization Succeeded'
ELSE PRINT 'Procedure Creation: DeleteOrganization Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadOrganizationUserByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadOrganizationUserByPrimaryKey];
GO

CREATE PROCEDURE [LoadOrganizationUserByPrimaryKey]
(
	@OrganizationID int,
	@UserID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[OrganizationID],
		[UserID]
	FROM [OrganizationUser]
	WHERE
		([OrganizationID] = @OrganizationID) AND
		([UserID] = @UserID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadOrganizationUserByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadOrganizationUserByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllOrganizationUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllOrganizationUser];
GO

CREATE PROCEDURE [LoadAllOrganizationUser]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[OrganizationID],
		[UserID]
	FROM [OrganizationUser]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllOrganizationUser Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllOrganizationUser Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertOrganizationUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertOrganizationUser];
GO

CREATE PROCEDURE [InsertOrganizationUser]
(
	@OrganizationID int,
	@UserID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [OrganizationUser]
	(
		[OrganizationID],
		[UserID]
	)
	VALUES
	(
		@OrganizationID,
		@UserID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertOrganizationUser Succeeded'
ELSE PRINT 'Procedure Creation: InsertOrganizationUser Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteOrganizationUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteOrganizationUser];
GO

CREATE PROCEDURE [DeleteOrganizationUser]
(
	@OrganizationID int,
	@UserID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [OrganizationUser]
	WHERE
		[OrganizationID] = @OrganizationID AND
		[UserID] = @UserID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteOrganizationUser Succeeded'
ELSE PRINT 'Procedure Creation: DeleteOrganizationUser Error on Creation'
GO

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
		[ProjectCategoryID]
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
		[ProjectCategoryID]
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
	@ProjectCategoryID int
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
		[ProjectCategoryID] = @ProjectCategoryID
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
	@ProjectCategoryID int
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
		[ProjectCategoryID]
	)
	VALUES
	(
		@ProjectGroupID,
		@Name,
		@Description,
		@StartDate,
		@FinishDate,
		@ProjectStatusID,
		@ProjectCategoryID
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

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadProjectCategoryByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadProjectCategoryByPrimaryKey];
GO

CREATE PROCEDURE [LoadProjectCategoryByPrimaryKey]
(
	@ProjectCategoryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectCategoryID],
		[Name],
		[Description]
	FROM [ProjectCategory]
	WHERE
		([ProjectCategoryID] = @ProjectCategoryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadProjectCategoryByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadProjectCategoryByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllProjectCategory') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllProjectCategory];
GO

CREATE PROCEDURE [LoadAllProjectCategory]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectCategoryID],
		[Name],
		[Description]
	FROM [ProjectCategory]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllProjectCategory Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllProjectCategory Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateProjectCategory') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateProjectCategory];
GO

CREATE PROCEDURE [UpdateProjectCategory]
(
	@ProjectCategoryID int,
	@Name varchar(255),
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [ProjectCategory]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[ProjectCategoryID] = @ProjectCategoryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateProjectCategory Succeeded'
ELSE PRINT 'Procedure Creation: UpdateProjectCategory Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertProjectCategory') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertProjectCategory];
GO

CREATE PROCEDURE [InsertProjectCategory]
(
	@ProjectCategoryID int = NULL output,
	@Name varchar(255),
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ProjectCategory]
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

	SELECT @ProjectCategoryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertProjectCategory Succeeded'
ELSE PRINT 'Procedure Creation: InsertProjectCategory Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteProjectCategory') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteProjectCategory];
GO

CREATE PROCEDURE [DeleteProjectCategory]
(
	@ProjectCategoryID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ProjectCategory]
	WHERE
		[ProjectCategoryID] = @ProjectCategoryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteProjectCategory Succeeded'
ELSE PRINT 'Procedure Creation: DeleteProjectCategory Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadProjectGroupByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadProjectGroupByPrimaryKey];
GO

CREATE PROCEDURE [LoadProjectGroupByPrimaryKey]
(
	@ProjectGroupID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectGroupID],
		[Name],
		[Description]
	FROM [ProjectGroup]
	WHERE
		([ProjectGroupID] = @ProjectGroupID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadProjectGroupByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadProjectGroupByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllProjectGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllProjectGroup];
GO

CREATE PROCEDURE [LoadAllProjectGroup]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectGroupID],
		[Name],
		[Description]
	FROM [ProjectGroup]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllProjectGroup Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllProjectGroup Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateProjectGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateProjectGroup];
GO

CREATE PROCEDURE [UpdateProjectGroup]
(
	@ProjectGroupID int,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [ProjectGroup]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[ProjectGroupID] = @ProjectGroupID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateProjectGroup Succeeded'
ELSE PRINT 'Procedure Creation: UpdateProjectGroup Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertProjectGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertProjectGroup];
GO

CREATE PROCEDURE [InsertProjectGroup]
(
	@ProjectGroupID int = NULL output,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ProjectGroup]
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

	SELECT @ProjectGroupID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertProjectGroup Succeeded'
ELSE PRINT 'Procedure Creation: InsertProjectGroup Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteProjectGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteProjectGroup];
GO

CREATE PROCEDURE [DeleteProjectGroup]
(
	@ProjectGroupID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ProjectGroup]
	WHERE
		[ProjectGroupID] = @ProjectGroupID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteProjectGroup Succeeded'
ELSE PRINT 'Procedure Creation: DeleteProjectGroup Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadProjectNotificationByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadProjectNotificationByPrimaryKey];
GO

CREATE PROCEDURE [LoadProjectNotificationByPrimaryKey]
(
	@ProjectNotificationID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectNotificationID],
		[RoleID],
		[AddressBookEntryID],
		[UserID],
		[ProjectID],
		[UpdateID],
		[NotificationTypeID]
	FROM [ProjectNotification]
	WHERE
		([ProjectNotificationID] = @ProjectNotificationID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadProjectNotificationByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadProjectNotificationByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllProjectNotification') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllProjectNotification];
GO

CREATE PROCEDURE [LoadAllProjectNotification]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectNotificationID],
		[RoleID],
		[AddressBookEntryID],
		[UserID],
		[ProjectID],
		[UpdateID],
		[NotificationTypeID]
	FROM [ProjectNotification]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllProjectNotification Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllProjectNotification Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateProjectNotification') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateProjectNotification];
GO

CREATE PROCEDURE [UpdateProjectNotification]
(
	@ProjectNotificationID int,
	@RoleID int = NULL,
	@AddressBookEntryID int = NULL,
	@UserID int = NULL,
	@ProjectID int,
	@UpdateID int = NULL,
	@NotificationTypeID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [ProjectNotification]
	SET
		[RoleID] = @RoleID,
		[AddressBookEntryID] = @AddressBookEntryID,
		[UserID] = @UserID,
		[ProjectID] = @ProjectID,
		[UpdateID] = @UpdateID,
		[NotificationTypeID] = @NotificationTypeID
	WHERE
		[ProjectNotificationID] = @ProjectNotificationID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateProjectNotification Succeeded'
ELSE PRINT 'Procedure Creation: UpdateProjectNotification Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertProjectNotification') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertProjectNotification];
GO

CREATE PROCEDURE [InsertProjectNotification]
(
	@ProjectNotificationID int = NULL output,
	@RoleID int = NULL,
	@AddressBookEntryID int = NULL,
	@UserID int = NULL,
	@ProjectID int,
	@UpdateID int = NULL,
	@NotificationTypeID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ProjectNotification]
	(
		[RoleID],
		[AddressBookEntryID],
		[UserID],
		[ProjectID],
		[UpdateID],
		[NotificationTypeID]
	)
	VALUES
	(
		@RoleID,
		@AddressBookEntryID,
		@UserID,
		@ProjectID,
		@UpdateID,
		@NotificationTypeID
	)

	SET @Err = @@Error

	SELECT @ProjectNotificationID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertProjectNotification Succeeded'
ELSE PRINT 'Procedure Creation: InsertProjectNotification Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteProjectNotification') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteProjectNotification];
GO

CREATE PROCEDURE [DeleteProjectNotification]
(
	@ProjectNotificationID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ProjectNotification]
	WHERE
		[ProjectNotificationID] = @ProjectNotificationID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteProjectNotification Succeeded'
ELSE PRINT 'Procedure Creation: DeleteProjectNotification Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadProjectNotificationExclusionByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadProjectNotificationExclusionByPrimaryKey];
GO

CREATE PROCEDURE [LoadProjectNotificationExclusionByPrimaryKey]
(
	@ProjectNotificationExclusionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectNotificationExclusionID],
		[UserID],
		[AddressBookEntryID],
		[NotificationTypeID],
		[ProjectID],
		[ProjectGroupID]
	FROM [ProjectNotificationExclusion]
	WHERE
		([ProjectNotificationExclusionID] = @ProjectNotificationExclusionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadProjectNotificationExclusionByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadProjectNotificationExclusionByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllProjectNotificationExclusion') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllProjectNotificationExclusion];
GO

CREATE PROCEDURE [LoadAllProjectNotificationExclusion]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectNotificationExclusionID],
		[UserID],
		[AddressBookEntryID],
		[NotificationTypeID],
		[ProjectID],
		[ProjectGroupID]
	FROM [ProjectNotificationExclusion]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllProjectNotificationExclusion Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllProjectNotificationExclusion Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateProjectNotificationExclusion') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateProjectNotificationExclusion];
GO

CREATE PROCEDURE [UpdateProjectNotificationExclusion]
(
	@ProjectNotificationExclusionID int,
	@UserID int = NULL,
	@AddressBookEntryID int = NULL,
	@NotificationTypeID int = NULL,
	@ProjectID int = NULL,
	@ProjectGroupID int = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [ProjectNotificationExclusion]
	SET
		[UserID] = @UserID,
		[AddressBookEntryID] = @AddressBookEntryID,
		[NotificationTypeID] = @NotificationTypeID,
		[ProjectID] = @ProjectID,
		[ProjectGroupID] = @ProjectGroupID
	WHERE
		[ProjectNotificationExclusionID] = @ProjectNotificationExclusionID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateProjectNotificationExclusion Succeeded'
ELSE PRINT 'Procedure Creation: UpdateProjectNotificationExclusion Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertProjectNotificationExclusion') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertProjectNotificationExclusion];
GO

CREATE PROCEDURE [InsertProjectNotificationExclusion]
(
	@ProjectNotificationExclusionID int,
	@UserID int = NULL,
	@AddressBookEntryID int = NULL,
	@NotificationTypeID int = NULL,
	@ProjectID int = NULL,
	@ProjectGroupID int = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ProjectNotificationExclusion]
	(
		[ProjectNotificationExclusionID],
		[UserID],
		[AddressBookEntryID],
		[NotificationTypeID],
		[ProjectID],
		[ProjectGroupID]
	)
	VALUES
	(
		@ProjectNotificationExclusionID,
		@UserID,
		@AddressBookEntryID,
		@NotificationTypeID,
		@ProjectID,
		@ProjectGroupID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertProjectNotificationExclusion Succeeded'
ELSE PRINT 'Procedure Creation: InsertProjectNotificationExclusion Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteProjectNotificationExclusion') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteProjectNotificationExclusion];
GO

CREATE PROCEDURE [DeleteProjectNotificationExclusion]
(
	@ProjectNotificationExclusionID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ProjectNotificationExclusion]
	WHERE
		[ProjectNotificationExclusionID] = @ProjectNotificationExclusionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteProjectNotificationExclusion Succeeded'
ELSE PRINT 'Procedure Creation: DeleteProjectNotificationExclusion Error on Creation'
GO

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

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadProjectUserByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadProjectUserByPrimaryKey];
GO

CREATE PROCEDURE [LoadProjectUserByPrimaryKey]
(
	@ProjectID int,
	@UserID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectID],
		[UserID]
	FROM [ProjectUser]
	WHERE
		([ProjectID] = @ProjectID) AND
		([UserID] = @UserID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadProjectUserByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadProjectUserByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllProjectUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllProjectUser];
GO

CREATE PROCEDURE [LoadAllProjectUser]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectID],
		[UserID]
	FROM [ProjectUser]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllProjectUser Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllProjectUser Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertProjectUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertProjectUser];
GO

CREATE PROCEDURE [InsertProjectUser]
(
	@ProjectID int,
	@UserID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ProjectUser]
	(
		[ProjectID],
		[UserID]
	)
	VALUES
	(
		@ProjectID,
		@UserID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertProjectUser Succeeded'
ELSE PRINT 'Procedure Creation: InsertProjectUser Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteProjectUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteProjectUser];
GO

CREATE PROCEDURE [DeleteProjectUser]
(
	@ProjectID int,
	@UserID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ProjectUser]
	WHERE
		[ProjectID] = @ProjectID AND
		[UserID] = @UserID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteProjectUser Succeeded'
ELSE PRINT 'Procedure Creation: DeleteProjectUser Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadRoleByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadRoleByPrimaryKey];
GO

CREATE PROCEDURE [LoadRoleByPrimaryKey]
(
	@RoleID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoleID],
		[Name],
		[Description]
	FROM [Role]
	WHERE
		([RoleID] = @RoleID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadRoleByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadRoleByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllRole') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllRole];
GO

CREATE PROCEDURE [LoadAllRole]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoleID],
		[Name],
		[Description]
	FROM [Role]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllRole Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllRole Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateRole') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateRole];
GO

CREATE PROCEDURE [UpdateRole]
(
	@RoleID int,
	@Name varchar(50),
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [Role]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[RoleID] = @RoleID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateRole Succeeded'
ELSE PRINT 'Procedure Creation: UpdateRole Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertRole') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertRole];
GO

CREATE PROCEDURE [InsertRole]
(
	@RoleID int = NULL output,
	@Name varchar(50),
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [Role]
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

	SELECT @RoleID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertRole Succeeded'
ELSE PRINT 'Procedure Creation: InsertRole Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteRole') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteRole];
GO

CREATE PROCEDURE [DeleteRole]
(
	@RoleID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [Role]
	WHERE
		[RoleID] = @RoleID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteRole Succeeded'
ELSE PRINT 'Procedure Creation: DeleteRole Error on Creation'
GO

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

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadUpdateGroupByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadUpdateGroupByPrimaryKey];
GO

CREATE PROCEDURE [LoadUpdateGroupByPrimaryKey]
(
	@UpdateGroupID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UpdateGroupID],
		[Name],
		[Description]
	FROM [UpdateGroup]
	WHERE
		([UpdateGroupID] = @UpdateGroupID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadUpdateGroupByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadUpdateGroupByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllUpdateGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllUpdateGroup];
GO

CREATE PROCEDURE [LoadAllUpdateGroup]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UpdateGroupID],
		[Name],
		[Description]
	FROM [UpdateGroup]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllUpdateGroup Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllUpdateGroup Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateUpdateGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateUpdateGroup];
GO

CREATE PROCEDURE [UpdateUpdateGroup]
(
	@UpdateGroupID int,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [UpdateGroup]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[UpdateGroupID] = @UpdateGroupID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateUpdateGroup Succeeded'
ELSE PRINT 'Procedure Creation: UpdateUpdateGroup Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertUpdateGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertUpdateGroup];
GO

CREATE PROCEDURE [InsertUpdateGroup]
(
	@UpdateGroupID int = NULL output,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [UpdateGroup]
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

	SELECT @UpdateGroupID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertUpdateGroup Succeeded'
ELSE PRINT 'Procedure Creation: InsertUpdateGroup Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteUpdateGroup') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteUpdateGroup];
GO

CREATE PROCEDURE [DeleteUpdateGroup]
(
	@UpdateGroupID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [UpdateGroup]
	WHERE
		[UpdateGroupID] = @UpdateGroupID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteUpdateGroup Succeeded'
ELSE PRINT 'Procedure Creation: DeleteUpdateGroup Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadUpdateStatusByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadUpdateStatusByPrimaryKey];
GO

CREATE PROCEDURE [LoadUpdateStatusByPrimaryKey]
(
	@UpdateStatusID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UpdateStatusID],
		[Name],
		[Description]
	FROM [UpdateStatus]
	WHERE
		([UpdateStatusID] = @UpdateStatusID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadUpdateStatusByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadUpdateStatusByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllUpdateStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllUpdateStatus];
GO

CREATE PROCEDURE [LoadAllUpdateStatus]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UpdateStatusID],
		[Name],
		[Description]
	FROM [UpdateStatus]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllUpdateStatus Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllUpdateStatus Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateUpdateStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateUpdateStatus];
GO

CREATE PROCEDURE [UpdateUpdateStatus]
(
	@UpdateStatusID int,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [UpdateStatus]
	SET
		[Name] = @Name,
		[Description] = @Description
	WHERE
		[UpdateStatusID] = @UpdateStatusID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateUpdateStatus Succeeded'
ELSE PRINT 'Procedure Creation: UpdateUpdateStatus Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertUpdateStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertUpdateStatus];
GO

CREATE PROCEDURE [InsertUpdateStatus]
(
	@UpdateStatusID int = NULL output,
	@Name varchar(255) = NULL,
	@Description varchar(1024) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [UpdateStatus]
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

	SELECT @UpdateStatusID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertUpdateStatus Succeeded'
ELSE PRINT 'Procedure Creation: InsertUpdateStatus Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteUpdateStatus') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteUpdateStatus];
GO

CREATE PROCEDURE [DeleteUpdateStatus]
(
	@UpdateStatusID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [UpdateStatus]
	WHERE
		[UpdateStatusID] = @UpdateStatusID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteUpdateStatus Succeeded'
ELSE PRINT 'Procedure Creation: DeleteUpdateStatus Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadUpdateStatusNotificationTypeByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadUpdateStatusNotificationTypeByPrimaryKey];
GO

CREATE PROCEDURE [LoadUpdateStatusNotificationTypeByPrimaryKey]
(
	@UpdateStatusID int,
	@NotificationTypeID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UpdateStatusID],
		[NotificationTypeID]
	FROM [UpdateStatusNotificationType]
	WHERE
		([UpdateStatusID] = @UpdateStatusID) AND
		([NotificationTypeID] = @NotificationTypeID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadUpdateStatusNotificationTypeByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadUpdateStatusNotificationTypeByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllUpdateStatusNotificationType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllUpdateStatusNotificationType];
GO

CREATE PROCEDURE [LoadAllUpdateStatusNotificationType]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UpdateStatusID],
		[NotificationTypeID]
	FROM [UpdateStatusNotificationType]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllUpdateStatusNotificationType Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllUpdateStatusNotificationType Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertUpdateStatusNotificationType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertUpdateStatusNotificationType];
GO

CREATE PROCEDURE [InsertUpdateStatusNotificationType]
(
	@UpdateStatusID int,
	@NotificationTypeID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [UpdateStatusNotificationType]
	(
		[UpdateStatusID],
		[NotificationTypeID]
	)
	VALUES
	(
		@UpdateStatusID,
		@NotificationTypeID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertUpdateStatusNotificationType Succeeded'
ELSE PRINT 'Procedure Creation: InsertUpdateStatusNotificationType Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteUpdateStatusNotificationType') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteUpdateStatusNotificationType];
GO

CREATE PROCEDURE [DeleteUpdateStatusNotificationType]
(
	@UpdateStatusID int,
	@NotificationTypeID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [UpdateStatusNotificationType]
	WHERE
		[UpdateStatusID] = @UpdateStatusID AND
		[NotificationTypeID] = @NotificationTypeID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteUpdateStatusNotificationType Succeeded'
ELSE PRINT 'Procedure Creation: DeleteUpdateStatusNotificationType Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadUserByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadUserByPrimaryKey];
GO

CREATE PROCEDURE [LoadUserByPrimaryKey]
(
	@UserID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserID],
		[Login],
		[Password],
		[AddressBookEntryID],
		[LastLoginDate],
		[GUID],
		[IsInactive]
	FROM [User]
	WHERE
		([UserID] = @UserID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadUserByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadUserByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllUser];
GO

CREATE PROCEDURE [LoadAllUser]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserID],
		[Login],
		[Password],
		[AddressBookEntryID],
		[LastLoginDate],
		[GUID],
		[IsInactive]
	FROM [User]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllUser Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllUser Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateUser];
GO

CREATE PROCEDURE [UpdateUser]
(
	@UserID int,
	@Login varchar(50),
	@Password varchar(50),
	@AddressBookEntryID int,
	@LastLoginDate datetime = NULL,
	@GUID uniqueidentifier,
	@IsInactive bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [User]
	SET
		[Login] = @Login,
		[Password] = @Password,
		[AddressBookEntryID] = @AddressBookEntryID,
		[LastLoginDate] = @LastLoginDate,
		[GUID] = @GUID,
		[IsInactive] = @IsInactive
	WHERE
		[UserID] = @UserID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateUser Succeeded'
ELSE PRINT 'Procedure Creation: UpdateUser Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertUser];
GO

CREATE PROCEDURE [InsertUser]
(
	@UserID int = NULL output,
	@Login varchar(50),
	@Password varchar(50),
	@AddressBookEntryID int,
	@LastLoginDate datetime = NULL,
	@GUID uniqueidentifier,
	@IsInactive bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [User]
	(
		[Login],
		[Password],
		[AddressBookEntryID],
		[LastLoginDate],
		[GUID],
		[IsInactive]
	)
	VALUES
	(
		@Login,
		@Password,
		@AddressBookEntryID,
		@LastLoginDate,
		@GUID,
		@IsInactive
	)

	SET @Err = @@Error

	SELECT @UserID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertUser Succeeded'
ELSE PRINT 'Procedure Creation: InsertUser Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteUser];
GO

CREATE PROCEDURE [DeleteUser]
(
	@UserID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [User]
	WHERE
		[UserID] = @UserID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteUser Succeeded'
ELSE PRINT 'Procedure Creation: DeleteUser Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadUserRoleByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadUserRoleByPrimaryKey];
GO

CREATE PROCEDURE [LoadUserRoleByPrimaryKey]
(
	@UserID int,
	@RoleID int,
	@OrganizationID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserID],
		[RoleID],
		[OrganizationID]
	FROM [UserRole]
	WHERE
		([UserID] = @UserID) AND
		([RoleID] = @RoleID) AND
		([OrganizationID] = @OrganizationID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadUserRoleByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadUserRoleByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllUserRole') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllUserRole];
GO

CREATE PROCEDURE [LoadAllUserRole]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserID],
		[RoleID],
		[OrganizationID]
	FROM [UserRole]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllUserRole Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllUserRole Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertUserRole') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertUserRole];
GO

CREATE PROCEDURE [InsertUserRole]
(
	@UserID int,
	@RoleID int,
	@OrganizationID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [UserRole]
	(
		[UserID],
		[RoleID],
		[OrganizationID]
	)
	VALUES
	(
		@UserID,
		@RoleID,
		@OrganizationID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertUserRole Succeeded'
ELSE PRINT 'Procedure Creation: InsertUserRole Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteUserRole') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteUserRole];
GO

CREATE PROCEDURE [DeleteUserRole]
(
	@UserID int,
	@RoleID int,
	@OrganizationID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [UserRole]
	WHERE
		[UserID] = @UserID AND
		[RoleID] = @RoleID AND
		[OrganizationID] = @OrganizationID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteUserRole Succeeded'
ELSE PRINT 'Procedure Creation: DeleteUserRole Error on Creation'
GO
