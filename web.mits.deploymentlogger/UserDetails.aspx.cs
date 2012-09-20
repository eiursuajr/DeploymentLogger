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

public partial class UserDetails : System.Web.UI.Page
{
    #region Members

    private int iUserID;

    #endregion

    #region Properties

    public int UserID
    {
        get
        {
            if (iUserID <= 0 && Request.QueryString["UserID"] != null)
            {
                iUserID = ConvertHelper.o2i(Request.QueryString["UserID"]);
            }
            return iUserID;
        }
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadUser();
        }
        else
        {
            StoreUserInfo();
        }
    }

    protected void linkbtnSave_Click(object sender, EventArgs e)
    {
        // save user to the multidatabase structure
        DL_WEB.DAL.Master.User oMasterUser = Session["MasterUser"] as DL_WEB.DAL.Master.User;
        DL_WEB.DAL.Client.User oClientUser = Session["ClientUser"] as DL_WEB.DAL.Client.User;
        oMasterUser.Save();

        Database oDatabase = new Database();
        Organization oOrganization = new Organization();

        ArrayList oUserRoles = Session["UserRoles"] as ArrayList;
        ArrayList oProcessedDatabases = new ArrayList();

        if (0 != UserID)
        {
            OrganizationUserRole oExistingUserRoles = new OrganizationUserRole();
            oExistingUserRoles.LoadUserOrganizationRole(UserID);

            foreach (DataRow dr in oExistingUserRoles.DefaultView.Table.Rows)
            {
                int iCurrentOrgID = ConvertHelper.o2i(dr["OrganizationID"]);
                int iCurrentRoleID = ConvertHelper.o2i(dr["RoleID"]);
                DataRow[] drsDB = Database.Instance.Databases.Select("DatabaseID = " + dr["DatabaseID"]);
                if (drsDB.Length > 0)
                {
                    string sConnectionString = ConvertHelper.o2s(drsDB[0]["DBConnectionString"]);

                    bool bShouldBeDeleted = false;

                    if (oUserRoles != null)
                    {
                        foreach (OrganizationRoleEntry oEntry in oUserRoles)
                        {
                            if (oEntry.ActionType == ActionTypes.Delete &&
                                oEntry.OrganizationID == iCurrentOrgID &&
                                oEntry.RoleID == iCurrentRoleID)
                            {
                                bShouldBeDeleted = true;
                                break;
                            }
                        }
                    }

                    DL_WEB.DAL.Client.User oClientUserRetrieved = new DL_WEB.DAL.Client.User();
                    oClientUserRetrieved.ConnectionString = sConnectionString;
                    oClientUserRetrieved.Where.GUID.Value = oMasterUser.GUID;
                    oClientUserRetrieved.Query.Load();
                    DL_WEB.DAL.Client.AddressBook oAddressBookRetrieved = oClientUserRetrieved.AddressBookEntry;

                    if (bShouldBeDeleted)
                    {
                        #region Deleting existing client database data

                        oClientUserRetrieved.MarkAsDeleted();
                        oClientUserRetrieved.Save();

                        oAddressBookRetrieved.MarkAsDeleted();
                        oAddressBookRetrieved.Save();

                        #endregion

                        #region Deleting assignment table (UserRole) data row

                        UserRole oUserRole = new UserRole();
                        oUserRole.Where.UserID.Value = UserID;
                        oUserRole.Where.UserID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                        oUserRole.Where.RoleID.Value = iCurrentRoleID;
                        oUserRole.Where.RoleID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                        oUserRole.Where.OrganizationID.Value = iCurrentOrgID;
                        oUserRole.Where.OrganizationID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

                        oUserRole.Query.Load();

                        if (oUserRole.RowCount > 0)
                        {
                            oUserRole.MarkAsDeleted();
                            oUserRole.Save();
                        }

                        #endregion
                    }
                    else
                    {
                        #region Updating existing client database data

                        DL_WEB.BLL.Helpers.DoodadsHelper.CopyData(oClientUser.AddressBookEntry, oAddressBookRetrieved);
                        oAddressBookRetrieved.Save();

                        DL_WEB.BLL.Helpers.DoodadsHelper.CopyData(oClientUser, oClientUserRetrieved);
                        oClientUser.UserID = oClientUserRetrieved.UserID;

                        oClientUserRetrieved.Save();

                        #endregion
                    }
                }
            }
        }

        if (oUserRoles != null)
        {
            foreach (OrganizationRoleEntry oUserRole in oUserRoles)
            {
                if (oUserRole.ActionType == ActionTypes.Delete)
                    continue;

                DataRow[] drOrg = Organization.Instance.Organizations.Select("OrganizationID = " + oUserRole.OrganizationID);

                if (drOrg.Length > 0)
                {
                    int iDatabaseID = ConvertHelper.o2i(drOrg[0]["DatabaseID"]);

                    DataRow[] drDbs = Database.Instance.Databases.Select("DatabaseID = " + iDatabaseID);
                    string sConnectionString = ConvertHelper.o2s(drDbs[0]["DBConnectionString"]);

                    #region Adding assigning info into the UserRole table

                    UserRole oAddingUserRole = new UserRole();
                    oAddingUserRole.AddNew();
                    oAddingUserRole.UserID = oMasterUser.UserID;
                    oAddingUserRole.RoleID = oUserRole.RoleID;
                    oAddingUserRole.OrganizationID = oUserRole.OrganizationID;

                    oAddingUserRole.Save();

                    #endregion

                    if (oProcessedDatabases.Contains(iDatabaseID))
                    {
                        continue;
                    }

                    if (drDbs.Length > 0)
                    {
                        #region Saving user into the client database

                        DL_WEB.DAL.Client.User oClientUserClone = new DL_WEB.DAL.Client.User();
                        oClientUserClone.AddNew();
                        DL_WEB.BLL.Helpers.DoodadsHelper.CopyData(oClientUser, oClientUserClone);
                        oClientUserClone.CreationDate = oClientUser.CreationDate;
                        oClientUserClone.IsApproved = oClientUser.IsApproved;
                        oClientUserClone.IsLockedOut = oClientUser.IsLockedOut;

                        oClientUserClone.AddressBookEntry = new DL_WEB.DAL.Client.AddressBook();
                        oClientUserClone.AddressBookEntry.AddNew();
                        DL_WEB.BLL.Helpers.DoodadsHelper.CopyData(oClientUser.AddressBookEntry, oClientUserClone.AddressBookEntry);

                        oClientUser.ConnectionString = sConnectionString;
                        oClientUser.AddressBookEntry.ConnectionString = sConnectionString;

                        oClientUserClone.AddressBookEntry.Save();
                        oClientUserClone.AddressBookEntryID = oClientUserClone.AddressBookEntry.EntryID;

                        oClientUserClone.Save();

                        #endregion

                        #region Updating processed databases list

                        oProcessedDatabases.Add(iDatabaseID);

                        #endregion
                    }
                }
            }
        }
        
        CancelLink_Click(sender, e);
    }

    #region LoadUser

    private void LoadUser()
    {
        if (this.UserID > 0)
        {
            DL_WEB.DAL.Master.User oMasterUser = LoadMasterUserInfo();

            if (null == oMasterUser)
                return;

            DL_WEB.DAL.Client.User oClientUser = LoadClientUserInfo(oMasterUser.UserID, oMasterUser.GUID);

            if (null != oClientUser &&
                null != oClientUser.AddressBookEntry)
            {
                this.tbFirstName.Text = oClientUser.AddressBookEntry.FirstName;
                this.tbLastName.Text = oClientUser.AddressBookEntry.LastName;
                this.tbMiddleName.Text = oClientUser.AddressBookEntry.MiddleName;
                this.tbJobTitle.Text = oClientUser.AddressBookEntry.JobTitle;
                this.tbHomePhone.Text = oClientUser.AddressBookEntry.HomePhone;
                this.tbWorkPhone.Text = oClientUser.AddressBookEntry.WorkPhone;
            }
        }
    }

    private DL_WEB.DAL.Master.User LoadMasterUserInfo()
    {
        DL_WEB.DAL.Master.User oMasterUser = null;
        if (null != Session["MasterUser"])
        {
            oMasterUser = Session["MasterUser"] as DL_WEB.DAL.Master.User;
        }
        else
        {
            oMasterUser = new DL_WEB.DAL.Master.User();
            oMasterUser.LoadByPrimaryKey(UserID);

            if (oMasterUser.RowCount == 0)
                return null;
        }

        this.tbLogin.Text = oMasterUser.Login;
        this.cbIsApproved.Checked = oMasterUser.IsApproved;

        if (this.UserID > 0)
        {
            if (!oMasterUser.IsColumnNull(DL_WEB.DAL.Master.User.ColumnNames.IsInactive))
                this.cbIsInactive.Checked = oMasterUser.IsInactive;
        }
        else
        {
            cbIsInactive.Checked = true;
            cbIsInactive.Enabled = false;
        }

        return oMasterUser;
    }

    public DL_WEB.DAL.Client.User LoadClientUserInfo(int iUserID, Guid oUserGUID)
    {
        DL_WEB.DAL.Client.User oClientUser = null;

        if (null != Session["ClientUser"])
        {
            oClientUser = Session["ClientUser"] as DL_WEB.DAL.Client.User;
        }
        else
        {
            oClientUser = new DL_WEB.DAL.Client.User();
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
        }

        return oClientUser;
    }

    #endregion

    #region StoreUserInfo

    private void StoreUserInfo()
    {
        DL_WEB.DAL.Master.User oMasterUser = new DL_WEB.DAL.Master.User();

        if (0 != UserID)
        {
            oMasterUser.LoadByPrimaryKey(UserID);

            if (0 != oMasterUser.RowCount)
            {
                oMasterUser.IsInactive = cbIsInactive.Checked;
                oMasterUser.IsApproved = cbIsApproved.Checked;
                oMasterUser.Login = tbLogin.Text;
                oMasterUser.Email = tbLogin.Text;
            }
        }
        else
        {
            oMasterUser.AddNew();
            oMasterUser.IsInactive = cbIsInactive.Checked;
            oMasterUser.IsApproved = cbIsApproved.Checked;
            oMasterUser.Login = tbLogin.Text;
            oMasterUser.Email = tbLogin.Text;
            oMasterUser.GUID = Guid.NewGuid();
            oMasterUser.Password = oMasterUser.GUID.ToString();
            oMasterUser.PasswordQuestion = "?";
            oMasterUser.IsLockedOut = false;
            oMasterUser.CreationDate = DateTime.Now;
        }

        Session["MasterUser"] = oMasterUser;

        DL_WEB.DAL.Client.User oClientUser = FillClientUser(oMasterUser);

        Session.Add("ClientUser", oClientUser);
    }

    private DL_WEB.DAL.Client.User FillClientUser(DL_WEB.DAL.Master.User oMasterUser)
    {
        DL_WEB.DAL.Client.User oClientUser = new DL_WEB.DAL.Client.User();

        if (0 != UserID)
        {
            oClientUser.Where.GUID.Value = oMasterUser.GUID;
            oClientUser.Query.Load();
        }

        if (oClientUser.RowCount == 0)
        {
            oClientUser.AddNew();
        }

        oClientUser.Login = oMasterUser.Email;
        oClientUser.Password = oMasterUser.Password;
        oClientUser.PasswordQuestion = oMasterUser.PasswordQuestion;
        oClientUser.PasswordAnswer = oMasterUser.PasswordAnswer;
        oClientUser.IsApproved = oMasterUser.IsApproved;
        oClientUser.IsLockedOut = oMasterUser.IsLockedOut;
        oClientUser.CreationDate = oMasterUser.CreationDate;
        oClientUser.GUID = oMasterUser.GUID;

        DL_WEB.DAL.Client.AddressBook oAddressBook = oClientUser.AddressBookEntry;
        if (null == oAddressBook)
        {
            oAddressBook = new DL_WEB.DAL.Client.AddressBook();
            oAddressBook.AddNew();
        }

        oAddressBook.FirstName = this.tbFirstName.Text;
        oAddressBook.LastName = this.tbLastName.Text;
        oAddressBook.PrimaryEmail = oMasterUser.Email;
        oAddressBook.MiddleName = this.tbMiddleName.Text;
        oAddressBook.JobTitle = this.tbJobTitle.Text;
        oAddressBook.HomePhone = this.tbHomePhone.Text;
        oAddressBook.WorkPhone = this.tbWorkPhone.Text;

        oClientUser.AddressBookEntry = oAddressBook;

        return oClientUser;
    }

    #endregion

    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "RemoveRole")
        {
            #region Retrieving deleting arguments

            DL_WEB.DAL.Master.OrganizationUserRole oOrganizationUserRole = new DL_WEB.DAL.Master.OrganizationUserRole();
            DataView dv = oOrganizationUserRole.LoadUserOrganizationRole_Session(UserID, Session["UserRoles"]);

            DataRow dr = dv[ConvertHelper.o2i(e.CommandArgument)].Row;

            int iRoleID = ConvertHelper.o2i(dr["RoleID"]);
            int iOrganizationID = ConvertHelper.o2i(dr["OrganizationID"]);

            #endregion

            ArrayList oUserRoles = Session["UserRoles"] as ArrayList;
            bool bInsertDeleteItem = true;

            if (null != oUserRoles)
            {
                foreach (OrganizationRoleEntry oEntry in oUserRoles)
                {
                    if (ActionTypes.Insert == oEntry.ActionType &&
                        oEntry.OrganizationID == iOrganizationID &&
                        oEntry.RoleID == iRoleID)
                    {
                        oUserRoles.Remove(oEntry);
                        bInsertDeleteItem = false;
                        break;
                    }
                }
            }
            else
            {
                oUserRoles = new ArrayList();
                Session["UserRoles"] = oUserRoles;
            }
            if (bInsertDeleteItem)
            {
                oUserRoles.Add(new OrganizationRoleEntry(iOrganizationID, iRoleID, ActionTypes.Delete));
            }
        }
    }
    protected void CancelLink_Click(object sender, EventArgs e)
    {
        Session.Remove("UserRoles");
        Session.Remove("ClientUser");
        Session.Remove("MasterUser");
        Response.Redirect("./UserList.aspx");
    }
}
