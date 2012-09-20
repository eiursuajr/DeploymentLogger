using System;
using System.Data;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using DL_WEB.DAL.Master;
using Micajah.Common.Helper;

public partial class OrganizationUserRoleDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (IsPostBack)
        {
            ArrayList oUserRoles = Session["UserRoles"] as ArrayList;
            OrganizationRoleEntry oEntry = new OrganizationRoleEntry(Micajah.Common.Helper.Convert.o2i(ddlOrganization.SelectedValue), Micajah.Common.Helper.Convert.o2i(ddlRole.SelectedValue), ActionTypes.Insert);

            if (null == oUserRoles)
            {
                oUserRoles = new ArrayList();
                oUserRoles.Add(oEntry);
                Session.Add("UserRoles", oUserRoles);
            }
            else
            {
                bool bContainsOrg = false;
                ArrayList oFoundEntries = new ArrayList();
                foreach (OrganizationRoleEntry oOrgRoleEntry in oUserRoles)
                {
                    if (oOrgRoleEntry.OrganizationID == oEntry.OrganizationID)
                    {
                        oFoundEntries.Add(oOrgRoleEntry);
                        bContainsOrg = true;
                    }
                }
                if (!bContainsOrg)
                {
                    // so, user could have only one role in organization
                    oUserRoles.Add(oEntry);
                }
                else
                {
                    bool bAddedEntryExists = false;
                    foreach (OrganizationRoleEntry oFoundEntry in oFoundEntries)
                    {
                        if (oFoundEntry.ActionType == ActionTypes.Delete &&
                            oFoundEntry.OrganizationID == oEntry.OrganizationID &&
                                oFoundEntry.RoleID == oEntry.RoleID)
                        {
                           oUserRoles.Remove(oFoundEntry);
                           bAddedEntryExists = true;
                           break;
                        }
                        else if (oFoundEntry.ActionType == ActionTypes.Insert)
                        {
                           bAddedEntryExists = true;
                           break;
                        }
                    }
                    if (!bAddedEntryExists)
                    {
                        oUserRoles.Add(oEntry);
                    }
                }
                Session["UserRoles"] = oUserRoles;
            }
        }
    }
}
