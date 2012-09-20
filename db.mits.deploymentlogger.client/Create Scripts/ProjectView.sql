/****** Object:  View [dbo].[ProjectView]    Script Date: 06/14/2007 21:16:46 ******/
IF  EXISTS (SELECT * FROM sys.views WHERE object_id = OBJECT_ID(N'[dbo].[ProjectView]'))
DROP VIEW [dbo].[ProjectView]
/****** Object:  View [dbo].[ProjectView]    Script Date: 06/14/2007 21:16:37 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ProjectView]
AS
SELECT     dbo.Project.ProjectID, dbo.Project.DepartmentID, dbo.Project.Name, dbo.Project.Description, dbo.Project.StartDate, dbo.Project.FinishDate, 
                      dbo.Project.ProjectGroupID, dbo.ProjectGroup.Name AS ProjectGroupName, dbo.Project.ProjectCategoryID, 
                      dbo.ProjectCategory.Name AS ProjectCategoryName, dbo.Project.ProjectStatusID, dbo.ProjectStatus.Name AS ProjectStatusName
FROM         dbo.Project INNER JOIN
                      dbo.ProjectCategory ON dbo.Project.ProjectCategoryID = dbo.ProjectCategory.ProjectCategoryID INNER JOIN
                      dbo.ProjectGroup ON dbo.Project.ProjectGroupID = dbo.ProjectGroup.ProjectGroupID INNER JOIN
                      dbo.ProjectStatus ON dbo.Project.ProjectStatusID = dbo.ProjectStatus.ProjectStatusID

GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[38] 4[10] 2[19] 3) )"
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
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "Project"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 189
               Right = 209
            End
            DisplayFlags = 280
            TopColumn = 2
         End
         Begin Table = "ProjectCategory"
            Begin Extent = 
               Top = 6
               Left = 247
               Bottom = 106
               Right = 418
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProjectGroup"
            Begin Extent = 
               Top = 6
               Left = 456
               Bottom = 106
               Right = 611
            End
            DisplayFlags = 280
            TopColumn = 0
         End
         Begin Table = "ProjectStatus"
            Begin Extent = 
               Top = 6
               Left = 649
               Bottom = 106
               Right = 806
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
      Begin ColumnWidths = 13
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
         Grou' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProjectView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane2', @value=N'pBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProjectView'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=2 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'ProjectView'