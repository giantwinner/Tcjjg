using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Net;

using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using FFJJG.Common.UserCenter;

/// <summary>
///BasePage 的摘要说明
/// </summary>

public class BasePage : System.Web.UI.Page
{
    public BasePage()
    {
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        //已经登录
        if (Session["UserInfo"] != null) return;
        //没有登录
        if (Request.Url != null)
        {
            Session["topUrl"] = Request.Url.ToString();
        }
        Response.Redirect("~/UserCenter/UserLogin.aspx", true);
    }
}
