
IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadProjectUserByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadProjectUserByPrimaryKey];
GO

CREATE PROCEDURE [LoadProjectUserByPrimaryKey]
(
	@ProjectID int,
	@UserID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectID],
		[UserID]
	FROM [ProjectUser]
	WHERE
		([ProjectID] = @ProjectID) AND
		([UserID] = @UserID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadProjectUserByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadProjectUserByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllProjectUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllProjectUser];
GO

CREATE PROCEDURE [LoadAllProjectUser]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[ProjectID],
		[UserID]
	FROM [ProjectUser]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllProjectUser Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllProjectUser Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertProjectUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertProjectUser];
GO

CREATE PROCEDURE [InsertProjectUser]
(
	@ProjectID int,
	@UserID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [ProjectUser]
	(
		[ProjectID],
		[UserID]
	)
	VALUES
	(
		@ProjectID,
		@UserID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertProjectUser Succeeded'
ELSE PRINT 'Procedure Creation: InsertProjectUser Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteProjectUser') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteProjectUser];
GO

CREATE PROCEDURE [DeleteProjectUser]
(
	@ProjectID int,
	@UserID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [ProjectUser]
	WHERE
		[ProjectID] = @ProjectID AND
		[UserID] = @UserID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteProjectUser Succeeded'
ELSE PRINT 'Procedure Creation: DeleteProjectUser Error on Creation'
GO
