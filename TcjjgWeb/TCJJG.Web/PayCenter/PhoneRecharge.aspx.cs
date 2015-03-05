using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;

public partial class PayCenter_PhoneRecharge : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        txtUserName.Text = user.UserName;
    }
}