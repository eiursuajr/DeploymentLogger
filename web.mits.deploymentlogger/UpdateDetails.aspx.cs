using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using Micajah.Common.Helper;
using DL_WEB.DAL.Client;

public partial class UpdateDetails : DL_WEB.BLL.Security.SecurityPage
{
	#region Members

	private int m_iUpdateID, m_UserID;

	#endregion

	#region Properties

    protected int UpdateID
	{
		get
		{
			if (m_iUpdateID <= 0 && Request.QueryString["UpdateID"] != null)
				m_iUpdateID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["UpdateID"]);
			return m_iUpdateID;
		}
    }

    public Guid UserGUID
    {
        get
        {
            return DL_WEB.DAL.Master.User.GetUserGUID(User.Identity.Name);
        }
    }

    #region ProjectID

    protected int ProjectID
    {
        get 
        {
            if (null != Request.QueryString["ProjectID"])
            {
                return Micajah.Common.Helper.Convert.o2i(Request.QueryString["ProjectID"]);
            }
            else if (0 != UpdateID) 
            {
                Update oUpdate = new Update();
                oUpdate.LoadByPrimaryKey(UpdateID);

                return oUpdate.ProjectID;
            }

            return 0;
        }
    }

    #endregion

    #region IsNewUpdate

    private bool IsNewUpdate
    {
        get 
        {
            if (0 != ProjectID && 0 == UpdateID)
                return true;
            return false;
        }
    }

    #endregion

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        FillUpdateGroups();
        FillUpdateStatus();

		ProjectInfo1.ProjectID = this.ProjectID;

		if (!this.IsPostBack)
		{
            if (UpdateID > 0)
            {
                DL_WEB.DAL.Client.Update oUpdate = new DL_WEB.DAL.Client.Update();
                oUpdate.LoadByPrimaryKey(this.UpdateID);

                if (oUpdate.RowCount > 0)
                {
                    tbUpdateName.Text = oUpdate.Name;
                    reDescription.Html = oUpdate.Description;
                    tbBuildDate.Text = oUpdate.BuildDate.ToShortDateString();
                    tbBuuildNumber.Text = oUpdate.BuildNumber;
                    ddlUpdateGroup.SelectedValue = oUpdate.UpdateGroupID.ToString();
                    ddlUpdateStatus.SelectedValue = oUpdate.UpdateStatusID.ToString();
                }
            }
            else
            {
                ddlUpdateStatus.SelectedValue = DL_WEB.DAL.Client.UpdateStatus.CreatedStatusID.ToString();
                ddlUpdateStatus.Enabled = false;
                linkbtnSave.Text = "Insert";
            }

            if (IsNewUpdate)
            {
                this.tbUpdateName.ReadOnly = false;
                this.reDescription.Editable = true;
                this.linkbtnAddLogEntry.Text = "Save and Add Log Entry";
            }
		}
    }

    protected void linkbtnSave_Click(object sender, EventArgs e)
    {
        if (IsNewUpdate)
        {
            SaveNewUpdate();
        }
        else
        {
            UpdateItemDetails();
        }
        Response.Redirect("~/Updates.aspx?ProjectID=" + ProjectID.ToString());
    }

    protected void linkbtnAddLogEntry_Click(object sender, EventArgs e)
    {
        if (IsNewUpdate)
        {
            int SavedUpdateID = SaveNewUpdate();

            if (SavedUpdateID > 0)
            {
                Response.Redirect("LogEntries.aspx?UpdateID=" + SavedUpdateID + "&action=add");
            }
            else 
            {
                throw new Exception("Error occured while saving the update details. Please contact system administrator.");
            }
        }
        else
        {
            Response.Redirect("LogEntries.aspx?UpdateID=" + UpdateID + "&action=add");
        }
    }

    #region Private methods

    private void FillUpdateGroups()
    {
        DL_WEB.DAL.Client.UpdateGroup oUpdateGroup = new DL_WEB.DAL.Client.UpdateGroup();
        oUpdateGroup.LoadAll();

        ddlUpdateGroup.Items.Add(new ListItem("[please select...]", "0"));

        if (oUpdateGroup.RowCount > 0)
        {
            do
            {
                ddlUpdateGroup.Items.Add(new ListItem(oUpdateGroup.Name, oUpdateGroup.UpdateGroupID.ToString()));
            } while (oUpdateGroup.MoveNext());
        }
    }

    private void FillUpdateStatus()
    {
        DL_WEB.DAL.Client.UpdateStatus oUpdateStatus = new DL_WEB.DAL.Client.UpdateStatus();
        oUpdateStatus.LoadAll();

        if (oUpdateStatus.RowCount > 0)
        {
            do
            {
                ddlUpdateStatus.Items.Add(new ListItem(oUpdateStatus.Name, oUpdateStatus.UpdateStatusID.ToString()));
            } while (oUpdateStatus.MoveNext());
        }
    }

    private int SaveNewUpdate()
    {
        DL_WEB.DAL.Client.Update oUpdate = new DL_WEB.DAL.Client.Update();
        oUpdate.AddNew();
        oUpdate.ProjectID = ProjectID;
        oUpdate.Name = tbUpdateName.Text;
        oUpdate.Description = reDescription.Html;
        oUpdate.BuildDate = Micajah.Common.Helper.Convert.o2dt(tbBuildDate.Text);
        oUpdate.EnteredDate = DateTime.Now;
        oUpdate.EnteredUserID = DL_WEB.DAL.Client.User.Instance.GetUserIDByGUID(this.UserGUID);
        oUpdate.UpdateStatusID = DL_WEB.DAL.Client.UpdateStatus.CreatedStatusID;
        oUpdate.UpdateGroupID = Micajah.Common.Helper.Convert.o2i(ddlUpdateGroup.SelectedValue);
        oUpdate.BuildNumber = tbBuuildNumber.Text;
        oUpdate.UpdateStatusID = Micajah.Common.Helper.Convert.o2i(ddlUpdateStatus.SelectedValue);

        oUpdate.Save();

        #region Registering Activity

		DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.UpdateCreated, "Update " + oUpdate.Name + " created", ActivityObject.Update, oUpdate.UpdateID, this.UserGUID, Context.User.Identity.Name);

        #endregion

        return oUpdate.UpdateID;
    }

    private void UpdateItemDetails()
    {
        DL_WEB.DAL.Client.Update oUpdate = new DL_WEB.DAL.Client.Update();
        oUpdate.LoadByPrimaryKey(UpdateID);

        if (oUpdate.RowCount > 0)
        {
            oUpdate.Name = tbUpdateName.Text;
            oUpdate.Description = reDescription.Html;
            oUpdate.BuildDate = Micajah.Common.Helper.Convert.o2dt(tbBuildDate.Text);
            oUpdate.UpdateStatusID = Micajah.Common.Helper.Convert.o2i(ddlUpdateStatus.SelectedValue);
            oUpdate.UpdateGroupID = Micajah.Common.Helper.Convert.o2i(ddlUpdateGroup.SelectedValue);
            oUpdate.BuildNumber = tbBuuildNumber.Text;

            oUpdate.Save();

            #region Registering Activity

			DL_WEB.DAL.Client.ActivityLog.Instance.RegisterActivity(ActivityTypes.UpdateUpdated, "Update " + oUpdate.Name + " updated", ActivityObject.Update, oUpdate.UpdateID, this.UserGUID, Context.User.Identity.Name);

            #endregion
        }
        else
        {
            throw new Exception("Update with UpdateID = " + UpdateID + " was not found.");
        }
    }

    #endregion
}
