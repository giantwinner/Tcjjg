using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using System.IO;
using Static.Common.Operation;

public partial class UserCenter_UpdateHeadPortrait : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ui = Session["UserInfo"] as WebUserInfo;
        if (!IsPostBack)
        {
            foreach (string item in ui.Roles)
            {
                if (item == "10003")
                {
                    headR.Visible = true;
                    lblRoles.Text = "10003";
                }
            }

            //大厅链接到头像认证
            if (Request.QueryString["vip"] != null)
            {
                ScriptManager.RegisterStartupScript(this.Page, GetType(), "uploadsetcss", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >tap3click();</script>", false);

            }

            FFJJG.Common.UserCenter.UserAmplyInfo uai = UserCenter.UserInfo().F_SelectUserInfoAmply(ui.UserID);
            img_CurrentHeadImage.ImageUrl = ui.HeadID + "?temp=" + DateTime.Now.Millisecond.ToString();
            if (string.IsNullOrEmpty(Convert.ToString(ui.Sex)))
            {
                DivSex.InnerText = "1";
            }
            else
            {
                DivSex.InnerText = Convert.ToString(ui.Sex);
            }
        }
        //
    }
    /// <summary>
    /// 前台界面调用，获得图片服务器地址
    /// </summary>
    /// <returns></returns>
    public string GetImgServerURL()
    {
        string ImgServerURL = WebCommon.GetFFJJGWebXML("ffjjgweb/", "ImgServerURL");
        return ImgServerURL;
    }

    private WebUserInfo ui = null;


    /// <summary>
    /// 回发通知界面
    /// </summary>
    /// <param name="ty"></param>
    private void upLoadSetCss()
    {
        ScriptManager.RegisterStartupScript(this.Page, GetType(), "uploadsetcss", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >tap2click();</script>", false);
    }

    /// <summary>
    /// 修改头像更新数据库
    /// </summary>
    /// <param name="headID"></param>
    private void UpdateHead(string headID)
    {
        ui.HeadID = UserCenter.UserInfo().F_UserUpdateHead(ui.UserID, headID, ui.Sex);
    }


}