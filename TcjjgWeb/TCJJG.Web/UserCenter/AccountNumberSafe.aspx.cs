using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;

public partial class UserCenter_AccountNumberSafe : BasePage
{
    public string frameSrc = "";
    public string frameSrc2 = "";
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidateUser();
    }

    //判断用户是否注册密码保护
    private void ValidateUser()
    {
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        try
        {
            Guid userID = user.UserID;
            PwdQuestionAndAnswer userPwdQAndA = UserCenter.UserInfo().GetPwdQuestion(userID);
            int q1 = userPwdQAndA.pwdQuestion1;
            int q2 = userPwdQAndA.pwdQuestion2;
            int q3 = userPwdQAndA.pwdQuestion3;


            //已注册密保
            if (q1 > 0 && q2 > 0 && q3 > 0)
            {
                frameSrc = "ChangePwd_Validata.aspx";
                frameSrc2 = "Protect_Exist.aspx";
            }

            //未注册密保
            else
            {
                frameSrc = "ChangePwd_Change.aspx";
                frameSrc2 = "Protect_SetUp.aspx";
            }
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write(ex);
        }


    }
}