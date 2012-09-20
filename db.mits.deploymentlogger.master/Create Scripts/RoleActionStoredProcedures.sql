
USE [mits_deploymentlogger_client1_beta]
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadRoleActionByPrimaryKey') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadRoleActionByPrimaryKey];
GO

CREATE PROCEDURE [LoadRoleActionByPrimaryKey]
(
	@RoleID int,
	@ActionID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoleID],
		[ActionID]
	FROM [RoleAction]
	WHERE
		([RoleID] = @RoleID) AND
		([ActionID] = @ActionID)

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadRoleActionByPrimaryKey Succeeded'
ELSE PRINT 'Procedure Creation: LoadRoleActionByPrimaryKey Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('LoadAllRoleAction') AND sysstat & 0xf = 4)
    DROP PROCEDURE [LoadAllRoleAction];
GO

CREATE PROCEDURE [LoadAllRoleAction]
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT
		[RoleID],
		[ActionID]
	FROM [RoleAction]

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllRoleAction Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllRoleAction Error on Creation'
GO

-------------------------------------------
-- NO UPDATE Stored Procedure Generated    
-- All Columns are part of the Primary key 
-------------------------------------------


IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('InsertRoleAction') AND sysstat & 0xf = 4)
    DROP PROCEDURE [InsertRoleAction];
GO

CREATE PROCEDURE [InsertRoleAction]
(
	@RoleID int,
	@ActionID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	INSERT
	INTO [RoleAction]
	(
		[RoleID],
		[ActionID]
	)
	VALUES
	(
		@RoleID,
		@ActionID
	)

	SET @Err = @@Error


	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: InsertRoleAction Succeeded'
ELSE PRINT 'Procedure Creation: InsertRoleAction Error on Creation'
GO

IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('DeleteRoleAction') AND sysstat & 0xf = 4)
    DROP PROCEDURE [DeleteRoleAction];
GO

CREATE PROCEDURE [DeleteRoleAction]
(
	@RoleID int,
	@ActionID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	DELETE
	FROM [RoleAction]
	WHERE
		[RoleID] = @RoleID AND
		[ActionID] = @ActionID
	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: DeleteRoleAction Succeeded'
ELSE PRINT 'Procedure Creation: DeleteRoleAction Error on Creation'
GO
