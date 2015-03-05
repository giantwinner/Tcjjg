using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Biz;

/// <summary>
///BasePageDL 的摘要说明
/// </summary>
public class BasePageIB : BasePage
{
    public BasePageIB()
    {
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        //
        TCJJG.Web.Model.WebUserInfo userInfo = Session["UserInfo"] as TCJJG.Web.Model.WebUserInfo;
        //
        if (Session["UserAreaInfo"] == null)
        {
            Session["UserAreaInfo"] = UserCenter.UserInfo().GetUserAreaInfo(userInfo.UserName);
        }
    }

    //protected bool IsRoles(int rolesID)
    //{
    //    bool returnValue = false;
    //    TCJJG.Web.Model.WebUserInfo userInfo = Session["UserInfo"] as TCJJG.Web.Model.WebUserInfo;
    //    if (null == userInfo)
    //    {
    //        return returnValue;
    //    }
    //    for (int i = 0; i < userInfo.Roles.Length; i++)
    //    {
    //        if (userInfo.Roles[i] == rolesID.ToString())
    //        {
    //            returnValue = true;
    //            break;
    //        }
    //    }
    //    return returnValue;
    //}
    protected bool IsCityManager()
    {
        bool returnValue = false;
        TCJJG.Web.Model.WebUserInfo userInfo = Session["UserInfo"] as TCJJG.Web.Model.WebUserInfo;
        UserAreaInfo userAreaInfo = Session["UserAreaInfo"] as UserAreaInfo;
        if (userAreaInfo.CityManager !=null&&userAreaInfo.CityManager.Value == userInfo.UserID)
        {
            returnValue = true;
        }
        return returnValue;
    }
    protected bool IsPartnerManager()
    {
        bool returnValue = false;
        TCJJG.Web.Model.WebUserInfo userInfo = Session["UserInfo"] as TCJJG.Web.Model.WebUserInfo;
        UserAreaInfo userAreaInfo = Session["UserAreaInfo"] as UserAreaInfo;
        if (userAreaInfo.PartnerManager!=null&&userAreaInfo.PartnerManager.Value == userInfo.UserID)
        {
            returnValue = true;
        }
        return returnValue;
    }
    protected UserAreaInfo UserAreaInfo()
    {
        UserAreaInfo userAreaInfo = Session["UserAreaInfo"] as UserAreaInfo;
        return userAreaInfo;
    }
}