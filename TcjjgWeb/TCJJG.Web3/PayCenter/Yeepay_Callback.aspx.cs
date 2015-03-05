using System;
using com.yeepay.bank;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using TCJJG.Web.DB;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using System.Collections.Generic;
using Static.Common.Operation;

public partial class PayCenter_Yeepay_Callback : System.Web.UI.Page
{
    private static string p1_MerId;
    private static string keyValue;

    protected void Page_Load(object sender, EventArgs e)
    {
        //设置 log 文件地址
        Buy.LogFileName = WebCommon.GetYeePayPayInfo("Y_LogFileName");
        if (!IsPostBack)
        {
            #region

            // 商家ID
            p1_MerId = WebCommon.GetYeePayPayInfo("Y_MerId");
            // 商家密钥                     
            keyValue = WebCommon.GetYeePayPayInfo("Y_KeyValue");
            // 校验返回数据包
            BuyCallbackResult result = Buy.VerifyCallback(p1_MerId, keyValue, Buy.GetQueryString("r0_Cmd"), Buy.GetQueryString("r1_Code"), Buy.GetQueryString("r2_TrxId"),
                Buy.GetQueryString("r3_Amt"), Buy.GetQueryString("r4_Cur"), Buy.GetQueryString("r5_Pid"), Buy.GetQueryString("r6_Order"), Buy.GetQueryString("r7_Uid"),
                Buy.GetQueryString("r8_MP"), Buy.GetQueryString("r9_BType"), Buy.GetQueryString("rp_PayDate"), Buy.GetQueryString("hmac"));

            #endregion

            if (string.IsNullOrEmpty(result.ErrMsg))
            {
                if (result.R1_Code == "1")
                {
                    #region --复杂处理

                    //参与密钥校验
                    int R6_Order = 0;                        //商户订单号
                    int R3_Amt = 0;                          //支付金额
                    string R2_TrxId = result.R2_TrxId;       //易宝支付交易流水号
                    string R7_Uid = result.R7_Uid;           //易宝支付会员ID
                    //不参与密钥校验
                    string Rb_BankId = string.Empty;                   //银行编码
                    string Ro_BankOrderId = string.Empty;              //银行订单号
                    string Rq_CardNo = string.Empty;                   //神州行充值卡序列号
                    string Ru_Trxtime = string.Empty;                  //交易结果通知时间 
                    string Rp_PayDate = result.Rp_PayDate;             //支付成功时间

                    #region 不参与密钥校验的参数验证

                    if (null != Request.Params["rb_BankId"])
                    {
                        Rb_BankId = valiStr(Request.Params["rb_BankId"].ToString(), "rb_BankId", 16, result.R6_Order);
                    }
                    if (null != Request.Params["ro_BankOrderId"])
                    {
                        Ro_BankOrderId = valiStr(Request.Params["ro_BankOrderId"].ToString(), "ro_BankOrderId", 64, result.R6_Order);
                    }
                    if (null != Request.Params["rq_CardNo"])
                    {
                        Rq_CardNo = valiStr(Request.Params["rq_CardNo"].ToString(), "rq_CardNo", 64, result.R6_Order);
                    }
                    if (null != Request.Params["ru_Trxtime"])
                    {
                        Ru_Trxtime = valiStr(Request.Params["ru_Trxtime"].ToString(), "ru_Trxtime", 16, result.R6_Order);
                    }

                    #endregion

                    int rv = -1;
                    try
                    {
                        R6_Order = Convert.ToInt32(result.R6_Order);
                        if (result.R3_Amt.IndexOf(".") == -1)
                        {
                            R3_Amt = Convert.ToInt32(result.R3_Amt);
                        }
                        else
                        {
                            R3_Amt = Convert.ToInt32(result.R3_Amt.Substring(0, result.R3_Amt.IndexOf(".")));
                        }
                        // 1 浏览器回发 2 服务器点对点
                        rv = this.updateUserCenter(Convert.ToInt32(result.R9_BType), R6_Order, R3_Amt, R2_TrxId, R7_Uid, Rb_BankId, Ro_BankOrderId, Rp_PayDate, Rq_CardNo, Ru_Trxtime);
                    }
                    catch (Exception e3)
                    {
                        PublicClass.WriteErrLog("易宝回发充值信息#1.R6_Order：" + result.R6_Order + "。R3_Amt：" + result.R3_Amt + "。r2_TrxId" + R2_TrxId + ".异常代码:" + e3.Message);
                    }
                    finally
                    {
                        Response.Redirect("/paycenter/payresult.aspx?r1=" + rv + "&r2=" + R3_Amt, true);
                    }
                    #endregion
                }
                else
                {
                    PublicClass.WriteErrLog("易宝回发充值信息#2.密钥验证失败");
                    Response.Redirect("/paycenter/payresult.html?r1=-1&r2=0", true);
                }
            }
            else
            {
                Response.Write("");
            }
        }
    }

