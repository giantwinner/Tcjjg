using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Biz;
using Static.Common.Operation;
using FFJJG.Common.UserCenter;
using System.Web.UI.HtmlControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HtmlMeta hm = new HtmlMeta();
            hm.HttpEquiv = "X-UA-Compatible";
            hm.Content = "IE=EmulateIE8";
            Page.Header.Controls.AddAt(1, hm);
            txtUsername.Focus();
        }
        IsLogin();
    }
    private void IsLogin()
    {
        
        if (Session["UserInfo"] != null)
        {
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
            userInfo.MsgCount = UserCenter.UserMessage().GetUnReadMessageCount(userInfo.UserID);
            if (userInfo.UserTypeID == 100)
            {
                visitorReg.Visible = true;
            }
            pnelfirst.Style.Add("display", "none");
            pnelsecond.Style.Add("display", "block");
            ScriptManager.RegisterStartupScript(this, GetType(), "show", "ShowLoginOK('" + userInfo.NickName + "'," + userInfo.MsgCount + ");", true);
        }
    }

    private string GetRandomNum()
    {
        System.Security.Cryptography.RNGCryptoServiceProvider rng =
        new System.Security.Cryptography.RNGCryptoServiceProvider();
        byte[] bytes = new byte[1];
        for (int i = 0; i < 1; i++)
        {
            rng.GetBytes(bytes);
        }
        string b = bytes[0].ToString().PadLeft(3, '0');
        Random rdm1 = new Random(unchecked((int)DateTime.Now.Ticks));
        return b + rdm1.Next(10000, 99999);
    }

    private RegUserInfo InitRegUserInfo(string userName, string passWord, string nickName, int sex, string headID, string recipient, string address, string email, string movePhone, string question, string answer, string realName, string idCard, string job, string birthday, Guid userID, int appid, string regIP, int prid)
    {
        RegUserInfo req_UserObject = new RegUserInfo();
        req_UserObject.UserID = userID;
        req_UserObject.AppID = appid;
        req_UserObject.UserName = userName;
        req_UserObject.Password = passWord;
        req_UserObject.NickName = nickName;
        req_UserObject.RegIP = regIP;
        req_UserObject.Sex = sex;
        req_UserObject.HeadID = headID;
        req_UserObject.Recipient = recipient;
        req_UserObject.Address = address;
        req_UserObject.EMail = email;
        req_UserObject.MovePhone = movePhone;
        req_UserObject.Prid = prid;
        req_UserObject.PwdQuestion = Convert.ToInt32(question);
        req_UserObject.PwdAnswer = answer;
        req_UserObject.RealName = realName;
        req_UserObject.IDCard = idCard;
        req_UserObject.Job = job;
        req_UserObject.Birthday = birthday;
        return req_UserObject;
    }


    /// <summary>
    /// 进入网站看是否已经是游客
    /// </summary>
    private void CheckIsVisitor()
    {
        if (null != Request.Cookies["tcjjgVisitor"])
        {
            //
            string visitorInfo = Request.Cookies["tcjjgVisitor"].Value;

            string userName = Server.UrlDecode(visitorInfo.Split(',')[0]);
            string pwd = visitorInfo.Split(',')[1];
            //
            Response.Redirect("~/Ajax/Ajax_LogIn.aspx?userName=" + userName + "&passWord=" + pwd + "&visitorPwd=" + pwd, true);
        }
    }

    /// <summary>
    /// 免费试玩
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ImgBtnFreeTry_Click(object sender, ImageClickEventArgs e)
    {
        CheckIsVisitor();

        #region 获得数据

        string userName = "游客" + GetRandomNum();
        Guid checkName = UserCenter.UserInfo().GetUserIDByUserName(userName, 0);
        while (Guid.Empty != checkName)
        {
            userName = "游客" + GetRandomNum();
        }

        string passWord = Guid.NewGuid().ToString();
        string nickName = userName;
        int sex = 2;
        string headID = WebCommon.GetFFJJGWebXML("ffjjgweb/", "defaulthead2");

        string recipient = null;
        string address = null;
        string email = null;
        string movePhone = null;
        string question = null;
        string answer = null;
        string realName = null;
        string idCard = null;
        string job = null;

        string birthday = null;
        int cityID = 1000;

        #endregion

        #region 注册前包装对象

        Guid? userID = new Guid();
        int appid = 0;
        string regIP = CommonOperation.GetIP4Address();
        string Lv = string.Empty;
        string RankTitle = string.Empty;
        int userType = 100;
        int prid = 0;

        AcountInfo[] userAcount = null;

        RegUserInfo req_UserObject = InitRegUserInfo(userName, passWord, nickName, sex,
            headID, recipient, address, email, movePhone, question, answer, realName, idCard, job, birthday, userID.Value, appid, regIP, prid);

        #endregion

        #region 开始注册

        try
        {
            string ope = string.Empty;
            int smcRegCount = 0;
            userAcount = UserCenter.UserInfo().F_InsertUser(req_UserObject, smcRegCount, cityID, regIP, 1, ref userID, ref Lv, ref RankTitle, userType, ref ope);
            if (userID.Value != Guid.Empty && ope == "0")
            {
                WebUserInfo user = new WebUserInfo();
                user = WebCommon.RembSession(user, appid, userID.Value, userName, passWord, nickName, headID, Lv, sex, userType, user.Roles);
                user = WebCommon.UpdateUserAcount(user, userAcount);
                user.MsgCount = UserCenter.UserMessage().GetUnReadMessageCount(user.UserID);
                Session["UserInfo"] = user;


                //记cookie
                HttpCookie cok = new HttpCookie("tcjjgVisitor", Server.UrlEncode(user.UserName) + "," + user.Password);
                cok.Expires = DateTime.Now.AddDays(7);
                Response.Cookies.Add(cok);
                //
                Response.Redirect("~/HallPage/HallPageFL.aspx", false);
            }
            else
            {
                FFJJG.Server.Utils.Logging.write("游客注册失败", "游客注册失败", true);
            }
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write("游客注册失败", ex.Message, true);
        }
        #endregion
    }
}
