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
using System.Web.Configuration;

public partial class UserPassword : DL_WEB.BLL.Security.SecurityPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["Login"] != null)
            Login.Text = Request.QueryString["Login"];
    }

    protected void ChangeButton_Click(object sender, EventArgs e)
    {
        MembershipSection section = (MembershipSection)ConfigurationManager.GetSection("system.web/membership");
        DL_WEB.BLL.DLMembershipProvider MembershipProvider = new DL_WEB.BLL.DLMembershipProvider();
        MembershipProvider.Initialize(Login.Text, section.Providers[section.DefaultProvider].Parameters);
        bool Result = MembershipProvider.ChangePassword(Login.Text, null, NewPassword.Text);
        if (Result)
        {
            Response.Redirect("UserList.aspx");
        }
        else
        {
            ErrorLabel.Visible = true;
            ErrorLabel.Text = string.Format(ErrorLabel.Text, MembershipProvider.MinRequiredPasswordLength, MembershipProvider.MinRequiredNonAlphanumericCharacters);
        }
    }
}
