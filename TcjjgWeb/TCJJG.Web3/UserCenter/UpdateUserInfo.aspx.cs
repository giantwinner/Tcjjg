using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;

public partial class UserCenter_UpdateUserInfo : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindUserInfo();
        }
    }

    private void BindUserInfo()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        FFJJG.Common.UserCenter.UserAmplyInfo userAmply = new FFJJG.Common.UserCenter.UserAmplyInfo();
        userAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);
        //性别
        ddlGender.SelectedValue = userAmply.G.ToString();
        //职业
        if (userAmply.J == null || userAmply.J == "")
        {
            ddlWork.SelectedValue = "6";
        }
        else
        {
            switch (userAmply.J)
            {
                case "--请选择--":
                    ddlWork.SelectedValue = "0";
                    break;
                case "在校学生":
                    ddlWork.SelectedValue = "1";
                    break;
                case "固定工作者":
                    ddlWork.SelectedValue = "2";
                    break;
                case "自由职业者":
                    ddlWork.SelectedValue = "3";
                    break;
                case "待业/无业/失业":
                    ddlWork.SelectedValue = "4";
                    break;
                case "退休":
                    ddlWork.SelectedValue = "5";
                    break;
                case "其他":
                    ddlWork.SelectedValue = "6";
                    break;
            }
        }
        //生日

        if (userAmply.B == null || userAmply.B == "")
        {
            txtBirthday.Text = "";
        }
        else
        {
            try
            {
                txtBirthday.Text = Convert.ToDateTime(userAmply.B).ToString("yyyy-MM-dd");
            }
            catch
            {
                txtBirthday.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }

        //手机
        txtMovePhone.Text = userAmply.M;

        //真实姓名
        txtRealName.Text = userAmply.RM;

        //身份证号
        txtIDCard.Text = userAmply.C;


        //其他信息
        ViewState["A"] = userAmply.A;
        ViewState["C"] = userAmply.C;
        ViewState["E"] = userAmply.E;
        ViewState["N"] = userAmply.N;
        ViewState["P"] = userAmply.P;
        ViewState["Q"] = userAmply.Q;
        ViewState["R"] = userAmply.R;
        ViewState["S"] = userAmply.S;
        ViewState["U"] = userAmply.U;
        ViewState["RM"] = userAmply.RM;
        ViewState["UserID"] = userInfo.UserID;
        //
        ViewState["G"] = userAmply.G;
        ViewState["J"] = userAmply.J;
        ViewState["B"] = userAmply.B;
        ViewState["M"] = userAmply.M;
    }

    protected void ImgBtn_Click(object sender, ImageClickEventArgs e)
    {
        Guid userID = new Guid(ViewState["UserID"].ToString());
        string email = ViewState["E"] == null ? null : ViewState["E"].ToString();
        string phone = ViewState["P"] == null ? null : ViewState["P"].ToString();
        string idCard = ViewState["C"] == null ? null : ViewState["C"].ToString();
        string recipient = ViewState["R"] == null ? null : ViewState["R"].ToString();
        string postNum = ViewState["N"] == null ? null : ViewState["N"].ToString();
        string address = ViewState["A"] == null ? null : ViewState["A"].ToString();
        string qq = ViewState["Q"].ToString();
        string msn = ViewState["S"].ToString();
        string realName = ViewState["RM"] == null ? null : ViewState["RM"].ToString();
        string movePhone = ViewState["M"] == null ? null : ViewState["M"].ToString();

        byte gender = Convert.ToByte(ddlGender.Items[ddlGender.SelectedIndex].Value);
        string job = ddlWork.SelectedItem.Text;
        if (!string.IsNullOrEmpty(txtBirthday.Text))
        {
            if (Convert.ToDateTime(txtBirthday.Text).Year > DateTime.Now.Year)
            {
                lblPrompt.Text = "请选择正确的生日！";
                return;
            }
        }
        string birthday = string.Empty;
        try
        {
            birthday = Convert.ToDateTime(txtBirthday.Text).ToString("yyyy-MM-dd");
        }
        catch (Exception)
        {
        }

        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        if (userInfo.Password != System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPassWord0.Text.Trim(), "MD5").ToLower())
        {
            lblPrompt.Text = "请正确输入确认密码";
            return;
        }

        bool b = UserCenter.UserInfo().F_ChangeUserInfoAmply(userID, email, movePhone, phone, idCard, recipient, postNum, address, qq, msn, gender, realName, job, birthday);
        if (b == true)
        {
            lblPrompt.Text = "修改成功！";
        }
        else
        {
            lblPrompt.Text = "修改失败！";
        }
    }
    protected void ImgBtn2_Click(object sender, ImageClickEventArgs e)
    {
        string idCard = txtIDCard.Text.Trim();
        string realName = txtRealName.Text.Trim();

        #region 验证
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        if (!Char.IsNumber(txtMovePhone.Text, 0))
        {
            lblPrompt2.Text = "请输入正确的手机号";
            return;
        }
        if (userInfo.Password != System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPassWord.Text.Trim(), "MD5").ToLower())
        {
            lblPrompt2.Text = "请正确输入确认密码";
            return;
        }
        #endregion
        #region 扣费

        //余额验证
        int typeID = 1;
        AccountAmount richCount = UserCenter.UserAcount().AccountAmount(userInfo.AppID, userInfo.UserName, typeID);
        if (richCount.Amount < 300)
        {
            lblPrompt2.Text = "您的账户余额不足~";
            return;
        }


        //开始扣费
        List<AcountInfo> lai2 = new List<AcountInfo>(); //应扣除的财富
        AcountInfo ai2 = new AcountInfo();
        ai2.A = 300;
        ai2.T = typeID;
        ai2.N = "元宝";
        lai2.Add(ai2);
        //
        int gameID = 0;
        int items = 100;
        SubItem subitm = SubItem.siDeduct;
        string matchName = string.Empty;
        string memo = userInfo.UserName + "修改实名认证，扣费" + ai2.A + ai2.N + "。";
        RichDirection direction = RichDirection.drOut;
        //
        int costRelationType = 0; string key = string.Empty;
        int matchID = 0; int matchNum = 0;


        int ret2 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, userInfo.UserID, lai2.ToArray(), costRelationType, key, matchID, matchNum);
        if (ret2 < 0)
        {
            if (ret2 == -408)
            {
                this.lblPrompt2.Text = "您的账户余额不足~";
                return;
            }
            else
            {
                this.lblPrompt2.Text = "其他错误，请联系管理员" + ret2;
                return;
            }
        }

        #endregion


        Guid userID = new Guid(ViewState["UserID"].ToString());
        string email = ViewState["E"] == null ? null : ViewState["E"].ToString();
        string phone = ViewState["P"] == null ? null : ViewState["P"].ToString();
        //string idCard = ViewState["C"].ToString();
        string recipient = ViewState["R"] == null ? null : ViewState["R"].ToString();
        string postNum = ViewState["N"] == null ? null : ViewState["N"].ToString();
        string address = ViewState["A"] == null ? null : ViewState["A"].ToString();
        string qq = ViewState["Q"].ToString();
        string msn = ViewState["S"].ToString();
        //string realName = ViewState["RM"].ToString();
        byte gender = Convert.ToByte(ViewState["G"]);
        string job = ViewState["J"] == null ? null : ViewState["J"].ToString();
        string birthday = ViewState["B"] == null ? null : ViewState["B"].ToString();
        string movePhone = txtMovePhone.Text;

        bool b = UserCenter.UserInfo().F_ChangeUserInfoAmply(userID, email, movePhone, phone, idCard, recipient, postNum, address, qq, msn, gender, realName, job, birthday);
        if (b == true)
        {
            lblPrompt2.Text = "修改成功！";
        }
        else
        {
            lblPrompt2.Text = "修改失败！";
        }
    }
}