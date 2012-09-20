
USE [DeploymentLogger]
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAddressBookByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAddressBookByPrimaryKey];
GO

CREATE PROCEDURE [LoadAddressBookByPrimaryKey]
(
	@EntryID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[EntryID],
		[FirstName],
		[LastName],
		[MiddleName],
		[HomePhone],
		[WorkPhone],
		[PrimaryEmail],
		[SecondaryEmail],
		[UserID],
		[IsShared]
	FROM [AddressBook]
	WHERE
		([EntryID] = @EntryID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAddressBookByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadAddressBookByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllAddressBook') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllAddressBook];
GO

CREATE PROCEDURE [LoadAllAddressBook]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[EntryID],
		[FirstName],
		[LastName],
		[MiddleName],
		[HomePhone],
		[WorkPhone],
		[PrimaryEmail],
		[SecondaryEmail],
		[UserID],
		[IsShared]
	FROM [AddressBook]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllAddressBook Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllAddressBook Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('UpdateAddressBook') AND sysstat & 0xf = 4)
    DROP PROCEDURE [UpdateAddressBook];
GO

CREATE PROCEDURE [UpdateAddressBook]
(
	@EntryID int,
	@FirstName varchar(255),
	@LastName varchar(255) = NULL,
	@MiddleName varchar(50) = NULL,
	@HomePhone varchar(50) = NULL,
	@WorkPhone varchar(50) = NULL,
	@PrimaryEmail varchar(50),
	@SecondaryEmail varchar(50) = NULL,
	@UserID int = NULL,
	@IsShared bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [AddressBook]
	SET
		[FirstName] = @FirstName,
		[LastName] = @LastName,
		[MiddleName] = @MiddleName,
		[HomePhone] = @HomePhone,
		[WorkPhone] = @WorkPhone,
		[PrimaryEmail] = @PrimaryEmail,
		[SecondaryEmail] = @SecondaryEmail,
		[UserID] = @UserID,
		[IsShared] = @IsShared
	WHERE
		[EntryID] = @EntryID


	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: UpdateAddressBook Succeeded'
ELSE PRINT 'Procedure Creation: UpdateAddressBook Error on Creation'
GO




IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertAddressBook') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertAddressBook];
GO

CREATE PROCEDURE [InsertAddressBook]
(
	@EntryID int = NULL output,
	@FirstName varchar(255),
	@LastName varchar(255) = NULL,
	@MiddleName varchar(50) = NULL,
	@HomePhone varchar(50) = NULL,
	@WorkPhone varchar(50) = NULL,
	@PrimaryEmail varchar(50),
	@SecondaryEmail varchar(50) = NULL,
	@UserID int = NULL,
	@IsShared bit = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [AddressBook]
	(
		[FirstName],
		[LastName],
		[MiddleName],
		[HomePhone],
		[WorkPhone],
		[PrimaryEmail],
		[SecondaryEmail],
		[UserID],
		[IsShared]
	)
	VALUES
	(
		@FirstName,
		@LastName,
		@MiddleName,
		@HomePhone,
		@WorkPhone,
		@PrimaryEmail,
		@SecondaryEmail,
		@UserID,
		@IsShared
	)

	SET @Err = @@Error

	SELECT @EntryID = SCOPE_IDENTITY()

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertAddressBook Succeeded'
ELSE PRINT 'Procedure Creation: InsertAddressBook Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteAddressBook') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteAddressBook];
GO

CREATE PROCEDURE [DeleteAddressBook]
(
	@EntryID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [AddressBook]
	WHERE
		[EntryID] = @EntryID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteAddressBook Succeeded'
ELSE PRINT 'Procedure Creation: DeleteAddressBook Error on Creation'
GO
