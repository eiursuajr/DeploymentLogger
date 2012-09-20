--
-- Script To Update AddressBook Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:52 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating AddressBook Table'
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
   IF EXISTS (SELECT Name FROM sysobjects WHERE Name = N'FK_User_AddressBook')
      ALTER TABLE [dbo].[User] DROP CONSTRAINT [FK_User_AddressBook]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   CREATE TABLE [dbo].[tmp_AddressBook] (
   [EntryID] [int] IDENTITY (1, 1) NOT NULL ,
   [FirstName] [varchar] (255) COLLATE Cyrillic_General_CI_AS NOT NULL ,
   [LastName] [varchar] (255) COLLATE Cyrillic_General_CI_AS NULL ,
   [MiddleName] [varchar] (50) COLLATE Cyrillic_General_CI_AS NULL ,
   [JobTitle] [varchar] (255) COLLATE Cyrillic_General_CI_AS NULL ,
   [Company] [varchar] (255) COLLATE Cyrillic_General_CI_AS NULL ,
   [BusinessAddress] [varchar] (1024) COLLATE Cyrillic_General_CI_AS NULL ,
   [HomeAddress] [varchar] (1024) COLLATE Cyrillic_General_CI_AS NULL ,
   [HomePhone] [varchar] (50) COLLATE Cyrillic_General_CI_AS NULL ,
   [WorkPhone] [varchar] (50) COLLATE Cyrillic_General_CI_AS NULL ,
   [PrimaryEmail] [varchar] (50) COLLATE Cyrillic_General_CI_AS NOT NULL ,
   [SecondaryEmail] [varchar] (50) COLLATE Cyrillic_General_CI_AS NULL ,
   [UserID] [int] NULL ,
   [IsShared] [bit] NULL
)
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_AddressBook] ON
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   INSERT INTO [dbo].[tmp_AddressBook] ([EntryID], [FirstName], [LastName], [MiddleName], [HomePhone], [WorkPhone], [PrimaryEmail], [SecondaryEmail], [UserID], [IsShared])
   SELECT [EntryID], [FirstName], [LastName], [MiddleName], [HomePhone], [WorkPhone], [PrimaryEmail], [SecondaryEmail], [UserID], [IsShared]
   FROM [dbo].[AddressBook]
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   SET IDENTITY_INSERT [dbo].[tmp_AddressBook] OFF
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   DROP TABLE [dbo].[AddressBook]
GO

sp_rename N'[dbo].[tmp_AddressBook]', N'AddressBook'

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[AddressBook] WITH NOCHECK ADD
      CONSTRAINT [PK_AddressBook] PRIMARY KEY CLUSTERED (
         [EntryID]
      )
GO

IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
BEGIN
   PRINT 'AddressBook Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update AddressBook Table'
END
GO


--
-- Script To Update AddressBook Table In mits_deploymentlogger_client1_beta on micajah.sql1
-- Generated Friday, February 10, 2006, at 02:52 AM
--
-- Please backup mits_deploymentlogger_client1_beta on micajah.sql1 before executing this script
--


BEGIN TRANSACTION
GO
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
GO

PRINT 'Updating AddressBook Table'
GO
SET ARITHABORT ON
IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[AddressBook] WITH NOCHECK ADD
      CONSTRAINT [FK_AddressBook_User] FOREIGN KEY (
         [UserID]
      ) REFERENCES [dbo].[User] (
         [UserID]
      )
GO


IF @@ERROR <> 0
   IF @@TRANCOUNT = 1 ROLLBACK TRANSACTION
GO

IF @@TRANCOUNT = 1
   ALTER TABLE [dbo].[ProjectNotificationExclusion] ADD
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
   ALTER TABLE [dbo].[User] WITH NOCHECK ADD
      CONSTRAINT [FK_User_AddressBook] FOREIGN KEY (
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
   PRINT 'AddressBook Table Updated Successfully'
   COMMIT TRANSACTION
END ELSE
BEGIN
   PRINT 'Failed To Update AddressBook Table'
END
GO
 