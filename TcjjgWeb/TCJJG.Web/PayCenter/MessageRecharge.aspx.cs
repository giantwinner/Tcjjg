using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Model;
using Static.Common.Operation;

public partial class PayCenter_MessageRecharge : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        txtUserName.Text = user.UserName;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string userName = txtUserName.Text;
        int amount = 0;
        //if (vPayRMB5.Checked == true)
        //{
        //    amount = 5;
        //}
        if (vPayRMB10.Checked == true)
        {
            amount = 10;
        }
        else if (vPayRMB20.Checked == true)
        {
            amount = 20;
        }
        else if (vPayRMB30.Checked == true)
        {
            amount = 30;
        }
        Response.Redirect("InPayRequest.aspx?UserName=" + userName + "&Amount=" + amount);
    }
    
}