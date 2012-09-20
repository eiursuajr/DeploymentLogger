
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
