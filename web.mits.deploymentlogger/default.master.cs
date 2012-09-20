using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using MyGeneration.dOOdads;
using DL_WEB;

public partial class _default : System.Web.UI.MasterPage
{
    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);

        if (Context.User.Identity.IsAuthenticated)
        {
            if (null == Session["Organization"])
            {
                if (!(Request.FilePath.Contains("ActiveOrganization.aspx") || Request.FilePath.Contains("Logoff.aspx")))
                {
                    Response.Redirect("./ActiveOrganization.aspx?redirecturl=" + HttpUtility.UrlEncode(Request.FilePath));
                }
                else
                {
                    MyGeneration.dOOdads.BusinessEntity.ClearConnectionString();
                }
            }
            else
            {
                DL_WEB.DAL.Master.Organization org = Session["Organization"] as DL_WEB.DAL.Master.Organization;

                ProfileTopLink.Visible = ProfileBottomLink.Visible = true;
                lblOrganizationName.Text = ":&nbsp;" + org.Name;

                if (Session["RoleActions"] == null)
                {
                    DL_WEB.DAL.Master.UserRole oUserRole = new DL_WEB.DAL.Master.UserRole();
                    oUserRole.Where.UserID.Operator = WhereParameter.Operand.Equal;
                    oUserRole.Where.UserID.Value = DL_WEB.DAL.Master.User.GetUserID(Context.User.Identity.Name);
                    oUserRole.Where.OrganizationID.Operator = WhereParameter.Operand.Equal;
                    oUserRole.Where.OrganizationID.Value = org.OrganizationID;
                    oUserRole.Query.Load();
                    DL_WEB.DAL.Master.RoleAction oRoleAction = new DL_WEB.DAL.Master.RoleAction();
                    DataTable dtRoleActions = oRoleAction.LoadRoleActionsByRoleID(oUserRole.RoleID);
                    Session.Add("RoleActions", dtRoleActions);
                }
            }
        }
    }
}
