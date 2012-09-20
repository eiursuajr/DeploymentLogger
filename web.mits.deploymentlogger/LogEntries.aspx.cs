using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class LogEntries : DL_WEB.BLL.Security.SecurityPage
{
	#region Properties

	public int UpdateID
	{
		get
		{
			int CurrentID = 0;
			if (Request.QueryString["UpdateID"] != null)
                CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["UpdateID"]);
			return CurrentID;
		}
	}

	#endregion

	protected void Page_Load(object sender, EventArgs e)
    {
		if (!this.IsPostBack)
		{
			if (this.UpdateID > 0)
			{
				DL_WEB.DAL.Client.Update oUpdate = new DL_WEB.DAL.Client.Update();
				oUpdate.LoadByPrimaryKey(this.UpdateID);

                if (oUpdate.RowCount > 0 && oUpdate.ProjectID > 0)
                {
                    ProjectIDLabel.Text = oUpdate.ProjectID.ToString();

					ProjectInfo1.ProjectID = oUpdate.ProjectID;
                }
            }
		}
    }
    protected void LogEntryList_RowCommand(object sender, GridViewCommandEventArgs e)
	{
        if (0 == e.CommandName.CompareTo("Include"))
        {
            int index = Convert.ToInt32(e.CommandArgument);
            GridViewRow row = gvLogEntryList.Rows[index];
            int iLogEntryID = Micajah.Common.Helper.Convert.o2i(row.Cells[0].Text);
			string Name = row.Cells[1].Text;

            DL_WEB.DAL.Client.LogEntry oLogEntry = new DL_WEB.DAL.Client.LogEntry();
            oLogEntry.IncludeInUpdate(iLogEntryID, UpdateID);

			DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.LogEntryUpdated, "LogEntry " + Name + " updated", ActivityObject.LogEntry, iLogEntryID, DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name), Context.User.Identity.Name);

			Response.Redirect("UpdateDetails.aspx?UpdateID=" + this.UpdateID.ToString());
        }
    }
}
