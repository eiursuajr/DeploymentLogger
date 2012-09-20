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
using System.ComponentModel;

using ClientDL = DL_WEB.DAL.Client;

public partial class UserControls_ImpactLevel : System.Web.UI.UserControl
{
    public event EventHandler OnSelectClick;

    #region Page Events

    protected void Page_Load(object sender, EventArgs e)
    {
    }

    override protected void OnInit(EventArgs e)
    {
        if (!IsPostBack)
        {
            ClientDL.ImpactLevel level = new ClientDL.ImpactLevel();

            ddlImpactLevel.DataSource = level.LoadAllImpactLevel();
            ddlImpactLevel.DataValueField = ClientDL.ImpactLevel.ColumnNames.ImpactLevelID;
            ddlImpactLevel.DataTextField = ClientDL.ImpactLevel.ColumnNames.Name;
            ddlImpactLevel.DataBind();
        }
    }

    #endregion

    #region Properties

    public int ImpactLevelID
    {
        get { return Convert.ToInt32(ddlImpactLevel.SelectedValue); }
        set
        {
            if (ddlImpactLevel.Items.FindByValue(value.ToString()) != null)
                ddlImpactLevel.SelectedValue = value.ToString();
            else
                if (ddlImpactLevel.Items.Count != 0)
                    ddlImpactLevel.SelectedIndex = 0;
        }
    }

    [Category("Layout")]
    [Browsable(true)]
    public int Width
    {
        set { ddlImpactLevel.Width = Unit.Point(value); }
    }

    [Category("Behavior")]
    [Browsable(true)]
    public bool AutoPostBack
    {
        set { ddlImpactLevel.AutoPostBack = value; }
    }

    #endregion

    #region Events

    // raise an event
    public void ClickSelect(EventArgs args)
    {
        if (OnSelectClick != null)
        {
            OnSelectClick(this, args);
        }
    }

    protected void ddlImpactLevel_SelectedIndexChanged(object sender, EventArgs e)
    {
        // raise an event
        this.ClickSelect(new EventArgs());
    }

    #endregion

}
