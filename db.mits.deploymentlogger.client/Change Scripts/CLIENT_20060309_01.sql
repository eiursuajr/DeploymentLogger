/*
   Thursday, March 09, 200612:38:20 PM
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
ALTER TABLE dbo.Notification
	DROP CONSTRAINT FK_Notification_NotificationType1
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Notification
	DROP CONSTRAINT FK_Notification_Project
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.Notification
	DROP CONSTRAINT DF_Notification_DateCreated
GO
ALTER TABLE dbo.Notification
	DROP CONSTRAINT DF_Notification_Complete
GO
CREATE TABLE dbo.Tmp_Notification
	(
	NotificationID int NOT NULL IDENTITY (1, 1),
	NotificationTypeID int NOT NULL,
	ProjectID int NOT NULL,
	Header varchar(1024) NULL,
	Description varchar(8000) NULL,
	DateCreated datetime NOT NULL,
	Complete bit NOT NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.Tmp_Notification ADD CONSTRAINT
	DF_Notification_DateCreated DEFAULT (getdate()) FOR DateCreated
GO
ALTER TABLE dbo.Tmp_Notification ADD CONSTRAINT
	DF_Notification_Complete DEFAULT (0) FOR Complete
GO
SET IDENTITY_INSERT dbo.Tmp_Notification ON
GO
IF EXISTS(SELECT * FROM dbo.Notification)
	 EXEC('INSERT INTO dbo.Tmp_Notification (NotificationID, NotificationTypeID, ProjectID, Description, DateCreated, Complete)
		SELECT NotificationID, NotificationTypeID, ProjectID, Description, DateCreated, Complete FROM dbo.Notification WITH (HOLDLOCK TABLOCKX)')
GO
SET IDENTITY_INSERT dbo.Tmp_Notification OFF
GO
ALTER TABLE dbo.NotificationLog
	DROP CONSTRAINT FK_NotificationLog_Notification
GO
DROP TABLE dbo.Notification
GO
EXECUTE sp_rename N'dbo.Tmp_Notification', N'Notification', 'OBJECT' 
GO
ALTER TABLE dbo.Notification ADD CONSTRAINT
	PK_Notification_1 PRIMARY KEY CLUSTERED 
	(
	NotificationID
	) ON [PRIMARY]

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
ALTER TABLE dbo.Notification WITH NOCHECK ADD CONSTRAINT
	FK_Notification_NotificationType1 FOREIGN KEY
	(
	NotificationTypeID
	) REFERENCES dbo.NotificationType
	(
	NotificationTypeID
	)
GO
COMMIT
BEGIN TRANSACTION
GO
ALTER TABLE dbo.NotificationLog WITH NOCHECK ADD CONSTRAINT
	FK_NotificationLog_Notification FOREIGN KEY
	(
	NotificationID
	) REFERENCES dbo.Notification
	(
	NotificationID
	)
GO
COMMIT
