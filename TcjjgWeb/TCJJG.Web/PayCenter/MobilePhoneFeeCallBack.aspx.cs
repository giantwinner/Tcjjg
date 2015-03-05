using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using System.Net;
using System.IO;
using System.Xml;
using System.Text;
using TCJJG.Web.UserCenter;

public partial class PayCenter_MobilePhoneFeeCallBack : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        CallBackLoad();
    }
    //
    private static string CompanyID = WebCommon.GetFFJJGWebXML("ffjjgweb/", "MobilePhoneFee/CompanyID");
    private static string InterfacePwd = WebCommon.GetFFJJGWebXML("ffjjgweb/", "MobilePhoneFee/InterfacePwd");
    //
    private static string OrderSource = WebCommon.GetFFJJGWebXML("ffjjgweb/", "MobilePhoneFee/OrderSource");
    private static string ReqestKey = WebCommon.GetFFJJGWebXML("ffjjgweb/", "MobilePhoneFee/ReqestKey");
    private static string AccessKey = WebCommon.GetFFJJGWebXML("ffjjgweb/", "MobilePhoneFee/AccessKey");
    //
    private static string ReqURL_submit = WebCommon.GetFFJJGWebXML("ffjjgweb/", "MobilePhoneFee/ReqURL_submit");
    private static string ResURL_callBack = WebCommon.GetFFJJGWebXML("ffjjgweb/", "MobilePhoneFee/ResURL_callBack");
    //
    private static string ReqURL_SendSms = WebCommon.GetFFJJGWebXML("ffjjgweb/", "SendSMS/ReqURL_SendSms");
    private static string un = WebCommon.GetFFJJGWebXML("ffjjgweb/", "SendSMS/un");
    private static string pwd = WebCommon.GetFFJJGWebXML("ffjjgweb/", "SendSMS/pwd");
    private static string msgStatic = WebCommon.GetFFJJGWebXML("ffjjgweb/", "SendSMS/msg");
    //
    private void CallBackLoad()
    {
        //验证参数
        if (Request.QueryString["CompanyID"] != CompanyID)
        {
            Response.Write("<result>参数错误</result>");
            return;
        }
        int amountYuan = 0;
        //
        string orderID = Request.QueryString["OrderID"];
        string amountFen = Request.QueryString["Amount"];
        string mobile = Request.QueryString["Mobile"];
        string result = Request.QueryString["Result"];
        string key1 = Request.QueryString["Key"];
        //验证密钥
        string key = CompanyID + mobile + amountFen + orderID + result + AccessKey;
        key = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(key, "MD5").ToLower();
        if (key != key1)
        {
            Response.Write("<result>密钥错误</result>");
            return;
        }
        //根据订单id，查询订单详细
        if (string.IsNullOrEmpty(orderID) ||
            string.IsNullOrEmpty(amountFen) ||
            string.IsNullOrEmpty(mobile) ||
            string.IsNullOrEmpty(result) ||
            string.IsNullOrEmpty(key1))
        {
            Response.Write("<result>订单错误</result>");
            return;
        }
        //确定充值订单，更新订单状态
        PaySvcClient paySvc = new PaySvcClient();
        string memo = "收到移动运营商回调，状态：" + result + "。";
        Guid? userID = Guid.Empty;
        //
        XmlDocument xd = new XmlDocument();
        string path = System.Web.HttpContext.Current.Server.MapPath("~/") + "ffjjgweb.config";
        xd.Load(path);
        XmlNodeList xnl = xd.SelectNodes("ffjjgweb/MobilePhoneFee/Amounts");
        for (int i = 0; i < xnl[0].ChildNodes.Count; i++)
        {
            if (xnl[0].ChildNodes[i].Attributes[2].Value == amountFen.ToString())
            {
                amountYuan = Convert.ToInt32(xnl[0].ChildNodes[i].Attributes[1].Value);
                break;
            }
        }
        //
        int state = 1;
        if (result != "0")
        {
            state = -1;
        }
        //
        int ope = paySvc.MobilePhoneFeeLogUpdateState(Convert.ToInt32(orderID), state, Convert.ToInt32(amountYuan), mobile, memo, ref  userID);
        //发送短信未执行过，并且，提交充值成功 
        if (result == "0" && ope == 1)
        {
            //发送短信
            string errorMsg = string.Empty;
            string msg = msgStatic;
            msg = msg.Replace("XXX", amountYuan.ToString());
            HttpWebResponse hwr = SMS.SendSMS(ReqURL_SendSms, un, pwd, mobile, msg, ref errorMsg);
            if (null != hwr)
            {
                StreamReader sr = new StreamReader(hwr.GetResponseStream(), Encoding.UTF8);
                string retValue = sr.ReadToEnd();// result=1&
                sr.Close();
                //
                retValue = retValue.Replace("result=", "").Replace("&", "");
                string memo1 = "电话卡直充成功，发送短信通知。短信运营商返回：" + SubmitState(retValue);
                paySvc.SMSLogCreate(System.Guid.Empty, 0, string.Empty, mobile, msg, orderID, memo1);
            }
            //发送系统短信
            if (userID != Guid.Empty)
            {
                Guid from = Guid.Empty;
                FFJJG.Common.UserCenter.MessageType messageType = FFJJG.Common.UserCenter.MessageType.mtSystem;
                string title = "手机充值卡充值成功";
                string msgStr = "您使用的" + amountYuan + "元手机充值卡已充值成功，祝您游戏愉快！";
                UserCenter.UserMessage().NewMessage(userID.Value, from, messageType, title, msgStr);
            }
        }
    }

    public static string SubmitState(string state)
    {
        string rv = string.Empty;
        switch (state)
        {
            case "1":
                rv = "1 = 发送成功";
                break;
            case "-1":
                rv = "-1 = 用户名和密码参数为空或者参数含有非法字符";
                break;
            case "-2":
                rv = "-2 = 手机号参数不正确";
                break;
            case "-3":
                rv = "-3 = msg参数为空或长度小于0个字符";
                break;
            case "-4":
                rv = "-4 = msg参数长度超过64个字符";
                break;
            case "-6":
                rv = "-6 = 发送号码为黑名单用户";
                break;
            case "-8":
                rv = "-8 = 下发内容中含有屏蔽词";
                break;
            case "-9":
                rv = "-9 = 下发账户不存在";
                break;
            case "-10":
                rv = "-10 = 下发账户已经停用";
                break;
            case "-11":
                rv = "-11 = 下发账户无余额";
                break;
            case "-15":
                rv = "-15 = MD5校验错误";
                break;
            case "-16":
                rv = "-16 = IP服务器鉴权错误";
                break;
            case "-17":
                rv = "-17 = 接口类型错误";
                break;
            case "-18":
                rv = "-18 = 服务类型错误";
                break;
            case "-22":
                rv = "-22 = 手机号达到当天发送限制";
                break;
            case "-23":
                rv = "-23 = 同一手机号，相同内容达到当天发送限制";
                break;
            case "-99":
                rv = "-99 = 系统异常";
                break;
            default:
                rv = "接口返回未知" + state;
                break;
        }
        return rv;
    }
}
