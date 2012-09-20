
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
		[Description]
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
		[Description]
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
	@Name varchar(255) = NULL,
	@Description varchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	UPDATE [Organization]
	SET
		[Name] = @Name,
		[Description] = @Description
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
	@Name varchar(255) = NULL,
	@Description varchar(50) = NULL
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [Organization]
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
