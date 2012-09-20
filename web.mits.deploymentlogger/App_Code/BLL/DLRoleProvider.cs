using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using DL_WEB.DAL;
using System.Collections;
using System.Web.SessionState;

namespace DL_WEB.BLL
{
    /// <summary>
    /// Summary description for DLRoleProvider
    /// </summary>
    public class DLRoleProvider : SqlRoleProvider
    {
        public override string[] GetAllRoles()
        {
            ArrayList roles = new ArrayList();

            DAL.Master.Role oRoles = new DAL.Master.Role();

            oRoles.LoadAll();

            foreach (DataRowView oRowView in oRoles.DefaultView)
            {
                roles.Add(oRowView.Row[DAL.Master.Role.ColumnNames.Name]);
            }
            return (string[])roles.ToArray(typeof(string));
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            int UserID = 0;
            int RoleID = 0;

            DAL.Master.User Users = new DL_WEB.DAL.Master.User();
            Users.Where.Login.Value = username;
            Users.Where.Login.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            Users.Query.Load();
            if (Users.RowCount == 1)
            {
                UserID = Users.UserID;
            }

            DAL.Master.Role Roles = new DL_WEB.DAL.Master.Role();
            Roles.Where.Name.Value = roleName;
            Roles.Where.Name.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            Roles.Query.Load();
            if (Roles.RowCount == 1)
            {
                RoleID = Roles.RoleID;
            }

            DAL.Master.UserRole UserRoles = new DL_WEB.DAL.Master.UserRole();

            UserRoles.Where.RoleID.Value = RoleID;
            UserRoles.Where.RoleID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            UserRoles.Where.UserID.Value = UserID;
            UserRoles.Where.UserID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

            UserRoles.Query.Load();

            if (UserRoles.RowCount > 0)
                return true;
            else
                return false;
        }

        public override void CreateRole(string roleName)
        {
            DAL.Master.Role Roles = new DL_WEB.DAL.Master.Role();
            Roles.AddNew();
            Roles.Name = roleName;
            Roles.Save();
        }

        public override string[] GetRolesForUser(string username)
        {
            IHttpSessionState session = System.Web.SessionState.SessionStateUtility.GetHttpSessionStateFromContext(HttpContext.Current);


            if (null != session["Organization"])
            {
                int UserID = 0;
                int RoleID = 0;

                try
                {
                    MyGeneration.dOOdads.BusinessEntity.PushStaticConnectionString();

                    DAL.Master.User Users = new DL_WEB.DAL.Master.User();
                    Users.Where.Login.Value = username;
                    Users.Where.Login.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                    Users.Query.Load();
                    if (Users.RowCount == 1)
                    {
                        UserID = Users.UserID;
                    }

                    DAL.Master.UserRole UserRoles = new DL_WEB.DAL.Master.UserRole();

                    UserRoles.Where.UserID.Value = UserID;
                    UserRoles.Where.UserID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                    UserRoles.Where.OrganizationID.Value = (session["Organization"] as DAL.Master.Organization).OrganizationID;
                    UserRoles.Where.OrganizationID.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;

                    UserRoles.Query.Load();

                    if (UserRoles.RowCount > 0)
                    {
                        string[] aRoles = new string[UserRoles.RowCount];
                        int counter = 0;
                        DAL.Master.Role oRole = new DL_WEB.DAL.Master.Role();

                        do
                        {
                            oRole.LoadByPrimaryKey(UserRoles.RoleID);
                            aRoles[counter++] = oRole.Name;
                        } while (UserRoles.MoveNext());
                        return aRoles;
                    }
                }
                finally
                {
                    MyGeneration.dOOdads.BusinessEntity.PopStaticConnectionString();
                }
            }
            return new string[0];
        }
    }
}