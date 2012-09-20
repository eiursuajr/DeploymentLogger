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

public partial class AddressBook : DL_WEB.BLL.Security.SecurityPage
{
	#region Properties

	public int EntryID
	{
		get
		{
			int CurrentID = 0;
			if (Request.QueryString["EntryID"] != null)
				CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["EntryID"]);
			return CurrentID;
		}
	}

	public Guid UserGUID
	{
		get
		{
			return DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name);
		}
	}

	#endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DL_WEB.DAL.Client.AddressBook oAddressBook = new DL_WEB.DAL.Client.AddressBook();
            if (null != Request["action"] &&
                0 == Request["action"].CompareTo("delete") &&
                this.EntryID > 0)
            {
                oAddressBook.LoadByPrimaryKey(this.EntryID);

				string Name = oAddressBook.FirstName + " " + oAddressBook.LastName;

                oAddressBook.MarkAsDeleted();
                oAddressBook.Save();

				DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.AddressBookDeleted, "AddressBook " + Name + " deleted", ActivityObject.AddressBook, this.EntryID, UserGUID, Context.User.Identity.Name);
            }
            oAddressBook = new DL_WEB.DAL.Client.AddressBook();
            oAddressBook.LoadUserContacts(DL_WEB.DAL.Client.User.Instance.GetUserIDByGUID(UserGUID));
            gvAddressBookList.DataSource = oAddressBook.DefaultView;
            gvAddressBookList.DataBind();
        }
    }
}
