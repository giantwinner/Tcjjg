using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;

public partial class UserCenter_IdentifyHeadImg_Validate : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    #region 头像认证
    protected void btnBeginIdentify_Click(object sender, EventArgs e)
    {
        BeoforeIdentifyHead();
    }
    private void BeoforeIdentifyHead()
    {
        WebUserInfo userInfo = (WebUserInfo)Session["UserInfo"];
        try
        {
            FFJJG.Common.UserCenter.UserAmplyInfo userInfoAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);
            if (string.IsNullOrEmpty(userInfoAmply.J) || string.IsNullOrEmpty(userInfoAmply.B) || string.IsNullOrEmpty(userInfoAmply.RM)|| string.IsNullOrEmpty(userInfoAmply.C))
            {
                lblVIPMsg.Text = "您的资料部分填写不完整";
                return;
            }
            Session["IdenHeadPass"] = 1;
            Response.Redirect("~/UserCenter/IdentifyHeadImg.aspx", true);
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write("头像认证验证", ex.Message, true);
        }

    }
    #endregion
}