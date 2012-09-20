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
using MyGeneration.dOOdads;
using DL_WEB.DAL.Client;

public partial class anonymous_SubscribeConfirmation : System.Web.UI.Page
{
    #region Properties

    #region AddressBookID

    public int AddressBookID
    {
        get
        {
            int CurrentID = 0;
            if (Request.QueryString["AddressBookID"] != null)
                CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["AddressBookID"]);
            return CurrentID;
        }
    }

    #endregion

    #region DatabaseID

    public int DatabaseID
    {
        get
        {
            int CurrentID = 0;
            if (Request.QueryString["DatabaseID"] != null)
                CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["DatabaseID"]);
            return CurrentID;
        }
    }
    
    #endregion 

    #region GUID

    public string GUID
    {
        get
        {
            string CurrentID = string.Empty;
            if (Request.QueryString["GUID"] != null)
                CurrentID = HttpUtility.UrlDecode(Request.QueryString["GUID"]);
            return CurrentID;
        }
    }

    #endregion

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        BusinessEntity.PushStaticConnectionString();

        try
        {

            BusinessEntity.StaticConnectionString = ConfigurationSettings.AppSettings["dbConnection"];

            DL_WEB.DAL.Master.Database oDatabase = new DL_WEB.DAL.Master.Database();
            oDatabase.LoadByPrimaryKey(DatabaseID);

            BusinessEntity.StaticConnectionString = oDatabase.DBConnectionString;

            AddressBook oAddressBook = new AddressBook();
            oAddressBook.LoadAddressBookByPrimaryKey(AddressBookID);

            if (0 == oAddressBook.GUID.ToString().CompareTo(GUID))
            {
                oAddressBook.IsApproved = true;

                NotificationType oNotificationType = new NotificationType();
                oNotificationType.Where.IsClientUpdate.Value = true;
                oNotificationType.Query.Load();

                do
                {
                    ProjectNotification oProjectNotification = new ProjectNotification();
                    oProjectNotification.AddNew();
                    oProjectNotification.AddressBookEntryID = oAddressBook.EntryID;
                    oProjectNotification.ProjectID = oAddressBook.ProjectID;
                    oProjectNotification.NotificationTypeID = oNotificationType.NotificationTypeID;

                    oProjectNotification.Save();

                } while (oNotificationType.MoveNext());

                oAddressBook.Save();
            }
            else
            {
                MultiView1.ActiveViewIndex = 1;
            }
            MultiView1.ActiveViewIndex = 0;
        }
        catch (Exception)
        {
            MultiView1.ActiveViewIndex = 1;
        }
        finally
        {
            BusinessEntity.PopStaticConnectionString();
        }
    }
}
