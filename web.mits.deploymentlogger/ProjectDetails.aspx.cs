using System;
using System.Web.UI.WebControls;
using DL_WEB.DAL.Client;

public partial class ProjectDetails : DL_WEB.BLL.Security.SecurityPage
{
	#region Members

	private int m_ProjectID;

	#endregion

	#region Properties

	public int ProjectID
	{
		get
		{
			if (m_ProjectID <= 0 && Request.QueryString["ProjectID"] != null)
				m_ProjectID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["ProjectID"]);
			return m_ProjectID;
		}

		set
		{
			m_ProjectID = value;
		}
	}

    public Guid UserGUID
    {
        get
        {
            return DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name);
        }
    }

	private bool IsNew
	{
		get
		{
			int CurrentID = 0;
			if (Request.QueryString["ProjectID"] != null)
				CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["ProjectID"]);
			return CurrentID == 0;
		}
	}

	#endregion

	protected void List_Init(object sender, EventArgs e)
	{
		if (!(this.IsPostBack || this.IsNew))
			(sender as DropDownList).Items.Clear();
	}

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack && this.IsNew)
        {
            TemplateField tmpltField = ProjectDetailsView.Fields[ProjectDetailsView.Fields.Count - 2] as TemplateField;
            tmpltField.Visible = false;
            CommandField cmdField = ProjectDetailsView.Fields[ProjectDetailsView.Fields.Count - 1] as CommandField;
            if (cmdField != null)
                cmdField.UpdateText = "Insert";
        }
    }

	protected void ProjectDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
	{
		string Name = e.NewValues["Name"].ToString();
		if (this.IsNew)
			DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.ProjectCreated, "Project " + Name + " created", ActivityObject.Project, this.ProjectID, this.UserGUID, Context.User.Identity.Name);
		else
			DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.ProjectUpdated, "Project " + Name + " updated", ActivityObject.Project, this.ProjectID, this.UserGUID, Context.User.Identity.Name);
		Response.Redirect("Projects.aspx");
	}

	protected void ProjectDataSource_Updated(object sender, ObjectDataSourceStatusEventArgs e)
	{
		this.ProjectID = Micajah.Common.Helper.Convert.o2i(e.ReturnValue);
	}
	
	protected void ProjectDetailsView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
	{
		if (e.CommandName.ToLower().CompareTo("cancel") == 0)
			Response.Redirect("Projects.aspx");
	}
}