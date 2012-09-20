using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class NotificationTypes : DL_WEB.BLL.Security.SecurityPage
{
	#region Members

	string m_Name = string.Empty;

	#endregion

	protected void Page_Load(object sender, EventArgs e)
    {

    }

	protected void NotificationTypeList_RowDeleted(object sender, GridViewDeletedEventArgs e)
	{
		int CurrentID = Micajah.Common.Helper.Convert.o2i(e.Keys["NotificationTypeID"]);
		DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.NotificationTypeDeleted, "NotificationType " + m_Name + " deleted", ActivityObject.NotificationType, CurrentID, DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name), Context.User.Identity.Name);
	}
	protected void NotificationTypeList_RowCommand(object sender, GridViewCommandEventArgs e)
	{
		if (e.CommandName.CompareTo("Delete") == 0)
		{
			int index = Convert.ToInt32(e.CommandArgument);
			HyperLink link = NotificationTypeList.Rows[index].Controls[0].Controls[0] as HyperLink;
			if (link != null)
				m_Name = link.Text;
		}
	}
}
