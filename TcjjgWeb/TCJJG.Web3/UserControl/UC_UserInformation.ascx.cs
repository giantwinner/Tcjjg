using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;

public partial class UserControl_UC_UserInformation : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindUserInfo();
    }

    private void BindUserInfo()
    {
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        AcountInfo[] new_UserAcount = UserCenter.UserAcount().GetUserAccount(user.UserID);
        user = WebCommon.UpdateUserAcount(user, new_UserAcount);
        lblNickName.Text = user.NickName;
        imgUserHead.ImageUrl = user.HeadID;
        foreach(var item in user.Lua)
        {
            switch (item.Ti)
            {
                case 1:
                    lblYuanBao.Text = item.Ac.ToString();
                    break;
                case 4:
                    lblGold.Text = item.Ac.ToString();
                    break;
            }
        }
    }
}