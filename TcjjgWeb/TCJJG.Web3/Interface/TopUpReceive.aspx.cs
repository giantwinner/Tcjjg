using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Interface_TopUpReceive : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string userName = Request.QueryString["ID"]; //用户ID
            string orderID = Request.QueryString["OrderID"]; //订单ID
            int appID = Convert.ToInt32(Request.QueryString["Key"]);    //密钥
            int amount = Convert.ToInt32(Request.QueryString["Amount"]);//充值数量
            int flag = Convert.ToInt32(Request.QueryString["Flag"]);
            string md = Request.QueryString["MD"].ToLower(); //MD5

            Response.Write("用户名=" + userName + "<br>订单号=" + orderID + "<br>密钥=" + appID + "<br>充值数量=" + amount + "<br>");
            switch (flag)
            {
                case 0:
                    Response.Write("充值成功！");
                    break;
                case 1:
                    Response.Write("该订单已充值！");
                    break;
                case 2:
                    Response.Write("账号不存在！");
                    break;
                case 3:
                    Response.Write("充值失败，请联系客服!");
                    break;
            }
        }
    }
}