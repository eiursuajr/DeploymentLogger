
ALTER PROCEDURE [LoadUserByPrimaryKey]
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
		[Email],
		[PasswordQuestion],
		[PasswordAnswer],
		[IsApproved],
		[IsLockedOut],
		[CreationDate],
		[LastLoginDate],
		[LastActivityDate],
		[LastPasswordChangedDate],
		[LastLockoutDate],
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

ALTER PROCEDURE [LoadAllUser]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[UserID],
		[Login],
		[Password],
		[Email],
		[PasswordQuestion],
		[PasswordAnswer],
		[IsApproved],
		[IsLockedOut],
		[CreationDate],
		[LastLoginDate],
		[LastActivityDate],
		[LastPasswordChangedDate],
		[LastLockoutDate],
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

ALTER PROCEDURE [UpdateUser]
(
	@UserID int,
	@Login varchar(50),
	@Password varchar(50),
	@Email varchar(255),
	@PasswordQuestion varchar(1024),
	@PasswordAnswer varchar(1024) = NULL,
	@IsApproved bit,
	@IsLockedOut bit,
	@CreationDate datetime,
	@LastLoginDate datetime = NULL,
	@LastActivityDate datetime = NULL,
	@LastPasswordChangedDate datetime = NULL,
	@LastLockoutDate datetime = NULL,
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
		[Email] = @Email,
		[PasswordQuestion] = @PasswordQuestion,
		[PasswordAnswer] = @PasswordAnswer,
		[IsApproved] = @IsApproved,
		[IsLockedOut] = @IsLockedOut,
		[CreationDate] = @CreationDate,
		[LastLoginDate] = @LastLoginDate,
		[LastActivityDate] = @LastActivityDate,
		[LastPasswordChangedDate] = @LastPasswordChangedDate,
		[LastLockoutDate] = @LastLockoutDate,
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




ALTER PROCEDURE [InsertUser]
(
	@UserID int = NULL output,
	@Login varchar(50),
	@Password varchar(50),
	@Email varchar(255),
	@PasswordQuestion varchar(1024),
	@PasswordAnswer varchar(1024) = NULL,
	@IsApproved bit,
	@IsLockedOut bit,
	@CreationDate datetime,
	@LastLoginDate datetime = NULL,
	@LastActivityDate datetime = NULL,
	@LastPasswordChangedDate datetime = NULL,
	@LastLockoutDate datetime = NULL,
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
		[Email],
		[PasswordQuestion],
		[PasswordAnswer],
		[IsApproved],
		[IsLockedOut],
		[CreationDate],
		[LastLoginDate],
		[LastActivityDate],
		[LastPasswordChangedDate],
		[LastLockoutDate],
		[GUID],
		[IsInactive]
	)
	VALUES
	(
		@Login,
		@Password,
		@Email,
		@PasswordQuestion,
		@PasswordAnswer,
		@IsApproved,
		@IsLockedOut,
		@CreationDate,
		@LastLoginDate,
		@LastActivityDate,
		@LastPasswordChangedDate,
		@LastLockoutDate,
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

ALTER PROCEDURE [DeleteUser]
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


