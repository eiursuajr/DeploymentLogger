using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class AvailableLogEntries : DL_WEB.BLL.Security.SecurityPage
{
    #region Members

    string m_Name = string.Empty;

    #endregion

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
		if (!this.IsPostBack && this.ProjectID > 0)
		{
			this.NewLogEntryLink.NavigateUrl += "?ProjectID=" + ProjectID;

			ProjectInfo1.ProjectID = this.ProjectID;
		}
	}
    
    protected void LogEntryList_RowDeleted(object sender, GridViewDeletedEventArgs e)
    {
        int LogEntryID = Micajah.Common.Helper.Convert.o2i(e.Keys["LogEntryID"]);
        DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.LogEntryDeleted, "LogEntry " + m_Name + " deleted", ActivityObject.LogEntry, LogEntryID, this.UserGUID, Context.User.Identity.Name);
    }

    protected void LogEntryList_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName.ToLower().CompareTo("delete") == 0)
        {
            int LogEntryID = Micajah.Common.Helper.Convert.o2i(e.CommandArgument);
            LogEntry oLogEntry = new LogEntry();
            oLogEntry.LoadByPrimaryKey(LogEntryID);
            m_Name = oLogEntry.Header;
        }
    }
}