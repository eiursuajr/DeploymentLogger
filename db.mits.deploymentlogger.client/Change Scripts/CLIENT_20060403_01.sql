SET QUOTED_IDENTIFIER ON 
GO
SET ANSI_NULLS ON 
GO

ALTER  VIEW dbo.ProductionLogEntries
AS
SELECT     dbo.LogEntry.Description, dbo.LogEntry.Header, dbo.LogEntry.LogEntryID, dbo.LogEntry.LogEntryTypeID, dbo.LogEntry.ProjectID, 
                      dbo.LogEntry.PublicDescription, dbo.LogEntry.PublicHeader, dbo.LogEntry.TimeStamp, dbo.LogEntry.UpdateID, dbo.LogEntry.LogEntryStatusID, 
                      dbo.LogEntryType.IconPath, dbo.LogEntryType.Name AS TypeName
			, dbo.LogEntry.ImpactLevelID
FROM         dbo.LogEntry INNER JOIN
                      dbo.LogEntryStatus ON dbo.LogEntry.LogEntryStatusID = dbo.LogEntryStatus.LogEntryStatusID INNER JOIN
                      dbo.LogEntryType ON dbo.LogEntry.LogEntryTypeID = dbo.LogEntryType.LogEntryTypeID
WHERE     (ISNULL(dbo.LogEntryStatus.IsVisibleInLog, 0) <> 0)
GO
SET QUOTED_IDENTIFIER OFF 
GO
SET ANSI_NULLS ON 
GO

