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

public partial class ErrorPage : DL_WEB.BLL.Security.SecurityPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string msg = "An unexpected error occurred. Please try again.";
		
		Exception exc = Context.Items["Exception"] as Exception;
		if(null != exc)
        {
            msg = exc.Message;
			stacktrace.Text = exc.StackTrace;
		}
		
		errorMessage.Text = msg;
    }
}
