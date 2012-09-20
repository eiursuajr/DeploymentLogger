using System;
using System.Data;
using System.Web.UI.WebControls;

using DL_WEB.DAL.Master;

public partial class Projects : DL_WEB.BLL.Security.SecurityPage
{

    #region Members

    private DL_WEB.DAL.Client.ProjectStatus oProjectStatus;
	private DL_WEB.DAL.Client.ProjectCategory oProjectCategory;

	#endregion

	protected void Page_Load(object sender, EventArgs e)
	{
		oProjectStatus = new DL_WEB.DAL.Client.ProjectStatus();
		oProjectStatus.LoadAll();

		oProjectCategory = new DL_WEB.DAL.Client.ProjectCategory();
		oProjectCategory.LoadAll();
	}

	protected void gvProjects_RowDataBound(object sender, GridViewRowEventArgs e)
	{
		DataRowView drv = e.Row.DataItem as DataRowView;
		if (drv != null)
		{
			Label NameLabel = e.Row.FindControl("ProjectStatusName") as Label;
			if (NameLabel != null)
			{
				oProjectStatus.DefaultView.RowFilter = string.Format("ProjectStatusID = {0}", drv["ProjectStatusID"]);
				if (oProjectStatus.DefaultView.Count > 0)
					NameLabel.Text = oProjectStatus.DefaultView[0]["Name"].ToString();
			}

			NameLabel = e.Row.FindControl("ProjectCategoryName") as Label;
			if (NameLabel != null)
			{
				oProjectCategory.DefaultView.RowFilter = string.Format("ProjectCategoryID = {0}", drv["ProjectCategoryID"]);
				if (oProjectCategory.DefaultView.Count > 0)
					NameLabel.Text = oProjectCategory.DefaultView[0]["Name"].ToString();
			}
		}
	}
}
