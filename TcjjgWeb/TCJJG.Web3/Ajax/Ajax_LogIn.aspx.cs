using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using System.Net;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using Static.Common.Operation;
using TCJJG.Web.Biz;
using System.Web.Script.Serialization;

public partial class Ajax_Ajax_LogIn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //登录
        WebUserInfo user = new WebUserInfo();

        //游客请求
        bool isVisitor = false;

        #region 验证
        /* *********************** */
        if (Request.Params["userName"] == null)
        {
            Response.Write("-1");
            return;
        }
        if (Request.Params["passWord"] == null)
        {
            Response.Write("-1");
            return;
        }

        if (Request.Params["visitorPwd"] == null)
        {
            if (Request.Params["validate"] == null)
            {
                Response.Write("-2");
                return;
            }
        }
        else
        {
            isVisitor = true;
        }



        string userName = Request.Params["userName"].ToLower();
        string psw = Request.Params["passWord"].Trim();//MD5时在小写

        if (isVisitor == false)
        {
            string validate = Request.Params["validate"].ToString();
            //正则验证
            if (!PublicValidateUser.UserNameLoginValidate(userName))
            {
                Response.Write("-1");
                return;
            }
            //正则验证
            if (!PublicValidateUser.PasswordValidate(psw))
            {
                Response.Write("-1");
                return;
            }
            //验证码错误
            if (string.IsNullOrEmpty(validate) || Session["code"] == null || validate != Session["code"].ToString())
            {
                if (validate == "login")
                { }
                else
                {
                    Response.Write("-2");
                    return;
                    // ReturnVal = "请正确输入验证码";
                }
            }
        }

        #endregion

        #region

        //MD5时在小写
        psw = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(psw, "MD5").ToLower();

        if (isVisitor)
        {
            psw = Convert.ToString(Request.Params["visitorPwd"]);
        }

        //
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
        AbstractUserInfo userInfo = UserCenter.UserInfo().UserLogOn(userName, psw, 0, false, serverIP, loginIP, false, ref error);
        string lv = string.Empty;
        if (null != userInfo)
        {
            lv = Convert.ToString(WSClient.ExpSvc().GetRank(userInfo.I.ToString()));
        }

        if (error == 0)
        {
            #region

            try
            {
                //re session
                user = WebCommon.RembSession(user, appid, userInfo.I, userName, psw, userInfo.N, userInfo.H, lv, userInfo.G, userInfo.UT, userInfo.RL);
                user = WebCommon.UpdateUserAcount(user, userInfo.A);

                user.MsgCount = UserCenter.UserMessage().GetUnReadMessageCount(user.UserID);

                Session["UserInfo"] = user;
                //
                //
                BasePageCMOP basePage = new BasePageCMOP();
                basePage.SalesExpireVerify(user.UserID, user.UserName, user.NickName);
                ////base.SalesExpireVerify(user.UserID, user.UserName, user.NickName);
                //
                basePage.GotoCMOP(user.UserName, user.NickName);

                /////////GotoCMOP(user.UserName, user.NickName);
                //登录成功后检查用户是否已经更换认证头像，如果更换则删除认证标志
                try
                {
                    bool isdelHeadVIP = WSClient.SocialCenterWS().HeadIdentifyIsChange(user.UserID);
                }
                catch (Exception ex)
                {
                    PublicClass.WriteErrLog(ex.Message);
                }

                if (isVisitor)
                {
                    Response.Redirect("~/HallPage/HallPageFL.aspx", true);
                }
            }
            catch
            {

            }

            #endregion
        }
        else
        {
            Response.Write(error);
        }
        /* *********************** */
        #endregion

        JavaScriptSerializer j = new JavaScriptSerializer();
        string data = j.Serialize(user);
        Response.Write(data);
    }
}