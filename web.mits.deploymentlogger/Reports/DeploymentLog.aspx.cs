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

using DL_DAL.Client;
using DL_WEB;

public partial class DeploymentLog : DL_WEB.BLL.Security.SecurityPage
{
    #region Members

    private string m_OrgConnectionString = string.Empty;

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

    public int ImpactLevel
    {
        get
        {
            int CurrentID = 0;
            if (Request.QueryString["ImpactLevel"] != null)
                CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["ImpactLevel"]);
            return CurrentID;
        }
    }

    protected int OrganizationID
    {
        get
        {
            int CurrentID = 0;
            if (Request.QueryString["OrganizationID"] != null)
                CurrentID = Micajah.Common.Helper.Convert.o2i(Request.QueryString["OrganizationID"]);
            return CurrentID;
        }
    }

    public override string StyleSheetTheme
    {
        get
        {
            switch (Request.QueryString["theme"])
            {
                case "Blue":
                    return "Blue";
                case "Standard":
                default:
                    return "Standard";
            }
        }
        set
        {
            base.StyleSheetTheme = value;
        }
    }

    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        string ProjectName = string.Empty;
        string OrgConnectionString = GetClientDBConnectionString();

        if (OrgConnectionString.Length == 0)
        {
            MessageLabel.Visible = true;
            MainPanel.Visible = false;
            return;
        }

        if (!IsPostBack)
        {
            ProjectView oProjectView = new ProjectView();
            oProjectView.ConnectionString = OrgConnectionString;
            oProjectView.Where.ProjectID.Value = ProjectID;
            oProjectView.Where.ProjectID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            oProjectView.Query.Load();

            if (oProjectView.RowCount == 0)
            {
                MessageLabel.Visible = true;
                MainPanel.Visible = false;
                return;
            }
            else
                this.ViewState["ProjectName"] = oProjectView.Name;

            hlSubscribe.NavigateUrl = string.Format("{0}?ProjectID={1}&OrganizationID={2}", Global.SubscribePageURL, ProjectID.ToString(), OrganizationID.ToString());

            DL_WEB.DAL.Client.ImpactLevel oImpactLevel = new DL_WEB.DAL.Client.ImpactLevel(OrgConnectionString);
            foreach (DataRow row in oImpactLevel.LoadAllImpactLevel().Table.Rows)
                ddlImpactLevel.Items.Add(new ListItem(row["Name"].ToString(), row["ImpactLevelID"].ToString()));
        }

        if (this.ViewState["ProjectName"] != null)
            ProjectName = this.ViewState["ProjectName"].ToString();
        
        this.Title = string.Format("Deployment Log for '{0}' Project", ProjectName);

        if (0 != ImpactLevel)
        {
            divImpactLevel.Visible = false;
        }

        ProductionUpdates oProductionUpdates = new ProductionUpdates(OrgConnectionString);
        oProductionUpdates.Where.ProjectID.Value = ProjectID;
        oProductionUpdates.Where.ProjectID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
        oProductionUpdates.Query.Load();
        oProductionUpdates.Sort = ProductionUpdates.ColumnNames.BuildDate + " DESC";

        if (oProductionUpdates.RowCount > 0)
        {
            do
            {
                TableRow tr = new TableRow();
                TableCell tc = new TableCell();

                tc.Text = string.Format("<br/><div class=\"project_name\">{0}</div> &nbsp;{1}", ProjectName, oProductionUpdates.IsColumnNull(ProductionUpdates.ColumnNames.BuildNumber) ? "v " + oProductionUpdates.BuildNumber : "") + "&nbsp; - &nbsp;" + oProductionUpdates.BuildDate.Month + "/" + oProductionUpdates.BuildDate.Day + "/" + oProductionUpdates.BuildDate.Year + "<br/><br/>";
                tc.ColumnSpan = 4;
                tr.Cells.Add(tc);

                tblHistory.Rows.Add(tr);

                ProductionLogEntries oProductionLogEntries = new ProductionLogEntries(OrgConnectionString);
                oProductionLogEntries.Where.UpdateID.Value = oProductionUpdates.UpdateID;
                oProductionLogEntries.Where.UpdateID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                if (ddlImpactLevel.SelectedValue != "0")
                {
                    oProductionLogEntries.Where.ImpactLevelID.Value = ddlImpactLevel.SelectedValue;
                    oProductionLogEntries.Where.ImpactLevelID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.LessThanOrEqual;
                }
                oProductionLogEntries.Query.Load();

                if (oProductionLogEntries.RowCount > 0)
                {
                    do
                    {
                        tr = new TableRow();
                        tc = new TableCell();
                        tc.CssClass = "log_entry_image";
                        Image img = new Image();
                        img.ImageUrl = oProductionLogEntries.IconPath;
                        img.AlternateText = oProductionLogEntries.TypeName;
                        tc.Controls.Add(img);
                        tc.Width = 30;
                        tr.Cells.Add(tc);

                        tc = new TableCell();
                        tc.CssClass = "log_entry_section";
                        tc.Text = string.Format("{0} :", oProductionLogEntries.ProjectSectionName);
                        tr.Cells.Add(tc);

                        tc = new TableCell();
                        tc.CssClass = "log_entry_name";
                        tc.Text = oProductionLogEntries.PublicHeader;
                        tr.Cells.Add(tc);

                        tc = new TableCell();
                        tc.CssClass = "log_entry_description";
                        tc.Text = oProductionLogEntries.PublicDescription;
                        tr.Cells.Add(tc);

                        tblHistory.Rows.Add(tr);
                    } while (oProductionLogEntries.MoveNext());

                }
                else
                {
                    tr = new TableRow();

                    tc = new TableCell();
                    tc.Text = "<i>There were no changes</i>";
                    tc.ColumnSpan = 3;

                    tr.Cells.Add(tc);
                    tblHistory.Rows.Add(tr);
                }
            } while (oProductionUpdates.MoveNext());
        }
    }

    protected string GetClientDBConnectionString()
    {
        DL_WEB.DAL.Master.Organization oOrganization = new DL_WEB.DAL.Master.Organization();
        oOrganization.LoadByPrimaryKey(OrganizationID);

        DL_WEB.DAL.Master.Database oDatabase = new DL_WEB.DAL.Master.Database();
        if (oOrganization.RowCount > 0)
        {
            oDatabase.LoadByPrimaryKey(oOrganization.DatabaseID);
        }

        DL_WEB.DAL.Master.Server oServer = new DL_WEB.DAL.Master.Server();
        if (0 == oDatabase.RowCount)
        {
            return string.Empty;
        }

        oServer.LoadByPrimaryKey(oDatabase.ServerID);

        return oDatabase.DBConnectionString;
    }
}
