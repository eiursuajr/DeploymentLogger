 --
-- Script To Update NotificationType Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:50 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating NotificationType Table'
GO
SET ARITHABORT ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT Name FROM sysobjects WHERE Name = N'FK_LogEntryStatusNotificationType_NotificationType')
      ALTER TABLE [dbo].[LogEntryStatusNotificationType] DROP CONSTRAINT [FK_LogEntryStatusNotificationType_NotificationType]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT Name FROM sysobjects WHERE Name = N'FK_Notification_NotificationType')
      ALTER TABLE [dbo].[Notification] DROP CONSTRAINT [FK_Notification_NotificationType]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT Name FROM sysobjects WHERE Name = N'FK_ProjectNotification_NotificationType')
      ALTER TABLE [dbo].[ProjectNotification] DROP CONSTRAINT [FK_ProjectNotification_NotificationType]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT Name FROM sysobjects WHERE Name = N'FK_UpdateStatusNotificationType_NotificationType')
      ALTER TABLE [dbo].[UpdateStatusNotificationType] DROP CONSTRAINT [FK_UpdateStatusNotificationType_NotificationType]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   CREATE TABLE [dbo].[tmp_NotificationType] (
   [NotificationTypeID] [int] IDENTITY (1, 1) NOT NULL ,
   [Name] [varchar] (255) COLLATE Cyrillic_General_CI_AS NULL ,
   [Description] [varchar] (1024) COLLATE Cyrillic_General_CI_AS NULL ,
   [ProcessingAssembly] [varchar] (1024) COLLATE Cyrillic_General_CI_AS NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_NotificationType] ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   INSERT INTO [dbo].[tmp_NotificationType] ([NotificationTypeID], [Name], [Description])
   SELECT [NotificationTypeID], [Name], [Description]
   FROM [dbo].[NotificationType]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_NotificationType] OFF
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [dbo].[NotificationType]
GO

sp_rename N'[dbo].[tmp_NotificationType]', N'NotificationType'

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[NotificationType] WITH NOCHECK ADD
      CONSTRAINT [PK_NotificationType] PRIMARY KEY CLUSTERED (
         [NotificationTypeID]
      )
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'NotificationType Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update NotificationType Table'
END
GO


--
-- Script To Update NotificationType Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:50 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating NotificationType Table'
GO
SET ARITHABORT ON
IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[LogEntryStatusNotificationType] ADD
      CONSTRAINT [FK_LogEntryStatusNotificationType_NotificationType] FOREIGN KEY (
         [NotificationTypeID]
      ) REFERENCES [dbo].[NotificationType] (
         [NotificationTypeID]
      )
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[Notification] ADD
      CONSTRAINT [FK_Notification_NotificationType] FOREIGN KEY (
         [NotificationTypeID]
      ) REFERENCES [dbo].[NotificationType] (
         [NotificationTypeID]
      )
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[ProjectNotification] ADD
      CONSTRAINT [FK_ProjectNotification_NotificationType] FOREIGN KEY (
         [NotificationTypeID]
      ) REFERENCES [dbo].[NotificationType] (
         [NotificationTypeID]
      )
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[UpdateStatusNotificationType] ADD
      CONSTRAINT [FK_UpdateStatusNotificationType_NotificationType] FOREIGN KEY (
         [NotificationTypeID]
      ) REFERENCES [dbo].[NotificationType] (
         [NotificationTypeID]
      )
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'NotificationType Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update NotificationType Table'
END
GO
