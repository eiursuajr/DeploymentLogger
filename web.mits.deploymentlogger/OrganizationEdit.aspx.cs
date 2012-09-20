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

public partial class OrganizationEdit : DL_WEB.BLL.Security.SecurityPage
{
    #region Properties

    public Guid UserGUID
    {
        get
        {
            return DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name);
        }
    }

    public int OrganizationID
    {
        get
        {
            int CurrentId = 0;
            if (Request.QueryString["OrganizationID"] != null)
                CurrentId = Micajah.Common.Helper.Convert.o2i(Request.QueryString["OrganizationID"]);
            return CurrentId;
        }
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            if (this.OrganizationID == 0)
            {
                CommandField cmdField = OrganizationDetailsView.Fields[OrganizationDetailsView.Fields.Count - 1] as CommandField;
                if (cmdField != null)
                    cmdField.UpdateText = "Insert";
            }
        }
    }

    protected void List_Init(object sender, EventArgs e)
    {
        if (!(this.IsPostBack || this.OrganizationID == 0))
            (sender as DropDownList).Items.Clear();
    }

    protected void OrganizationDetailsView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower().CompareTo("cancel") == 0)
            Response.Redirect("Organizations.aspx");
    }

    protected void OrganizationDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        int CurrentId = Micajah.Common.Helper.Convert.o2i(e.Keys["OrganizationID"]);
        string CurrentName = e.NewValues["Name"].ToString();
        if (this.OrganizationID == 0)
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.OrganizationCreated, "Organization " + CurrentName + " created", ActivityObject.Organization, CurrentId, this.UserGUID, Context.User.Identity.Name);
        else
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.OrganizationUpdated, "Organization " + CurrentName + " updated", ActivityObject.Organization, CurrentId, this.UserGUID, Context.User.Identity.Name);
        Response.Redirect("Organizations.aspx");
    }
}
