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

using DL_WEB.DAL.Master;

namespace DL_WEB.BLL.Security
{
    public partial class SecurityPage : System.Web.UI.Page
    {
        #region Properties

        public int OrganizationID
        {
            get
            {
                int iOrgID = 0;
                Organization oOrg = Session["Organization"] as Organization;
                if (null != oOrg)
                {
                    iOrgID = oOrg.OrganizationID;
                }
                return iOrgID;
            }
        }

        #endregion

        #region Constructor 

        public SecurityPage()
        {
        }

        #endregion

        #region FindControlRecursive

        private Control FindControlRecursive(String Name)
        {
            return FindControlRecursive(Name, null);
        }

        private Control FindControlRecursive(String Name, ControlCollection Controls)
        {
            if (Controls == null)
                Controls = Page.Controls;
            foreach (Control ctrl in Controls)
            {
                if (ctrl.ID == Name)
                    return ctrl;
                if (ctrl.Controls.Count > 0)
                {
                    Control ctrlChild = FindControlRecursive(Name, ctrl.Controls);
                    if (ctrlChild != null)
                        return ctrlChild;
                }
            }
            return null;
        }

        #endregion 

        #region CheckAccessRights

        private void CheckAccessRights()
        {
            if (Session["RoleActions"] != null)
            {
                DataTable dtRoleActions = (DataTable)Session["RoleActions"];
                foreach (DataRow row in dtRoleActions.Rows)
                {
                    if ("ASP." + row["URL"].ToString().ToLower() + "_aspx" == this.GetType().ToString())
                    {
                        if (row["IsPermitted"].ToString() == "1")
                        {
                            foreach (DataRow childRow in dtRoleActions.Rows)
                            {
                                if (childRow["ParentID"].ToString() == row["ActionID"].ToString()
                                && childRow["IsPermitted"].ToString() == "0")
                                {
                                    Control ctrl = FindControlRecursive(childRow["ControlID"].ToString());
                                    if (ctrl != null)
                                        ctrl.Visible = false;
                                }
                            }
                        }
                        else
                        {
                            Response.Redirect("NotAllowed.aspx");
                            return;
                        }
                    }
                }
            }
        }

        #endregion

        #region OnPreRender
        
        protected override void OnPreRender(EventArgs e)
        {
            base.OnPreRender(e);
            CheckAccessRights();
        }

        #endregion

        #region OnInit

        override protected void OnInit(EventArgs e)
        {
            base.OnInit(e);
            if (Context.Session != null)
            {
                int int_MilliSecondsTimeOut = (this.Session.Timeout * 60000) - 30000;
                string str_Script = @"<script type='text/javascript'> " + Environment.NewLine +
                    "function getObjectHTTP()" + Environment.NewLine +
                    "{" + Environment.NewLine +
                    "var xmlhttp = null" + Environment.NewLine +
                    "if (navigator.userAgent.indexOf(\"MSIE\")>=0)" + Environment.NewLine +
                    "{" + Environment.NewLine +
                    "   xmlhttp = new ActiveXObject(\"Microsoft.XMLHTTP\")" + Environment.NewLine +
                    "}" + Environment.NewLine +
                    "else" + Environment.NewLine +
                    "{" + Environment.NewLine +
                    "   xmlHttp = new XMLHttpRequest()" + Environment.NewLine +
                    "}" + Environment.NewLine +
                    "return xmlhttp" + Environment.NewLine +
                    "}" + Environment.NewLine +
                    "function Reconnect() " + Environment.NewLine +
                    "{" + Environment.NewLine +
                    "var url='~/Reconnect.aspx'" + Environment.NewLine +
                    "xmlHttp=getObjectHTTP()" + Environment.NewLine +
                    "xmlHttp.open('GET', url , true)" + Environment.NewLine +
                    "xmlHttp.send(null)" + Environment.NewLine +
                    "}" + Environment.NewLine +
                    "</script>";
                this.Page.RegisterClientScriptBlock("Reconnect", str_Script);
            }
        }

        #endregion

    }
}

