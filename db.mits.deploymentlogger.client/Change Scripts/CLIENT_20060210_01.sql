 --
-- Script To Update LogEntryStatus Table In DeploymentLogger on (local)
-- Generated Friday, February 10, 2006, at 01:40 AM
--
-- Please backup DeploymentLogger on (local) before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating LogEntryStatus Table'
GO
SET ARITHABORT ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT Name FROM sysobjects WHERE Name = N'FK_LogEntry_LogEntryStatus')
      ALTER TABLE [dbo].[LogEntry] DROP CONSTRAINT [FK_LogEntry_LogEntryStatus]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT Name FROM sysobjects WHERE Name = N'FK_LogEntryStatusNotificationType_LogEntryStatus')
      ALTER TABLE [dbo].[LogEntryStatusNotificationType] DROP CONSTRAINT [FK_LogEntryStatusNotificationType_LogEntryStatus]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   CREATE TABLE [dbo].[tmp_LogEntryStatus] (
   [LogEntryStatusID] [int] IDENTITY (1, 1) NOT NULL ,
   [Name] [varchar] (1024) COLLATE Cyrillic_General_CI_AS NOT NULL ,
   [Description] [varchar] (8000) COLLATE Cyrillic_General_CI_AS NULL ,
   [StatusOrder] [int] NOT NULL ,
   [ButtonText] [varchar] (255) COLLATE SQL_Latin1_General_CP1_CI_AS NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_LogEntryStatus] ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   INSERT INTO [dbo].[tmp_LogEntryStatus] ([LogEntryStatusID], [Name], [Description])
   SELECT [LogEntryStatusID], [Name], [Description]
   FROM [dbo].[LogEntryStatus]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_LogEntryStatus] OFF
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [dbo].[LogEntryStatus]
GO

sp_rename N'[dbo].[tmp_LogEntryStatus]', N'LogEntryStatus'

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[LogEntryStatus] WITH NOCHECK ADD
      CONSTRAINT [PK_LogEntryStatus] PRIMARY KEY CLUSTERED (
         [LogEntryStatusID]
      )
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'LogEntryStatus Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update LogEntryStatus Table'
END
GO


--
-- Script To Update LogEntryStatus Table In DeploymentLogger on (local)
-- Generated Friday, February 10, 2006, at 01:40 AM
--
-- Please backup DeploymentLogger on (local) before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating LogEntryStatus Table'
GO
SET ARITHABORT ON
IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[LogEntry] ADD
      CONSTRAINT [FK_LogEntry_LogEntryStatus] FOREIGN KEY (
         [LogEntryStatusID]
      ) REFERENCES [dbo].[LogEntryStatus] (
         [LogEntryStatusID]
      )
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[LogEntryStatusNotificationType] ADD
      CONSTRAINT [FK_LogEntryStatusNotificationType_LogEntryStatus] FOREIGN KEY (
         [LogEntryStatusID]
      ) REFERENCES [dbo].[LogEntryStatus] (
         [LogEntryStatusID]
      )
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'LogEntryStatus Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update LogEntryStatus Table'
END
GO
