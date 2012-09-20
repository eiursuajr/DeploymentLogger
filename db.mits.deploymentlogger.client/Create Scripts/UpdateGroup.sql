
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
