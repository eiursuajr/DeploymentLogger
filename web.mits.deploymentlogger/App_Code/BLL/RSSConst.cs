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
/// Summary description for Const
/// </summary>
/// 
namespace DL_WEB.BLL
{
    public class RSSConst
    {
        public enum RSSFeedType
        {
            QUERY_STRING_PARAMETERS_NOT_DEFINED = 0,
            NO_UPDATES = 1,
            INCORRECT_FORMAT = 2,
            ORG_CONN_STR_NOT_FOUND = 3,
            NO_LOG_ENTRIES = 4
        }

        public const string NO_UPDATES = "No updates";
        public const string INCORRECT_FORMAT = "Incorrect format of query string parameters";
        public const string QUERY_STRING_PARAMETERS_NOT_DEFINED = "Query string parameters not defined";
        public const string ORG_CONN_STR_NOT_FOUND = "Connection string for organization not found";
        public const string NO_LOG_ENTRIES = "No log entries";

    }
}