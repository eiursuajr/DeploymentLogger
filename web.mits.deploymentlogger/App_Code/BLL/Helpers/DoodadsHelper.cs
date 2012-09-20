using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

using MyGeneration.dOOdads;
using System.Reflection;

namespace DL_WEB.BLL.Helpers
{
    /// <summary>
    /// Summary description for DoodadsHelper
    /// </summary>
    public class DoodadsHelper
    {
        public DoodadsHelper()
        {
        }

        public static BusinessEntity CopyData(BusinessEntity oSource, BusinessEntity oDestination)
        {
            MemberInfo[] oInfo = oSource.GetType().GetMember("PropertyNames", MemberTypes.NestedType, BindingFlags.Default | BindingFlags.NonPublic | BindingFlags.Public);
            Type oPropertyNamesContainerClass = null;
            Type oSourceType = oSource.GetType();

            do
            {
                oPropertyNamesContainerClass = oSourceType.GetNestedType("PropertyNames");
                if (null != oPropertyNamesContainerClass)
                { 
                    break;
                }
                oSourceType = oSourceType.BaseType;
            } while(null != oSourceType);

            if (null != oPropertyNamesContainerClass)
            {
                FieldInfo[] oFieldInfos = oPropertyNamesContainerClass.GetFields(BindingFlags.Static | BindingFlags.Public);

                foreach(FieldInfo oFieldInfo in oFieldInfos)
                {
                    try
                    {
                        object oFieldValue = oFieldValue = Micajah.Common.Helper.Reflection.getPublicProperty(oSource, oFieldInfo.Name);
                        Micajah.Common.Helper.Reflection.setPublicProperty(oDestination, oFieldInfo.Name, oFieldValue, false);
                    }
                    catch (Exception)
                    {
                        continue;
                    }
                }
            }

            return oDestination;
        }
    }
}