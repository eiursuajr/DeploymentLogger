using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class LogEntryDetails : DL_WEB.BLL.Security.SecurityPage
{
    #region Members

    private int m_LogEntryID;

    #endregion

    #region Properties

    public int LogEntryID
    {
        get
        {
            int CurrentID = 0;
            if (Request.QueryString["LogEntryID"] != null)
                CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["LogEntryID"]);
            return CurrentID;
        }

        set
        {
            m_LogEntryID = value;
        }
    }

    public Guid UserGUID
    {
        get
        {
            return DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name);
        }
    }

    protected int ProjectID
    {
        get
        {
            return Micajah.Common.Helper.Convert.o2i(Request["ProjectID"]);
        }
    }

    private bool IsNew
    {
        get
        {
            return Micajah.Common.Helper.Convert.o2i(Request.QueryString["LogEntryID"]) == 0;
        }
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!this.IsPostBack && this.LogEntryID > 0)
        {
            if (Request.UrlReferrer != null)
                RedirectUrl.Value = HttpUtility.UrlEncode(Request.UrlReferrer.PathAndQuery);
        }
        CommandField cmdField = LogEntryDetailsView.Fields[LogEntryDetailsView.Fields.Count - 1] as CommandField;
        if (LogEntryID > 0 && null != cmdField)
        {
            LogEntryDetailsView.DefaultMode = DetailsViewMode.Edit;
            cmdField.ShowEditButton = true;
            cmdField.ShowInsertButton = false;
        }
        else
        {
            LogEntryDetailsView.DefaultMode = DetailsViewMode.Insert;
            cmdField.ShowEditButton = false;
            cmdField.ShowInsertButton = true;
        }
        DropDownList ddl = LogEntryDetailsView.FindControl("LogEntryStatusID") as DropDownList;
        if (null != ddl)
        {
            if (0 == LogEntryID)
            {
                ddl.SelectedValue = DL_WEB.DAL.Client.LogEntryStatus.CreatedStatusID.ToString();
                ddl.Enabled = false;
            }
        }
    }

    protected void List_Init(object sender, EventArgs e)
    {
        if (!this.IsPostBack && this.LogEntryID > 0)
            (sender as DropDownList).Items.Clear();
    }

    protected void LogEntryDetailsView_ItemInserted(object sender, DetailsViewInsertedEventArgs e)
    {
        ItemUpdated(e.Values["Header"].ToString());
    }

    protected void LogEntryDetailsView_ItemUpdated(object sender, DetailsViewUpdatedEventArgs e)
    {
        ItemUpdated(e.NewValues["Header"].ToString());
    }

    protected void LogEntryDataSource_Updated(object sender, ObjectDataSourceStatusEventArgs e)
    {
        m_LogEntryID = Micajah.Common.Helper.Convert.o2i(e.ReturnValue);
    }

    protected void LogEntryDetailsView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower().CompareTo("cancel") == 0)
        {
            CheckReturnUrl();
            Response.Redirect(HttpUtility.UrlDecode(RedirectUrl.Value));
        }
    }

    private void CheckReturnUrl()
    {
        if (RedirectUrl.Value.Trim().Length == 0)
            RedirectUrl.Value = HttpUtility.UrlEncode("AvailableLogEntries.aspx?ProjectID=" + ProjectID.ToString());
    }

    private void ItemUpdated(string name)
    {
        if (this.IsNew)
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.LogEntryCreated, "LogEntry " + name + " created", ActivityObject.LogEntry, m_LogEntryID, this.UserGUID, Context.User.Identity.Name);
        else
            DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.LogEntryUpdated, "LogEntry " + name + " updated", ActivityObject.LogEntry, m_LogEntryID, this.UserGUID, Context.User.Identity.Name);

        CheckReturnUrl();
        Response.Redirect(HttpUtility.UrlDecode(RedirectUrl.Value));
    }
}
