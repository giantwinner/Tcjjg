using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;

public partial class HallPage_HallPage : BasePage
{
    //string uid = "", pwd = "", appid = "0",istaste="1";
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (!IsPostBack)
        //{
        //    if (Session["UserInfo"] != null)
        //    {
        //        WebUserInfo userWeb = Session["UserInfo"] as WebUserInfo;
        //        uid = userWeb.UserName;
        //        pwd = userWeb.Password;
        //        UserInfoSvcClient uin = new UserInfoSvcClient();

        //       // uin.GetUserIsPayUser(userInfo.UserID)
        //        istaste =  uin.GetUserIsPayUser(userWeb.UserID).ToString();
        //        appid = userWeb.AppID.ToString();
        //    }
        //    else
        //    {
        //        Response.Redirect("~/UserCenter/UserLogin.aspx");
        //    }
        //    this.hdUid.Value = uid;
        //    this.hdUpwd.Value = pwd;
        //    this.hdAppID.Value = appid;
        //    this.hdIsTaste.Value = istaste;
        //}
        Response.Redirect("~/HallPage/HallPageFL.aspx", true);
    }
}
