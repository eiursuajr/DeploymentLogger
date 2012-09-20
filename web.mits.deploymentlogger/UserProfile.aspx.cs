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
using ConvertHelper = Micajah.Common.Helper.Convert;
using DL_WEB.DAL.Master;

public partial class UserProfile : DL_WEB.BLL.Security.SecurityPage
{
    #region Properties

    public Guid UserGUID
    {
        get
        {
            return DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name);
        }
    }

    public int UserID
    {
        get
        {
            return DL_WEB.DAL.Master.User.GetUserID(Context.User.Identity.Name);
        }
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack)
        {
            LoadUser();
        }
    }

    private void LoadUser()
    {
        DL_WEB.DAL.Client.User oClientUser = LoadClientUserInfo(this.UserID, this.UserGUID);

        if (null != oClientUser && null != oClientUser.AddressBookEntry)
        {
            this.tbFirstName.Text = oClientUser.AddressBookEntry.FirstName;
            this.tbLastName.Text = oClientUser.AddressBookEntry.LastName;
            this.tbMiddleName.Text = oClientUser.AddressBookEntry.MiddleName;
            this.tbJobTitle.Text = oClientUser.AddressBookEntry.JobTitle;
            this.tbHomePhone.Text = oClientUser.AddressBookEntry.HomePhone;
            this.tbWorkPhone.Text = oClientUser.AddressBookEntry.WorkPhone;
        }
    }

    private DL_WEB.DAL.Client.User LoadClientUserInfo(int iUserID, Guid oUserGUID)
    {
        DL_WEB.DAL.Client.User oClientUser = new DL_WEB.DAL.Client.User();
        oClientUser.Where.GUID.Value = oUserGUID;

        UserRole oUserRole = new UserRole();
        oUserRole.Where.UserID.Value = iUserID;
        oUserRole.Query.Load();

        if (oUserRole.RowCount > 0)
        {
            DataRow[] drOrgs = Organization.Instance.Organizations.Select("OrganizationID = " + oUserRole.OrganizationID);
            if (drOrgs.Length > 0)
            {
                DataRow[] drsDBs = Database.Instance.Databases.Select("DatabaseID = " + drOrgs[0]["DatabaseID"]);
                if (drsDBs.Length > 0)
                {
                    oClientUser.ConnectionString = ConvertHelper.o2s(drsDBs[0]["DBConnectionString"]);
                    oClientUser.Query.Load();
                }
            }
        }

        return oClientUser;
    }
}
