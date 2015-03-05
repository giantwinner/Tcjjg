using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using TCJJG.Web.Model;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Biz;

public partial class PayCenter_PayCenter : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string IsAllowRedirect = null;
        try
        {
            IsAllowRedirect = WebCommon.GetFFJJGWebXML("ffjjgweb/PayUrlSettings/", "IsAllowRedirect");
        }
        catch (Exception e1)
        {
            PublicClass.WriteErrLog("异常1：" + e1.Message);
        }
        if (IsAllowRedirect == "1")
        {
            PayUrlRedirect();
        }
    }

    private void PayUrlRedirect()
    {
        UserAreaInfo userAreaInfo = Session["UserAreaInfo"] as UserAreaInfo;
        int? partnerID = userAreaInfo.PartnerID;
        try
        {
            XmlDocument doc = new XmlDocument();
            doc.Load(Server.MapPath("../ffjjgweb.config"));
            XmlNodeList nodes = doc.SelectSingleNode("ffjjgweb/PayUrlSettings").ChildNodes;

            foreach (XmlNode node in nodes)
            {
                XmlElement xle = node as XmlElement;
                if (xle != null && xle.Name != "IsAllowRedirect")
                {
                    if (partnerID.Value == Convert.ToInt32(xle.GetAttribute("key")))
                    {
                        Response.Redirect(xle.GetAttribute("value"), true);
                    }
                }
            }
        }
        catch (Exception e1)
        {
            PublicClass.WriteErrLog("异常2：" + e1.Message);
        }
    }
}