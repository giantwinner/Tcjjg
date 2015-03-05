using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.DB;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using Static.Common.Operation;

public partial class Spread_SpreadResults : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetDivKeyUp = "dType1";
            BinStyle();
            BinSpreadResults_Info();
        }
    }
    /// <summary>
    /// 用户推广详情
    /// </summary>
    public void BinSpreadResults_Info()
    {
        int? count = 0;
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        //List<proc_Results_sel_InfoResult> prsi = sp.proc_Results_sel_Info(userInfo.UserID, AspNetPager2.PageSize, AspNetPager2.CurrentPageIndex, ref count).ToList();
        var prsi = WSClient.SpreadWS().GetDetailSpreadResults(userInfo.UserID, AspNetPager2.PageSize, AspNetPager2.CurrentPageIndex, ref count);
        rpSRInfo.DataSource = prsi;
        AspNetPager2.RecordCount = count.Value;
        rpSRInfo.DataBind();
        if (prsi.Length < 1)
        {
            lbNoneInfo1.Text = "<br />您还有没有奖励记录<br />";
        }
    }
    protected void AspNetPager2_PageChanged(object sender, EventArgs e)
    {
        BinSpreadResults_Info();
    }

    /// <summary>
    /// 用户推广汇总
    /// </summary>
    public void BinSpreadResults_Count()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        //List<proc_Results_sel_CountResult> resultsCount = sp.proc_Results_sel_Count(userInfo.UserID).ToList();
        var resultsCount = WSClient.SpreadWS().GetSpreadResults(userInfo.UserID);
        rpSRCount.DataSource = resultsCount;// sp.proc_Results_sel_Count(userInfo.UserID);
        rpSRCount.DataBind();
        int? lblev1 = 0;
        int? lblev2 = 0;
        foreach (var rsc in resultsCount)
        {
            lblev1 += rsc.Lev1 == null ? 0 : rsc.Lev1;
            lblev2 += rsc.Lev2 == null ? 0 : rsc.Lev2;
        }
        labLev1.Text = lblev1.ToString();
        labLev2.Text = lblev2.ToString();
        labLevCount.Text = (lblev1 + lblev2).ToString();
        //
        //List<proc_Reward_sel_CountResult> rSC = sp.proc_Reward_sel_Count(userInfo.UserID).ToList();
        var rSC = WSClient.SpreadWS().GetSpreadRewardCount(userInfo.UserID);

        LabRewardCount1.Text = rSC[1].Amount.ToString() == "" ? "0" : rSC[1].Amount.ToString();
        LabRewardCount2.Text = rSC[0].Amount.ToString() == "" ? "0" : rSC[0].Amount.ToString();

    }

    #region 选项卡

    private static string GetDivKeyUp;
    protected void BinStyle()
    {
        //声明调用JS方法
        string js = @"<Script language='JavaScript'> show2('" + GetDivKeyUp + "'); </Script>";
        //调用前台中JS方法 加载样式
        ClientScript.RegisterStartupScript(Page.GetType(), "downUpType", js);
    }
    protected void lkType1_Click(object sender, EventArgs e)
    {
        GetDivKeyUp = "dType1";
        BinStyle();
        pLeft.Visible = true;
        pRight.Visible = false;

        BinSpreadResults_Info();
    }
    protected void lkType2_Click(object sender, EventArgs e)
    {
        GetDivKeyUp = "dType2";
        BinStyle();
        pLeft.Visible = false;
        pRight.Visible = true;

        BinSpreadResults_Count();
    }

    #endregion
}