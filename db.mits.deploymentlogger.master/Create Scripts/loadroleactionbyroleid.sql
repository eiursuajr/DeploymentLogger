
CREATE  PROCEDURE [dbo].[LoadRoleActionsByRoleID]
(
	@RoleID int
)
AS
BEGIN
	SET NOCOUNT ON
	DECLARE @Err int

	SELECT 
		a.ActionID, 
		a.ParentID, 
		a.Name, 
		a.URL, 
		a.ControlID, 
		ISNULL(SIGN(ra.RoleID), 0) AS IsPermitted
	FROM            dbo.[Action] a 
	LEFT OUTER JOIN dbo.RoleAction ra ON  ra.ActionID = a.ActionID
					  AND ra.RoleID   = @RoleID

	SET @Err = @@Error

	RETURN @Err
END

GO
