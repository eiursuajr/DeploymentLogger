using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Net;
using System.IO;
using System.Web.Hosting;
using System.Text;

using DL_WEB;
using DL_WEB.BLL;
using MasterDL = DL_WEB.DAL.Master;
using ClientDL = DL_WEB.DAL.Client;


using skmRss;
using skmRss.Engine;

public partial class Reports_DeploymentLogReport : System.Web.UI.Page
{
    #region Page Events

    protected void Page_Load(object sender, EventArgs e)
    {
        ucImpactLevel.OnSelectClick += new EventHandler(ucImpactLevel_OnSelectClick);

        if (!Page.IsPostBack)
        {
            if (Request["ProjectID"] != null &&
                Request["OrganizationID"] != null)
            {
                ucProjectInfo.ProjectID = Convert.ToInt32(Request["ProjectID"]);
                hlSubscribe.NavigateUrl = string.Format("{0}?ProjectID={1}&OrganizationID={2}", Global.SubscribePageURL, Request["ProjectID"].ToString(), Request["OrganizationID"].ToString());
                try
                {
                    DisplayFeed();
                }
                catch (FormatException ex)
                {
                    DisplayErrorMessage(ex.Message);
                }
            }
        }
    }

    #endregion
   
    #region Methods

    //get RSS URL
    string GetRSSURL()
    {
        StringBuilder sb = new StringBuilder();
        sb.Append(Util.GetUrl());
        sb.Append("/RSS/RSS.aspx?ProjectID=");
        sb.Append(Request["ProjectID"].ToString());
        sb.Append("&OrganizationID=");
        sb.Append(Request["OrganizationID"].ToString());
        sb.Append("&ImpactLevelID=");
        sb.Append(ucImpactLevel.ImpactLevelID.ToString());
        return sb.ToString();
    }

    void DisplayFeed()
    {
        try
        {
            string URI = GetRSSURL();
            ucRssFeed.DataSource = URI;
            ucRssFeed.DataBind();
        }
        catch (FeedTimeoutException ex)
        {
            DisplayErrorMessage(ex.Message);
        }
        catch (FeedException ex)
        {
            DisplayErrorMessage(ex.Message);
        }      
        catch (WebException ex)
        {
            DisplayErrorMessage(ex.Message);
        }
        catch (TimeoutException ex)
        {
            DisplayErrorMessage(ex.Message);
        }      
        catch (ApplicationException ex)
        {
            DisplayErrorMessage(ex.Message);
        }
        catch (Exception ex)
        {
            DisplayErrorMessage(ex.Message);
        }
    }

    protected void DisplayErrorMessage(string message)
    {
        lblErrorMessage.Visible = true;
        lblErrorMessage.Text = message;
        ucRssFeed.Visible = false;
    }

    protected void DisplayErrorMessage(RSSConst.RSSFeedType feedType)
    {
        string message = string.Empty;

        lblErrorMessage.Visible = true;
        ucRssFeed.Visible = false;

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
        lblErrorMessage.Text = message;
    }

    #endregion

    #region Events

    protected void ucImpactLevel_OnSelectClick(object sender, EventArgs e)
    {
        DisplayFeed();
    }

    protected void ucRssFeed_ItemDataBound(object sender, RssFeedItemEventArgs e)
    {        
        if ((e.Item.ItemType == RssFeedItemType.Item) ||
             (e.Item.ItemType == RssFeedItemType.AlternatingItem))
        {
            RssFeedItem item = e.Item;
            switch (item.DataItem.Description)
            {
                case RSSConst.NO_UPDATES:
                    DisplayErrorMessage(RSSConst.RSSFeedType.NO_UPDATES);
                    break;
                case RSSConst.INCORRECT_FORMAT:
                    DisplayErrorMessage(RSSConst.RSSFeedType.INCORRECT_FORMAT);
                    break;
                case RSSConst.ORG_CONN_STR_NOT_FOUND:
                    DisplayErrorMessage(RSSConst.RSSFeedType.ORG_CONN_STR_NOT_FOUND);
                    break;
                case RSSConst.QUERY_STRING_PARAMETERS_NOT_DEFINED:
                    DisplayErrorMessage(RSSConst.RSSFeedType.QUERY_STRING_PARAMETERS_NOT_DEFINED);
                    break;
                case RSSConst.NO_LOG_ENTRIES:
                    Image img = (Image)e.Item.FindControl("imgCategory");
                    if (img != null)
                        img.Visible = false;
                    break;
            }
        }
    }

    protected void ucRssFeed_PreRender(object sender, EventArgs e)
    {
        if (ucRssFeed.Items.Count == 0)
        {
            ucRssFeed.Visible = false;
            lblErrorMessage.Text = "No updates";
            lblErrorMessage.Visible = true;
        }
    }

    #endregion
}

