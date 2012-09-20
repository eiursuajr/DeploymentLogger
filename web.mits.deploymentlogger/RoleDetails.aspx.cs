using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class RoleDetails : DL_WEB.BLL.Security.SecurityPage
{
    #region Members

    private int m_RoleID;

    #endregion

    #region Properties

    public int RoleID
    {
        get
        {
            if (m_RoleID <= 0 && Request.QueryString["RoleID"] != null)
                m_RoleID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["RoleID"]);
            return m_RoleID;
        }

        set
        {
            m_RoleID = value;
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
            if (Request.QueryString["RoleID"] != null)
                CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["RoleID"]);
            return CurrentID == 0;
        }
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack && this.IsNew)
        {
            CommandField cmdField = RoleDetailsView.Fields[RoleDetailsView.Fields.Count - 1] as CommandField;
            if (cmdField != null)
                cmdField.UpdateText = "Insert";
        }
    }

    protected void RoleDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string Name = e.NewValues["Name"].ToString();
        if (this.IsNew)
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.RoleCreated, "Role " + Name + " created", ActivityObject.Role, this.RoleID, this.UserGUID, Context.User.Identity.Name);
        else
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.RoleUpdated, "Role " + Name + " updated", ActivityObject.Role, this.RoleID, this.UserGUID, Context.User.Identity.Name);
        Response.Redirect("Roles.aspx");
    }

    protected void RoleDetailsView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower().CompareTo("cancel") == 0)
            Response.Redirect("Roles.aspx");
    }
}
