IF EXISTS (SELECT * FROM SYSOBJECTS WHERE ID = OBJECT_ID('[dbo].[LoadAllUserByNotificationTypeID]') AND sysstat & 0xf = 4)
    DROP PROCEDURE [dbo].[LoadAllUserByNotificationTypeID]
GO

CREATE PROCEDURE [dbo].[LoadAllUserByNotificationTypeID]
(
	@NotificationTypeID int,
	@ProjectID int
)
AS
BEGIN

	SET NOCOUNT ON
	DECLARE @Err int

	SELECT DISTINCT
		pn.ProjectNotificationID,
		u.[UserID], 
		u.[Login], 
		u.[IsInactive], 
		u.[IsApproved], 
		u.[IsLockedOut]
	FROM [User] u
	INNER JOIN ProjectNotification pn
		ON 	u.UserID = pn.UserID AND
			pn.NotificationTypeID = @NotificationTypeID AND
			pn.ProjectID = @ProjectID

	SET @Err = @@Error

	RETURN @Err
END
GO


-- Display the status of Proc creation
IF (@@Error = 0) PRINT 'Procedure Creation: LoadAllUserByNotificationTypeID Succeeded'
ELSE PRINT 'Procedure Creation: LoadAllUserByNotificationTypeID Error on Creation'
GO