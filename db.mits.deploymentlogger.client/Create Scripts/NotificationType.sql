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
		[Description],
		[ProcessingAssemblyName],
		[ProcessingClassName],
		[ProcessingProcedureName],
		[NotificationEmailDefaultHeader],
		[NotificationEmailDefaultDescription],
		[IsClientUpdate]
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
		[Description],
		[ProcessingAssemblyName],
		[ProcessingClassName],
		[ProcessingProcedureName],
		[NotificationEmailDefaultHeader],
		[NotificationEmailDefaultDescription],
		[IsClientUpdate]
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
	@Description varchar(1024) = NULL,
	@ProcessingAssemblyName varchar(1024) = NULL,
	@ProcessingClassName varchar(1024) = NULL,
	@ProcessingProcedureName varchar(255) = NULL,
	@NotificationEmailDefaultHeader varchar(1024) = NULL,
	@NotificationEmailDefaultDescription varchar(8000) = NULL,
	@IsClientUpdate bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [NotificationType]
	SET
		[Name] = @Name,
		[Description] = @Description,
		[ProcessingAssemblyName] = @ProcessingAssemblyName,
		[ProcessingClassName] = @ProcessingClassName,
		[ProcessingProcedureName] = @ProcessingProcedureName,
		[NotificationEmailDefaultHeader] = @NotificationEmailDefaultHeader,
		[NotificationEmailDefaultDescription] = @NotificationEmailDefaultDescription,
		[IsClientUpdate] = @IsClientUpdate
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
	@Description varchar(1024) = NULL,
	@ProcessingAssemblyName varchar(1024) = NULL,
	@ProcessingClassName varchar(1024) = NULL,
	@ProcessingProcedureName varchar(255) = NULL,
	@NotificationEmailDefaultHeader varchar(1024) = NULL,
	@NotificationEmailDefaultDescription varchar(8000) = NULL,
	@IsClientUpdate bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [NotificationType]
	(
		[Name],
		[Description],
		[ProcessingAssemblyName],
		[ProcessingClassName],
		[ProcessingProcedureName],
		[NotificationEmailDefaultHeader],
		[NotificationEmailDefaultDescription],
		[IsClientUpdate]
	)
	VALUES
	(
		@Name,
		@Description,
		@ProcessingAssemblyName,
		@ProcessingClassName,
		@ProcessingProcedureName,
		@NotificationEmailDefaultHeader,
		@NotificationEmailDefaultDescription,
		@IsClientUpdate
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


