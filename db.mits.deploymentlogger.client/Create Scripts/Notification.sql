
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
