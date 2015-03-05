using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.UserCenter;
using System.Net.Mail;
using TCJJG.Web.Biz;
using System.Net;
using System.IO;
using System.Text;

public partial class UserCenter_FindPassWordStep3 : System.Web.UI.Page
{
    private static string ReqURL_SendSms = WebCommon.GetFFJJGWebXML("ffjjgweb/", "SendSMS/ReqURL_SendSms");
    private static string un = WebCommon.GetFFJJGWebXML("ffjjgweb/", "SendSMS/un");
    private static string fpwd = WebCommon.GetFFJJGWebXML("ffjjgweb/", "SendSMS/pwd");

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                BindUserBinding();
            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
            }

        }
    }
    private void BindUserBinding()
    {
        if (null != Request.QueryString["t"])
        {
            string type = Request.QueryString["t"].ToString();

            if (null != Session["FindUser"])
            {
                string userName = Session["FindUser"].ToString();
                Session.Remove("FindUser");
                Guid userID = UserCenter.UserInfo().GetUserIDByUserName(userName, 0);
                FFJJG.Common.UserCenter.UserAmplyInfo userAmply = new FFJJG.Common.UserCenter.UserAmplyInfo();
                userAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userID);
                if (type == "m")
                {
                    pnelMail.Visible = true;
                    pnelPhone.Visible = false;
                    if (!string.IsNullOrEmpty(userAmply.E))
                    {
                        SendMail(userAmply.E, userID, userName);
                    }
                    else
                    {
                        lblmail.Text = "您还未绑定邮箱！";
                    }
                }
                else if (type == "p")
                {
                    pnelMail.Visible = false;
                    pnelPhone.Visible = true;
                    if (!string.IsNullOrEmpty(userAmply.M))
                    {
                        SendMsg(userID, userName, userAmply.M);
                    }
                    else
                    {
                        lblphone.Text = "您还未绑定手机！";
                    }
                }
            }
        }
    }

    private void SendMail(string userEmail, Guid userID, string userName)
    {
        string pwd = string.Empty;
        //修改密码
        if (!ChangePwd(userID, userName, ref pwd))
        {
            lblmail.Text = "修改密码失败，请联系管理员。";
            return;
        }

        //发送邮件

        string officialEmai = WebCommon.GetFFJJGWebXML("ffjjgweb/", "BingEMail/Email");
        string officialpwd = WebCommon.GetFFJJGWebXML("ffjjgweb/", "BingEMail/EmailPassWord");

        MailAddress from = new MailAddress(officialEmai);
        MailAddress to = new MailAddress(userEmail);
        MailMessage msg = new MailMessage(from, to);//定义一封邮件，参数是发件人地址和收件人地址           
        msg.Subject = "tcjjg邮箱找回密码";//邮件的主题            
        msg.IsBodyHtml = true;//邮件是否为HTML格式的            
        msg.Body = "你申请了同城竞技馆密码重置服务，系统已将你的登录密码重置为：" + pwd + "，请尽快登录。为了你的账号安全，登录后请更改密码。[同城竞技馆]  " + DateTime.Now.ToString();

        try
        {
            SmtpClient objEmail = new SmtpClient("smtp.163.com"); //SMTP服务器主机名，比如GMail的smtp.gmail.com            
            objEmail.Credentials = new NetworkCredential(officialEmai, officialpwd);
            objEmail.EnableSsl = true; //是否启用加密连接，GMail的邮箱必须用加密，其他不支持的邮箱用false objEmail.Send(Msg);
            objEmail.Send(msg);
            lblmail.Text = "邮件已发送，请到绑定邮箱查收！";
        }
        catch (Exception ex)
        {
            lblmail.Text = "邮件发送失败~，请联系管理员";
            FFJJG.Server.Utils.Logging.write("邮件发送失败",ex.Message,true);
        }
    }

    private void SendMsg(Guid userID, string userName, string mobile)
    {
        string pwd = string.Empty;
        //修改密码
        if (!ChangePwd(userID, userName, ref pwd))
        {
            lblmail.Text = "修改密码失败，请联系管理员。";
            return;
        }

        string retValue = string.Empty;

        bool checkCount = WSClient.CMOPWebWS().CheckBindPhoneSendCount(userID);

        if (checkCount)
        {
            string msg = "系统已将你的登录密码重置为：" + pwd + "，请尽快登录。为了你的账号安全，登录后请更改密码。[同城竞技馆]";
            string errorMsg = string.Empty;
            HttpWebResponse hwr = SMS.SendSMS(ReqURL_SendSms, un, fpwd, mobile, msg, ref errorMsg);
            if (null != hwr)
            {
                StreamReader sr = new StreamReader(hwr.GetResponseStream(), Encoding.UTF8);
                retValue = sr.ReadToEnd();// result=1&
                sr.Close();
                //
                retValue = retValue.Replace("result=", "").Replace("&", "");
                if (Convert.ToInt32(retValue) < 0)
                {
                    lblphone.Text = "短信接口异常请联系管理员 error：" + retValue;
                }
                else
                {
                    lblphone.Text = "短信已发送，请注意查收！";
                }
            }
            else
            {
                lblphone.Text = "短信接口异常请联系管理员";
            }
        }
        else
        {
            lblphone.Text = "今天获取验证码已经到3次";
        }
    }

    private string GetRandomPwd(int num)//生成随机密码
    {
        string a = "0123456789";
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < num; i++)
        {
            sb.Append(a[new Random(Guid.NewGuid().GetHashCode()).Next(0, a.Length - 1)]);
        }
        return sb.ToString();
    }
    private bool ChangePwd(Guid userID, string userName, ref string pwd)
    {
        bool result = false;
        string pwdOld = UserCenter.UserInfo().GetUserPwd(userName, 0);
        string pwdNew = GetRandomPwd(8);
        pwd = pwdNew;
        pwdNew = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pwdNew, "MD5").ToLower();

        int i = UserCenter.UserInfo().UpdatePassWord(userID, pwdOld, pwdNew, pwdNew);

        if (i == 0)
        {
            //张守文2013年1月31日 18:06:57,修改论坛密码
            string str = WebCommon.GetFFJJGWebXML("ffjjgweb/", "DNTBBSUrlTc") + "/tcjjgbbs.aspx?m=BBSUserChangePsw&userName="
+ Server.UrlEncode(userName) + "&passWord=" + Server.UrlEncode(pwdNew);
            HttpWebRequest htreq = (HttpWebRequest)WebRequest.Create(str);
            htreq.GetResponse();
            result = true;
        }
        return result;
    }
}