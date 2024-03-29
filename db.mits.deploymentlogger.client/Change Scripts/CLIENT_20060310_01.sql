/*
   Friday, March 10, 20061:02:28 AM
   User: 
   Server: ANDREWS-MOBILE
   Database: DeploymentLogger
   Application: 
*/

/* To prevent any potential data loss issues, you should review this script in detail before running it outside the context of the database designer.*/
BEGIN TRANSACTION
SET QUOTED_IDENTIFIER ON
SET ARITHABORT ON
SET NUMERIC_ROUNDABORT OFF
SET CONCAT_NULL_YIELDS_NULL ON
SET ANSI_NULLS ON
SET ANSI_PADDING ON
SET ANSI_WARNINGS ON
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Project
	DROP CONSTRAINT FK_Project_ProjectCategory
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Project
	DROP CONSTRAINT FK_Project_ProjectStatus
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Project
	DROP CONSTRAINT FK_Project_ProjectGroup
GO
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.Tmp_Project
	(
	ProjectID int NOT NULL IDENTITY (1, 1),
	ProjectGroupID int NOT NULL,
	Name varchar(255) NULL,
	PublicName varchar(255) NULL,
	Description varchar(1024) NULL,
	StartDate datetime NULL,
	FinishDate datetime NULL,
	ProjectStatusID int NOT NULL,
	ProjectCategoryID int NOT NULL
	)  ON [PRIMARY]
GO
SET IDENTITY_INSERT dbo.Tmp_Project ON
GO
IF EXISTS(SELECT * FROM dbo.Project)
	 EXEC('INSERT INTO dbo.Tmp_Project (ProjectID, ProjectGroupID, Name, Description, StartDate, FinishDate, ProjectStatusID, ProjectCategoryID)
		SELECT ProjectID, ProjectGroupID, Name, Description, StartDate, FinishDate, ProjectStatusID, ProjectCategoryID FROM dbo.Project WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Project OFF
GO
ALTER TABLE dbo.Notification
	DROP CONSTRAINT FK_Notification_Project
GO
ALTER TABLE dbo.ProjectUser
	DROP CONSTRAINT FK_ProjectUser_Project
GO
ALTER TABLE dbo.LogEntry
	DROP CONSTRAINT FK_LogEntry_Project
GO
ALTER TABLE dbo.ProjectNotificationExclusion
	DROP CONSTRAINT FK_ProjectNotificationExclusion_Project
GO
ALTER TABLE dbo.ProjectNotification
	DROP CONSTRAINT FK_ProjectNotification_Project
GO
ALTER TABLE dbo.[Update]
	DROP CONSTRAINT FK_Update_Project
GO
DROP TABLE dbo.Project
GO
EXECUTE sp_rename N'dbo.Tmp_Project', N'Project', 'OBJECT' 
GO
ALTER TABLE dbo.Project ADD CONSTRAINT
	PK_Project PRIMARY KEY CLUSTERED 
	(
	ProjectID
	) ON [PRIMARY]

GO
ALTER TABLE dbo.Project WITH NOCHECK ADD CONSTRAINT
	FK_Project_ProjectGroup FOREIGN KEY
	(
	ProjectGroupID
	) REFERENCES dbo.ProjectGroup
	(
	ProjectGroupID
	)
GO
ALTER TABLE dbo.Project WITH NOCHECK ADD CONSTRAINT
	FK_Project_ProjectStatus FOREIGN KEY
	(
	ProjectStatusID
	) REFERENCES dbo.ProjectStatus
	(
	ProjectStatusID
	)
GO
ALTER TABLE dbo.Project WITH NOCHECK ADD CONSTRAINT
	FK_Project_ProjectCategory FOREIGN KEY
	(
	ProjectCategoryID
	) REFERENCES dbo.ProjectCategory
	(
	ProjectCategoryID
	)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.[Update] WITH NOCHECK ADD CONSTRAINT
	FK_Update_Project FOREIGN KEY
	(
	ProjectID
	) REFERENCES dbo.Project
	(
	ProjectID
	)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProjectNotification WITH NOCHECK ADD CONSTRAINT
	FK_ProjectNotification_Project FOREIGN KEY
	(
	ProjectID
	) REFERENCES dbo.Project
	(
	ProjectID
	)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProjectNotificationExclusion WITH NOCHECK ADD CONSTRAINT
	FK_ProjectNotificationExclusion_Project FOREIGN KEY
	(
	ProjectID
	) REFERENCES dbo.Project
	(
	ProjectID
	)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.LogEntry WITH NOCHECK ADD CONSTRAINT
	FK_LogEntry_Project FOREIGN KEY
	(
	ProjectID
	) REFERENCES dbo.Project
	(
	ProjectID
	)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.ProjectUser WITH NOCHECK ADD CONSTRAINT
	FK_ProjectUser_Project FOREIGN KEY
	(
	ProjectID
	) REFERENCES dbo.Project
	(
	ProjectID
	)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Notification WITH NOCHECK ADD CONSTRAINT
	FK_Notification_Project FOREIGN KEY
	(
	ProjectID
	) REFERENCES dbo.Project
	(
	ProjectID
	)
GO
COMMIT
