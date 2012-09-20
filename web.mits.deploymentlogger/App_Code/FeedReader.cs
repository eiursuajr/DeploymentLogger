using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections.Generic;
using System.Text;
using System.Xml;

using DL_WEB.BLL;

/// <summary>
/// Summary description for FeedReader
/// </summary>
/// 
namespace RSSReader
{
    public class FeedReader
    {
        private Uri m_uri;
        private List<NewsItem> m_newsItems;
        private List<ChannelInfo> m_channelInfo;

        public FeedReader(Uri uri)
        {
            this.m_uri = uri;
        }

        public void Load()
        {
            m_newsItems = new List<NewsItem>();
            m_channelInfo = new List<ChannelInfo>();

            XmlDocument doc = new XmlDocument();
            using (XmlReader reader = XmlReader.Create(m_uri.AbsoluteUri))
            {
                doc.Load(reader);
                reader.Close();
            }

            XmlNode channelNode = doc.SelectSingleNode("//rss/channel");
            //if (channelNode == null)
            //    throw new RssException("Not a valid RSS channel.");

            XmlNode channelTitleNode = channelNode.SelectSingleNode("title");
            string channelTitle = (channelTitleNode == null) ? "" : channelTitleNode.InnerText;

            XmlNode channelLinkNode = channelNode.SelectSingleNode("link");
            string channelLink = (channelLinkNode == null) ? "" : channelLinkNode.InnerText;

            XmlNode channelDescNode = channelNode.SelectSingleNode("description");
            string channelDesc = (channelDescNode == null) ? "" : channelDescNode.InnerText;

            XmlNode imageLinkNode = channelNode.SelectSingleNode("image/link");
            string imageLink = (imageLinkNode == null) ? "" : imageLinkNode.InnerText;

            XmlNode imageUrlNode = channelNode.SelectSingleNode("image/url");
            string imageUrl = (imageUrlNode == null) ? "" : imageUrlNode.InnerText;

            ChannelInfo chInfo = new ChannelInfo(channelTitle, channelLink,
                                                channelDesc, imageUrl, imageLink);
            m_channelInfo.Add(chInfo);

            XmlNodeList items = channelNode.SelectNodes("item");
            foreach (XmlNode itemNode in items)
            {
                XmlNode titleNode = itemNode.SelectSingleNode("title");
                string title = (titleNode == null) ? "" : titleNode.InnerText;

                XmlNode linkNode = itemNode.SelectSingleNode("link");
                string link = (linkNode == null) ? "" : linkNode.InnerText;

                XmlNode descNode = itemNode.SelectSingleNode("description");
                string descHtml = (descNode == null) ? "" :
                       System.Web.HttpUtility.HtmlDecode(descNode.InnerText);
                string desc = Util.StripHtmlTags(descHtml);

                m_newsItems.Add(new NewsItem(title, link, desc));
            }
        }

        public List<NewsItem> GetNewsItems()
        {
            return m_newsItems;
        }

        //public List<ChannelInfo> GetChannelInfo()
        //{
        //    return m_channelInfo;
        //}
    }
}