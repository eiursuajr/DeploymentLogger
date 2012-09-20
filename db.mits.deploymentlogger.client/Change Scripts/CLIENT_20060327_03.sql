/*
   Thursday, March 23, 20062:22:21 PM
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
COMMIT
BEGIN TRANSACTION
GO
CREATE TABLE dbo.ProjectSection
	(
	ProjectSectionID int NOT NULL IDENTITY (1, 1),
	ProjectID int NOT NULL,
	Name varchar(255) NOT NULL,
	Description varchar(1024) NULL
	)  ON [PRIMARY]
GO
ALTER TABLE dbo.ProjectSection ADD CONSTRAINT
	FK_ProjectSection_Project1 FOREIGN KEY
	(
	ProjectID
	) REFERENCES dbo.Project
	(
	ProjectID
	)
GO
COMMIT 