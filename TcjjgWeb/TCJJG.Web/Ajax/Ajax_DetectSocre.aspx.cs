using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Model;

public partial class Ajax_Ajax_DetectSocre : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        if ( null==userInfo)
        {
            return;
        }

        //用户详细信息
        FFJJG.Common.UserCenter.UserAmplyInfo userInfoAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);

        int score = 0;
        double scoreWith = 0;
        string exileInfo = "";
        if (!string.IsNullOrEmpty(userInfoAmply.RM))//姓名
        {
            score += 5;
        }
        else
        {
            exileInfo = "uc-info-realname";
        }
        if (!string.IsNullOrEmpty(userInfoAmply.E))//邮箱
        {
            score += 5;
        }
        else
        {
            exileInfo = "uc-info-bindmail";
        }

        if (!string.IsNullOrEmpty(userInfoAmply.C))//身份证
        {
            score += 30;
        }
        else
        {
            exileInfo = "uc-info-idcard";
        }
        //if (!string.IsNullOrEmpty(userInfoAmply.A))//居住地
        //{
        //    score += 10;
        //}
        //else
        //{
        //    //exileInfo = "uc-info-address";
        //}
        if (!string.IsNullOrEmpty(userInfoAmply.M))//手机号
        {
            score += 20;
        }
        else
        {
            exileInfo = "uc-info-phone";
        }
        if (!string.IsNullOrEmpty(userInfoAmply.B))//生日
        {
            score += 2;
        }
        else
        {
            exileInfo = "uc-info-birthday";
        }
        if (!string.IsNullOrEmpty(userInfoAmply.J))//职业
        {
            score += 3;
        }
        else
        {
            exileInfo = "uc-info-job";
        }

        PwdQuestionAndAnswer pwd = UserCenter.UserInfo().GetPwdQuestion(userInfo.UserID);//密保提示问题
        int q1 = pwd.pwdQuestion1;
        int q2 = pwd.pwdQuestion2;
        int q3 = pwd.pwdQuestion3;
        if (q1 != 0 && q2 != 0 && q3 != 0)
        {
            score += 25;
        }
        else
        {
            exileInfo = "uc-info-pwdpro";
        }
        scoreWith = Convert.ToDouble(score) / 100 * 284;
        string returnVal = score + "," + scoreWith + "," + exileInfo;
        Response.Write(returnVal);
    }
}