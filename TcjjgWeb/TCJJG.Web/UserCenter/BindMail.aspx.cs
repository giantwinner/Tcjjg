using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using System.Net.Mail;
using System.Net;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;

public partial class UserCenter_BindMail : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            CheckIsBinding();
            ValidCallBack();
        }
    }
    private void CheckIsBinding()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        FFJJG.Common.UserCenter.UserAmplyInfo userAmply = new FFJJG.Common.UserCenter.UserAmplyInfo();
        try
        {
            userAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);
            if (!string.IsNullOrEmpty(userAmply.E))
            {
                pnel.Visible = false;
                pnel2.Visible = true;
                lblBindMailMsg.Text = "你的绑定邮箱为：" + userAmply.E.ToString().Substring(0, 3) + "*****@" + userAmply.E.ToString().Split('@')[1];
                //破产补偿
                UserCenter.UserInfo().GuidePartLog_Add(userInfo.UserID, 3);
            }
            else
            {
                pnel.Visible = true;
                pnel2.Visible = false;
            }
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write("绑定邮箱", ex.Message, true);
        }

    }
    private void ValidCallBack()
    {
        if (null != Request.QueryString["s"])
        {
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
            string returnSalt = Request.QueryString["s"].ToString();
            string userEmail = Request.QueryString["e"].ToString();
            if (returnSalt == Convert.ToString(Session["salt"]))
            {
                try
                {
                    if (UserCenter.UserInfo().UpdateUserEmail(userInfo.UserID, userEmail))
                    {
                        CheckIsBinding();
                        lblMsg.Text = "绑定成功！";

                        //破产补偿
                        UserCenter.UserInfo().GuidePartLog_Add(userInfo.UserID, 3);
                    }
                    else
                    {
                        lblMsg.Text = "绑定失败！";
                    }
                }
                catch (Exception ex)
                {

                    FFJJG.Server.Utils.Logging.write("绑定邮箱失败", ex.Message, true);
                }

            }
        }
    }

    protected void BtnBinding_Click(object sender, EventArgs e)
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        string salt = userInfo.UserID.ToString() + userInfo.Password;
        salt = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(salt, "MD5").ToLower();
        //发送邮件
        string userEmail = txtEmail.Text.Trim();
        string officialEmai = WebCommon.GetFFJJGWebXML("ffjjgweb/", "BingEMail/Email");
        string officialpwd = WebCommon.GetFFJJGWebXML("ffjjgweb/", "BingEMail/EmailPassWord");
        string callBackUrl = WebCommon.GetFFJJGWebXML("ffjjgweb/", "BingEMail/CallBackUrl") + "?e=" + userEmail + "&s=" + salt;

        MailAddress from = new MailAddress(officialEmai);
        MailAddress to = new MailAddress(userEmail);
        MailMessage msg = new MailMessage(from, to);//定义一封邮件，参数是发件人地址和收件人地址           
        msg.Subject = "tcjjg邮箱绑定";//邮件的主题            
        msg.IsBodyHtml = true;//邮件是否为HTML格式的            
        msg.Body = "请点击以下链接进行绑定<br />" + callBackUrl;

        try
        {
            SmtpClient objEmail = new SmtpClient("smtp.163.com"); //SMTP服务器主机名，比如GMail的smtp.gmail.com            
            objEmail.Credentials = new NetworkCredential(officialEmai, officialpwd);
            objEmail.EnableSsl = true; //是否启用加密连接，GMail的邮箱必须用加密，其他不支持的邮箱用false objEmail.Send(Msg);
            objEmail.Send(msg);
            Session["salt"] = salt;
            BtnBinding.Enabled = false;
            lblMsg.Text = "邮件已发送，请注意查收您的邮箱...";
        }
        catch (Exception ex)
        {
            lblMsg.Text = "邮件发送失败~,请检查您的邮箱是否正确。";
            FFJJG.Server.Utils.Logging.write("邮件发送失败", ex.Message, true);
        }

    }
}