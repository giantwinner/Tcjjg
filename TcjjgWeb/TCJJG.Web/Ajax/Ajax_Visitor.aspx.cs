using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using Static.Common.Operation;
using System.Net;

public partial class Ajax_Ajax_Visitor : System.Web.UI.Page
{
    string spreadUser = string.Empty;//推广号
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadSpreadNum();
            VisitorReg();
        }
    }
    private void LoadSpreadNum()
    {
        //获得推广号
        if (Request.QueryString["spread"] != null)
        {
            Session["spread"] = Request.QueryString["spread"];
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
    private bool CheckIsVisitor()
    {
        bool result = false;
        WebUserInfo user = new WebUserInfo();

        if (null != Request.Cookies["tcjjgVisitor"])
        {
            //
            string visitorInfo = Request.Cookies["tcjjgVisitor"].Value;

            string userName = Server.UrlDecode(visitorInfo.Split(',')[0]);
            string pwd = visitorInfo.Split(',')[1];
            //
            #region ajax login

            string serverIP = string.Empty; //服务器IP
            string strHostName = Dns.GetHostName(); //得到本机的主机名
            IPHostEntry ipEntry = Dns.GetHostEntry(strHostName); //取得本机IP
            foreach (System.Net.IPAddress ip in ipEntry.AddressList)
            {
                serverIP = ip.ToString();
            }
            string loginIP = CommonOperation.GetIP4Address();
            int error = 0;
            string nickName = string.Empty;
            string domainName = string.Empty;
            int appid = 0;
            AbstractUserInfo userInfo = UserCenter.UserInfo().UserLogOn(userName, pwd, 0, false, serverIP, loginIP, false, ref error);
            string lv = string.Empty;
            if (null != userInfo)
            {
                var rankInfo = TCJJG.Web.UserCenter.UserCenter.UserInfo().GetRankByExperience(userInfo.I);
                if (null != rankInfo)
                {
                    lv = Convert.ToString(rankInfo.Rank);
                }
            }

            if (error == 0)
            {
                #region

                try
                {
                    //re session
                    user = WebCommon.RembSession(user, appid, userInfo.I, userName, pwd, userInfo.N, userInfo.H, lv, userInfo.G, userInfo.UT, userInfo.RL);
                    user = WebCommon.UpdateUserAcount(user, userInfo.A);

                    user.MsgCount = UserCenter.UserMessage().GetUnReadMessageCount(user.UserID);

                    Session["UserInfo"] = user;

                    result = true;
                    //
                    BasePageCMOP basePage = new BasePageCMOP();

                    basePage.GotoCMOP(user.UserName, user.NickName);

                }
                catch (Exception ex)
                {
                    FFJJG.Server.Utils.Logging.write(ex);
                }

                #endregion
            }

            #endregion

        }
        return result;
    }

    private void VisitorReg()
    {
        #region 带推广号的链接试玩

        if (Convert.ToString(Request.QueryString["tg"]) == "1")
        {
            #region 推广号验证

            if (Session["spread"] != null)
            {
                spreadUser = Session["spread"].ToString();
                Session.Remove("spread");
                if (string.IsNullOrEmpty(spreadUser.Trim()) || !CommonOperation.IsNumInt32(spreadUser))
                {
                    return;
                }
                if (WSClient.SpreadWS().Spread_UserInfo_Reg_Verify(spreadUser) < 0)
                {
                    return;
                }
            }

            #endregion
        }

        #endregion
        if (Session["UserInfo"] != null)
        {
            #region 链接试玩

            if (Convert.ToString(Request.QueryString["tg"]) == "1")
            {
                Response.Redirect("~/HallPage/HallPageFL.aspx",true);
            }

            #endregion


            Response.Write("2");
            return;
        }

        if (null == Request.Cookies["tcjjgVisitor"])
        {

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

                    #region 链接试玩

                    if (Convert.ToString(Request.QueryString["tg"]) == "1")
                    {
                        string spreadNumber = spreadUser.Trim();
                        Guid UserID = user.UserID;
                        string UserName = user.UserName,
                        NickName = user.NickName;
                        DateTime LastLogOnTime = DateTime.Now;
                        string BarName = "网吧名称";
                        int? status = -1;

                        WSClient.SpreadWS().Spread_Reg_UserInfo(spreadNumber, UserID, UserName, NickName, LastLogOnTime, BarName, ref status);
                        if (status == -1)
                        {
                            return;
                        }
                        Response.Redirect("~/HallPage/HallPageFL.aspx", true);
                    }

                    #endregion
                    //
                    Response.Write("1");
                }
                else
                {
                    Response.Write("-2");
                    FFJJG.Server.Utils.Logging.write("游客注册失败", "游客注册失败", true);
                }
            }
            catch (System.Threading.ThreadAbortException tx)
            {
            }
            catch (Exception ex)
            {
                Response.Write("-2");
                FFJJG.Server.Utils.Logging.write("游客注册失败", ex.Message, true);
            }

            #endregion
        }
        else
        {
            if (!CheckIsVisitor())
            {
                Response.Write("-1");
            }
            else
            {
                #region 链接试玩

                if (Convert.ToString(Request.QueryString["tg"]) == "1")
                {
                    Response.Redirect("~/HallPage/HallPageFL.aspx", true);
                }

                #endregion
                Response.Write("2");
            }
        }

    }
}