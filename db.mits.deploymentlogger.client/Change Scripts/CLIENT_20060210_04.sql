 --
-- Script To Update LogEntryStatusNotificationType Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:58 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating LogEntryStatusNotificationType Table'
GO
SET ARITHABORT ON
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
BEGIN
   PRINT 'LogEntryStatusNotificationType Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update LogEntryStatusNotificationType Table'
END
GO


--
-- Script To Update ProjectNotificationExclusion Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:58 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating ProjectNotificationExclusion Table'
GO
SET ARITHABORT ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT Name FROM sysobjects WHERE Name = N'FK_ProjectNotificationExclusion_AddressBook')
      ALTER TABLE [dbo].[ProjectNotificationExclusion] DROP CONSTRAINT [FK_ProjectNotificationExclusion_AddressBook]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'ProjectNotificationExclusion Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update ProjectNotificationExclusion Table'
END
GO


--
-- Script To Update LogEntryStatusNotificationType Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:58 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating LogEntryStatusNotificationType Table'
GO
SET ARITHABORT ON
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
   PRINT 'LogEntryStatusNotificationType Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update LogEntryStatusNotificationType Table'
END
GO


--
-- Script To Update ProjectNotificationExclusion Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:58 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating ProjectNotificationExclusion Table'
GO
SET ARITHABORT ON
IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[ProjectNotificationExclusion] WITH NOCHECK ADD
      CONSTRAINT [FK_ProjectNotificationExclusion_AddressBook] FOREIGN KEY (
         [AddressBookEntryID]
      ) REFERENCES [dbo].[AddressBook] (
         [EntryID]
      )
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'ProjectNotificationExclusion Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update ProjectNotificationExclusion Table'
END
GO




--
-- Script To Update LogEntryStatusNotificationType Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:58 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating LogEntryStatusNotificationType Table'
GO
SET ARITHABORT ON
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
BEGIN
   PRINT 'LogEntryStatusNotificationType Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update LogEntryStatusNotificationType Table'
END
GO


--
-- Script To Update ProjectNotificationExclusion Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:58 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating ProjectNotificationExclusion Table'
GO
SET ARITHABORT ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   IF EXISTS (SELECT Name FROM sysobjects WHERE Name = N'FK_ProjectNotificationExclusion_AddressBook')
      ALTER TABLE [dbo].[ProjectNotificationExclusion] DROP CONSTRAINT [FK_ProjectNotificationExclusion_AddressBook]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'ProjectNotificationExclusion Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update ProjectNotificationExclusion Table'
END
GO


--
-- Script To Update LogEntryStatusNotificationType Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:58 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating LogEntryStatusNotificationType Table'
GO
SET ARITHABORT ON
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
   PRINT 'LogEntryStatusNotificationType Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update LogEntryStatusNotificationType Table'
END
GO


--
-- Script To Update ProjectNotificationExclusion Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:58 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating ProjectNotificationExclusion Table'
GO
SET ARITHABORT ON
IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[ProjectNotificationExclusion] WITH NOCHECK ADD
      CONSTRAINT [FK_ProjectNotificationExclusion_AddressBook] FOREIGN KEY (
         [AddressBookEntryID]
      ) REFERENCES [dbo].[AddressBook] (
         [EntryID]
      )
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'ProjectNotificationExclusion Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update ProjectNotificationExclusion Table'
END
GO
