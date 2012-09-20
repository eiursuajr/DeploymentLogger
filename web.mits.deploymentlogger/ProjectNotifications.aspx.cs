using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class ProjectNotifications : DL_WEB.BLL.Security.SecurityPage
{
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

	#endregion

    protected void Page_Load(object sender, EventArgs e)
    {
		if (!this.IsPostBack)
		{
			this.NewProjectNotificationLink.NavigateUrl += "?ProjectID=" + ProjectID;

			ProjectInfo1.ProjectID = this.ProjectID;

			if (null != Request["action"] && 0 == Request["action"].CompareTo("delete") && this.NotificationTypeID > 0)
			{
				DL_WEB.DAL.Client.ProjectNotification oProjectNotification = new DL_WEB.DAL.Client.ProjectNotification();
				oProjectNotification.Where.NotificationTypeID.Value = this.NotificationTypeID;
				oProjectNotification.Where.NotificationTypeID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
				oProjectNotification.Query.Load();

				oProjectNotification.DeleteAll();
				oProjectNotification.Save();

				DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.ProjectNotificationDeleted, "ProjectNotifications deleted by NotificationTypeID", ActivityObject.ProjectNotification, this.NotificationTypeID, DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name), Context.User.Identity.Name);
			}
		}
    }
}
