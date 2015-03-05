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

public partial class Sales_SalesInfo : BasePageIB
{
    // #region 标题    #endregion
    int salesStatus = 0;
    int? count = 0;
    string ty = "0";
    int ykj = 0;
    string nn = string.Empty;
    int OrderByKey = 0;
    int OrderByDesc = 2;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BinddlSalesConfig();
            ViewState["OrderByDesc"] = "1";
        }
    }

    /// <summary>
    /// 重新绑定竞拍信息
    /// </summary>
    private void BinddlSalesConfig()
    {
        //
        if (Request.Params["ty"] != null && Request.Params["ykj"] != null && CommonOperation.IsNumInt32(Request.Params["ykj"].ToString()) && Request.Params["nn"] != null)
        {
            ty = Request.Params["ty"].ToString();
            ykj = Convert.ToInt32(Request.Params["ykj"].ToString());
            nn = Server.UrlDecode(Request.Params["nn"].ToString());

            ViewState["ty"] = ty.ToString();
            ViewState["ykj"] = ykj.ToString();
            ViewState["nn"] = nn.ToString();
        }
        //
        if (ViewState["ty"] != null && ViewState["ykj"] != null && CommonOperation.IsNumInt32(ViewState["ykj"].ToString()) && ViewState["nn"] != null)
        {
            ty = ViewState["ty"].ToString();
            ykj = Convert.ToInt32(ViewState["ykj"].ToString());
            nn = Server.UrlDecode(ViewState["nn"].ToString());
        }
        //
        if (ViewState["OrderByKey"] != null && ViewState["OrderByDesc"] != null)
        {
            OrderByKey = Convert.ToInt32(ViewState["OrderByKey"].ToString());
            OrderByDesc = Convert.ToInt32(ViewState["OrderByDesc"].ToString());
        }
        /*****zws2012-8-14添加地区条件过滤*********/
        int cityID = base.UserAreaInfo().CityID.Value;
        //repeaterSalesList.DataSource = salesroow.SalesInfo_SalesSearch(cityID,ty, ykj, nn, salesStatus, OrderByKey, OrderByDesc, aspNetPager.PageSize, aspNetPager.CurrentPageIndex, ref count);
        repeaterSalesList.DataSource = WSClient.SalesRoomWS().GetSalesSearchForDropDownList(cityID, ty, ykj, nn, salesStatus, OrderByKey, OrderByDesc, aspNetPager.PageSize, aspNetPager.CurrentPageIndex, ref count);

        aspNetPager.RecordCount = count.Value;
        repeaterSalesList.DataBind();
    }

    protected void AspNetPager_PageChanged(object sender, EventArgs e)
    {
        BinddlSalesConfig();
    }

    private void SalesConfigOrderBy(int OrderByKey)
    {
        OrderByDesc = Convert.ToInt32(ViewState["OrderByDesc"]);
        //OrderByKey = 1;
        //
        if (OrderByDesc == 2)
            OrderByDesc = 1;
        else if (OrderByDesc == 1)
            OrderByDesc = 2;
        //
        ViewState["OrderByKey"] = OrderByKey.ToString();
        ViewState["OrderByDesc"] = OrderByDesc.ToString();
        BinddlSalesConfig();

    }
    protected void iborderByCurrentAmount_Click(object sender, ImageClickEventArgs e)
    {
        //按数量排序
        if (iborderByCurrentAmount.ImageUrl == "~/Images/SubPage/Arrow_4.jpg")
        {
            iborderByCurrentAmount.ImageUrl = "~/Images/SubPage/Arrow_3.jpg";
        }
        else
        {
            iborderByCurrentAmount.ImageUrl = "~/Images/SubPage/Arrow_4.jpg";
        }

        SalesConfigOrderBy(2);
    }
    protected void iborderByPrice_Click(object sender, ImageClickEventArgs e)
    {         
        //按数量排序
        if (iborderByPrice.ImageUrl == "~/Images/SubPage/Arrow_4.jpg")
        {
            iborderByPrice.ImageUrl = "~/Images/SubPage/Arrow_3.jpg";
        }
        else
        {
            iborderByPrice.ImageUrl = "~/Images/SubPage/Arrow_4.jpg";
        }

        SalesConfigOrderBy(1);

    }
}