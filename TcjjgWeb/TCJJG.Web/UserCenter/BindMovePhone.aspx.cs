using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;

public partial class UserCenter_BindMovePhone : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindOldData();
        }
    }
    private void BindOldData()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        FFJJG.Common.UserCenter.UserAmplyInfo userAmply = new FFJJG.Common.UserCenter.UserAmplyInfo();
        try
        {
            userAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);
            if (string.IsNullOrEmpty(userAmply.M))
            {
                PnelBinding.Visible = true;
                PnelBinded.Visible = false;
                Pnelchang1.Visible = false;
            }
            else
            {
                HideNum.Text = userAmply.M;
                lblBindedNum.Text = userAmply.M.ToString().Substring(0, 3) + "****" + userAmply.M.ToString().Substring(7, 4);
                lblBindedNum2.Text = lblBindedNum.Text;
                lblprompt.Text = "提示：*绑定的手机成功后，系统奖励金币自动发放，你可以到账单内查询。<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;绑定手机还可以作为找回密码的工具使用，你已经成功绑定了手机，祝你游戏愉快！";

                PnelBinding.Visible = false;
                PnelBinded.Visible = true;
                Pnelchang1.Visible = false;
            }
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write("绑定手机", ex.Message, true);
        }

    }
    protected void BtnBinding_Click(object sender, EventArgs e)
    {
        if (null != Session["MCode"])
        {
            if (string.IsNullOrEmpty(txtMobile.Text.Trim()))
            {
                lblBindMobileMsg.Text = "请填写手机号！";
                return;
            }
            if (string.IsNullOrEmpty(txtCode.Text.Trim()) || Session["MCode"].ToString() != txtCode.Text.Trim())
            {
                lblBindMobileMsg.Text = "验证码错误！";
                return;
            }
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
            FFJJG.Common.UserCenter.UserAmplyInfo userAmply = new FFJJG.Common.UserCenter.UserAmplyInfo();
            userAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);

            bool b = UserCenter.UserInfo().F_ChangeUserInfoAmply(userInfo.UserID, userAmply.E, txtMobile.Text, userAmply.P, userAmply.C, userAmply.R, userAmply.N, userAmply.A, userAmply.Q, userAmply.S, userAmply.G, userAmply.RM, userAmply.J, userAmply.B);
            if (b)
            {
                BtnBinding.Enabled = false;

                if (string.IsNullOrEmpty(userAmply.M))//第一次绑定送金币
                {
                    //破产补偿
                    try
                    {
                        UserCenter.UserInfo().GuidePartLog_Add(userInfo.UserID, 4);

                    }
                    catch (Exception ex)
                    {
                        FFJJG.Server.Utils.Logging.write("绑定手机破产补偿", ex.Message, true);
                    }
                }

                lblBindMobileMsg.Text = "绑定成功！";
                BindOldData();
            }
            else
            {
                lblBindMobileMsg.Text = "绑定失败！";
            }

        }
        else
        {
            lblBindMobileMsg.Text = "验证码错误！";
        }
    }

    protected void linkBtn_Click(object sender, EventArgs e)
    {
        lblTitle.Text = "更换绑定手机";
        lblprompt.Text = "提示：*更换绑定手机号支持移动联通电信全号段，每天有3次操作机会，请谨慎输入。";
        PnelBinding.Visible = false;
        PnelBinded.Visible = false;
        Pnelchang1.Visible = true;
    }
    protected void LinkNextStep_Click(object sender, EventArgs e)
    {


        if (null != Session["MCode"])
        {
            if (string.IsNullOrEmpty(txtCode2.Text.Trim()) || Session["MCode"].ToString() != txtCode2.Text.Trim())
            {
                lblBindMobileMsg2.Text = "验证码错误！";
            }
            else
            {
                lblTitle.Text = "更换绑定手机";
                lblprompt.Text = "提示：*更换绑定成功则启用新的绑定手机号，更换失败则沿用旧的手机号。";
                PnelBinding.Visible = true;
                PnelBinded.Visible = false;
                Pnelchang1.Visible = false;
            }
        }
    }
}