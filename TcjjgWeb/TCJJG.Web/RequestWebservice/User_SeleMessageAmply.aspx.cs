using System;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using Static.Common.Operation;
using TCJJG.Web.UserCenter;

public partial class RequestWebservice_User_SeleMessageAmply : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";
        Response.CacheControl = "no-cache";
        Request.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        //接收到的参数
        string misID = Request.QueryString.Get("MisID");
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        string returnXML = string.Empty;
        //
        if (null != user && CommonOperation.IsNumInt32(misID))
        {
            int intMisID = Convert.ToInt32(misID);
            returnXML = UserCenter.UserMessage().UserSeleMessageAmply(user.UserID, intMisID);
            user.MsgCount = UserCenter.UserMessage().GetUnReadMessageCount(user.UserID);

            Session["UserInfo"] = user;
        }
        if (string.IsNullOrEmpty(returnXML))
        {
            returnXML = "暂无数据";
        }
        Response.Write("<response><msg>" + returnXML + "</msg></response>");
        Response.End();
    }
}
