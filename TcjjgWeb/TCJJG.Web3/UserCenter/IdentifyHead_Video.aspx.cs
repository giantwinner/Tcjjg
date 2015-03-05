using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Biz;
using FFJJG.Common.UserCenter;

public partial class UserCenter_IdentifyHead_Video : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (null == Session["IdenHeadPass"])
            {
                Response.Redirect("~/UserCenter/Default.aspx", true);
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

        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        int deductionsAmount = Convert.ToInt32(WebCommon.GetFFJJGWebXML("ffjjgweb/HeadImgIdentify/", "Video"));
        foreach (var item in userInfo.Lua)
        {
            if (item.Ti == 4)
            {
                if (item.Ac <deductionsAmount )
                {
                    lblMsg.Text = "您的账户余额不足~";
                    return;
                }
            }
        }
        if (Deductions(deductionsAmount, userInfo))
        {
            string identifyInfo = "QQ：" + txtQQ.Text + "；预约时间：" + date.AddHours(Convert.ToDouble(ddlHour.SelectedValue)).AddMinutes(Convert.ToDouble(ddlMini.SelectedValue));
            bool result = InsertIdentifyInfo(2, identifyInfo);
            if (result == true)
            {
                lblMsg.Text = "提交成功，我们的工作人员会按照您的预约时间与您取得联系。";
            }
            else
            {
                lblMsg.Text = "提交失败！";
            }
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
        userAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);

        int age = DateTime.Now.Year - Convert.ToDateTime(userAmply.B).Year;
        return WSClient.SocialCenterWS().AddHeadImgIdentify(userInfo.UserID, DateTime.Now, identifyType, 0, identifyInfo, "", userInfo.NickName, age, userAmply.G, userInfo.HeadID);
    }
    /// <summary>
    /// 扣费
    /// </summary>
    /// <param name="amount"></param>
    private bool Deductions(int amount, WebUserInfo userInfo)
    {
        List<AcountInfo> lai = new List<AcountInfo>();
        AcountInfo ai = new AcountInfo();
        ai.A = amount;
        ai.T = 4;
        ai.N = "金币";
        lai.Add(ai);

        int gameID = 0; int items = 1; SubItem subitm = SubItem.siDeduct;
        string matchName = string.Empty;
        string memo = userInfo.UserName + "进行头像认证，系统扣除" + ai.N + ai.A;

        RichDirection direction = RichDirection.drOut;
        int costRelationType = 0; string key = string.Empty;
        int matchID = 0; int matchNum = 0;
        //
        int result = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, userInfo.UserID, lai.ToArray(), costRelationType, key, matchID, matchNum);
        if (result < 0)
        {
            if (result == -408)
            {
                this.lblMsg.Text = "您的账户余额不足";
            }
            else
            {
                this.lblMsg.Text = "扣除金币错误，请联系管理员";
            }
            return false;
        }
        return true;
    }
}