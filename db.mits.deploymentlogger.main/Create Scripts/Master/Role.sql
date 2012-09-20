
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
