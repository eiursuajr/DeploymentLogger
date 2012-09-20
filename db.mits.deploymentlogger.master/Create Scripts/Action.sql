if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_Action_Action]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[Action] DROP CONSTRAINT FK_Action_Action
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[FK_RoleAction_Action]') and OBJECTPROPERTY(id, N'IsForeignKey') = 1)
ALTER TABLE [dbo].[RoleAction] DROP CONSTRAINT FK_RoleAction_Action
GO

if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[Action]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[Action]
GO

CREATE TABLE [dbo].[Action] (
	[ActionID] [int] IDENTITY (1, 1) NOT NULL ,
	[ParentID] [int] NULL ,
	[Name] [varchar] (50) COLLATE Cyrillic_General_CI_AS NOT NULL ,
	[URL] [varchar] (1000) COLLATE Cyrillic_General_CI_AS NULL ,
	[ControlID] [varchar] (1000) COLLATE Cyrillic_General_CI_AS NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[Action] ADD 
	CONSTRAINT [PK_Action] PRIMARY KEY  CLUSTERED 
	(
		[ActionID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[Action] ADD 
	CONSTRAINT [FK_Action_Action] FOREIGN KEY 
	(
		[ParentID]
	) REFERENCES [dbo].[Action] (
		[ActionID]
	)
GO

