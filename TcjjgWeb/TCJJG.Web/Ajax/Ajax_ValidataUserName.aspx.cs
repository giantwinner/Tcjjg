using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Model;
using System.Web.Script.Serialization;

public partial class Ajax_Ajax_ValidataUserName : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidataUserName();
    }

    public class userPwdInfo
    {
        public int sign { get; set; }
        public string Q1 { get; set; }
        public string Q2 { get; set; }
        public string Q3 { get; set; }
    }

    private void ValidataUserName()
    {
        if (Request.Params["UserName"] != null)
        {
            string userName = Request.Params["UserName"];
            Guid userID = new Guid();
            userID = UserCenter.UserInfo().GetUserIDByUserName(userName,0);
            userPwdInfo uPwd = new userPwdInfo(); 
            if (userID == new Guid("00000000-0000-0000-0000-000000000000"))
            {
                //用户不存在
                uPwd.sign = -1;
                uPwd.Q1 = "";
                uPwd.Q2 = "";
                uPwd.Q3 = "";
                JavaScriptSerializer j = new JavaScriptSerializer();
                string data = j.Serialize(uPwd);
                Response.Write(data);
                Response.End();
            }
            else
            {
                Session["FindUser"] = userName;
                PwdQuestionAndAnswer pwd = UserCenter.UserInfo().GetPwdQuestion(userID);
                int q1 = pwd.pwdQuestion1;
                int q2 = pwd.pwdQuestion2;
                int q3 = pwd.pwdQuestion3;
                if (q1 == 0 && q2 == 0 && q3 == 0)
                {
                    //用户未注册密保
                    uPwd.sign = -2;
                    uPwd.Q1 = "";
                    uPwd.Q2 = "";
                    uPwd.Q3 = "";
                    JavaScriptSerializer j = new JavaScriptSerializer();
                    string data = j.Serialize(uPwd);
                    Response.Write(data);
                    Response.End();
                }
                else
                {
                    uPwd.sign = 0;
                    uPwd.Q1 = pwd.pwdQuestionName1;
                    uPwd.Q2 = pwd.pwdQuestionName2;
                    uPwd.Q3 = pwd.pwdQuestionName3;
                    JavaScriptSerializer j = new JavaScriptSerializer();
                    string data = j.Serialize(uPwd);
                    Response.Write(data);
                    Response.End();
                }
            }
        }
    }
}