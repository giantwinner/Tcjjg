using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;
using TCJJG.Web.DB;

public partial class Spread_SpreadIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoginVerify();
        }
    }
    protected void LoginVerify()
    {
        //按状态绑定样式、模板
        lbReward.Text = "奖励制度";
        lbReward.Style.Add(HtmlTextWriterStyle.Color, "rgb(53,53,53)");
        lbWhySpread.Style.Add(HtmlTextWriterStyle.Color, "rgb(53,53,53)");

        if (Session["UserInfo"] != null)
        {//已登录
            pLoginYes.Visible = true;
            pLoginNo.Visible = false;
            lbReward.Text = "推广员可以获得那些奖励";
            lbReward.Style.Add(HtmlTextWriterStyle.Color, "rgb(53,53,53)");
            lbWhySpread.Style.Add(HtmlTextWriterStyle.Color, "rgb(53,53,53)");
            //  
            BindInfo();
        }
    }

    /// <summary>
    /// 绑定用户信息
    /// </summary>
    protected void BindInfo()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        //List<proc_userInfo_U_selResult> uiSel = spread.proc_userInfo_U_sel(userInfo.UserID).ToList();
        var uiSel = WSClient.SpreadWS().GetSpreadUserInfo(userInfo.UserID);
        LabNickName.Text = userInfo.UserName;
        LabSpreadNumber.Text = uiSel[0].SpreadNumber.ToString();
        LabSpreadCount.Text = (uiSel[0].SpreadCountLevel1 + uiSel[0].SpreadCountLevel2).ToString();
        txtSpreadURL.Text = System.Configuration.ConfigurationManager.AppSettings["SpUrl"] + uiSel[0].SpreadNumber;
        //
        //List<proc_Reward_sel_CountResult> rSC = spread.proc_Reward_sel_Count(userInfo.UserID).ToList();
        var rSC = WSClient.SpreadWS().GetSpreadRewardCount(userInfo.UserID);
        LabRewardCount.Text = rSC[1].Amount.ToString() == "" ? "0" : rSC[1].Amount.ToString();
    }
}