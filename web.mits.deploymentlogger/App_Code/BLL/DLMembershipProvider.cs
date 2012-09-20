using System;
using System.Collections.Generic;
using System.Text;
using System.Web.Security;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;

using MyGeneration.dOOdads;
using ConvertHelper = Micajah.Common.Helper.Convert;
using DL_WEB.DAL.Master;

namespace DL_WEB.BLL
{
    public class DLMembershipProvider : MembershipProvider
    {
        #region Fields

        private string applicationName = string.Empty;

        public static DAL.Master.User AuthorizedUser;
        public static DAL.Master.Organization ActiveOrganization;

        protected System.Collections.Specialized.NameValueCollection m_Config;

        #endregion

        #region Properties

        #region EnablePasswordReset

        public override bool EnablePasswordReset
        {
            get
            {
                //
                // always allow password reset
                //
                return true;
            }
        }

        #endregion

        #region RequiresQuestionAndAnswer

        public override bool RequiresQuestionAndAnswer
        {
            get
            {
                //
                // never requires a question and answer
                //
                return false;
            }
        }

        #endregion

        #region EnablePasswordRetrieval

        public override bool EnablePasswordRetrieval
        {
            get
            {
                //
                // don allow password retrievel
                //
                return false;
            }
        }

        #endregion

        #region ApplicationName

        public override string ApplicationName
        {
            get
            {
                return this.applicationName;
            }

            set
            {
                this.applicationName = value;
            }
        }

        #endregion

        #endregion

        #region Methods
        public override void Initialize(string name, System.Collections.Specialized.NameValueCollection config)
        {
            base.Initialize(name, config);
            string userName = config["userName"];
            string password = config["password"];
            m_Config = config;
            
            if (userName == null)
            {
                throw new ConfigurationErrorsException("Missing userName attribute on custom membership provider.");
            }
            else if (password == null)
            {
                throw new ConfigurationErrorsException("Missing password attribute on custom membership provider.");
            }
        }

