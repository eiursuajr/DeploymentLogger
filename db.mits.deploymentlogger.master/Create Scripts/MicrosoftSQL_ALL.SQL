
USE [DeploymentLogger_MASTER]
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadDatabaseByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadDatabaseByPrimaryKey];
GO

CREATE PROCEDURE [LoadDatabaseByPrimaryKey]
(
	@DatabaseID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DatabaseID],
		[Name],
		[ConnectionString],
		[Description],
		[IsInactive]
	FROM [Database]
	WHERE
		([DatabaseID] = @DatabaseID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadDatabaseByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadDatabaseByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllDatabase') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllDatabase];
GO

CREATE PROCEDURE [LoadAllDatabase]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[DatabaseID],
		[Name],
		[ConnectionString],
		[Description],
		[IsInactive]
	FROM [Database]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllDatabase Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllDatabase Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateDatabase') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateDatabase];
GO

CREATE PROCEDURE [UpdateDatabase]
(
	@DatabaseID int,
	@Name varchar(255),
	@ConnectionString varchar(1024),
	@Description varchar(8000) = NULL,
	@IsInactive bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [Database]
	SET
		[Name] = @Name,
		[ConnectionString] = @ConnectionString,
		[Description] = @Description,
		[IsInactive] = @IsInactive
	WHERE
		[DatabaseID] = @DatabaseID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateDatabase Succeeded'
ELSE PRINT 'Procedure Creation: UpdateDatabase Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertDatabase') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertDatabase];
GO

CREATE PROCEDURE [InsertDatabase]
(
	@DatabaseID int = NULL output,
	@Name varchar(255),
	@ConnectionString varchar(1024),
	@Description varchar(8000) = NULL,
	@IsInactive bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [Database]
	(
		[Name],
		[ConnectionString],
		[Description],
		[IsInactive]
	)
	VALUES
	(
		@Name,
		@ConnectionString,
		@Description,
		@IsInactive
	)

	SET @Err = @@Error

	SELECT @DatabaseID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertDatabase Succeeded'
ELSE PRINT 'Procedure Creation: InsertDatabase Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteDatabase') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteDatabase];
GO

CREATE PROCEDURE [DeleteDatabase]
(
	@DatabaseID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [Database]
	WHERE
		[DatabaseID] = @DatabaseID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteDatabase Succeeded'
ELSE PRINT 'Procedure Creation: DeleteDatabase Error on Creation'
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
		[Description],
		[DatabaseID]
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
		[Description],
		[DatabaseID]
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
	@Name varchar(255),
	@Description varchar(50) = NULL,
	@DatabaseID int = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [Organization]
	SET
		[Name] = @Name,
		[Description] = @Description,
		[DatabaseID] = @DatabaseID
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
	@Name varchar(255),
	@Description varchar(50) = NULL,
	@DatabaseID int = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [Organization]
	(
		[Name],
		[Description],
		[DatabaseID]
	)
	VALUES
	(
		@Name,
		@Description,
		@DatabaseID
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
		[LastLoginDate],
		[GUID],
		[IsInactive]
	)
	VALUES
	(
		@Login,
		@Password,
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
