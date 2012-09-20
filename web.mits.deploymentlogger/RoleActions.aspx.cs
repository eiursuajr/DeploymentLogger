using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using Telerik.WebControls;
using System.Collections.Specialized;
using System.Data.SqlClient;
using MyGeneration.dOOdads;

public partial class RoleActions : DL_WEB.BLL.Security.SecurityPage
{
    public Int32 RoleID;
    DL_WEB.DAL.Master.RoleAction oRoleAction;

    protected void Page_Load(object sender, EventArgs e)
    {
        oRoleAction = new DL_WEB.DAL.Master.RoleAction();
        RoleID = Request.Params.GetValues("RoleID") != null ? Convert.ToInt32(Request.Params.GetValues("RoleID")[0]) : 0;
        if (RoleID != 0)
        {
            RadTree1.DataFieldID = "ActionID";
            RadTree1.DataFieldParentID = "ParentID";
            RadTree1.DataSource = oRoleAction.LoadRoleActionsByRoleID(RoleID);
            RadTree1.DataBind();
        }
        else
            Response.Redirect("Roles.aspx");
    }
    protected void RadTree1_NodeCheck(object o, RadTreeNodeEventArgs e)
    {
        oRoleAction = new DL_WEB.DAL.Master.RoleAction();
        RadTreeNode node = e.NodeChecked;
        Int32 ActionID = Convert.ToInt32(node.ID.Substring(9));
        if (!node.Checked)
        {
            oRoleAction.AddNew();
            oRoleAction.ActionID = ActionID;
            oRoleAction.RoleID = RoleID;
            node.Checked = true;
        }
        else
        {
            oRoleAction.LoadByPrimaryKey(RoleID, ActionID);
            oRoleAction.MarkAsDeleted();
            node.Checked = false;
        }
        oRoleAction.Save();
    }
    protected void RadTree1_NodeBound(object o, RadTreeNodeEventArgs e)
    {
        DataRow row = e.NodeBoundDataRow;
        RadTreeNode node = e.NodeBound;
        node.Expanded = true;
        node.Text = row["Name"].ToString();
        node.ID = "ActionID_"+row["ActionID"].ToString();
        node.Checked = row["IsPermitted"].ToString() == "1";
    }
    
    protected void UpdateLinkButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("Roles.aspx");
    }
}
