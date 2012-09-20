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

public partial class Organizations : DL_WEB.BLL.Security.SecurityPage
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
            if (Request.QueryString["action"] != null)
            {
                if (Request.QueryString["action"].ToLower().CompareTo("delete") == 0)
                {
                    int CurrentId = this.OrganizationID;

                    DL_WEB.DAL.Master.Organization oOrganization = new DL_WEB.DAL.Master.Organization();
                    oOrganization.LoadByPrimaryKey(CurrentId);

                    string CurrentName = oOrganization.Name;

                    oOrganization.IsDeleted = true;
                    oOrganization.Save();

                    DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.OrganizationDeleted, "Organization " + CurrentName + " deleted", ActivityObject.Organization, CurrentId, this.UserGUID, Context.User.Identity.Name);
                }
            }
        }

        DL_DAL.Master.OrganizationView oOrganizationView = new DL_DAL.Master.OrganizationView();
        oOrganizationView.ConnectionString = DL_WEB.DAL.Master.Master.DBConnectionString;
        oOrganizationView.Where.IsDeleted.Value = false;
        oOrganizationView.Where.IsDeleted.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        oOrganizationView.Query.Load();

        OrganizationList.DataSource = oOrganizationView.DefaultView;
        OrganizationList.DataBind();
    }
}
