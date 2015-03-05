using System;
using System.Web.UI;
using com.yeepay.bank;
using TCJJG.Web.DB;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using Static.Common.Operation;

public partial class PayCenter_Yeepay : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WebUserInfo user = Session["UserInfo"] as WebUserInfo;
            this.txtUserName_Bank.Text = user.UserName;
            this.txtUserName_SZX.Text = user.UserName;
            this.txtUserName_LT.Text = user.UserName;
            this.txtUserName_JW.Text = user.UserName;
            this.txtUserName_SD.Text = user.UserName;
            this.txtUserName_ZT.Text = user.UserName;
            SelectPayType();
        }
    }

    /// <summary>
    /// 选择充值方式
    /// </summary>
    private void SelectPayType()
    {
        if (null != Request.Params["py"] && Request.Params["py"].ToString() == "SZX-NET")
        {
            this.pl_y_szx.Visible = true;
        }
        else if (null != Request.Params["py"] && Request.Params["py"].ToString() == "UNICOM-NET")
        {
            this.pl_y_lt.Visible = true;
        }
        else if (null != Request.Params["py"] && Request.Params["py"].ToString() == "JUNNET-NET")
        {
            this.pl_y_jw.Visible = true;
        }
        else if (null != Request.Params["py"] && Request.Params["py"].ToString() == "SNDACARD-NET")
        {
            this.pl_y_sd.Visible = true;
        }
        else if (null != Request.Params["py"] && Request.Params["py"].ToString() == "ZHENGTU-NET")
        {
            this.pl_y_zt.Visible = true;
        }
        else
        {
            this.pl_y_bank.Visible = true;
        }
    }

    /// <summary>
    /// 网银，选择充值银行
    /// </summary>
    /// <returns></returns>
    private string BankSelect()
    {
        string strReturn = string.Empty;

        if (this.rb_y_bank_yhGSYH.Checked) strReturn = "ICBC-NET";     //工商银行
        if (this.rb_y_bank_yhNYYH.Checked) strReturn = "ABC-NET";      //农业银行
        if (this.rb_y_bank_yhJTYH.Checked) strReturn = "BOCO-NET";     //交通银行
        if (this.rb_y_bank_yhZSYH.Checked) strReturn = "CMBCHINA-NET"; //招商银行
        if (this.rb_y_bank_yhMSYH.Checked) strReturn = "CMBC-NET";     //民生银行
        if (this.rb_y_bank_yhXYYH.Checked) strReturn = "CIB-NET";     //兴业银行
        if (this.rb_y_bank_yhJSYH.Checked) strReturn = "CCB-NET";     //建设银行
        //if (this.RadioButton12.Checked) strReturn = "ICBC-WAP";    //建设银行WAP
        if (this.rb_y_bank_yhZXYH.Checked) strReturn = "ECITIC-NET";  //中信银行
        if (this.rb_y_bank_yhGDYH.Checked) strReturn = "CEB-NET";     //光大银行
        if (this.rb_y_bank_yhBJYH.Checked) strReturn = "BCCB-NET";    //北京银行
        if (this.rb_y_bank_yhPFYH.Checked) strReturn = "SPDB-NET";    //浦发银行
        if (this.rb_y_bank_yhSZFZ.Checked) strReturn = "SDB-NET";     //深圳发展
        //if (this.RadioButton18.Checked) strReturn = "POST-NET";    //中国邮政
        if (this.rb_y_bank_yhNJYH.Checked) strReturn = "NJCB-NET";    //南京银行         
        if (this.rb_y_bank_yhZGYH.Checked) strReturn = "BOC-NET";    //中国银行
        if (this.rb_y_bank_yhGZSNXS.Checked) strReturn = "GNXS-NET";    //广州市农信社
        if (this.rb_y_bank_yhGZSSYYH.Checked) strReturn = "GZCB-NET";    //广州市商业银行 
        if (this.rb_y_bank_yhSDNXS.Checked) strReturn = "SDE-NET";    //顺德农信社
        if (this.rb_y_bank_yhSHNCSYYH.Checked) strReturn = "SHRCB-NET";    //上海农村商业银行
        if (this.rb_y_bank_yhGFYH.Checked) strReturn = "GDB-NET";    //广东发展银行 

        return strReturn;
    }

    /// <summary>
    /// 网银，选择充值金额
    /// </summary>
    /// <returns></returns>
    private int BankPayAmount()
    {
        if (this.rb_y_bank_je20.Checked)
        {
            return 20;
        }
        else if (this.rb_y_bank_je50.Checked)
        {
            return 50;
        }
        else if(this.rb_y_bank_je100.Checked)
        {
            return 100;
        }
        else if (this.rb_y_bank_je300.Checked)
        {
            return 300;
        }
        else if (this.rb_y_bank_je500.Checked)
        {
            return 500;
        }
        else
        {
            return 50;
        }
    }

    /// <summary>
    /// 神州行，选择充值金额
    /// </summary>
    /// <returns></returns>
    private int SZXPayAmount()
    {
        if (this.rb_y_szx_je30.Checked)
        {
            return 30;
        }
        else if (this.rb_y_szx_je50.Checked)
        {
            return 50;
        }
        else if (this.rb_y_szx_je100.Checked)
        {
            return 100;
        }
        else
        {
            return -1;
        }
    }

    /// <summary>
    /// 联通，选择充值金额
    /// </summary>
    /// <returns></returns>
    private int LTPayAmount()
    {
        if (this.rb_y_lt_je30.Checked)
        {
            return 30;
        }
        else if (this.rb_y_lt_je50.Checked)
        {
            return 50;
        }
        else if (this.rb_y_lt_je100.Checked)
        {
            return 100;
        }
        else
        {
            return -1;
        }
    }

    /// <summary>
    /// 骏网，选择充值金额
    /// </summary>
    /// <returns></returns>
    private int JWPayAmount()
    {
        if (this.rb_y_jw_je10.Checked)
        {
            return 10;
        }
        else if (this.rb_y_jw_je15.Checked)
        {
            return 15;
        }
        else if (this.rb_y_jw_je30.Checked)
        {
            return 30;
        }
        else if (this.rb_y_jw_je50.Checked)
        {
            return 50;
        }
        else if (this.rb_y_jw_je100.Checked)
        {
            return 100;
        }
        else
        {
            return -1;
        }
    }

    /// <summary>
    /// 盛大，选择充值金额
    /// </summary>
    /// <returns></returns>
    private int SDPayAmount()
    {
        if (this.rb_y_sd_je10.Checked)
        {
            return 10;
        }
        else if (this.rb_y_sd_je15.Checked)
        {
            return 15;
        }
        else if (this.rb_y_sd_je25.Checked)
        {
            return 25;
        }
        else if (this.rb_y_sd_je30.Checked)
        {
            return 30;
        }
        else if (this.rb_y_sd_je35.Checked)
        {
            return 35;
        }
        else if (this.rb_y_sd_je50.Checked)
        {
            return 50;
        }
        else if (this.rb_y_sd_je100.Checked)
        {
            return 100;
        }
        else if (this.rb_y_sd_je300.Checked)
        {
            return 300;
        }
        else
        {
            return -1;
        }
    }

    /// <summary>
    /// 征途，选择充值金额
    /// </summary>
    /// <returns></returns>
    private int ZTPayAmount()
    {
        if (this.rb_y_zt_je10.Checked)
        {
            return 10;
        }
        else if (this.rb_y_zt_je15.Checked)
        {
            return 15;
        }
        else if (this.rb_y_zt_je25.Checked)
        {
            return 25;
        }
        else if (this.rb_y_zt_je30.Checked)
        {
            return 30;
        }
        else if (this.rb_y_zt_je50.Checked)
        {
            return 50;
        }
        else if (this.rb_y_zt_je100.Checked)
        {
            return 100;
        }
        else
        {
            return -1;
        }
    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        this.btnBank.Enabled = false;

        #region

        int amount = 0;
        string YFlag = string.Empty;
        //
        if (null != Request.Params["py"] && Request.Params["py"].ToString() == "SZX-NET")
        {
            amount = SZXPayAmount();
            YFlag = "SZX-NET";
        }
        else if (null != Request.Params["py"] && Request.Params["py"].ToString() == "UNICOM-NET")
        {
            amount = LTPayAmount();
            YFlag = "UNICOM-NET";
        }
        else if (null != Request.Params["py"] && Request.Params["py"].ToString() == "JUNNET-NET")
        {
            amount = JWPayAmount();
            YFlag = "JUNNET-NET";
        }
        else if (null != Request.Params["py"] && Request.Params["py"].ToString() == "SNDACARD-NET")
        {
            amount = SDPayAmount();
            YFlag = "SNDACARD-NET";
        }
        else if (null != Request.Params["py"] && Request.Params["py"].ToString() == "ZHENGTU-NET")
        {
            amount = ZTPayAmount();
            YFlag = "ZHENGTU-NET";
        }
        else
        {
            amount = BankPayAmount();
            YFlag = BankSelect();
        }
        if (amount==-1)
        {
            return;
        }
        //
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        int typeID = 1;//充值类型
        int status = 1;//充值状态
        string createIP = CommonOperation.GetIP4Address();
        string remark = "易宝充值:" + YFlag;
        //
        PaySvcClient paySvc = new PaySvcClient();
        int opeCreateYeepayLog = paySvc.YPayInit(user.UserName, user.UserName, typeID, amount, YFlag, status, createIP, remark);
        if (opeCreateYeepayLog <= 0)
        {
            FFJJG.Server.Utils.Logging.write("充值","充值中心-易宝充值-提交易宝前。" + "充值用户：" + user.UserName +
            ".充值数量：" + amount + ".银行标记：" + YFlag + ".创建IP：" + createIP + ".错误标记：" + opeCreateYeepayLog,true);
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "payts", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('充值失败，请速与管理员联系');</script>", false);
            return;
        }
        //
        string htmlCodeGet = InitYeepay(opeCreateYeepayLog.ToString(), amount.ToString(), YFlag);
        //
        ScriptManager.RegisterClientScriptBlock(Page, GetType(), "a", "window.parent.location='" + htmlCodeGet + "'", true);

        #endregion
    }

    private static string p1_MerId;
    private static string keyValue;
    private string p2_Order;
    private string p3_Amt;
    private string p4_Cur;
    private string p5_Pid;
    private string p6_Pcat;

    private string p7_Pdesc;
    private string p8_Url;
    private string p9_SAF;
    private string pa_MP;
    private string pd_FrpId;
    private string pr_NeedResponse;

    public string htmlCodeGet;
    public string htmlCodePost;

    protected string InitYeepay(string opeCreateYeepayLog, string amount, string bankFlag)
    {
        //设置 log 文件地址
        Buy.LogFileName = WebCommon.GetYeePayPayInfo("Y_LogFileName");

        // 设置 Response编码格式为GB2312
        Response.ContentEncoding = System.Text.Encoding.GetEncoding("gb2312");

        // 商家ID
        p1_MerId = WebCommon.GetYeePayPayInfo("Y_MerId");

        // 商家密钥
        keyValue = WebCommon.GetYeePayPayInfo("Y_KeyValue");

        // 设置请求地址
        Buy.NodeAuthorizationURL = WebCommon.GetYeePayPayInfo("Y_NodeAuthorizationURL");

        // 商家设置用户购买商品的支付信息.
        //易宝支付平台统一使用GBK/GB2312编码方式,参数如用到中文，请注意转码

        // 商户订单号,选填.
        //若不为""，提交的订单号必须在自身账户交易中唯一;为""时，易宝支付会自动生成随机的商户订单号.
        p2_Order = opeCreateYeepayLog;

        // 支付金额,必填.
        //单位:元，精确到分.   
        p3_Amt = amount;
        //交易币种,固定值"CNY".
        p4_Cur = "CNY";

        //商品名称
        //用于支付时显示在易宝支付网关左侧的订单产品信息.

        byte[] p5_b = CommonOperation.stringToGB2312("元宝");
        for (int i = 0; i < p5_b.Length; i++)
        {
            p5_Pid += p5_b[i];
        }

        //商品种类
        byte[] p6_b = CommonOperation.stringToGB2312("元宝");
        for (int i = 0; i < p6_b.Length; i++)
        {
            p6_Pcat += p6_b[i];
        }

        //商品描述
        p7_Pdesc = string.Empty;

        //商户接收支付成功数据的地址,支付成功后易宝支付会向该地址发送两次成功通知.
        p8_Url = WebCommon.GetYeePayPayInfo("Y_CallBack");

        //送货地址
        //为“1”: 需要用户将送货地址留在易宝支付系统;为“0”: 不需要，默认为 ”0”.
        p9_SAF = "0";

        //商户扩展信息
        //商户可以任意填写1K 的字符串,支付成功时将原样返回.	
        pa_MP = string.Empty;

        //银行编码
        //默认为""，到易宝支付网关.若不需显示易宝支付的页面，直接跳转到各银行、神州行支付、骏网一卡通等支付页面，该字段可依照附录:银行列表设置参数值.
        pd_FrpId = bankFlag;

        //应答机制
        //为"1": 需要应答机制;为"0": 不需要应答机制.
        pr_NeedResponse = "1";

        //创建一个Form

        //创建GET方式的url
        htmlCodeGet = Buy.CreateBuyUrl(p1_MerId, keyValue, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse);
        //htmlCodePost = Buy.CreateBuyForm(p1_MerId, keyValue, p2_Order, p3_Amt, p4_Cur, p5_Pid, p6_Pcat, p7_Pdesc, p8_Url, p9_SAF, pa_MP, pd_FrpId, pr_NeedResponse, "frmYeepay");
        return htmlCodeGet;
    }
}
//pd_FrpId参数值 对应支付通道名称
//1000000-NET 易宝会员支付   
////////////////////////////////////////////////////
//ICBC-NET 工商银行  
//CMBCHINA-NET 招商银行  
//ABC-NET 农业银行  
//CCB-NET 建设银行  
//ICBC-WAP 建设银行WAP  
//BCCB-NET 北京银行  
//BOCO-NET 交通银行  
//CIB-NET 兴业银行  
//NJCB-NET 南京银行  
//CMBC-NET 民生银行  
//CEB-NET 光大银行  
//ECITIC-NET 中信银行
//SDB-NET 深发展
//SPDB-NET 浦发银行  
//POST-NET 中国邮政   
///////////////////////////////////////////////////
//ICBC-NET 工商银行 
//ABC-NET 农业银行
//BOCO-NET 交通银行 
//CMBCHINA-NET 招商银行  

//CMBC-NET 民生银行 
//CIB-NET 兴业银行 
//CCB-NET 建设银行 
//ICBC-WAP 建设银行WAP 

//ECITIC-NET 中信银行
//CEB-NET 光大银行
//BCCB-NET 北京银行  
//SPDB-NET 浦发银行 

//SDB-NET 深圳发展
//POST-NET 中国邮政 
//NJCB-NET 南京银行 

////////////////////////////////////////////////////
//JUNNET-NET 骏网一卡通   
//SNDACARD-NET 盛大卡   
//SZX-NET 神州行标准版网关   
//ZHENGTU-NET 征途卡   
//QQCARD Q币支付   
//UNICOM-NET 联通卡支付   
//YPCARD 易宝一卡通   
//BOC-NET 中国银行  
//GNXS-NET 广州市农信社  
//GZCB-NET 广州市商业银行  
//SDE-NET 顺德农信社  
//SHRCB-NET 上海农村商业银行  
//GDB-NET 广东发展银行 