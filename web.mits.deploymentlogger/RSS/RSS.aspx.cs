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
using System.Text;

using nsoftware.RSSTools;

using MasterDL = DL_WEB.DAL.Master;
using ClientDL = DL_WEB.DAL.Client;
using DL_WEB.BLL;

public partial class RSS_RSS : System.Web.UI.Page
{
    int projectID = 7;
    int orgID = 1;
    int impactLevelID = 3;

    DataView projectInfo = null;

    #region Page Events

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            // Set the content-type
            Response.ContentType = "text/xml";
            Response.ContentEncoding = Encoding.UTF8;

            if (Request["ProjectID"] != null &&
                Request["OrganizationID"] != null &&
                Request["ImpactLevelID"] != null)
            {
                try
                {
                    projectID = Convert.ToInt32(Request["ProjectID"]);
                    orgID = Convert.ToInt32(Request["OrganizationID"]);
                    impactLevelID = Convert.ToInt32(Request["ImpactLevelID"]);
                }
                catch (FormatException ex)
                {
                    CreateRSSFeed(RSSConst.RSSFeedType.INCORRECT_FORMAT);
                    return;
                }

                // organization database ID
                int orgDataBaseID = MasterDL.Organization.GetOrganizationDataBaseID(orgID);
                if (orgDataBaseID != 0)
                {
                    // organization connection string
                    string orgConnectionStr = MasterDL.Database.GetConnectionString(orgDataBaseID);
                    if (!String.IsNullOrEmpty(orgConnectionStr))
                    {
                        projectInfo = ClientDL.Project.GetProjectInfo(orgConnectionStr, projectID);

                        // get project updates
                        DataView updates = ClientDL.Project.GetProductionUpdates(orgConnectionStr, projectID);
                        if (updates.Table.Rows.Count > 0)
                        {
                            Rssfeed RSSFeedControl = new Rssfeed();
                            RSSFeedControl.OnError += new Rssfeed.OnErrorHandler(RSSFeedControl_OnError);

                            RSSFeedControl.SetChannel("title", GetRSSTitle(projectInfo, orgID));
                            //RSSFeedControl.SetChannel("link", appl.ChannelLink);
                            RSSFeedControl.SetChannel("description", GetRSSDecsription(projectInfo));

                            RSSFeedControl.StartFeed();

                            foreach (DataRow drUpdt in updates.Table.Rows)
                            {
                                DataView entries = ClientDL.Project.GetProductionLogEntries(orgConnectionStr, Convert.ToInt32(drUpdt["UpdateID"]), impactLevelID);
                                if (entries.Table.Rows.Count > 0)
                                {
                                    foreach (DataRow drEntr in entries.Table.Rows)
                                    {
                                        // build date
                                        RSSFeedControl.SetOutput("pubDate", Convert.ToDateTime(drUpdt["BuildDate"]).ToString("d"));
                                        //RSSFeedControl.SetOutput("pubDate", drUpdt["BuildDate"].ToString());
                                        // log entry type name
                                        RSSFeedControl.SetOutput("category", drEntr["TypeName"].ToString());
                                        // log entry icon path
                                        //RSSFeedControl.SetOutput("rssEnclosure", drEntr["IconPath"].ToString());
                                        RSSFeedControl.SetOutput("link", drEntr["IconPath"].ToString());
                                        string title = "<b>" + drEntr["ProjectSectionName"].ToString() + "</b>. " + drEntr["PublicHeader"].ToString();
                                        RSSFeedControl.PushItem(title, drEntr["PublicDescription"].ToString());
                                    }
                                }
                                else
                                {
                                    // build date
                                    RSSFeedControl.SetOutput("pubDate", Convert.ToDateTime(drUpdt["BuildDate"]).ToString("G"));
                                    RSSFeedControl.PushItem("<b>" + drUpdt["Name"].ToString() + "</b>", RSSConst.NO_LOG_ENTRIES);
                                }
                            }
                            RSSFeedControl.EndFeed();

                            // write out the RSS feed
                            Response.Write(RSSFeedControl.FeedContent);
                        }
                        else
                            CreateRSSFeed(RSSConst.RSSFeedType.NO_UPDATES);
                    }
                    else
                        CreateRSSFeed(RSSConst.RSSFeedType.ORG_CONN_STR_NOT_FOUND);
                }
                else
                    CreateRSSFeed(RSSConst.RSSFeedType.ORG_CONN_STR_NOT_FOUND);
            }
            else
                CreateRSSFeed(RSSConst.RSSFeedType.QUERY_STRING_PARAMETERS_NOT_DEFINED);
        }
    }

    #endregion

    #region Methods

    protected void CreateRSSFeed(RSSConst.RSSFeedType feedType)
    {
        string message = String.Empty;

        Rssfeed RSSFeedControl = new Rssfeed();
        RSSFeedControl.OnError += new Rssfeed.OnErrorHandler(RSSFeedControl_OnError);

        switch (feedType)
        {
            case RSSConst.RSSFeedType.NO_UPDATES:
                message = RSSConst.NO_UPDATES;
                break;
            case RSSConst.RSSFeedType.INCORRECT_FORMAT:
                message = RSSConst.INCORRECT_FORMAT;
                break;
            case RSSConst.RSSFeedType.QUERY_STRING_PARAMETERS_NOT_DEFINED:
                message = RSSConst.QUERY_STRING_PARAMETERS_NOT_DEFINED;
                break;
            case RSSConst.RSSFeedType.ORG_CONN_STR_NOT_FOUND:
                message = RSSConst.ORG_CONN_STR_NOT_FOUND;
                break;
        }

        RSSFeedControl.SetChannel("title", message);
        RSSFeedControl.SetChannel("description", message);
        RSSFeedControl.StartFeed();
        RSSFeedControl.SetOutput("pubDate", DateTime.Now.ToString());
        RSSFeedControl.PushItem(message, message);
        RSSFeedControl.EndFeed();

        // write out the RSS feed
        Response.Write(RSSFeedControl.FeedContent);
    }

    protected string GetRSSDecsription(DataView projectInfo)
    {
        if (projectInfo.Table.Rows.Count > 0)
            return projectInfo.Table.Rows[0]["Description"].ToString();
        else
            return String.Empty;
    }

    protected string GetRSSTitle(DataView projectInfo,
                                 int orgID)
    {
        StringBuilder sb = new StringBuilder();

        if (projectInfo.Table.Rows.Count > 0)
        {
            sb.Append("Organization:");
            // organization name
            string orgName = ClientDL.Organization.GetOrganizationName(orgID);
            sb.Append(orgName);
            sb.Append("&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;");
            sb.Append("Project:");
            sb.Append(projectInfo.Table.Rows[0]["Name"].ToString());
        }
        return sb.ToString();
    }

    #endregion

    #region Events

    protected void RSSFeedControl_OnError(object sender, RssfeedErrorEventArgs e)
    {
        throw new ApplicationException(e.Description);
    }

    #endregion
}
