using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;

public partial class UserCenter_UserRealInfoConfirm : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void linkBtnComplete_Click(object sender, EventArgs e)
    {
        this.Panel1.Visible = false;
        this.Panel2.Visible = true;
    }
    protected void ImgBtn_Click(object sender, ImageClickEventArgs e)
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        FFJJG.Common.UserCenter.UserAmplyInfo userAmply = new FFJJG.Common.UserCenter.UserAmplyInfo();
        userAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);
        string idCard = txtIDCard.Text.Trim();
        string realName = txtRealName.Text.Trim();
        string movePhone = txtMovePhone2.Text.Trim();
        bool b = UserCenter.UserInfo().F_ChangeUserInfoAmply(userInfo.UserID, userAmply.E, movePhone, userAmply.P, idCard, userAmply.R, userAmply.N, userAmply.A, userAmply.Q, userAmply.S, userAmply.G, realName, userAmply.J, userAmply.B);
        if (b == true)
        {
            this.Panel1.Visible = false;
            this.Panel2.Visible = true;
        }
        else
        {
            lblMsg.Text = "保存失败...";
        }
    }
}