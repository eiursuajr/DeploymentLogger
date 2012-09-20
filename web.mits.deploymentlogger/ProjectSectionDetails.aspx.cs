using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class ProjectSectionDetails : DL_WEB.BLL.Security.SecurityPage
{
    #region Members

    private int m_ProjectSectionID;

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

    public int ProjectSectionID
    {
        get
        {
            int CurrentID = 0;
            if (Request.QueryString["ProjectSectionID"] != null)
                CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["ProjectSectionID"]);
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
            ProjectInfo1.ProjectID = this.ProjectID;

            if (this.ProjectSectionID == 0)
            {
                CommandField cmdField = ProjectSectionDetailsView.Fields[ProjectSectionDetailsView.Fields.Count - 1] as CommandField;
                if (cmdField != null)
                    cmdField.UpdateText = "Insert";
            }
        }
    }

    protected void ProjectSectionDetailsView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower().CompareTo("cancel") == 0)
            Response.Redirect("ProjectSections.aspx?ProjectID=" + this.ProjectID.ToString());
    }

    protected void ProjectSectionDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string Name = e.NewValues["Name"].ToString();
        if (this.ProjectSectionID > 0)
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.ProjectSectionUpdated, "ProjectSection " + Name + " updated", ActivityObject.ProjectSection, m_ProjectSectionID, this.UserGUID, Context.User.Identity.Name);
        else
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.ProjectSectionCreated, "ProjectSection " + Name + " created", ActivityObject.ProjectSection, m_ProjectSectionID, this.UserGUID, Context.User.Identity.Name);
        Response.Redirect("ProjectSections.aspx?ProjectID=" + this.ProjectID.ToString());
    }

    protected void ProjectSectionDataSource_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        m_ProjectSectionID = Micajah.Common.Helper.Convert.o2i(e.ReturnValue);
    }
}
