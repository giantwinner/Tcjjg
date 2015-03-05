using System;
using System.Web.UI;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;

public partial class UserCenter_UserInfo : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;

            AcountInfo[] new_UserAcount = UserCenter.UserAcount().GetUserAccount(userInfo.UserID);
            userInfo = WebCommon.UpdateUserAcount(userInfo, new_UserAcount);

            foreach (var item in userInfo.Lua)
            {
                if (item.Ti == 3)
                {
                    lblBonus.Text = item.Ac.ToString();
                }
                if (item.Ti == 4)
                {
                    lblGold.Text = item.Ac.ToString();
                }
                if (item.Ti == 6)
                {
                    lblExperience.Text = item.Ac.ToString();
                }
            }
            lblLevel.Text = userInfo.Lv;
            lblNick.Text = userInfo.NickName;
            lblSpread.Text = userInfo.UserName;
            imgHead.ImageUrl = userInfo.HeadID;

            BindUserInfo();
        }
    }

    private void BindUserInfo()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        FFJJG.Common.UserCenter.UserAmplyInfo user = new FFJJG.Common.UserCenter.UserAmplyInfo();
        user = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);
        lblName.Text = user.RM;
        lblJob.Text = user.J;
        lblBirthday.Text = user.B;
        lblMovePhone.Text = user.M;
        if (user.G == 2)
        {
            lblGender.Text = "女";
        }
        else
        {
            lblGender.Text = "男";
        }
    }
}