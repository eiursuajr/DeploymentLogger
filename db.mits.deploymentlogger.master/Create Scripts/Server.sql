 USE [DeploymentLogger_MASTER]
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadServerByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadServerByPrimaryKey];
GO

CREATE PROCEDURE [LoadServerByPrimaryKey]
(
	@ServerID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ServerID],
		[mailHost],
		[mailUser],
		[mailPass],
		[mailEmail],
		[WebReference]
	FROM [Server]
	WHERE
		([ServerID] = @ServerID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadServerByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadServerByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllServer') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllServer];
GO

CREATE PROCEDURE [LoadAllServer]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ServerID],
		[mailHost],
		[mailUser],
		[mailPass],
		[mailEmail],
		[WebReference]
	FROM [Server]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllServer Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllServer Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateServer') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateServer];
GO

CREATE PROCEDURE [UpdateServer]
(
	@ServerID int,
	@mailHost varchar(255) = NULL,
	@mailUser varchar(255) = NULL,
	@mailPass varchar(255) = NULL,
	@mailEmail varchar(255) = NULL,
	@WebReference varchar(255) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [Server]
	SET
		[mailHost] = @mailHost,
		[mailUser] = @mailUser,
		[mailPass] = @mailPass,
		[mailEmail] = @mailEmail,
		[WebReference] = @WebReference
	WHERE
		[ServerID] = @ServerID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateServer Succeeded'
ELSE PRINT 'Procedure Creation: UpdateServer Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertServer') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertServer];
GO

CREATE PROCEDURE [InsertServer]
(
	@ServerID int = NULL output,
	@mailHost varchar(255) = NULL,
	@mailUser varchar(255) = NULL,
	@mailPass varchar(255) = NULL,
	@mailEmail varchar(255) = NULL,
	@WebReference varchar(255) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [Server]
	(
		[mailHost],
		[mailUser],
		[mailPass],
		[mailEmail],
		[WebReference]
	)
	VALUES
	(
		@mailHost,
		@mailUser,
		@mailPass,
		@mailEmail,
		@WebReference
	)

	SET @Err = @@Error

	SELECT @ServerID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertServer Succeeded'
ELSE PRINT 'Procedure Creation: InsertServer Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteServer') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteServer];
GO

CREATE PROCEDURE [DeleteServer]
(
	@ServerID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [Server]
	WHERE
		[ServerID] = @ServerID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteServer Succeeded'
ELSE PRINT 'Procedure Creation: DeleteServer Error on Creation'
GO


