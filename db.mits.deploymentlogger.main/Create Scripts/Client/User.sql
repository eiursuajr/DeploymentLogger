
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
		[AddressBookEntryID],
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
		[AddressBookEntryID],
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
	@AddressBookEntryID int,
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
		[AddressBookEntryID] = @AddressBookEntryID,
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
	@AddressBookEntryID int,
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
		[AddressBookEntryID],
		[LastLoginDate],
		[GUID],
		[IsInactive]
	)
	VALUES
	(
		@Login,
		@Password,
		@AddressBookEntryID,
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
