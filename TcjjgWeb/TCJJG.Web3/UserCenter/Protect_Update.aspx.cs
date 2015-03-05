using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;

public partial class SecurityCenter_Protect_Update : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindQuestion();
        }
    }

    private void BindQuestion()
    {
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        Guid userID = user.UserID;
        lblUserName.Text = user.UserName;
        PwdQuestionAndAnswer pwd = UserCenter.UserInfo().GetPwdQuestion(userID);
        lblQuestion1.Text = pwd.pwdQuestionName1;
        lblQuestion2.Text = pwd.pwdQuestionName2;
        lblQuestion3.Text = pwd.pwdQuestionName3;
    }
}