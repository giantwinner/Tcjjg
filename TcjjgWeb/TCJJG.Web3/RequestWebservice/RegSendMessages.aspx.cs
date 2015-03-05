using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Collections.Specialized;
using Static.Common.Operation;
using System.Text;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;

public partial class RequestWebservice_RegSendMessages : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        #region 发送短信前验证

        Response.ContentType = "text/xml";
        Response.CacheControl = "no-cache";
        Byte[] bytes = Request.BinaryRead(Request.ContentLength);
        NameValueCollection req = CommonOperation.FillFromEncodedBytes(bytes, Encoding.UTF8);
        //取值
        string userName = req.Get("un");
        string nickName = req.Get("nn");
        string movePhone = req.Get("mp");
        //帐号或昵称为空，直接放弃
        if (string.IsNullOrEmpty(userName) || string.IsNullOrEmpty(nickName))
        {
            Response.Write("<mi>" + -100 + "</mi>");
            return;
        }
        //手机号码不正确，直接放弃
        if (!CommonOperation.IsNum(movePhone) || movePhone.Length != 11)
        {
            Response.Write("<mi>" + -101 + "</mi>");
            return;
        }
        //一个会话只允许发送10条短信
        int sendMessage_SendCount = 0;
        if (Session["SendMessage_SendCount"] != null)
        {
            sendMessage_SendCount = Convert.ToInt32(Session["SendMessage_SendCount"].ToString());
        }
        sendMessage_SendCount += 1;
        Session["SendMessage_SendCount"] = sendMessage_SendCount;
        if (sendMessage_SendCount > 10)
        {
            Response.Write("<mi>" + -102 + "</mi>");
            return;
        }
        //一个cookies一天只允许发送10条短信
        try
        {
            if (null != Request.Cookies["tcjjgReg"])
            {
                int regSendMessageCount = Convert.ToInt32(Request.Cookies["tcjjgReg"]["regSendMessageCount"]);
                string regSendMessageTime = Request.Cookies["tcjjgReg"]["regSendMessageTime"];
                DateTime dt1 = Convert.ToDateTime(regSendMessageTime);
                DateTime dt2 = Convert.ToDateTime(DateTime.Now.ToString("yyyyMMdd"));
                if (dt1 == dt2)//今天
                {
                    regSendMessageCount += 1;
                }
                else//已过期
                {
                    regSendMessageCount = 1;
                }
                //
                HttpCookie cookie = new HttpCookie("tcjjgReg");
                cookie.Values["regSendMessageCount"] = regSendMessageCount.ToString();
                cookie.Values["regSendMessageTime"] = dt2.ToString("yyyyMMdd");
                cookie.Expires = DateTime.Now.AddDays(7d);
                Response.Cookies.Add(cookie);
                //
                if (regSendMessageCount > 10)
                {
                    Response.Write("<mi>" + -103 + "</mi>");
                    return;
                }
            }
            else
            {
                HttpCookie cookie = new HttpCookie("tcjjgReg");
                cookie.Values["regSendMessageCount"] = "1";
                cookie.Values["regSendMessageTime"] = DateTime.Now.ToString("yyyyMMdd");
                cookie.Expires = DateTime.Now.AddDays(7d);
                Response.Cookies.Add(cookie);
            }
        }
        catch (Exception e1)
        {
            PublicClass.WriteErrLog("RegSendMessages.aspx.e1:" + e1.Message);
        }
        //一个手机号码一天只允许发送10条短信（*）
        //int smv = SendMessage.SendMessageLogValidate(movePhone, CommonOperation.GetIP4Address());
        int smv = WSClient.CMOPWebWS().SendMessageLogValidate(movePhone, CommonOperation.GetIP4Address());
        if (smv == -1)
        {
            Response.Write("<mi>" + -104 + "</mi>");
            return;
        }
        //一个手机号码只允许注册两个（可配置）帐号（*）
        //SendMessageConfig smc = SendMessage.SendMessageConfigSel();
        var smc = WSClient.CMOPWebWS().SendMessageConfigSel();
        int frmp = UserCenter.UserInfo().F_RegMovePhone(movePhone, Convert.ToInt32(smc.RegCount));
        if (frmp == -1)
        {
            Response.Write("<mi>" + -105 + "</mi>");
            return;
        }

        #endregion

        #region 发送短信

        //org.SendMessages.Service1 ws = new org.SendMessages.Service1();
        //string smUid = smc.Uid;
        //string smPsw = smc.Psw;
        ////
        //string code = GenerateCheckCode();
        //Session.Add("code", code);
        //string msg = "欢迎您来到同城竞技馆，您的注册验证码为 " + code + " ，此验证码5分钟内有效。中国扑克竞技赛（CMOP）。";
        //string otime = string.Empty;//otime	定时发送,留空即时发送,格式2008-08-19 09:10:00 
        //string sm = ws.SendMessages(smUid, smPsw, movePhone, msg, otime);
        ////
        //if (!CommonOperation.IsNum(sm))
        //{
        //    PublicClass.WriteErrLog("RegSendMessages.aspx.e2:" + sm);
        //    SendMessage.SendMessageConfigUp();
        //    Response.Write("<mi>" + -300 + "</mi>");
        //    return;
        //}

        #endregion

        Response.Write("<mi>" + 0 + "</mi>");
    }

    private string GenerateCheckCode()
    {
        char[] s = new char[] { '1', '2', '3', '4', '5', '6', '7', '8', '9', '0' };
        string num = "";
        Random r = new Random();
        for (int i = 0; i < 4; i++)
        {
            num += s[r.Next(0, s.Length)].ToString().ToUpper();
        }
        return num;
    }
}
/*
--步骤--
 
将短信的帐号和密码写到数据库中，并且有是否允许使用短信注册开关（0 不使用；1 使用）

a允许发送短信注册，先验证，（下面有详细的验证），

a1验证成功，取帐号和密码发送短信，成功发送短信就结束。([0])

a2验证成功，发送短信不成功，记录日志，通知gm，更新短信发送条件为不允许，让用户输入验证码([-300])

a3验证不成功，提示用户一般性错误([-100] - [-105])

b不允许发送短信注册，让用户输入验证码

--发送短信验证--

帐号或昵称为空，直接放弃 -100
 
手机号码不正确，直接放弃 -101

一个会话只允许发送10条短信 -102

一个cookies一天只允许发送10条短信 -103

一个手机号码一天只允许发送10条短信（*）-104

一个手机号码只允许注册两个（可配置）帐号（*）-105

发送短信后，短信接口异常 -300

--注册验证--

用户中心注册接口验证，一个手机号码只允许注册两个（可配置）帐号（*）-201

--发布步骤--

修改web.config
<appSettings>
<add key="org.SendMessages.Service" value="http://service2.winic.org/Service.asmx"/>
</appSettings>

 */