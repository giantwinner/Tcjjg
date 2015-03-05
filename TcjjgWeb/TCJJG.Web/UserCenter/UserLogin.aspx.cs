using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using Static.Common.Operation;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;

public partial class UserCenter_UserLogin : BasePageCMOP
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserInfo"] != null)
        {
            Response.Redirect("~/", true);
        }
        if (!IsPostBack)
        {
            this.txtUserName.Focus();
            this.loadUserNameFromCookies();
        }
    }
    protected void BtnLogin_Click(object sender, EventArgs e)
    {
        try
        {
            this.BtnLogin.Enabled = false;
            //
            string userName = this.txtUserName.Text.Trim().ToLower();
            string psw = this.txtPsw.Text.Trim();//MD5时在小写
            string validate = this.txtVli.Text;
            //验证码错误

                if (string.IsNullOrEmpty(validate) || Session["code"] == null || validate != Session["code"].ToString())
                {
                    this.Label1.Text = this.Label2.Text = ""; this.Label3.Text = "请正确输入验证码";
                    this.txtVli.Focus();
                    this.BtnLogin.Enabled = true;
                    return;
                }
            
            //Session is not null
            if (Session["UserInfo"] != null)
            {
                Response.Redirect("~/", true);
            }
            //正则验证
            if (!PublicValidateUser.UserNameLoginValidate(userName))
            {
                this.Label1.Text = "请正确输入帐号"; this.Label2.Text = this.Label3.Text = "";
                this.txtUserName.Focus();
                this.BtnLogin.Enabled = true;
                return;
            }
            //正则验证
            if (!PublicValidateUser.PasswordValidate(psw))
            {
                this.Label1.Text = ""; this.Label2.Text = "请正确输入密码"; this.Label3.Text = "";
                this.txtPsw.Focus();
                this.BtnLogin.Enabled = true;
                return;
            }
            //MD5时在小写
            psw = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(psw, "MD5").ToLower();
            //
            string serverIP = string.Empty;
            string strHostName = Dns.GetHostName(); //得到本机的主机名
            IPHostEntry ipEntry = Dns.GetHostEntry(strHostName); //取得本机IP
            foreach (System.Net.IPAddress ip in ipEntry.AddressList)
            {
                serverIP = ip.ToString();
            }
            string loginIP = CommonOperation.GetIP4Address();
            int error = 0;

            int appid = 0;
            AbstractUserInfo userInfo = UserCenter.UserInfo().UserLogOn(userName, psw, 0, false, serverIP, loginIP, false, ref error);
            if (error == 0)
            {
                this.rememeberCookiesForUserName();
                //re session
                WebUserInfo user = new WebUserInfo();
                user = WebCommon.RembSession(user, appid, userInfo.I, userName, psw, userInfo.N, userInfo.H, user.Lv, userInfo.G, userInfo.UT, userInfo.RL);
                user = WebCommon.UpdateUserAcount(user, userInfo.A);
                user.MsgCount = UserCenter.UserMessage().GetUnReadMessageCount(user.UserID);
                Session["UserInfo"] = user;
                //
                //base.SalesExpireVerify(user.UserID, user.UserName, user.NickName);
                //
                GotoCMOP(user.UserName, user.NickName);
                //
                if (Session["topUrl"] != null)
                {
                    string str = Session["topUrl"] as string;
                    Response.Redirect(str, true);
                }
                if (null != Request.Params["bbsToUrl"] && !string.IsNullOrEmpty(Request.Params["bbsToUrl"].ToString()))
                {
                    Response.Redirect("tcjjgbbs.aspx?bbsToUrl=" + Server.UrlEncode(Request.Params["bbsToUrl"].ToString()), true);
                }
                Response.Redirect("~/", true);
            }
            else
            {
                if (error == -403)
                {
                    this.Label1.Text = "用户已被锁定";
                }
                else if (error == -407)
                {
                    this.Label1.Text = "此IP地址已经被禁止登录";
                }
                else
                {
                    this.Label1.Text = "帐号或密码错误，请重试...";
                }
                this.BtnLogin.Enabled = true;
                this.txtPsw.Focus();

                return; //login is lost!!
            }
        }
        catch (System.Threading.ThreadAbortException tx)
        {
        }
        catch (Exception ex)
        {
            //PublicClass.WriteErrLog("userlogin error 1:" + e1.Message);
            FFJJG.Server.Utils.Logging.write(ex);
            return;
        }
    }
    /// <summary>
    /// load userName from cookies
    /// </summary>
    private void loadUserNameFromCookies()
    {
        try
        {
            if (null != Request.Cookies["54jjguserlogin"])
            {
                string un = Request.Cookies["54jjguserlogin"]["username"];
                un = HttpUtility.UrlDecode(un);
                if (!string.IsNullOrEmpty(un))
                {
                    this.txtUserName.Text = un;
                    this.RememberMe.Checked = true;
                }
            }
        }
        catch (HttpException)
        {
        }
    }
    /// <summary>
    /// rememeber userName use Cookies
    /// </summary>
    private void rememeberCookiesForUserName()
    {
        try
        {
            if (this.RememberMe.Checked)
            {
                HttpCookie cookie = new HttpCookie("54jjguserlogin");
                cookie.Values["username"] = HttpUtility.UrlEncode(this.txtUserName.Text);
                cookie.Expires = DateTime.Now.AddDays(10d);
                Response.Cookies.Add(cookie);
            }
            else
            {
                HttpCookie cookie = new HttpCookie("54jjguserlogin");
                cookie.Values.Clear();
                cookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(cookie);
            }
        }
        catch (Exception)
        {

        }
    }
}