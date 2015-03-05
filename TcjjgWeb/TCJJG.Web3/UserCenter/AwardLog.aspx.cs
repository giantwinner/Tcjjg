using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using TCJJG.Web.DB;
using TCJJG.Web.Biz;


public partial class UserCenter_AwardLog : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ViewRBL();
            txtDate1.Text = DateTime.Now.ToString("yyyy-MM-dd");
        }
    }
    #region 网吧兑奖(财富赠送)记录

    private void getData1()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        int? pageTotal = 0;
        //
        GangsReckoning gr = new GangsReckoning();
        gr.UserID = userInfo.UserID;
        gr.CreateTime = this.txtDate1.Text == string.Empty ? DateTime.Now.ToString("yyyyMMdd") : this.txtDate1.Text.Replace("-", "");
        gr.Item = 0;//[G_Reckoning_Sel]//@Item = 6 and @SubItem = 0 or @SubItem = 4--awardLog.aspx
        gr.SubItem = 0;
        gr.Direction = 0;
        gr.PageIndex = AspNetPager1.CurrentPageIndex;
        gr.PageSize = AspNetPager1.PageSize;
        gvData.DataSource = UserCenter.UserGangsControl().GangsGetReckoning(gr, ref pageTotal);
        gvData.DataBind();
        this.AspNetPager1.RecordCount = pageTotal.Value * AspNetPager1.PageSize;
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        getData1();
    }

    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        getData1();
    }

    /* zhaoyu 2011年7月25日17:25:11 修正了列表被文字挤压变形的错误    */
    protected void gvData_RowCreated(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowType == DataControlRowType.Header)
        {
            //为GridView添加层次表头

            GridViewRow rowHeader = new GridViewRow(1, 0, DataControlRowType.Header, DataControlRowState.Normal);
            rowHeader.Font.Bold = true;
            rowHeader.CssClass = "peck_ts_insertRow";

            TableCellCollection cells = e.Row.Cells;
            TableCell headerCell = new TableCell();

            headerCell = new TableCell();
            headerCell.Text = "受赠";
            headerCell.ColumnSpan = 3;
            headerCell.HorizontalAlign = HorizontalAlign.Center;
            rowHeader.Cells.Add(headerCell);

            headerCell = new TableCell();
            headerCell.Text = "赠送";
            headerCell.ColumnSpan = 3;
            headerCell.HorizontalAlign = HorizontalAlign.Center;
            rowHeader.Cells.Add(headerCell);

            headerCell = new TableCell();
            headerCell.Text = "日期";
            headerCell.ColumnSpan = 1;
            headerCell.HorizontalAlign = HorizontalAlign.Center;
            rowHeader.Cells.Add(headerCell);

            rowHeader.Visible = true;
            gvData.Controls[0].Controls.AddAt(0, rowHeader);
        }

        /* zhaoyu 2011年7月25日17:25:11 修正了列表被文字挤压变形的错误    */
    }

    #endregion

    #region CMOP商店兑换记录

    private void BindgvAward()
    {
        //WebDataDataContext data = new WebDataDataContext();
        WebUserInfo ui = Session["UserInfo"] as WebUserInfo;
        string userName = ui.UserName;
        int? pageTotal = 0;
        //gvAward.DataSource = data.FWP_ClaimLog_MatchSel(ui.UserID, 3, AspNetPager2.CurrentPageIndex, AspNetPager2.PageSize, ref pageTotal);
        gvAward.DataSource = WSClient.CMOPWebWS().GetMatchClaimLogList(ui.UserID, 3, AspNetPager2.CurrentPageIndex, AspNetPager2.PageSize, ref pageTotal);

        gvAward.DataBind();
        this.AspNetPager2.RecordCount = pageTotal.Value * AspNetPager2.PageSize;
    }

    protected void AspNetPager2_PageChanged(object sender, EventArgs e)
    {
        BindgvAward();
    }

    #endregion

    #region 比赛奖品兑换记录

    private void GetMatchInfo()
    {
        WebUserInfo ui = Session["UserInfo"] as WebUserInfo;
        //WebDataDataContext da = new WebDataDataContext();
        int? pageTotal = 0;
        //var sv = da.FWP_ClaimLog_MatchSel(ui.UserID, 4, AspNetPager3.CurrentPageIndex, AspNetPager3.PageSize, ref pageTotal);
        var sv = WSClient.CMOPWebWS().GetMatchClaimLogList(ui.UserID, 4, AspNetPager3.CurrentPageIndex, AspNetPager3.PageSize, ref pageTotal);

        this.GridView1.DataSource = sv;
        this.GridView1.DataBind();
        this.AspNetPager3.RecordCount = pageTotal.Value * AspNetPager3.PageSize;
    }

    protected void AspNetPager3_PageChanged(object sender, EventArgs e)
    {
        GetMatchInfo();
    }

    #endregion

    #region 选择记录

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        ViewRBL();
    }

    private void ViewRBL()
    {
        if (this.RadioButtonList1.SelectedValue == "0")
        {
            getData1();
            this.Panel1.Visible = true;
            this.Panel2.Visible = false;
            this.Panel3.Visible = false;
        }
        else if (this.RadioButtonList1.SelectedValue == "1")
        {
            BindgvAward();
            this.Panel1.Visible = false;
            this.Panel2.Visible = true;
            this.Panel3.Visible = false;
        }
        else
        {
            GetMatchInfo();
            this.Panel1.Visible = false;
            this.Panel2.Visible = false;
            this.Panel3.Visible = true;
        }
    }

    #endregion
}