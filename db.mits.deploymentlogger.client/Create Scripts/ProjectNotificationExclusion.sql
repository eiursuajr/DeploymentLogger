
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
