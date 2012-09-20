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

public partial class ActivityLog : DL_WEB.BLL.Security.SecurityPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void lnkbtnAdvSearch_Click(object sender, EventArgs e)
    {
        mvFilter.SetActiveView(viewAdvSearch);
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        DL_DAL.Client.ActivityLogView oActivityLog = new DL_DAL.Client.ActivityLogView();

        if (string.Empty != tbStartDate.Text &&
            string.Empty != tbEndDate.Text)
        {
            oActivityLog.Where.DateLog.BetweenBeginValue = Micajah.Common.Helper.Convert.o2dt(tbStartDate.Text);
            oActivityLog.Where.DateLog.BetweenEndValue = Micajah.Common.Helper.Convert.o2dt(tbEndDate.Text);
            oActivityLog.Where.DateLog.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Between;
        }
        else if(string.Empty != tbStartDate.Text &&
            string.Empty == tbEndDate.Text)
        {
            oActivityLog.Where.DateLog.Value = Micajah.Common.Helper.Convert.o2dt(tbStartDate.Text);
            oActivityLog.Where.DateLog.Operator = MyGeneration.dOOdads.WhereParameter.Operand.GreaterThanOrEqual;
        }
        else if (string.Empty == tbStartDate.Text &&
            string.Empty != tbEndDate.Text)
        {
            oActivityLog.Where.DateLog.Value = Micajah.Common.Helper.Convert.o2dt(tbEndDate.Text);
            oActivityLog.Where.DateLog.Operator = MyGeneration.dOOdads.WhereParameter.Operand.LessThanOrEqual;
        }

        oActivityLog.Query.Load();

        gvActivityLog.DataSource = oActivityLog.DefaultView;
        lblResults.Text = "Results (" + oActivityLog.RowCount + " rows): ";
        gvActivityLog.DataBind();
    }
    protected void linkbtnFilter_Click(object sender, EventArgs e)
    {
        mvFilter.SetActiveView(viewSimpleSearch);
    }
}