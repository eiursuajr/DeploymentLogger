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
using MyGeneration.dOOdads;
using System.Net.Mail;
using System.Net;

public partial class anonymous_Subscribe : System.Web.UI.Page
{
    #region Properties

    public int ProjectID
    {
        get
        {
            int CurrentID = 0;
            if (Request.QueryString["ProjectID"] != null)
                CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["ProjectID"]);
            return CurrentID;
        }
    }
    public int OrganizationID
    {
        get
        {
            int CurrentID = 0;
            if (Request.QueryString["OrganizationID"] != null)
                CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["OrganizationID"]);
            return CurrentID;
        }
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            MultiView1.ActiveViewIndex = 1;
            ReturnLink.NavigateUrl = string.Format("~/Reports/DeploymentLog.aspx?ProjectID={0}&OrganizationID={1}", this.ProjectID.ToString(), this.OrganizationID.ToString());
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        BusinessEntity.PushStaticConnectionString();

        BusinessEntity.StaticConnectionString = ConfigurationSettings.AppSettings["dbConnection"];

        DL_WEB.DAL.Master.Organization oOrganization = new DL_WEB.DAL.Master.Organization();
        oOrganization.LoadByPrimaryKey(OrganizationID);

        DL_WEB.DAL.Master.Database oDatabase = new DL_WEB.DAL.Master.Database();
        if (oOrganization.RowCount > 0)
        {
            oDatabase.LoadByPrimaryKey(oOrganization.DatabaseID);
        }

        DL_WEB.DAL.Master.Server oServer = new DL_WEB.DAL.Master.Server();
        if (oDatabase.RowCount > 0)
        {
            oServer.LoadByPrimaryKey(oDatabase.ServerID);

            MyGeneration.dOOdads.BusinessEntity.StaticConnectionString = oDatabase.DBConnectionString;
        }

        AddressBook oAddressBook = new AddressBook();
        oAddressBook.AddNew();
        oAddressBook.FirstName = tbFirstName.Text;
        oAddressBook.LastName = tbLastName.Text;
        oAddressBook.Company = tbCompany.Text;
        oAddressBook.PrimaryEmail = tbEmail.Text;
        oAddressBook.ProjectID = this.ProjectID;
        oAddressBook.IsApproved = false;
        oAddressBook.GUID = Guid.NewGuid();
        oAddressBook.Save();

        ProjectNotification oProjectNotification = new ProjectNotification();
        oProjectNotification.AddNew();
        oProjectNotification.AddressBookEntryID = oAddressBook.EntryID;
        oProjectNotification.ProjectID = this.ProjectID;
        oProjectNotification.ImpactLevelID = Micajah.Common.Helper.Convert.o2i(this.ImpactLevelList.SelectedValue);
        oProjectNotification.NotificationTypeID = 1;
        oProjectNotification.Save();

        BusinessEntity.PopStaticConnectionString();

        #region Sending confirmation request to this contact

        SmtpClient client = new SmtpClient(oServer.MailHost);
        client.Credentials = new NetworkCredential(oServer.MailUser, oServer.MailPass);

        MailAddress from = new MailAddress(oServer.MailEmail, "Deployment Logger");
        MailAddress to = new MailAddress(tbEmail.Text, tbFirstName.Text + " " + tbLastName.Text);
        MailMessage message = new MailMessage(from, to);

        message.Subject = "Welcome to Deployment Logger";
        message.Body = String.Format("Dear, {3},\n\nThank you for registering with Deployment Logger.\n" +
            "To activate your account and verify your e-mail address, please click on the following link:\n" +
            "{0}anonymous/SubscribeConfirmation.aspx?addressbookid={1}&databaseid={2}&guid={4}\n\n" +
            "If you have received this mail in error, you do not need to take any action to cancel the account. " +
            "The account will not be activated, and you will not receive any further emails.\n\n" +
            "If clicking the link above does not work, copy and paste the URL in a new browser window instead.\n\n" +
            "Thank you for using Micajah Deployment Logger!" +
            "---" +
            "This is a post-only mailing.  Replies to this message are not monitored or answered.", oServer.WebReference, oAddressBook.EntryID, oDatabase.DatabaseID, tbFirstName.Text + " " + tbLastName.Text, HttpUtility.UrlEncode(oAddressBook.GUID.ToString()));
        client.Send(message);
        message.Dispose();

        #endregion

    }
}
