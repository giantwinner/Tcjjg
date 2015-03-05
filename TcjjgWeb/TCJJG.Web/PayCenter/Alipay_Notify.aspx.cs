using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Com.Alipay;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;
using System.Collections.Specialized;
using FFJJG.Common.UserCenter;
using Static.Common.Operation;

public partial class PayCenter_Alipay_Notify : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        SortedDictionary<string, string> sPara = GetRequestPost();

        if (sPara.Count > 0)//判断是否有带返回参数
        {
            Notify aliNotify = new Notify();
            bool verifyResult = aliNotify.Verify(sPara, Request.Form["notify_id"], Request.Form["sign"]);

            if (verifyResult)//验证成功
            {
                /////////////////////////////////////////////////////////////////////////////////////////////////////////////
                //请在这里加上商户的业务逻辑程序代码


                //——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
                //获取支付宝的通知返回参数，可参考技术文档中服务器异步通知参数列表

                //商户订单号

                string out_trade_no = Request.Form["out_trade_no"];

                //支付宝交易号

                string trade_no = Request.Form["trade_no"];

                //交易状态
                string trade_status = Request.Form["trade_status"];

                //交易金额
                string total_fee = Request.Form["total_fee"];

                int result = 0;
                Guid? userID = Guid.Empty;
                string userName = string.Empty;
                string memo = "支付宝异步回发；订单号：" + out_trade_no + ";金额：" + total_fee;
                int status = -1;
                int? payRate = 0;
                if (Request.Form["trade_status"] == "TRADE_FINISHED")
                {
                    //判断该笔订单是否在商户网站中已经做过处理
                    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    //如果有做过处理，不执行商户的业务程序

                    //注意：
                    //该种交易状态只在两种情况下出现
                    //1、开通了普通即时到账，买家付款成功后。
                    //2、开通了高级即时到账，从该笔交易成功时间算起，过了签约时的可退款时限（如：三个月以内可退款、一年以内可退款等）后。
                    status = 1;
                    PaySvcClient paySvc = new PaySvcClient();

                    try
                    {
                        result = paySvc.AlipayLogUpdateStatus(Convert.ToInt32(out_trade_no), status, Convert.ToInt32(Convert.ToDouble(total_fee)), memo, ref userID, ref userName, ref payRate);
                        if (result == 1)//订单状态更新成功
                        {
                            //更新元宝
                            if (UpdateUserAccount(Convert.ToInt32(Convert.ToDouble(total_fee)), Convert.ToInt32(out_trade_no), userID.Value, userName, payRate.Value) < 0)
                            {
                                //更新元宝失败
                                FFJJG.Server.Utils.Logging.write("充值Notify", "更新元宝失败", false);
                            }
                            else
                            {
                                //更新元宝成功
                            }
                        }
                        else if (result == 2)//订单已处理过
                        {
                            FFJJG.Server.Utils.Logging.write("充值Notify", "订单已处理过" + result, false);
                        }
                        else
                        {
                            FFJJG.Server.Utils.Logging.write("充值Notify", "更改支付宝状态失败result：" + result + "；trade_status：" + trade_status + "；订单号：" + out_trade_no + "；金额：" + total_fee + "；userName：" + userName, true);
                        }
                    }
                    catch (Exception ex)
                    {
                        FFJJG.Server.Utils.Logging.write("充值Notify", "支付宝异步回发-修改订单状态。" + "订单号：" + out_trade_no + ";充值接口PaySvc异常信息：" + ex.Message, true);
                        ScriptManager.RegisterStartupScript(this.Page, GetType(), "payts", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('充值失败，请速与管理员联系');</script>", false);
                        return;
                    }
                }
                else if (Request.Form["trade_status"] == "TRADE_SUCCESS")
                {
                    //判断该笔订单是否在商户网站中已经做过处理
                    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
                    //如果有做过处理，不执行商户的业务程序

                    //注意：
                    //该种交易状态只在一种情况下出现——开通了高级即时到账，买家付款成功后。
                    status = 1;
                    PaySvcClient paySvc = new PaySvcClient();

                    try
                    {
                        result = paySvc.AlipayLogUpdateStatus(Convert.ToInt32(out_trade_no), status, Convert.ToInt32(Convert.ToDouble(total_fee)), memo, ref userID, ref userName, ref payRate);
                        if (result == 1)//订单状态更新成功
                        {
                            //更新元宝
                            if (UpdateUserAccount(Convert.ToInt32(Convert.ToDouble(total_fee)), Convert.ToInt32(out_trade_no), userID.Value, userName, payRate.Value) < 0)
                            {
                                //更新元宝失败
                                FFJJG.Server.Utils.Logging.write("充值Notify", "更新元宝失败", false);
                            }
                            else
                            {
                                //更新元宝成功
                            }
                        }
                        else if (result == 2)//订单已处理过
                        {
                            FFJJG.Server.Utils.Logging.write("充值Notify", "订单已处理过" + result, false);
                        }
                        else
                        {
                            FFJJG.Server.Utils.Logging.write("充值Notify", "更改支付宝状态失败result：" + result + "；trade_status：" + trade_status + "；订单号：" + out_trade_no + "；金额：" + total_fee + "；userName：" + userName, true);
                        }
                    }
                    catch (Exception ex)
                    {
                        FFJJG.Server.Utils.Logging.write("充值Notify", "支付宝异步回发-修改订单状态。" + "订单号：" + out_trade_no + ";充值接口PaySvc异常信息：" + ex.Message, true);
                        ScriptManager.RegisterStartupScript(this.Page, GetType(), "payts", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('充值失败，请速与管理员联系');</script>", false);
                        return;
                    }
                }
                else
                {
                    FFJJG.Server.Utils.Logging.write("充值Notify", "支付宝异步回发-修改订单状态。" + "订单号：" + out_trade_no + ";支付宝返回状态trade_status：" + Request.QueryString["trade_status"], true);
                    ScriptManager.RegisterStartupScript(this.Page, GetType(), "payts", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('充值失败，请速与管理员联系');</script>", false);
                    return;
                }

                //——请根据您的业务逻辑来编写程序（以上代码仅作参考）——

                Response.Write("success");  //请不要修改或删除

                /////////////////////////////////////////////////////////////////////////////////////////////////////////////
            }
            else//验证失败
            {
                Response.Write("fail");
                FFJJG.Server.Utils.Logging.write("充值", "支付宝异步回发-验证失败", false);
            }
        }
        else
        {
            FFJJG.Server.Utils.Logging.write("充值", "支付宝异步回发-无返回参数", false);
        }
    }

    /// <summary>
    /// 获取支付宝POST过来通知消息，并以“参数名=参数值”的形式组成数组
    /// </summary>
    /// <returns>request回来的信息组成的数组</returns>
    public SortedDictionary<string, string> GetRequestPost()
    {
        int i = 0;
        SortedDictionary<string, string> sArray = new SortedDictionary<string, string>();
        NameValueCollection coll;
        //Load Form variables into NameValueCollection variable.
        coll = Request.Form;

        // Get names of all forms into a string array.
        String[] requestItem = coll.AllKeys;

        for (i = 0; i < requestItem.Length; i++)
        {
            sArray.Add(requestItem[i], Request.Form[requestItem[i]]);
        }

        return sArray;
    }

    /// <summary>
    /// 更新用户财富
    /// </summary>
    /// <param name="payAmount"></param>
    /// <param name="orderID"></param>
    /// <param name="userID"></param>
    /// <param name="userName"></param>
    /// <returns></returns>
    private int UpdateUserAccount(int payAmount, int orderID, Guid userID, string userName, int payRate)
    {
        int gameID = 0; int items = 3; SubItem subitm = SubItem.siFill;
        string matchName = string.Empty;
        string memo = "支付宝充值。充值金额：" + payAmount + "（元）。订单号：" + orderID;
        RichDirection direction = RichDirection.rdIn;
        int costRelationType = 0; string key = string.Empty;
        int matchID = 0;
        int matchNum = 0;
        //
        List<AcountInfo> lai = new List<AcountInfo>();
        AcountInfo ai = new AcountInfo();
        ai.A = payAmount * payRate;
        ai.T = 1;
        ai.N = "元宝";
        lai.Add(ai);
        //
        int ret3 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, userID, lai.ToArray(), costRelationType, key, matchID, matchNum);
        //
        if (ret3 < 0)
        {
            FFJJG.Server.Utils.Logging.write("充值", "支付宝充值_更新财富失败。" + ret3, true);
            return -1; ;
        }
        else
        {
            RichInfoSvcClient rc = new RichInfoSvcClient();

            int payType = 23;//23支付宝充值

            //区分易宝网银和其他充值渠道 zhangsw 2012年1月5日 17:14:55
            rc.PayLogAdd(payType, userName, userName, payAmount, ai.T, ai.A, CommonOperation.GetIP4Address(), "");

            return 1;
        }
    }
}