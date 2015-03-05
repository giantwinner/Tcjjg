using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Static.Common.Operation;
using TCJJG.Web.Model;

public partial class PayCenter_InPayRequest : System.Web.UI.Page
{

    public string sp;      //商户代码
    public string sppwd;   //加密串
    public string od;      //订单号
    public string mz;      //金额
    public string spzdy;   //自定义数据
    public string md5;     //md5
    public string spreq;   //商户网站请求地址
    public string spsuc;   //商户端显示成功充值地址
    public string userName; 
    public Guid userID;
    public string servadd;

    private string payUrl = System.Configuration.ConfigurationManager.AppSettings["payUrl"].ToString();
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            int yeepID = YeepayLog();
            sp = "30054";
            sppwd = "kpwshundopdrekiugu";
            spreq = payUrl + "PayCenter/PayCenter.aspx";   // '失败链接
            spsuc = payUrl + "PayCenter/payresult.html?r1=1";    // '成功链接
            mz = Request.QueryString["Amount"];   // '接参数面值元            
            userName = Request.QueryString["UserName"];
            od = yeepID.ToString();
            string ip = CommonOperation.GetIP4Address();
            spzdy = ip.Replace(".", "n");
            string md5Str = sp + od + sppwd + mz + spreq + spsuc;
            md5 = MD5(md5Str, 32);//  '先MD532 然后转大写
            servadd = "http://ydzf.vnetone.com/Default_mo.aspx";  //服务器活动
        }
        catch { 
        }
    }

    //md5加密
    public string MD5(string str, int code)
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
        int amount = Convert.ToInt32(Request.QueryString["Amount"]);
        string remark = "手机短信充值:InPay";
        string ip = CommonOperation.GetIP4Address();
        PaySvcClient paySvc = new PaySvcClient();
        int opeInfo = paySvc.YPayInit(userName, userName, 1, amount, "InPay", 1, ip, remark);
        if (opeInfo <= 0)
        {
            PublicClass.WriteErrLog("充值中心-声讯电话充值-提交充值前。" + "充值用户：" + userName +
           ".充值数量：" + amount + ".充值标记：" + "VPay" + ".创建IP：" + ip + ".错误标记：" + opeInfo);
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "payts", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('充值失败，请速与管理员联系');</script>", false);
        }
        else
        {

        }
        return opeInfo;
    }
}