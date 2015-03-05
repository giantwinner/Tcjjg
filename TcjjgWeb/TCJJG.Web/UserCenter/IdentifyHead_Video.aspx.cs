using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;

public partial class UserCenter_IdentifyHead_Video : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (null == Session["IdenHeadPass"])
            {
                Response.Redirect("~/UserCenter/UpdateHeadPortrait.aspx", true);
            }
            txtDate.Attributes.Add("readonly", "true");
        }
    }
    protected void btnSubmit2_Click(object sender, EventArgs e)
    {
        #region 验证预约时间
        if (string.IsNullOrEmpty(txtDate.Text))
        {
            lblMsg.Text = "请选择预约时间";
            return;
        }
        DateTime date = Convert.ToDateTime(txtDate.Text);
        DayOfWeek dw = date.DayOfWeek;
        if (date > DateTime.Now.AddDays(3) || date.AddHours(Convert.ToDouble(ddlHour.SelectedValue)).AddMinutes(Convert.ToDouble(ddlMini.SelectedValue)) < DateTime.Now)
        {
            lblMsg.Text = "系统只接受3日内的预约!";
            return;
        }
        if (dw == DayOfWeek.Saturday || dw == DayOfWeek.Sunday)
        {
            lblMsg.Text = "请选择周一至周五！";
            return;
        }
        #endregion

        string identifyInfo = "QQ：" + txtQQ.Text + "；预约时间：" + date.AddHours(Convert.ToDouble(ddlHour.SelectedValue)).AddMinutes(Convert.ToDouble(ddlMini.SelectedValue));
        bool result = InsertIdentifyInfo(2, identifyInfo);
        if (result == true)
        {
            lblMsg.Text = "提交成功，我们的工作人员会按照您的预约时间与您取得联系。";
            btnSubmit2.Enabled = false;
        }
        else
        {
            lblMsg.Text = "提交失败！";
        }
    }
    /// <summary>
    /// 插入头像验证信息
    /// </summary>
    /// <param name="identifyType"></param>
    /// <param name="identifyInfo"></param>
    /// <returns></returns>
    private bool InsertIdentifyInfo(int identifyType, string identifyInfo)
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        FFJJG.Common.UserCenter.UserAmplyInfo userAmply = new FFJJG.Common.UserCenter.UserAmplyInfo();
        try
        {
            userAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);

            int age = DateTime.Now.Year - Convert.ToDateTime(userAmply.B).Year;
            return WSClient.SocialCenterWS().AddHeadImgIdentify(userInfo.UserID, DateTime.Now, identifyType, 0, identifyInfo, "", userInfo.NickName, age, userAmply.G, userInfo.HeadID);

        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write("插入头像验证信息", ex.Message, true);
            return false;
        }

    }
}