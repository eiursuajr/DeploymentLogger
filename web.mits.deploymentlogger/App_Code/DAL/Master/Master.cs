using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Summary description for Master
/// </summary>

namespace DL_WEB.DAL.Master
{
    public static class Master
    {
        private static String m_sConnectionString;

        public static String DBConnectionString{
            get {
                return m_sConnectionString;
            }
            set {
                m_sConnectionString = value;
            }
        }
    }
}

