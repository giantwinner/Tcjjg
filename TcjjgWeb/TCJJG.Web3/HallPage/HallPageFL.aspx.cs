using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;

public partial class HallPage_HallPageFL : BasePage
{
    string uid = "", pwd = "", appid = "0", istaste = "1";
    string nickName="", type1="", type4="";
    int userType = 0;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            if (Session["UserInfo"] != null)
            {
                WebUserInfo userWeb = Session["UserInfo"] as WebUserInfo;
                uid = userWeb.UserName;
                pwd = userWeb.Password;

                UserAreaInfo UserArea2 = UserCenter.UserInfo().GetUserAreaInfo(userWeb.UserName);
                nickName = UserArea2.NickName;
                UserInfoSvcClient uin = new UserInfoSvcClient();

                // uin.GetUserIsPayUser(userInfo.UserID)
                istaste = uin.GetUserIsPayUser(userWeb.UserID).ToString();
                appid = userWeb.AppID.ToString();

                AcountInfo[] new_UserAcount = UserCenter.UserAcount().GetAllUserAccount(userWeb.UserID);
               // userInfo = WebCommon.UpdateUserAcount(userInfo, new_UserAcount);

                foreach (var item in new_UserAcount)
                {
                    if (item.T == 1)
                    {
                        type1 = item.A.ToString();
                    }
                    if (item.T == 4)
                    {
                        type4 = item.A.ToString();
                    }
                }


                UserProperty[] aup1 = UserCenter.UserInfo().GetUserProperty(userWeb.AppID, userWeb.UserName);
                
                foreach (var t in aup1)
                {
                    userType = t.UserType;
                }
            }
            else
            {
                Response.Redirect("~/UserCenter/UserLogin.aspx");
            }
            this.hdUid.Value = uid;
            this.hdUpwd.Value = pwd;
            this.hdAppID.Value = appid;
            this.hdIsTaste.Value = istaste;
            this.hdUserType.Value = Convert.ToString(userType==4?1:0);
            if (string.IsNullOrEmpty(type1))
            {
                this.hdType1.Value = "0";
            }
            else
            {
                this.hdType1.Value = type1;
            }
            if (string.IsNullOrEmpty(type4))
            {
                 this.hdType4.Value = "0";
            }
            else
            {
                this.hdType4.Value = type4;
            }
            this.hdNickName.Value = nickName;
        }
    }
}
