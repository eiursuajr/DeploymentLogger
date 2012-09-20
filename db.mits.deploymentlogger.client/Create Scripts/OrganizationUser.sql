
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
