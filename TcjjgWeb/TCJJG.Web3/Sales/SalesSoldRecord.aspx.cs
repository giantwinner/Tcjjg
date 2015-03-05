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

public partial class AwardCenter_SalesSoldRecord : BasePageIB
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BinddlSalesConfig();
        }
    }
    #region 绑定竞拍交易记录

    /// <summary>
    /// 绑定竞拍交易记录
    /// </summary>
    private void BinddlSalesConfig()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;

        int? count = 0;
        //dlSalesRecord.DataSource = SalesRoomDataContext.SalesPurchaseRecord_sel_out(userInfo.UserID, AspNetPager2.PageSize, AspNetPager2.CurrentPageIndex, ref count);
        dlSalesRecord.DataSource = WSClient.SalesRoomWS().GetSalesPurchaseRecordOut(userInfo.UserID, AspNetPager2.PageSize, AspNetPager2.CurrentPageIndex, ref count);

        AspNetPager2.RecordCount = count.Value;
        dlSalesRecord.DataBind();
    }

    #endregion

    protected void dlSalesRecord_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("salesDle"))
        {
            //卖家删除记录
            int delFalg = -4;
            int purchaseID = Convert.ToInt32(e.CommandArgument.ToString());
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
            string memo = "卖家" + userInfo.UserName + "手动删除竞拍商城已售记录";

            //SalesRoomDataContext.SalesPurchaseRecord_update_Status(purchaseID, delFalg, userInfo.UserID, userInfo.UserName, userInfo.NickName, memo);
            WSClient.SalesRoomWS().SalesPurchaseRecordUpdateStatus(purchaseID, delFalg, userInfo.UserID, userInfo.UserName, userInfo.NickName, memo);
            BinddlSalesConfig(); //绑定竞拍交易记录
        }
    }

    protected void AspNetPager2_PageChanged(object sender, EventArgs e)
    {
        BinddlSalesConfig(); //绑定竞拍交易记录
    }
}