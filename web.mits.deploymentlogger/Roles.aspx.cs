using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using DL_WEB.DAL.Client;

public partial class Roles : DL_WEB.BLL.Security.SecurityPage
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
    
    protected void linkbDelete_OnCommand(object sender, CommandEventArgs e)
    {
        DL_WEB.DAL.Master.Role oRole = new DL_WEB.DAL.Master.Role();
        oRole.LoadByPrimaryKey(Convert.ToInt32(e.CommandArgument));
        m_Name = oRole.Name;
        oRole.MarkAsDeleted();
        oRole.Save();
    }

    protected void GridView1_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        Int32 RoleID = Convert.ToInt32(e.Values["RoleID"].ToString());
        DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.RoleDeleted, "Role " + m_Name + " deleted", ActivityObject.Role, RoleID, this.UserGUID, Context.User.Identity.Name);
        Server.Transfer("~/Roles.aspx");
    }
}
