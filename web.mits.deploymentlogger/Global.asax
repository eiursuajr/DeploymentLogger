<%@ Application Inherits="DL_WEB.Global" Language="C#" %>
<%@ Import Namespace="System.Web" %>

<script RunAt="server" Language="C#">

    private const bool useCustomErrorPage = true;

    void Application_Error(object sender, EventArgs e)
    {
        if (useCustomErrorPage)
        {
            Exception exc = Server.GetLastError();
            if (null != exc)
            {
                if (exc is HttpUnhandledException && (null != exc.InnerException))
                {
                    exc = exc.InnerException;
                }

                bool isSecurityException = exc is System.Security.SecurityException;

                System.Web.Services.Protocols.SoapException soapExc = FindSoapException(exc);
                if (null != soapExc)
                {
                    isSecurityException = soapExc.Message.Contains("Request for principal permission failed");
                }

                if (isSecurityException)
                {
                    Server.ClearError();
                    Response.Redirect("~/Login.aspx");
                }
                else
                {
                    Server.ClearError();

                    #region Emailing exceptions

                    bool EnableExceptionEmailing = false;
                    if (ConfigurationManager.AppSettings["EnableExceptionEmailing"] != null)
                        EnableExceptionEmailing = Convert.ToBoolean(ConfigurationManager.AppSettings["EnableExceptionEmailing"]);

                    if (EnableExceptionEmailing)
                    {
                        DL_WEB.BLL.ErrorHandling.WebException WE = new DL_WEB.BLL.ErrorHandling.WebException();
                        WE.CurrentException = exc;
                        WE.MailFrom = ConfigurationManager.AppSettings["ExceptionMailFrom"];
                        WE.MailTo = ConfigurationManager.AppSettings["ExceptionMailTo"];
                        WE.Site = ("Deployment Logger Site");
                        WE.SmtpServer = ConfigurationManager.AppSettings["SMTPServer"];
                        WE.MailAdmin = ConfigurationManager.AppSettings["ExceptionMailAdmin"];
                        WE.FloodCount = 10;
                        WE.FloodMins = 5;
                        WE.Handle();
                    }

                    #endregion

                    Context.Items.Add("Exception", exc);
                    Server.Transfer("~/ErrorPage.aspx");
                }
            }
        }
    }

    private System.Web.Services.Protocols.SoapException FindSoapException(Exception exc)
    {
        if (null == exc)
            return null;
        if (exc is System.Web.Services.Protocols.SoapException)
            return (System.Web.Services.Protocols.SoapException)exc;
        return FindSoapException(exc.InnerException);
    }

</script>

