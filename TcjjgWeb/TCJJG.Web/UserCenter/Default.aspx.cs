using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserCenter_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        //string total_fee = "1.00";
        //int result = 0;
        //Guid? userID = Guid.Empty;
        //string userName = string.Empty;
        //string memo = string.Empty;
        //int status = -1;
        //if (true)
        //{
        //    //判断该笔订单是否在商户网站中已经做过处理
        //    //如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
        //    //如果有做过处理，不执行商户的业务程序

        //    status = 1;
        //    PaySvcClient paySvc = new PaySvcClient();

        //    try
        //    {
        //        result = paySvc.AlipayLogUpdateStatus(1, 1, Convert.ToInt32(Convert.ToDouble(total_fee)), memo, ref userID, ref userName);

        //        if (result == 1)//订单状态更新成功
        //        {

        //        }
        //        else
        //        {

        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        return;
        //    }
        //}
    }
}