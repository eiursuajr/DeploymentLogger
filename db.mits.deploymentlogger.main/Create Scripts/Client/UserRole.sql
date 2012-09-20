
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
