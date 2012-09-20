 /****** Object:  View [dbo].[LogEntriesView]    Script Date: 06/13/2007 16:38:00 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[LogEntriesView]'))
DROP VIEW [dbo].[LogEntriesView]

GO
/****** Object:  View [dbo].[LogEntriesView]    Script Date: 06/13/2007 19:43:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[LogEntriesView]
AS
SELECT     dbo.LogEntry.Description, dbo.LogEntry.Header, dbo.LogEntry.LogEntryID, dbo.LogEntry.LogEntryTypeID, dbo.LogEntry.ProjectID, 
                      dbo.LogEntry.PublicDescription, dbo.LogEntry.PublicHeader, dbo.LogEntry.TimeStamp, dbo.LogEntry.UpdateID, dbo.LogEntry.LogEntryStatusID, 
                      dbo.LogEntryStatus.Name AS StatusName, dbo.LogEntryStatus.StatusOrder, dbo.LogEntryStatus.ButtonText, dbo.LogEntryType.Name AS TypeName, 
                      dbo.LogEntry.ImpactLevelID, dbo.ImpactLevel.Name AS ImpactLevelName, dbo.LogEntry.ProjectSectionID, 
                      dbo.ProjectSection.Name AS SectionName
FROM         dbo.LogEntry INNER JOIN
                      dbo.LogEntryStatus ON dbo.LogEntry.LogEntryStatusID = dbo.LogEntryStatus.LogEntryStatusID INNER JOIN
                      dbo.LogEntryType ON dbo.LogEntry.LogEntryTypeID = dbo.LogEntryType.LogEntryTypeID INNER JOIN
                      dbo.ImpactLevel ON dbo.LogEntry.ImpactLevelID = dbo.ImpactLevel.ImpactLevelID INNER JOIN
                      dbo.ProjectSection ON dbo.LogEntry.ProjectSectionID = dbo.ProjectSection.ProjectSectionID

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[36] 4[17] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = -96
         Left = 0
      End
      Begin Tables = 
         Begin Table = "LogEntry"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 121
               Right = 204
            End
            DisplayFlags = 280
            TopColumn = 4
         End
         Begin Table = "LogEntryStatus"
            Begin Extent = 
               Top = 6
               Left = 242
               Bottom = 121
               Right = 408
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "LogEntryType"
            Begin Extent = 
               Top = 6
               Left = 446
               Bottom = 106
               Right = 605
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ImpactLevel"
            Begin Extent = 
               Top = 108
               Left = 446
               Bottom = 216
               Right = 597
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProjectSection"
            Begin Extent = 
               Top = 126
               Left = 38
               Bottom = 234
               Right = 198
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 18
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Widt' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LogEntriesView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'h = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LogEntriesView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'LogEntriesView'