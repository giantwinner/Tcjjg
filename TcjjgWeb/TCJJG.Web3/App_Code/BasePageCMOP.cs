using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;

/// <summary>
///BasePageCMOP 的摘要说明
/// </summary>
public class BasePageCMOP : System.Web.UI.Page
{
    public BasePageCMOP()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        //
        if (Session["cmop"] == null && Request.Params["cmop"] != null && Request.UrlReferrer != null)
        {
            Session["cmop"] = Request.UrlReferrer.ToString();
        }
    }

    public void GotoCMOP(string userName, string nickName)
    {
        if (Session["cmop"] != null && Session["cmop"].ToString() != string.Empty)
        {
            string url0 = Session["cmop"].ToString();
            string url1 = "";
            if (url0.IndexOf("?") > 0)
            {
                url1 = "&un=" + Server.UrlEncode(userName);
            }
            else
            {
                url1 = "?un=" + Server.UrlEncode(userName);
            }
           
            string url2 = "&nn=" + Server.UrlEncode(nickName);
            Session.Remove("cmop");
            Response.Redirect(url0 + url1 + url2, true);
        }
    }

    public void SalesExpireVerify(Guid userID, string userName, string nickName)
    {
        //竞拍过期道具验证
        int? count = 0;
        //TCJJG.Web.Biz.SalesRoom salesroom = new TCJJG.Web.Biz.SalesRoom();
        //salesroom.SalesExpireVerify(userID, userName, nickName, ref count);
        WSClient.SalesRoomWS().SalesExpireVerify(userID, userName, nickName, ref count);
        if (count > 0)
        {
            //为卖家发送通知
            Guid to = userID;
            Guid from = Guid.Empty;

            FFJJG.Common.UserCenter.MessageType messageType = FFJJG.Common.UserCenter.MessageType.mtSystem;
            string title = "竞拍物品过期通知";
            string msg = "您有" + count + "次竞拍已过期，请到商城的“我要出售”中领回";
            TCJJG.Web.UserCenter.UserCenter.UserMessage().NewMessage(to, from, messageType, title, msg);
        }
    }



}
