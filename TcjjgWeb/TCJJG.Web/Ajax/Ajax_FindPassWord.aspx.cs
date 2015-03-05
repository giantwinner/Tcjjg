using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;

public partial class Ajax_Ajax_FindPassWord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        FindPassWord();
    }

    private void FindPassWord()
    {
        if (Request.Params["UserName"] != null)
        {
            string userName = Request.Params["UserName"];
            string answer1 = Request.Params["A1"];
            string answer2 = Request.Params["A2"];
            string answer3 = Request.Params["A3"];
            string passWord1 = Request.Params["P1"];
            string pwd1 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(passWord1, "MD5").ToLower();
            string passWord2 = Request.Params["P2"];
            string pwd2 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(passWord2, "MD5").ToLower();

            Guid userID = UserCenter.UserInfo().GetUserIDByUserName(userName,0);

            if (userID == new Guid("00000000-0000-0000-0000-000000000000"))
            {
                //用户名不存在
                Response.Write(-4);
                Response.End();
            }
            else
            {              
                int i = UserCenter.UserInfo().ValidatePwdQuestion(userName, answer1, answer2, answer3);
                if (i >= 0)
                {                  
                    int j = UserCenter.UserInfo().FindPassWord(userID, pwd1, pwd2);
                    //j=0:完成    j=-1:两次密码输入不一致     j=-2:修改失败
                    Response.Write(j);
                    Response.End();
                }
                else
                {
                    //密保问题错误
                    Response.Write(-3);
                    Response.End();
                }
            }
        }

    }
}