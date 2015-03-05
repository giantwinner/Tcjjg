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
        try
        {
            var prsi = WSClient.SpreadWS().GetDetailSpreadResults(userInfo.UserID, AspNetPager2.PageSize, AspNetPager2.CurrentPageIndex, ref count);
            rpSRInfo.DataSource = prsi;
            AspNetPager2.RecordCount = count.Value;
            rpSRInfo.DataBind();
            if (prsi.Length < 1)
            {
                lbNoneInfo1.Text = "<br />您还有没有奖励记录<br />";
            }
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write(ex);
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
        try
        {
            var resultsCount = WSClient.SpreadWS().GetSpreadResults(userInfo.UserID);
            rpSRCount.DataSource = resultsCount;
            rpSRCount.DataBind();
            int? lblev1 = 0;
            foreach (var rsc in resultsCount)
            {
                lblev1 += rsc.Lev1 == null ? 0 : rsc.Lev1;
            }
            labLev1.Text = lblev1.ToString();

            rptRewardGeted.DataSource = WSClient.SpreadWS().GetRewardList(userInfo.UserID);
            rptRewardGeted.DataBind();
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write(ex);
        }

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
        lkType2.ImageUrl = "~/Images/BtnImg/ach1.jpg";
        lkType1.ImageUrl = "~/Images/BtnImg/spreadDetail2.jpg";

        pLeft.Visible = true;
        pRight.Visible = false;

        BinSpreadResults_Info();
    }
    protected void lkType2_Click(object sender, EventArgs e)
    {
        lkType2.ImageUrl = "~/Images/BtnImg/ach2.jpg";
        lkType1.ImageUrl = "~/Images/BtnImg/spreadDetail1.jpg";

        pLeft.Visible = false;
        pRight.Visible = true;

        BinSpreadResults_Count();
    }

    #endregion
}