using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class ProjectSections : DL_WEB.BLL.Security.SecurityPage
{
	#region Members

	string m_Name = string.Empty;

	#endregion

	#region Properties

	public int ProjectID
	{
		get
		{
			int CurrentID = 0;
			if (Request.QueryString["ProjectID"] != null)
				CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["ProjectID"]);
			return CurrentID;
		}
	}

    public Guid UserGUID
    {
        get
        {
            return DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name);
        }
    }

	#endregion

	protected void Page_Load(object sender, EventArgs e)
    {
		if (!this.IsPostBack)
		{
			this.NewProjectSectionLink.NavigateUrl += "?ProjectID=" + ProjectID;

			ProjectInfo1.ProjectID = this.ProjectID;
		}
    }

	protected void SectionsList_RowDeleted(object sender, GridViewDeletedEventArgs e)
	{
		int ProjectSectionID = Micajah.Common.Helper.Convert.o2i(e.Keys["ProjectSectionID"]);
		DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.ProjectSectionDeleted, "ProjectSection " + m_Name + " deleted", ActivityObject.ProjectSection, ProjectSectionID, this.UserGUID, Context.User.Identity.Name);
	}
	
	protected void SectionsList_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName.ToLower().CompareTo("delete") == 0)
		{
			int ProjectSectionID = Micajah.Common.Helper.Convert.o2i(e.CommandArgument);
			ProjectSection oProjectSection = new ProjectSection();
			oProjectSection.LoadByPrimaryKey(ProjectSectionID);
			m_Name = oProjectSection.Name;
		}
	}
}
