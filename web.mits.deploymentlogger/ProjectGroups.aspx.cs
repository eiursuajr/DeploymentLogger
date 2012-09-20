using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class ProjectGroups : DL_WEB.BLL.Security.SecurityPage
{
    #region Members

    string m_Name = string.Empty;

    #endregion

    #region Properties

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

    }

    protected void ProjectGroupList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower().CompareTo("delete") == 0)
        {
            ProjectGroup oProjectGroup = new ProjectGroup();
            oProjectGroup.LoadByPrimaryKey(Micajah.Common.Helper.Convert.o2i(e.CommandArgument));
            m_Name = oProjectGroup.Name;
        }
    }
    
    protected void ProjectGroupList_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        int ProjectGroupID = Micajah.Common.Helper.Convert.o2i(e.Keys["ProjectGroupID"]);
        DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.ProjectGroupDeleted, "ProjectGroup " + m_Name + " deleted", ActivityObject.ProjectGroup, ProjectGroupID, this.UserGUID, Context.User.Identity.Name);
    }
}
