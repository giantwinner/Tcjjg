using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;

public partial class SecurityCenter_ChangePwd_Change : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUser();
        }
    }

    private void BindUser()
    {
        try
        {
            WebUserInfo user = Session["UserInfo"] as WebUserInfo;
            lblUserID.Text = user.UserID.ToString();
        }
        catch
        { }
    }

    
}