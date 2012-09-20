using System;
using System.Web;
using System.Web.Security;
using System.Web.UI.WebControls;

public partial class Login : DL_WEB.BLL.Security.SecurityPage
{
    protected void loginCtrl_Authenticate(object sender, AuthenticateEventArgs e)
    {
        if (Membership.ValidateUser(Login1.UserName, Login1.Password))
        {
            FormsAuthentication.RedirectFromLoginPage(Login1.UserName, true);
            string RedirectURL = FormsAuthentication.GetRedirectUrl(Login1.UserName, true);
            Response.Redirect("./ActiveOrganization.aspx?redirecturl=" + HttpUtility.UrlEncode(RedirectURL));
        }
    }
}
