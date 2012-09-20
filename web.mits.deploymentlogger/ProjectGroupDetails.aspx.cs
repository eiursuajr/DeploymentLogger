using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class ProjectGroupDetails : DL_WEB.BLL.Security.SecurityPage
{
    #region Members

    private int iProjectGroupID = 0;

    #endregion

    #region Properies

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
        if (null != Request["id"])
        {
            iProjectGroupID = Convert.ToInt32(Request["id"]);
        }
        if (!IsPostBack && iProjectGroupID > 0)
        {
            ProjectGroup oProjectGroup = new ProjectGroup();
            oProjectGroup.LoadByPrimaryKey(iProjectGroupID);

            this.tbName.Text = oProjectGroup.Name;
            this.tbDescription.Text = oProjectGroup.Description;
        }
        else
        {
            UpdateLink.Text = "Insert";
        }
    }

    protected void UpdateLink_Click(object sender, EventArgs e)
    {
        ProjectGroup oProjectGroup = new ProjectGroup();

        if (0 == iProjectGroupID)
        {
            oProjectGroup.AddNew();
        }
        else
        {
            oProjectGroup.LoadByPrimaryKey(iProjectGroupID);
        }
        oProjectGroup.Name = tbName.Text;
        oProjectGroup.Description = tbDescription.Text;
        oProjectGroup.Save();

        if (0 == iProjectGroupID)
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.ProjectGroupCreated, "ProjectGroup " + oProjectGroup.Name + " created", ActivityObject.ProjectGroup, oProjectGroup.ProjectGroupID, this.UserGUID, Context.User.Identity.Name);
        else
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.ProjectGroupUpdated, "ProjectGroup " + oProjectGroup.Name + " updated", ActivityObject.ProjectGroup, oProjectGroup.ProjectGroupID, this.UserGUID, Context.User.Identity.Name);

        Response.Redirect("~/ProjectGroups.aspx");
    }
}
