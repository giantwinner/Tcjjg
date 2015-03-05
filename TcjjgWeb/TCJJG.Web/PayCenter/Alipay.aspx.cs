using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Com.Alipay;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;

public partial class PayCenter_Alipay : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WebUserInfo user = Session["UserInfo"] as WebUserInfo;
            this.txtUserName_Bank.Text = user.UserName;
        }
    }
    private int AlipayAmount()
    {
        if (this.alipay_20.Checked)
        {
            return 20;
        }
        else if (this.alipay_50.Checked)
        {
            return 50;
        }
        else if (this.alipay_100.Checked)
        {
            return 100;
        }
        else if (this.alipay_300.Checked)
        {
            return 300;
        }
        else if (this.alipay_500.Checked)
        {
            return 500;
        }
        else
        {
            return 1;
        }
    }
    protected void btnPay_Click(object sender, ImageClickEventArgs e)
    {
        ////////////////////////////////////////////请求参数////////////////////////////////////////////

        //支付类型
        string payment_type = "1";
        //必填，不能修改
        //服务器异步通知页面路径
        string notify_url = WebCommon.GetFFJJGWebXML("ffjjgweb/", "AlipayConfig/notify_url");
        //需http://格式的完整路径，不能加?id=123这类自定义参数

        //页面跳转同步通知页面路径
        string return_url = WebCommon.GetFFJJGWebXML("ffjjgweb/", "AlipayConfig/return_url");
        //需http://格式的完整路径，不能加?id=123这类自定义参数，不能写成http://localhost/

        //卖家支付宝帐户
        string seller_email = WebCommon.GetFFJJGWebXML("ffjjgweb/", "AlipayConfig/seller_email");
        //必填

        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        PaySvcClient paySvc = new PaySvcClient();
        int status = 0;
        Guid userID = Guid.Empty;
        int appid = 0;
        string userName = string.Empty;
        int amount = 0;
        string memo = string.Empty;
        int? orderID = 0;
        try
        {
            status = 0;
            userID = user.UserID;
            appid = user.AppID;
            userName = user.UserName;
            amount = AlipayAmount();
            memo = userName + "：支付宝充值" + amount + ";";
            orderID = 0;
            paySvc.AddAlipayLog(status, userID, appid, userName, amount, memo, ref orderID);
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write("充值", "支付宝-创建订单。" + "充值用户：" + userName + ".充值数量：" + amount + ";异常信息：" + ex.Message, true);
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "payts", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('充值失败，请速与管理员联系');</script>", false);
            return;
        }

        //商户订单号
        string out_trade_no = Convert.ToString(orderID);
        //商户网站订单系统中唯一订单号，必填

        //订单名称
        string subject = "同城充值";
        //必填

        //付款金额
        string total_fee = Convert.ToString(amount);
        //必填

        ////////////////////////////////////////////////////////////////////////////////////////////////

        //把请求参数打包成数组
        SortedDictionary<string, string> sParaTemp = new SortedDictionary<string, string>();
        sParaTemp.Add("partner", Config.Partner);
        sParaTemp.Add("_input_charset", Config.Input_charset.ToLower());
        sParaTemp.Add("service", "create_direct_pay_by_user");
        sParaTemp.Add("payment_type", payment_type);
        sParaTemp.Add("notify_url", notify_url);
        sParaTemp.Add("return_url", return_url);
        sParaTemp.Add("seller_email", seller_email);
        sParaTemp.Add("out_trade_no", out_trade_no);
        sParaTemp.Add("subject", subject);
        sParaTemp.Add("total_fee", total_fee);

        //建立请求
        string sHtmlText = Submit.BuildRequest(sParaTemp, "get", "确认");
        Response.Write(sHtmlText);
    }
}