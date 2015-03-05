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

public partial class AwardCenter_SalingGoodsRecord : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            binddlSalesConfig();
        }
    }
    /// <summary>
    /// 绑定商城道具出售交易记录
    /// </summary>
    private void binddlSalesConfig()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;

        int? count = 0;
        //rpGoodsPurchaseRecord.DataSource = SalesRoomDataContext.GoodsPurchaseRecord_sel(userInfo.UserID, 0, AspNetPager2.PageSize, AspNetPager2.CurrentPageIndex, ref count).ToList();
        rpGoodsPurchaseRecord.DataSource = WSClient.SalesRoomWS().GetGoodsPurchaseRecord(userInfo.UserID, 0, AspNetPager2.PageSize, AspNetPager2.CurrentPageIndex, ref count);
        AspNetPager2.RecordCount = count.Value;
        rpGoodsPurchaseRecord.DataBind();
    }

    protected void rpGoodsPurchaseRecord_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.CommandName.Equals("GoodsDle"))
        {
            //买家删除记录
            int delFalg = -3;
            int purchaseID = Convert.ToInt32(e.CommandArgument.ToString());
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
            string memo = "买家" + userInfo.UserName + "手动删除道具商城购买记录";

            //SalesRoomDataContext.GoodsPurchaseRecord_update_Status(purchaseID, delFalg, userInfo.UserID, userInfo.UserName, userInfo.NickName, memo);
            WSClient.SalesRoomWS().GoodsPurchaseRecordUpdateStatus(purchaseID, delFalg, userInfo.UserID, userInfo.UserName, userInfo.NickName, memo);

            binddlSalesConfig();
        }
    }

    protected void AspNetPager2_PageChanged(object sender, EventArgs e)
    {
        binddlSalesConfig();
    }
}