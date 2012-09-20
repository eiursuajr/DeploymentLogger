using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class NotificationTypeDetails : DL_WEB.BLL.Security.SecurityPage
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

	#endregion

	protected void Page_Load(object sender, EventArgs e)
	{
        if (!this.IsPostBack && this.NotificationTypeID == 0)
        {
            CommandField cmdField = NotificationTypeDetailsView.Fields[NotificationTypeDetailsView.Fields.Count - 1] as CommandField;
            if (cmdField != null)
                cmdField.UpdateText = "Insert";
        }
	}

	protected void NotificationTypeDetailsView_ItemCommand(object sender, DetailsViewCommandEventArgs e)
	{
		if (string.Compare(e.CommandName, "cancel", true) == 0)
		{
			Response.Redirect("NotificationTypes.aspx");
		}
	}

	protected void NotificationTypeDataSource_Updated(object sender, ObjectDataSourceStatusEventArgs e)
	{
		string Name = string.Empty;
		TextBox textbox = NotificationTypeDetailsView.Rows[0].Cells[1].Controls[0] as TextBox;
		if (textbox != null)
			Name = textbox.Text;
		
		if (this.NotificationTypeID > 0)
		{
			DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.NotificationTypeUpdated, "NotificationType " + Name + " updated", ActivityObject.NotificationType, this.NotificationTypeID, DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name), Context.User.Identity.Name);
		}
		else
		{
			int CurrentID = Micajah.Common.Helper.Convert.o2i(e.ReturnValue);
			DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.NotificationTypeUpdated, "NotificationType " + Name + " created", ActivityObject.NotificationType, CurrentID, DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name), Context.User.Identity.Name);
		}

		Response.Redirect("NotificationTypes.aspx");
	}
}