    /// <summary>
    /// 处理充值逻辑
    /// </summary>
    /// <param name="callbackID"></param>
    /// <param name="yeepayLog"></param>
    /// <param name="typeID"></param>
    /// <param name="y_Amount"></param>
    /// <param name="r2_TrxId"></param>
    /// <param name="UserID2"></param>
    /// <param name="payOrderID"></param>
    /// <param name="payGetMoney"></param>
    /// <returns></returns>
    private int updateUserCenter(int callbackID, int R6_Order, int R3_Amt, string R2_TrxId, string R7_Uid, string Rb_BankId, string Ro_BankOrderId,
        string Rp_PayDate, string Rq_CardNo, string Ru_Trxtime)
    {
        Guid? UserID2 = Guid.Empty;
        string UserName1 = "";
        int? P_Amount = 0;
        int? C_TypeID = 0;
        int? C_Amount = 0;
        //1.处理回发
        //int opeCreateOrder = yeepay.FWP_YeepayLog2(R6_Order, R3_Amt, R2_TrxId, R7_Uid, Rb_BankId, Ro_BankOrderId, Rp_PayDate, Rq_CardNo, Ru_Trxtime, callbackID, ref UserID2, ref P_Amount, ref C_TypeID, ref C_Amount);
        //
        PaySvcClient paySvc = new PaySvcClient();
        int opeCreateOrder = paySvc.YCallBack(R6_Order, R3_Amt, R2_TrxId, R7_Uid, Rb_BankId, Ro_BankOrderId, Rp_PayDate, Rq_CardNo, Ru_Trxtime, callbackID, ref UserName1, ref P_Amount, ref C_TypeID, ref C_Amount);
        if (opeCreateOrder == 2) // --订单已经处理过 
        {
            return 1;
        }
        if (opeCreateOrder != 1) //--error1.不存在的订单// --error2.易宝回复的金额与平台记录的金额不等// --error3.其他未知的状态
        {
            PublicClass.WriteErrLog("易宝回发充值信息#3.异常代码:opeCreateOrder：" + opeCreateOrder + "。callbackID：" + callbackID + "。R6_Order：" + R6_Order + "。R3_Amt：" + R3_Amt + "。R2_TrxId" + R2_TrxId);
            return -1;
        }
        //更新财富
        int gameID = 0; int items = 3; SubItem subitm = SubItem.siFill;
        string matchName = string.Empty;
        string memo = "易宝网银。充值金额：" + P_Amount.Value + "（元）。网银编号：" + Rb_BankId + "。序列：**" + R6_Order;
        RichDirection direction = RichDirection.rdIn;
        int costRelationType = 0; string key = string.Empty;
        int matchID = 0;
        int matchNum = 0;
        //
        List<AcountInfo> lai = new List<AcountInfo>();
        AcountInfo ai = new AcountInfo();
        ai.A = C_Amount.Value;
        ai.T = C_TypeID.Value;
        ai.N = "元宝";
        lai.Add(ai);
        //
        UserID2 = UserCenter.UserInfo().GetUserIDByUserName(UserName1,0);
        int ret3 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, UserID2.Value, lai.ToArray(), costRelationType, key, matchID, matchNum);
        //
        if (ret3 < 0)
        {
            PublicClass.WriteErrLog("易宝回发充值信息#4.异常代码:opeCreateOrder：" + opeCreateOrder + "。callbackID：" + callbackID + "。R6_Order：" + R6_Order + "。R3_Amt：" + R3_Amt + "。R2_TrxId" + R2_TrxId);
            return -1; ;
        }
        else
        {
            RichInfoSvcClient rc = new RichInfoSvcClient();
            //区分易宝网银和其他充值渠道 zhangsw 2012年1月5日 17:14:55
            int payType = 11;//11 网银充值
            Rb_BankId = Rb_BankId.ToUpper();
            if (Rb_BankId == "SZX-NET")//12 易宝神州行
            {
                payType = 12;
            }
            else if (Rb_BankId == "UNICOM-NET")//13 易宝联通卡
            {
                payType = 13;
            }
            else if (Rb_BankId == "JUNNET-NET")//14 易宝骏网一卡通
            {
                payType = 14;
            }
            else if (Rb_BankId == "SNDACARD-NET")//15 易宝盛大卡
            {
                payType = 15;
            }
            else if (Rb_BankId == "ZHENGTU-NET")//16 易宝征途卡
            {
                payType = 16;
            }
            //区分易宝网银和其他充值渠道 zhangsw 2012年1月5日 17:14:55
            rc.PayLogAdd(payType, UserName1, UserName1, P_Amount.Value, 4, C_Amount.Value, CommonOperation.GetIP4Address(), "");

            return 1;
        }
        //zhangsw 2011年9月14日 16:32:07 - 统一财富接口
        //2.提交用户中心
        //int item = 3, subItem = 9;
        //AcountInfo[] acountInfo = UserCenter.UserAcount().UserAccountLog(UserID2.Value, item, subItem, R6_Order, 0, P_Amount.Value, C_TypeID.Value, C_Amount.Value, "易宝充值");
        ////
        //if (acountInfo != null)
        //{
        //    //3.用户中心返回,更新session
        //    UserInfo user = Session["UserInfo"] as UserInfo;
        //    if (null != user)
        //    {
        //        WebCommon.UpdateUserAcount(user, acountInfo);
        //    }
        //    return 1;
        //}
        //else
        //{
        //    PublicClass.WriteErrLog("易宝回发充值信息#4.异常代码:opeCreateOrder：" + opeCreateOrder + "。callbackID：" + callbackID + "。R6_Order：" + R6_Order + "。R3_Amt：" + R3_Amt + "。R2_TrxId" + R2_TrxId);
        //    return -1;
        //}
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="valiStr"></param>
    /// <param name="flag"></param>
    /// <param name="strLegth"></param>
    /// <param name="R6_Order"></param>
    /// <returns></returns>
    private static string valiStr(string valiStr, string flag, int strLegth, string R6_Order)
    {
        if (valiStr.Length < strLegth)
        {
            return valiStr;
        }
        PublicClass.WriteErrLog("易宝回发充值信息#5.。非密钥参数异常。R6_Order：" + R6_Order +
            "。valiStr：" + valiStr + "。flag：" + flag + "。strLegth：" + strLegth);
        return "非密钥参数异常";
    }
}
