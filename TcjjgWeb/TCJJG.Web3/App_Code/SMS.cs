using System.Web;
using System.Net;
using System.Text;

//zhangsw 2013年6月1日 15:05:28

/// <summary>
/// SMS 的摘要说明
/// 调用接口发送短信
/// </summary>
public class SMS
{
    public static HttpWebResponse SendSMS(string ReqURL_SendSms, string un, string pwd, string mobile, string msg, ref string errorMsg)
    {
        if (msg.Length < 1 || msg.Length > 64)
        {
            errorMsg = "短信长度在1-64个字符之间。";
            return null;
        }
        msg = HttpUtility.UrlEncode(msg, Encoding.GetEncoding("gb2312"));
        //
        string url = ReqURL_SendSms + "?un=" + un + "&pwd=" + pwd + "&mobile=" + mobile + "&msg=" + msg;
        HttpWebResponse response = HttpWebResponseUtility.CreateGetHttpResponse(url, null, null, null);
        return response;
    }
}
