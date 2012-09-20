if exists (select * from dbo.sysobjects where id = object_id(N'[dbo].[RoleAction]') and OBJECTPROPERTY(id, N'IsUserTable') = 1)
drop table [dbo].[RoleAction]
GO

CREATE TABLE [dbo].[RoleAction] (
	[RoleID] [int] NOT NULL ,
	[ActionID] [int] NOT NULL 
) ON [PRIMARY]
GO

ALTER TABLE [dbo].[RoleAction] ADD 
	CONSTRAINT [PK_RoleAction] PRIMARY KEY  CLUSTERED 
	(
		[RoleID],
		[ActionID]
	)  ON [PRIMARY] 
GO

ALTER TABLE [dbo].[RoleAction] ADD 
	CONSTRAINT [FK_RoleAction_Action] FOREIGN KEY 
	(
		[ActionID]
	) REFERENCES [dbo].[Action] (
		[ActionID]
	) ON DELETE CASCADE ,
	CONSTRAINT [FK_RoleAction_Role] FOREIGN KEY 
	(
		[RoleID]
	) REFERENCES [dbo].[Role] (
		[RoleID]
	) ON DELETE CASCADE 
GO

