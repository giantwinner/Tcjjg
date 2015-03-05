using System;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using Static.Common.Operation;
using FFJJG.UserCenter.Biz;
using FFJJG.Common.UserCenter;
using System.Collections.Generic;

public partial class RequestWebservice_User_SeleMessage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";
        Response.CacheControl = "no-cache";
        Request.ContentEncoding = System.Text.Encoding.GetEncoding("GB2312");
        //接收到的参数
        string strPageIndex = string.IsNullOrEmpty(Request.QueryString.Get("pi")) ? "1" : Request.QueryString.Get("pi");
        string strPageCount = string.IsNullOrEmpty(Request.QueryString.Get("pc")) ? "5" : Request.QueryString.Get("pc");
        //MsgID//1:私人消息;2:系统消息//0：未读；1：已读。
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        string returnXML = string.Empty;
        string pageXML = string.Empty;
        //
        if (null != user && CommonOperation.IsNumInt32(strPageIndex) && CommonOperation.IsNumInt32(strPageCount))
        {
            int pageIndex = Convert.ToInt32(strPageIndex);
            int pageCount = Convert.ToInt32(strPageCount);
            int? opePageTotal = 0;
            //UserSeleMessage
            ListMsgTmp listMsgTmp = UserCenter.UserMessage().GetUserMessage(user.UserID, pageCount, pageIndex);
            //
            if (listMsgTmp.RCount % pageCount == 0)
            {
                opePageTotal = listMsgTmp.RCount / pageCount;
            }
            else
            {
                opePageTotal = (listMsgTmp.RCount / pageCount) + 1;
            }
            //
            List<UM> listUM = new List<UM>();
            if (null != listMsgTmp && null != listMsgTmp.ls)
            {
                foreach (var item in listMsgTmp.ls)
                {
                    UM um = new UM();
                    um.I = item.MsgID.ToString();
                    um.D = item.SendTime.ToString();
                    um.C = string.IsNullOrEmpty(item.Title) ? "-1" : item.Title;
                    um.M = "-1";
                    um.S = item.IsReaded.ToString();
                    um.T = item.Type.ToString();
                    listUM.Add(um);
                }
            }
            returnXML = MashMessage.Removexmlns(MashMessage.SerializeToString(listUM));
            //
            pageXML = "<pi>" + strPageIndex + "</pi><pt>" + opePageTotal + "</pt>";
            //
            user.MsgCount = UserCenter.UserMessage().GetUnReadMessageCount(user.UserID);
            Session["UserInfo"] = user;
        }
        Response.Write("<response>" + returnXML + pageXML + "</response>");
        Response.End();
    }
}
