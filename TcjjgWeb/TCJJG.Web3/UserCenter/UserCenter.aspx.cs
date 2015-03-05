using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Model;
using FFJJG.Common.UserCenter;

public partial class UserCenter_UserCenter : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ValidateUser();
        }
    }

    //根据用户是否注册密码保护，调整链接
    private void ValidateUser()
    {
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        Guid userID = user.UserID;
        PwdQuestionAndAnswer userPwdQAndA = UserCenter.UserInfo().GetPwdQuestion(userID);
        int q1 = userPwdQAndA.pwdQuestion1;
        int q2 = userPwdQAndA.pwdQuestion2;
        int q3 = userPwdQAndA.pwdQuestion3;


        //已注册密保
        if (q1 > 0 && q2 > 0 && q3 > 0)
        {
            linkPwd.NavigateUrl = "../SecurityCenter/ChangePwd_Validata.aspx";
            linkQuestion.NavigateUrl = "../SecurityCenter/Protect_Exist.aspx";
        }

        //未注册密保
        else
        {
            linkPwd.NavigateUrl = "../SecurityCenter/ChangePwd_Change.aspx";
            linkQuestion.NavigateUrl = "../SecurityCenter/Protect_SetUp.aspx";
        }

    }
}