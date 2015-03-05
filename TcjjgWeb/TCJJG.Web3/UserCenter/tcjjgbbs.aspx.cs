using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.IO;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;

public partial class UserCenter_tcjjgbbs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
            if (null == userInfo)
            {
                if (!string.IsNullOrEmpty(Request.Params["bbsReq"]))//论坛到主站。
                {
                    if (Request.Params["bbsReq"].ToString() == "login")
                    {
                        BBSToTcjjg_Login_NoSession();
                    }
                    else if (Request.Params["bbsReq"].ToString() == "reg")
                    {
                        BBSToTcjjg_Reg_NoSession();
                    }
                    else if (Request.Params["bbsReq"].ToString() == "logout")
                    {
                        BBSToTcjjg_Logout_NoSession();
                    }
                }
                else if (!string.IsNullOrEmpty(Request.Params["BBSUserLogout"]))//主站到论坛。
                {
                    TcjjgToBBS_Logout_NoSession();
                }
                else //主站到论坛。
                {
                    TcjjgToBBS_Index_NoSession();
                }
            }
            else if (!string.IsNullOrEmpty(Request.Params["bbsReq"]) && Request.Params["bbsReq"].ToString() == "logout")
            {
                BBSToTcjjg_Logout_NoSession();
            }
            else
            {
                //主站到论坛。
                TcjjgToBBS_Login(userInfo.UserName, userInfo.Password);
            }
        }
    }

    private string DNTBBSUrlTc = WebCommon.GetFFJJGWebXML("ffjjgweb/", "DNTBBSUrlTc");

    private void TcjjgToBBS_Login(string userName, string passWord)
    {
        string str = string.Empty;
        if (!string.IsNullOrEmpty(Request.Params["bbsToUrl"]))
        {
            str = Server.UrlEncode(Request.Params["bbsToUrl"].ToString());
        }
        Response.Redirect(DNTBBSUrlTc + "/tcjjgbbs.aspx?m=BBSUserLoginReg&userName="
            + Server.UrlEncode(userName) + "&passWord=" + Server.UrlEncode(passWord) + "&bbsToUrl=" + str, true);
    }

    private void TcjjgToBBS_Logout_NoSession()
    {
        Response.Redirect(DNTBBSUrlTc + "/tcjjgbbs.aspx?m=BBSUserLogout", true);
    }

    private void TcjjgToBBS_Index_NoSession()
    {
        Response.Redirect(DNTBBSUrlTc + "/tcjjgbbs.aspx?m=BBSIndex", true);
    }

    private void BBSToTcjjg_Login_NoSession()
    {
        string str = string.Empty;
        if (!string.IsNullOrEmpty(Request.Params["bbsToUrl"]))
        {
            str = Server.UrlEncode(Request.Params["bbsToUrl"].ToString());
        }
        Response.Redirect("userlogin.aspx?bbsToUrl=" + str, true);
    }

    private void BBSToTcjjg_Reg_NoSession()
    {
        string str = string.Empty;
        if (!string.IsNullOrEmpty(Request.Params["bbsToUrl"]))
        {
            str = Server.UrlEncode(Request.Params["bbsToUrl"].ToString());
        }
        Response.Redirect("userreg.aspx?bbsToUrl=" + str, true);
    }

    private void BBSToTcjjg_Logout_NoSession()
    {
        Response.Redirect("userlogout.aspx?bbsToUrl=bbsToUrl", true);
    }
}