using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using System.Web.Script.Serialization;
using TCJJG.Web.Biz;
using System.Net;

public partial class Ajax_Ajax_ValidataPassWord : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ValidataPassWord();
    }
    private void ValidataPassWord()
    {
        string SuserID = Request.Params["UserID"];
        if (string.IsNullOrEmpty(SuserID))
        {
            return;
        }
        Guid userID = new Guid(SuserID);
        string pOld = Request.Params["PwdOld"];
        string pNew = Request.Params["PwdNew"];
        string pNew2 = Request.Params["PwdNew2"];
        if (userID != null && pOld != null && pNew != null && pNew2 != null)
        {
            string pwdOld = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pOld, "MD5").ToLower();
            string pwdNew = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pNew, "MD5").ToLower();
            string pwdNew2 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(pNew2, "MD5").ToLower();
            int i = UserCenter.UserInfo().UpdatePassWord(userID, pwdOld, pwdNew, pwdNew2);
            //更新论坛密码zhangsw-2012年6月30日 12:50:48
            WebUserInfo webUserInfo = Session["UserInfo"] as WebUserInfo;
            if (null != webUserInfo)
            {
                if (i == 0)
                {
                    //更新session中的密码
                    webUserInfo.Password = pwdNew;
                    //张守文2013年1月31日 18:06:57,修改论坛密码
                    string str = WebCommon.GetFFJJGWebXML("ffjjgweb/", "DNTBBSUrlTc") + "/tcjjgbbs.aspx?m=BBSUserChangePsw&userName="
        + Server.UrlEncode(webUserInfo.UserName) + "&passWord=" + Server.UrlEncode(pwdNew);
                    HttpWebRequest htreq = (HttpWebRequest)WebRequest.Create(str);
                    htreq.GetResponse();
                }
            }
            Response.Write(i);
            Response.End();
        }
        else
        {
            Response.Write(-3);
            Response.End();
        }
    }
}