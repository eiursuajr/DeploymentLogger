using System;
using System.Data;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;

public partial class ProjectInfoControl : System.Web.UI.UserControl
{
	#region Members

	private int m_ProjectID;

	#endregion

	#region Properties

	public int ProjectID
	{
		get
		{
			return m_ProjectID;
		}

		set
		{
			m_ProjectID = value;
		}
	}

	#endregion

    protected void Page_Load(object sender, EventArgs e)
    {
		if (m_ProjectID > 0)
		{
			DL_DAL.Client.ProjectView oProjectView = new DL_DAL.Client.ProjectView();
			oProjectView.Where.ProjectID.Value = m_ProjectID;
			oProjectView.Where.ProjectID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
			oProjectView.Query.Load();

			if (oProjectView.RowCount > 0)
			{
				ProjectNameLink.Text = oProjectView.Name;
                ProjectNameLink.NavigateUrl = string.Format("~/ProjectDetails.aspx?ProjectID={0}", oProjectView.ProjectID);
			}
		}
    }
}
