using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Model;

public partial class UserControl_UserCenter : System.Web.UI.UserControl
{
    public string iframeLink = "";
    public string linkPwd = "";
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
            iframeLink = "../UserCenter/ExistCryptoguard.aspx";
            linkPwd = "../UserCenter/ValidateUpdateUserPwd.aspx";
        }

        //未注册密保
        else
        {
            iframeLink = "../UserCenter/Cryptoguard.aspx";
            linkPwd = "../UserCenter/UpdateUserPwd.aspx";
        }

    }
}