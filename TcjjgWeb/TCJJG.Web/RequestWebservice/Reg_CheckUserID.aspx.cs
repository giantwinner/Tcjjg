using System;
using System.Collections.Specialized;
using System.Text;

using TCJJG.Web.UserCenter;
using Static.Common.Operation;

public partial class Reg_CheckUserID : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";
        Response.CacheControl = "no-cache";
        Byte[] bytes = Request.BinaryRead(Request.ContentLength);
        NameValueCollection req = CommonOperation.FillFromEncodedBytes(bytes, Encoding.UTF8);
        //等于0帐号正常，等于1帐号重复，等于-1有系统屏蔽字 等于-2正则失败
        int message = 0;
        string userName = req.Get("i");
        int appid = 0;
        //
        if (!PublicValidateUser.UserNameRegValidate(userName))
        {
            //参数正则验证
            message = -2;
        }
        else
        {
            userName = userName.ToLower();
            //词语过滤//与config进行比对
            if (!PublicValidateUser.FiltrateWordsValidate(userName))
            {
                message = -1;
            }
            else if (UserCenter.UserInfo().F_ChickUserID(appid, userName))
            {  //请求wcf 存在返回 true 不存在返回 false
                message = 1;
            }
        }
        string strxml = "<response><mi>" + message + "</mi></response>";
        Response.Write(strxml);
        Response.End();
    }
}
