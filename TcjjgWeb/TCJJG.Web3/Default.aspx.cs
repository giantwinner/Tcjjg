using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.DB;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using Static.Common.Operation;


public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadMaintenancePage();
            GetTopImgs();
            IsLogin();
        }
    }
    protected string GetBBSUrl()
    {
        return WebCommon.GetFFJJGWebXML("ffjjgweb/", "DNTBBSUrl");
    }
    private void LoadMaintenancePage()
    {
        var data = TCJJGWeb.GetMaintenancePage();
        if (null == data)
        {
            return;
        }
        else
        {
            if (data.IsApply == 1)
            {
                Server.Transfer("~/MaintenancePage/MaintenancePage.aspx");
            }
        }
    }
    /// <summary>
    /// 顶部切换图片
    /// </summary>
    private void GetTopImgs()
    {
        try
        {
            var LY = WSClient.CMOPWebWS().GetIndexADImg().Take(3).ToList();
            string imgStr = string.Empty;
            string butspan = string.Empty;  //按钮
            string butTitle = string.Empty;  //标题
            //
            int i = 0;
            foreach (var row in LY)
            {
                //string urlStr = "href=\"" + row.LinkURL + "\" target=\"_blank\"";
                //if (row.LinkURL.Trim().Length < 1)
                //{
                //    urlStr = string.Empty;
                //}
                imgStr += "<img class=\"divImg\" style=\"display: none;\" src=\"" + row.ImageName + "\" />";

                //ltaTopbut
                butspan += "<span class=\"SwitchBtn\" >●</span>";
                // butTitle += "<span class=\"d_top1_R_BTitle\" style=\"display: none;\" >" + row.Title + " >></span>";
                if (i == 0)
                {
                    imgStr = "<img class=\"divImg\" src=\"" + row.ImageName + "\" />";
                    //butTitle = "<span class=\"d_top1_R_BTitle\" >" + row.Title + " >></span>";
                }
                i++;
            }
            //按钮
            string butDiv = "<div class=\"d_top1_R_Bdiv\">" + butspan + "</div>";
            // butDiv += "<div class=\"d_top1_R_Bdiv2\">" + butTitle + "</div>";
            //接收拼接字符串
            ltaTopImgs.Text = imgStr;
            ltaTopbut.Text = butDiv;
        }
        catch (Exception ex)
        {
            PublicClass.WriteErrLog(ex.Message);
        }

    }

    private void IsLogin()
    {
        if (Session["UserInfo"] == null)
        {
            string js = @"<Script language='JavaScript'> $('#ctl00_ContentPlaceHolder1_pnl_First').show();$('#ctl00_ContentPlaceHolder1_pnl_Again').hide(); $('#ctl00_ContentPlaceHolder1_pnl_Success').hide(); </Script>";
            ClientScript.RegisterStartupScript(Page.GetType(), "downUpType", js);
        }
        else
        {
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;

            string linkToGM = WebCommon.GetFFJJGWebXML("ffjjgweb/", "LinkToGM");
            AgencyLink.NavigateUrl = linkToGM;

            string js = @"<Script language='JavaScript'> $('#ctl00_ContentPlaceHolder1_pnl_Success').show(); $('#ctl00_ContentPlaceHolder1_pnl_First').hide();$('#ctl00_ContentPlaceHolder1_pnl_Again').hide(); $('#ctl00_ContentPlaceHolder1_AgencyLink').hide(); $('#default_bar_Img').attr('src','StyleSheet/defaultImg/Tcjjg_gb_home_14_3.gif'); </Script>";
            ClientScript.RegisterStartupScript(Page.GetType(), "downUpType", js);
            this.lblNickName.Text = userInfo.NickName;
            if (!string.IsNullOrEmpty(userInfo.HeadID))
            {
                this.ImgAvatar.ImageUrl = userInfo.HeadID + "?temp=" + DateTime.Now.Millisecond.ToString();
            }
            foreach (var item in userInfo.Lua)
            {
                if (item.Ti == 1)
                {
                    this.lblYuanBao.Text = item.Ac.ToString();
                }
                if (item.Ti == 4)
                {
                    this.lblGoldCoin.Text = item.Ac.ToString();
                }
            }
            //
            for (int i = 0; i < userInfo.Roles.Length; i++)
            {
                if (userInfo.Roles[i] == "8")
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "butLog2", "<Script language='JavaScript'> $('#ctl00_ContentPlaceHolder1_AgencyLink').show(); </Script>", false);
                    this.AgencyLink.Text = "代理商管理";
                    //this.LinkAward.Visible = false;
                    //this.LinkMyGoods.Visible = false;
                }
                if (userInfo.Roles[i] == "9")
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "butLog2", "<Script language='JavaScript'> $('#ctl00_ContentPlaceHolder1_AgencyLink').show(); </Script>", false);
                    this.AgencyLink.Text = "网吧管理";
                    //this.LinkAward.Visible = false;
                    //this.LinkMyGoods.Visible = false;
                }
            }
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "IsLogin", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >IsLogin('" + userInfo.UserName + "','" + userInfo.AppID + "');</script>", false);
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
    /// 游戏试玩
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
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
                PublicClass.WriteErrLog("游客注册失败");
            }
        }
        catch (Exception ex)
        {
            PublicClass.WriteErrLog("游客注册" + ex.Message);
        }
        #endregion
    }

}