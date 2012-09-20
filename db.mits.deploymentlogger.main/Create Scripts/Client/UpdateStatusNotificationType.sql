
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
