/*
   Saturday, March 18, 20069:40:41 AM
   User: 
   Server: ANDREWS-MOBILE
   Database: DeploymentLogger_MASTER
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
CREATE TABLE dbo.Object
	(
	ObjectID int NOT NULL,
	Name varchar(50) NOT NULL,
	Description varchar(255) NULL
	)  ON [PRIMARY]
GO
COMMIT
