using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class ContactDetails : DL_WEB.BLL.Security.SecurityPage
{
    #region Members

    private int m_EntryID;

    #endregion

    #region Properties

    public Guid UserGUID
    {
        get
        {
            return DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name);
        }
    }

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

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            UserIDLabel.Text = DL_WEB.DAL.Client.User.Instance.GetUserIDByGUID(this.UserGUID).ToString();

            if (this.EntryID == 0)
            {
                CommandField cmdField = AddressBookDetailsView.Fields[AddressBookDetailsView.Fields.Count - 1] as CommandField;
                if (cmdField != null)
                    cmdField.UpdateText = "Insert";
            }
        }
    }

    protected void AddressBookDataSource_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        m_EntryID = Micajah.Common.Helper.Convert.o2i(e.ReturnValue);
    }

    protected void AddressBookDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        string Name = e.NewValues["FirstName"].ToString() + " " + e.NewValues["LastName"].ToString();
        if (EntryID > 0)
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.AddressBookUpdated, "AddressBook " + Name + " updated", ActivityObject.AddressBook, m_EntryID, this.UserGUID, Context.User.Identity.Name);
        else
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.AddressBookCreated, "AddressBook " + Name + " created", ActivityObject.AddressBook, m_EntryID, this.UserGUID, Context.User.Identity.Name);
        Response.Redirect("AddressBook.aspx");
    }

    protected void AddressBookDetailsView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower().CompareTo("cancel") == 0)
            Response.Redirect("AddressBook.aspx");
    }

    #endregion

}
