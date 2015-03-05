using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;

public partial class SecurityCenter_ChangePwd_Validata : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindQuestion();
    }

    private void BindQuestion()
    {
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        Guid userID = user.UserID;
        PwdQuestionAndAnswer userQAndA = new PwdQuestionAndAnswer();
        userQAndA = UserCenter.UserInfo().GetPwdQuestion(userID);
        lblQuestion1.Text = userQAndA.pwdQuestionName1;
        lblQuestion2.Text = userQAndA.pwdQuestionName2;
        lblQuestion3.Text = userQAndA.pwdQuestionName3;
        lblUserName.Text = user.UserName;
    }


}