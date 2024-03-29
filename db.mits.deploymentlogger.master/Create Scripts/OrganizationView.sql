IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(N'[dbo].[OrganizationView]') AND OBJECTPROPERTY(id, N'IsView') = 1)
DROP VIEW [dbo].[OrganizationView]
GO

CREATE VIEW [dbo].[OrganizationView]
AS
SELECT     o.OrganizationID, o.Name, o.Description, o.DatabaseID, o.IsDeleted, d.Name AS DatabaseName, COUNT(ou.UserID) AS UserCount
FROM         dbo.Organization AS o INNER JOIN
                      dbo.[Database] AS d ON d.DatabaseID = o.DatabaseID LEFT OUTER JOIN
                      dbo.OrganizationUser AS ou ON o.OrganizationID = ou.OrganizationID
GROUP BY o.OrganizationID, o.Name, o.Description, o.DatabaseID, o.IsDeleted, d.Name

GO