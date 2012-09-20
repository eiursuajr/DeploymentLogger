using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class ProjectNotificationDetails : DL_WEB.BLL.Security.SecurityPage
{
	#region Properties

	public int NotificationTypeID
	{
		get
		{
			int CurrentID = 0;
			if (Request.QueryString["NotificationTypeID"] != null)
				CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["NotificationTypeID"]);
			if (CurrentID == 0 && NotificationTypeList.SelectedValue.Length > 0)
				CurrentID = Micajah.Common.Helper.Convert.o2i(NotificationTypeList.SelectedValue);
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

	#endregion

	protected void Page_Load(object sender, EventArgs e)
	{
        ProjectInfo1.ProjectID = this.ProjectID;
	}

	protected void NotificationTypeList_DataBound(object sender, EventArgs e)
	{
		if (!this.IsPostBack && this.NotificationTypeID > 0)
		{
			if (NotificationTypeList.Items.FindByValue(this.NotificationTypeID.ToString()) != null)
			{
				NotificationTypeList.Items.FindByValue(this.NotificationTypeID.ToString()).Selected = true;
			}
		}
	}
	
	protected void ProjectNotificationList_RowDeleted(object sender, GridViewDeletedEventArgs e)
	{
		int CurrentID = Micajah.Common.Helper.Convert.o2i(e.Keys["ProjectNotificationID"]);
		DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.ProjectNotificationDeleted, "ProjectNotification deleted", ActivityObject.ProjectNotification, CurrentID, DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name), Context.User.Identity.Name);
	}

    protected void NotificationTypeList_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Redirect(string.Format("ProjectNotificationDetails.aspx?NotificationTypeID={0}&ProjectID={1}", Micajah.Common.Helper.Convert.o2i(NotificationTypeList.SelectedValue), this.ProjectID));
    }
}
