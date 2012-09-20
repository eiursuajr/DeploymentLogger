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

public partial class UserList : DL_WEB.BLL.Security.SecurityPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            Session.Remove("UserRoles");
            Session.Remove("ClientUser");
            Session.Remove("MasterUser");
        }
    }
}
