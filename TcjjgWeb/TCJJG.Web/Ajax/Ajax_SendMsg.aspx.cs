using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;
using System.Net;
using System.IO;
using System.Text;

public partial class Ajax_Ajax_SendMsg : System.Web.UI.Page
{
    private static string ReqURL_SendSms = WebCommon.GetFFJJGWebXML("ffjjgweb/", "SendSMS/ReqURL_SendSms");
    private static string un = WebCommon.GetFFJJGWebXML("ffjjgweb/", "SendSMS/un");
    private static string pwd = WebCommon.GetFFJJGWebXML("ffjjgweb/", "SendSMS/pwd");

    protected void Page_Load(object sender, EventArgs e)
    {
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        if ( null==user)
        {
            return;
        }

        string mobile = Convert.ToString(Request.QueryString["m"]);
        string code = Convert.ToString(Request.QueryString["n"]);
        if (!string.IsNullOrEmpty(code))
        {
            Session["MCode"] = code;
        }

        string retValue = string.Empty;

        bool checkCount = WSClient.CMOPWebWS().CheckBindPhoneSendCount(user.UserID);

        if (checkCount)
        {
            string msg = "您在同城竞技馆个人中心申请手机验证的验证码是：" + code + "，请输入后进行验证，谢谢。[同城竞技馆]";
            string errorMsg = string.Empty;
            HttpWebResponse hwr = SMS.SendSMS(ReqURL_SendSms, un, pwd, mobile, msg, ref errorMsg);
            if (null != hwr)
            {
                StreamReader sr = new StreamReader(hwr.GetResponseStream(), Encoding.UTF8);
                retValue = sr.ReadToEnd();// result=1&
                sr.Close();
                //
                retValue = retValue.Replace("result=", "").Replace("&", "");
                retValue = SubmitState(Convert.ToInt32(retValue));
            }
        }
        else
        {
            retValue = "-100 = 今天获取验证码已经到3次";
        }
        Response.Write(retValue);
    }
    public static string SubmitState(int state)
    {
        string rv = string.Empty;
        if (state > 0)
        {
            rv = "1 = 短信验证码已发送...";
        }
        else if (state == -2)
        {
            rv = "-2 = 手机号错误...";
        }
        else
        {
            rv = "-1 = 短信接口异常请联系管理员..." + state;
        }
        return rv;
    }
}