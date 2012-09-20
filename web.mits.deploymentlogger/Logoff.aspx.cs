using System;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB;

public partial class Logoff : DL_WEB.BLL.Security.SecurityPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();
        FormsAuthentication.SignOut();
        MyGeneration.dOOdads.BusinessEntity.ClearConnectionString();
        Response.Redirect("~/Login.aspx?ReturnUrl=" + HttpUtility.UrlEncode(Global.DefaultPageURL));
    }
}
