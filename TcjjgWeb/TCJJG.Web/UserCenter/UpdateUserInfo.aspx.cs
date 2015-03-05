using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;

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
        if (userAmply.G == 1)
        {
            rbtnMale.Checked = true;
        }
        else
        {
            rbtnFemale.Checked = true;
        }
        //职业
        if (string.IsNullOrEmpty(userAmply.J))
        {
            ddlWork.SelectedValue = "0";
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
    protected void SaveBtn_Click(object sender, EventArgs e)
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
        int gender_int = 1;
        if (rbtnFemale.Checked == true)
        {
            gender_int = 2;
        }
        byte gender = Convert.ToByte(gender_int);
        string job = ddlWork.SelectedItem.Text;

        string birthday = string.Empty;
        try
        {
            birthday = Convert.ToDateTime(txtBirthday.Text).ToString("yyyy-MM-dd");
        }
        catch
        {
            lblPrompt.Text = "请选择正确的生日！";
            return;
        }

        if (!string.IsNullOrEmpty(txtBirthday.Text))
        {
            if (Convert.ToDateTime(txtBirthday.Text) > Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd")))
            {
                lblPrompt.Text = "日期超过今天了！";
                return;
            }
        }

        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        if (userInfo.Password != System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtPassWord.Text.Trim(), "MD5").ToLower())
        {
            lblPrompt.Text = "请正确输入确认密码";
            return;
        }

        bool b = UserCenter.UserInfo().F_ChangeUserInfoAmply(userID, email, movePhone, phone, idCard, recipient, postNum, address, qq, msn, gender, realName, job, birthday);
        if (b == true)
        {
            lblPrompt.Text = "修改成功！";

            Image genderImg = (Image)this.UC_UserInfo.FindControl("imgGender");
            if (gender == 2)
            {
                genderImg.ImageUrl = "~/Images/UserCenter/gender-female.png";
            }
            else
            {
                genderImg.ImageUrl = "~/Images/UserCenter/gender-male.png";
            }

            //更新session
            userInfo.Sex = gender;
            Session["UserInfo"] = userInfo;
        }
        else
        {
            lblPrompt.Text = "修改失败！";
        }
    }
}