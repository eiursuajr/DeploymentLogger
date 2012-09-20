
USE [mits_deploymentlogger_client1_beta]
GO

ALTER PROCEDURE [LoadRoleByPrimaryKey]
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
		[Description],
		[IsPublicFieldsEditable]
	FROM [Role]
	WHERE
		([RoleID] = @RoleID)

	SET @Err = @@Error

	RETURN @Err
END
GO


ALTER PROCEDURE [LoadAllRole]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoleID],
		[Name],
		[Description],
		[IsPublicFieldsEditable]
	FROM [Role]

	SET @Err = @@Error

	RETURN @Err
END
GO


ALTER PROCEDURE [UpdateRole]
(
	@RoleID int,
	@Name varchar(50),
	@Description varchar(1024) = NULL,
	@IsPublicFieldsEditable bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [Role]
	SET
		[Name] = @Name,
		[Description] = @Description,
		[IsPublicFieldsEditable] = @IsPublicFieldsEditable
	WHERE
		[RoleID] = @RoleID


	SET @Err = @@Error


	RETURN @Err
END
GO




ALTER PROCEDURE [InsertRole]
(
	@RoleID int = NULL output,
	@Name varchar(50),
	@Description varchar(1024) = NULL,
	@IsPublicFieldsEditable bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [Role]
	(
		[Name],
		[Description],
		[IsPublicFieldsEditable]
	)
	VALUES
	(
		@Name,
		@Description,
		@IsPublicFieldsEditable
	)

	SET @Err = @@Error

	SELECT @RoleID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


ALTER PROCEDURE [DeleteRole]
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

