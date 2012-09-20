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

using MyGeneration.dOOdads;

public partial class ActiveOrganization : DL_WEB.BLL.Security.SecurityPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                UserRole oUserRole = new UserRole();
                Hashtable oOrgs = oUserRole.GetUserOrganizations(DL_WEB.DAL.Master.User.GetUserID(HttpContext.Current.User.Identity.Name)) as Hashtable;

                foreach (Organization org in oOrgs.Values)
                {
                    if (!org.IsDeleted)
                        bullistOrgs.Items.Add(new ListItem(org.Name, org.OrganizationID.ToString()));
                }
            }
            catch (Exception ex) 
            { 
                throw ex;
            }
            finally
            {
                BusinessEntity.PopStaticConnectionString();
            }
        }
    }
    protected void bullistOrgs_Click(object sender, BulletedListEventArgs e)
    {
        try
        {
			MyGeneration.dOOdads.BusinessEntity.ClearConnectionString();
            Organization org = new Organization();
            BusinessEntity.PushStaticConnectionString();

            org.LoadByPrimaryKey(Convert.ToInt32(bullistOrgs.Items[e.Index].Value));
            Session["Organization"] = org;
			Session["OrganizationID"] = org.OrganizationID;
            BusinessEntity.PopStaticConnectionString();
            MyGeneration.dOOdads.BusinessEntity.StaticConnectionString = org.DBConnectionString;
            //if (Request["redirecturl"] != null)
            //    Response.Redirect(HttpUtility.UrlDecode(Request["redirecturl"]));
            //else
			Response.Redirect(HttpUtility.UrlDecode(DL_WEB.Global.DefaultPageURL));
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}
