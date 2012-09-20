using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class ProjectNotificationItem : DL_WEB.BLL.Security.SecurityPage
{
    #region Properties

    public int NotificationTypeID
    {
        get
        {
            int CurrentID = 0;
            if (Request.QueryString["NotificationTypeID"] != null)
                CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["NotificationTypeID"]);
            return CurrentID;
        }
    }

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

    public string Type
    {
        get
        {
            string TypeString = string.Empty;
            if (Request.QueryString["type"] != null)
                TypeString = Request.QueryString["type"].ToLower();
            return TypeString;
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
        if (!this.Page.IsPostBack)
        {
            switch (this.Type)
            {
                case "role":
                    ObjectNameLabel.Text = "Role";
                    ProjectNotificationItemList.DataSourceID = "RoleDataSource";
                    ProjectNotificationItemList.DataValueField = "RoleID";
                    ProjectNotificationItemList.DataTextField = "Name";
                    break;
                case "user":
                    ObjectNameLabel.Text = "User";

                    ProjectNotification oProjectNotification = new ProjectNotification();
                    oProjectNotification.Where.ProjectID.Value = this.ProjectID;
                    oProjectNotification.Where.ProjectID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                    oProjectNotification.Where.NotificationTypeID.Value = this.NotificationTypeID;
                    oProjectNotification.Where.NotificationTypeID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                    oProjectNotification.Where.UserID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.IsNotNull;
                    oProjectNotification.Query.Distinct = true;
                    oProjectNotification.Query.Load();

                    string UserIdList = string.Empty;
                    while (!oProjectNotification.EOF)
                    {
                        UserIdList += "," + oProjectNotification.UserID.ToString();
                        oProjectNotification.MoveNext();
                    }
                    if (UserIdList.Length > 0)
                        UserIdList = UserIdList.Remove(0, 1);

                    DL_WEB.DAL.Client.User oUser = new DL_WEB.DAL.Client.User();
                    oUser.Where.UserID.Value = UserIdList;
                    oUser.Where.UserID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.NotIn;
                    oUser.Query.Load();

                    ProjectNotificationItemList.DataSource = oUser.DefaultView;
                    ProjectNotificationItemList.DataValueField = "UserID";
                    ProjectNotificationItemList.DataTextField = "Login";
                    ProjectNotificationItemList.DataBind();
                    break;
                case "addressbook":
                    ObjectNameLabel.Text = "Contact";

                    DL_DAL.Client.AddressBookView view = new DL_DAL.Client.AddressBookView();
                    view.Where.UserID.Value = DL_WEB.DAL.Client.User.Instance.GetUserIDByGUID(this.UserGUID);
                    view.Where.UserID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                    view.Where.IsShared.Value = true;
                    view.Where.IsShared.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                    view.Where.IsShared.Conjuction = MyGeneration.dOOdads.WhereParameter.Conj.Or;
                    view.LoadAll();
                    ProjectNotificationItemList.DataSource = view.DefaultView;
                    ProjectNotificationItemList.DataValueField = "EntryID";
                    ProjectNotificationItemList.DataTextField = "Name";
                    ProjectNotificationItemList.DataBind();
                    break;
            }
        }
    }

    protected void SaveButton_Click(object sender, EventArgs e)
    {
        int CurrentID = 0;
        if (ProjectNotificationItemList.SelectedValue.Length > 0)
            CurrentID = Micajah.Common.Helper.Convert.o2i(ProjectNotificationItemList.SelectedValue);

        if (CurrentID > 0)
        {
            DL_WEB.DAL.Client.ProjectNotification oProjectNotification = new DL_WEB.DAL.Client.ProjectNotification();
            oProjectNotification.AddNew();
            oProjectNotification.ProjectID = this.ProjectID;
            oProjectNotification.NotificationTypeID = this.NotificationTypeID;
            switch (this.Type)
            {
                case "role":
                    oProjectNotification.RoleID = CurrentID;
                    break;
                case "user":
                    oProjectNotification.UserID = CurrentID;
                    break;
                case "addressbook":
                    oProjectNotification.AddressBookEntryID = CurrentID;
                    break;
            }
            oProjectNotification.Save();

            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.ProjectNotificationCreated, "ProjectNotification created", ActivityObject.ProjectNotification, oProjectNotification.ProjectNotificationID, DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name), Context.User.Identity.Name);
        }

        CancelButton_Click(sender, e);
    }

    protected void CancelButton_Click(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("ProjectNotificationDetails.aspx?NotificationTypeID={0}&ProjectID={1}",
            this.NotificationTypeID.ToString(), this.ProjectID.ToString()));
    }
}