using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DL_WEB.DAL.Client;

public partial class Updates : DL_WEB.BLL.Security.SecurityPage
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
		ProjectInfo1.ProjectID = this.ProjectID;
		if (!this.IsPostBack)
		{
			this.hlNewUpdate.NavigateUrl += "?ProjectID=" + ProjectID;
            
			if (null != Request["action"] && 0 == Request["action"].CompareTo("delete") && null != Request["UpdateID"])
            {
                Update oUpdate = new Update();
				oUpdate.LoadByPrimaryKey(this.UpdateID);

				string Name = oUpdate.Name;

                oUpdate.MarkAsDeleted();
                oUpdate.Save();

				DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.UpdateDeleted, "Update " + Name + " deleted", ActivityObject.Update, this.UpdateID, DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name), Context.User.Identity.Name);
            }
		}
    }
}