        public override bool ValidateUser(string name, string password)
        {
            try
            {
                DAL.Master.User oUser = new DL_WEB.DAL.Master.User();

                oUser.Where.Login.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                oUser.Where.Login.Value = name;

                oUser.Where.Password.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
                oUser.Where.Password.Value = password;

                oUser.Query.Load();
                if (oUser.RowCount > 0)
                {
                    AuthorizedUser = oUser;
                    oUser.LastLoginDate = DateTime.Now;
                    oUser.Save();
                    return true;
                }
                else
                    return false;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public override string GetPassword(string name, string answer)
        {
            throw new NotImplementedException();
        }

        public override bool ChangePasswordQuestionAndAnswer(string name, string password, string newPasswordQuestion, string newPasswordAnswer)
        {
            throw new NotImplementedException();
        }

        public override bool ChangePassword(string name, string oldPassword, string newPassword)
        {
            try
            {
                if (newPassword.Length < MinRequiredPasswordLength)
                    return false;

                int UserID = DL_WEB.DAL.Master.User.GetUserID(name);
                Guid UserGuid = DL_WEB.DAL.Master.User.GetUserGUID(name);

                DL_WEB.DAL.Master.User oMasterUser = new DL_WEB.DAL.Master.User();
                oMasterUser = new DL_WEB.DAL.Master.User();
                oMasterUser.LoadByPrimaryKey(UserID);

                if (oldPassword != null && oldPassword != oMasterUser.Password)
                    return false;

                oMasterUser.Password = newPassword;
                oMasterUser.Save();

                UserRole oUserRoles = new DL_WEB.DAL.Master.UserRole();
                oUserRoles.Where.UserID.Value = UserID;
                oUserRoles.Query.Load();

                foreach (DataRowView oUserRole in oUserRoles.DefaultView)
                {
                    DataRow[] drOrg = Organization.Instance.Organizations.Select("OrganizationID = " + oUserRole["OrganizationID"]);

                    if (drOrg.Length > 0)
                    {
                        int iDatabaseID = ConvertHelper.o2i(drOrg[0]["DatabaseID"]);

                        DataRow[] drDbs = Database.Instance.Databases.Select("DatabaseID = " + iDatabaseID);
                        string sConnectionString = ConvertHelper.o2s(drDbs[0]["DBConnectionString"]);

                        if (drDbs.Length > 0)
                        {
                            DL_WEB.DAL.Client.User oClientUser = new DL_WEB.DAL.Client.User();
                            oClientUser.Where.GUID.Value = UserGuid;
                            oClientUser.ConnectionString = sConnectionString;
                            oClientUser.Query.Load();

                            if (oClientUser.RowCount > 0)
                            {
                                oClientUser.Password = newPassword;
                                oClientUser.Save();
                            }
                        }
                    }
                }

                return true;
            }
            catch
            {
                return false;
            }
        }

        public override string ResetPassword(string name, string answer)
        {
            throw new NotImplementedException();
        }

        public override string GetUserNameByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public override int GetNumberOfUsersOnline()
        {
            throw new NotImplementedException();
        }

        public override int MaxInvalidPasswordAttempts
        {
            get { return Convert.ToInt32(m_Config["maxInvalidPasswordAttempts"]); }
        }

        public override int MinRequiredPasswordLength
        {
            get { return Convert.ToInt32(m_Config["minRequiredPasswordLength"]); }
        }

        public override string PasswordStrengthRegularExpression
        {
            get { throw new Exception("The method or operation is not implemented."); }
        }

        public override int MinRequiredNonAlphanumericCharacters
        {
            get { return Convert.ToInt32(m_Config["minRequiredNonAlphanumericCharacters"]); }
        }

        public override MembershipUser CreateUser(string username, 
                                                    string password, 
                                                    string email, 
                                                    string passwordQuestion,
                                                    string passwordAnswer, 
                                                    bool isApproved,
                                                    object providerUserKey,
                                                    out MembershipCreateStatus status)
        {
            try
            {
                #region Checking if user with specified username exists

                DAL.Master.User oUser = new DL_WEB.DAL.Master.User();
                BusinessEntity.PushStaticConnectionString();

                //oUser.ConnectionString = ConfigurationManager.AppSettings[MyGeneration.dOOdads.BusinessEntity.DefaultConnectionStringConfig];
                oUser.Where.Login.Value = username;
                oUser.Query.Load();

                #endregion

                if (oUser.RowCount > 0)
                {
                    status = MembershipCreateStatus.DuplicateUserName;
                    return null;
                }
                else
                {
                    oUser = new DL_WEB.DAL.Master.User();
                    oUser.AddNew();
                    oUser.Login = email;
                    oUser.Password = password;
                    oUser.Email = email;
                    oUser.PasswordQuestion = null == passwordQuestion ? "?" : passwordQuestion;
                    oUser.PasswordAnswer = null == passwordAnswer ? string.Empty : passwordAnswer;
                    oUser.IsApproved = false;
                    oUser.IsLockedOut = false;
                    oUser.GUID = Guid.NewGuid();
                    oUser.CreationDate = DateTime.Now;

                    oUser.Save();
                    status = MembershipCreateStatus.Success;
                    return new MembershipUser(this.Name, oUser.Login, oUser.UserID, oUser.Email, oUser.PasswordQuestion, string.Empty, oUser.IsApproved, oUser.IsLockedOut, oUser.CreationDate, oUser.LastLoginDate, oUser.LastActivityDate, oUser.LastPasswordChangedDate, oUser.LastLockoutDate);
                }
            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627) // unique key constraints
                    status = MembershipCreateStatus.DuplicateEmail;
                else
                    status = MembershipCreateStatus.ProviderError;
                return null;
            }
            catch (Exception ex)
            {
                status = MembershipCreateStatus.ProviderError;
                return null;
            }
            finally
            {
                BusinessEntity.PopStaticConnectionString();
            }
        }

        public override MembershipUser GetUser(string name, bool userIsOnline)
        {
            DAL.Master.User oUser = new DL_WEB.DAL.Master.User();

            oUser.Where.Login.Operator = MyGeneration.dOOdads.WhereParameter.Operand.Equal;
            oUser.Where.Login.Value = name;

            oUser.Query.Load();

            return new MembershipUser(this.Name, oUser.Login, oUser.UserID, oUser.Email, oUser.PasswordQuestion, string.Empty, oUser.IsApproved, oUser.IsLockedOut, oUser.CreationDate,
                (oUser.IsColumnNull(DL_WEB.DAL.Master.User.ColumnNames.LastLoginDate) ? new DateTime() : oUser.LastLoginDate),
                (oUser.IsColumnNull(DL_WEB.DAL.Master.User.ColumnNames.LastActivityDate) ? new DateTime() : oUser.LastActivityDate),
                (oUser.IsColumnNull(DL_WEB.DAL.Master.User.ColumnNames.LastPasswordChangedDate) ? new DateTime() : oUser.LastPasswordChangedDate),
                (oUser.IsColumnNull(DL_WEB.DAL.Master.User.ColumnNames.LastLockoutDate) ? new DateTime() : oUser.LastLockoutDate));
        }

        public override MembershipUserCollection FindUsersByEmail(string emailToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection FindUsersByName(string usernameToMatch, int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override MembershipUserCollection GetAllUsers(int pageIndex, int pageSize, out int totalRecords)
        {
            throw new NotImplementedException();
        }

        public override void UpdateUser(MembershipUser user)
        {
            throw new NotImplementedException();
        }

        public override bool DeleteUser(string name, bool deleteAllRelatedData)
        {
            throw new NotImplementedException();
        }

        public override MembershipPasswordFormat PasswordFormat
        {
            get { throw new NotImplementedException(); }
        }

        public override int PasswordAttemptWindow
        {
            get { throw new NotImplementedException(); }
        }

        public override bool RequiresUniqueEmail
        {
            get { throw new NotImplementedException(); }
        }

        public override bool UnlockUser(string userName)
        {
            throw new NotImplementedException();
        }

        public override MembershipUser GetUser(object providerUserKey, bool userIsOnline)
        {
            throw new NotImplementedException();
        }

        #endregion

    }
}
