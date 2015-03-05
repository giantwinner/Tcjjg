using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.DB;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using Static.Common.Operation;

public partial class PayCenter_VpayRequest : BasePage
{
    public string spid;
    public string sppwd;
    public string spreq;
    public string sprec;
    public string spcustom;
    public string spversion;
    public string money;
    public string userid;
    public string orderId;
    public string post_key;
    public string md5password;
    public string IpAddress;
    public string urlcode;
    public string spname;
    public string servadd;
    public string userName;
    public Guid userID;

    private string payUrl = System.Configuration.ConfigurationManager.AppSettings["payUrl"].ToString();

    protected void Page_Load(object sender, EventArgs e)
    {
       
        int yeepID = YeepayLog();
        spid = "11525";
        sppwd = "290891530071936242";
        spreq = payUrl + "PayCenter/PhoneRecharge.aspx";   // '换成商户请求地址
        sprec = payUrl + "PayCenter/VpayReceive.aspx";   // '换成商户接收地址
        spname = Server.UrlEncode("中游竞技文化股份有限公司");  //需要 Server.UrlEncode编码
        string ip = CommonOperation.GetIP4Address();
        spcustom = ip.Replace(".","n");     //  需要 Server.UrlEncode编码  '客户自定义 30字符内 只能是数字、字母或数字字母的组合。不能用汉字。
        spversion = "vpay1001"; //  '此接口的版本号码 此版本是"vpay1001"
        money = Request.Form["money"];   // '接参数面值元            
        userid = Server.UrlEncode(userName);  // '接参数用户ID 需要 Server.UrlEncode编码
        urlcode = "utf-8";//'编码  gbk  gb2312   utf-8  unicode   big5(注意不能一个繁体和简体字交叉写)  你程序的编码
        orderId = yeepID.ToString();
        // '客户订单 请妥善管理客户的订单  长度：30字符以内（只能是数字、字母或数字字母的组合。不能用汉字订单）
        post_key = orderId + spreq + sprec + spid + sppwd + spversion + money;
        // '网站订单号码+ 请求地址+ 接收地址 + 5位spid+ 18位SP密码+支付的版本号+面值
        //'LCase函数是将字符转换为小写; Ucase函数是将字符转换为大写
        //'全国声讯支付联盟全国声讯电话支付接口对MD5值只认大写字符串，所以小写的MD5值得转换为大写
        md5password = md5(post_key, 32);//  '先MD532 然后转大写
        //IpAddress = (HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != null
        //  && HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"] != String.Empty)
        //  ? HttpContext.Current.Request.ServerVariables["HTTP_X_FORWARDED_FOR"]
        //  : HttpContext.Current.Request.ServerVariables["REMOTE_ADDR"];
        IpAddress = CommonOperation.GetIP4Address();
        servadd = "http://s2.vnetone.com/Default.aspx";  //服务器活动
    }
    
    //md5加密
    public string md5(string str, int code)
    {
        if (code == 16) //16位MD5加密（取32位加密的9~25字符） 
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToUpper().Substring(8, 16);
        }
        else//32位加密 
        {
            return System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToUpper();
        }
    }

    //添加日志并获取日志id
    private int YeepayLog()
    {
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        userID = user.UserID;
        userName = user.UserName;
        int amount = Convert.ToInt32(Request.Form["money"]);
        string remark = "声讯电话充值:VPay";
        IpAddress = CommonOperation.GetIP4Address();
        PaySvcClient paySvc = new PaySvcClient();
        int opeInfo = paySvc.YPayInit(userName, userName, 1, amount, "VPay", 1, IpAddress, remark);
        if(opeInfo<=0)
        {
            FFJJG.Server.Utils.Logging.write("充值","充值中心-声讯电话充值-提交充值前。" + "充值用户：" + userName +
           ".充值数量：" + amount + ".充值标记：" + "VPay" + ".创建IP：" + IpAddress + ".错误标记：" + opeInfo,true);
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "payts", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('充值失败，请速与管理员联系');</script>", false);
        }
        else
        {
           
        }
        return opeInfo;
    }
}