using System;
using System.Collections.Generic;
using System.Text;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Globalization;


/// <summary>
/// Summary description for Util
/// </summary>
/// 
namespace DL_WEB.BLL
{
    public class Util
    {
        public static string StripHtmlTags(string input)
        {
            if (string.IsNullOrEmpty(input))
                return "";
            StringBuilder buffer = new StringBuilder();
            bool insideTag = false;
            for (int i = 0; i < input.Length; i++)
            {
                switch (input[i])
                {
                    case '<':
                        insideTag = true;
                        break;
                    case '>':
                        insideTag = false;
                        break;
                    default:
                        if (!insideTag)
                            buffer.Append(input[i]);
                        break;
                }
            }
            return buffer.ToString();
        }

        public static void DisplayAlert(Page ctrlPage,
                                Type cstype,
                                string message)
        {
            ClientScriptManager cs = ctrlPage.ClientScript;
            StringBuilder script = new StringBuilder();
            script.Append("alert('");
            script.Append(message.Replace("'", "\'"));
            script.Append("');");
            cs.RegisterStartupScript(cstype, "AlertScript", script.ToString(), true);
        }

        public static string GetUrl()
        {
            string url = System.Web.HttpContext.Current.Request.Url.GetLeftPart(UriPartial.Authority);
            url += System.Web.HttpContext.Current.Request.ApplicationPath;
            return url;
        }

        public static string Capitalize(string value)
        {
            // Creates a TextInfo based on the "en-US" culture.
            TextInfo myTI = new CultureInfo("en-US", false).TextInfo;
            value = myTI.ToLower(value);
            return myTI.ToTitleCase(value);
        }
    }
}