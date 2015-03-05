using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.DB;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Biz;


public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        IsLogin();
    }

    private void IsLogin()
    {
        if (Session["UserInfo"] != null)
        {
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
            ScriptManager.RegisterStartupScript(this, GetType(), "show", "ShowLoginOK('" + userInfo.UserName + "'," + userInfo.MsgCount + ")", true);
        }
        //else
        //{

        //    WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        //    int MsgCount = UserCenter.UserMessage().GetUnReadMessageCount(userInfo.UserID);
        //    M_LinkLogin.Visible = false;
        //    M_LinkRegister.Visible = false;

        //    M_LinkUserName.Visible = true;
        //    M_LinkMsg.Visible = true;
        //    if (MsgCount > 0)
        //    {
        //        M_LinkMsg.Text += "(" + MsgCount + ")";
        //    }
        //    M_LinkLogOut.Visible = true;
        //    M_LinkUserName.Text = userInfo.UserName;
        //}
    }
}
