﻿using System;
using TCJJG.Web.Model;
using System.Text;
using System.Collections.Specialized;
using System.IO;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;
using Static.Common.Operation;
using System.Collections;

public partial class RequestWebservice_User_Head : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";
        Response.CacheControl = "no-cache";
        Byte[] bytes = Request.BinaryRead(Request.ContentLength);
        NameValueCollection req = CommonOperation.FillFromEncodedBytes(bytes, Encoding.UTF8);
        //
        string h = req.Get("h");
        string s = req.Get("s");
        int si = 1;
        if (s == "s2") si = 2;
        //
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        if (string.IsNullOrEmpty(h) || h.Length > 10)//该值有可能是".xxx.com/Image",为图片还未加载完bug
        {
            h = user.HeadID;
        }
        else
        {
            string iurl_hu = WebCommon.GetFFJJGWebXML("ffjjgweb/", "ImgServerURL") + "/images/hu/";
            h = iurl_hu + h;
            //delete old upload head
            if (!WSClient.ImageService().DeleteHeadImage("/images/hb/" + CommonOperation.GetFileName(user.HeadID)))
            {
                FFJJG.Server.Utils.Logging.write("", " 删除原有头像失败！", false);
            }
            if (!WSClient.ImageService().DeleteHeadImage("/images/hs/" + CommonOperation.GetFileName(user.HeadID)))
            {
                FFJJG.Server.Utils.Logging.write("", " 删除原有头像失败！", false);
            }
        }
        user.HeadID = this.updateUserHead(user.UserID, h, si);
        if (user.HeadID == h)
        {
            try
            {
                //检查用户是否已经更换认证头像，如果更换则删除认证标志
                bool isdelHeadVIP = WSClient.SocialCenterWS().HeadIdentifyIsChange(user.UserID);
                if (isdelHeadVIP)
                {
                    UserInfoSvcClient uin = new UserInfoSvcClient();
                    uin.RemoveRole(user.UserID, 10003);
                    ArrayList ar = new ArrayList(user.Roles);
                    ar.Remove("10003");
                    user.Roles = (string[])ar.ToArray(typeof(string));
                    Session["UserInfo"] = user;
                }
            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
            }

        }
        user.Sex = si;
        Response.Write("<response><hp>1</hp></response>");
        Response.End();
    }

    /// <summary>
    /// return 1 更新成功.return -412 更新失败，不存在该用户.return -404 数据库异常
    /// </summary>
    /// <param name="userID"></param>
    /// <param name="headID"></param>
    /// <param name="sex"></param>
    /// <returns></returns>
    private string updateUserHead(Guid userID, string headID, int sex)
    {
        return UserCenter.UserInfo().F_UserUpdateHead(userID, headID, sex);
    }
}
