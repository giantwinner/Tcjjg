using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using FFJJG.Common.UserCenter;
using TCJJG.Web.DB;
using TCJJG.Web.Biz;

public partial class Sales_MySale : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindSalesConfig();
            BindSalesConfigOldTime();
            //BinddlSalesConfig();
        }
    }
    #region 绑定用户出售信息

    private void BindSalesConfig()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        int SalesStatus = 0;
        int? count = 0;
        //dlSalesConfig.DataSource = SalesRoomDataContext.SalesInfo_sel(userInfo.UserID, SalesStatus, AspNetPager5.PageSize, AspNetPager5.CurrentPageIndex, ref count);
        dlSalesConfig.DataSource = WSClient.SalesRoomWS().GetSalesInfoList(userInfo.UserID, SalesStatus, AspNetPager5.PageSize, AspNetPager5.CurrentPageIndex, ref count);

        AspNetPager5.RecordCount = count.Value;
        dlSalesConfig.DataBind();
    }

    protected void AspNetPager5_PageChanged(object sender, EventArgs e)
    {
        BindSalesConfig();
    }

    protected void dlSalesConfig_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int salesID = Convert.ToInt32(e.CommandArgument.ToString());

        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;

        #region 获取竞拍道具

        int typeID = 0;
        string typeName = string.Empty;
        int price = 0;
        int currentAmount = 0;
        //
        foreach (var item in WSClient.SalesRoomWS().GetSalesInfoByUser(userInfo.UserID, salesID))
        {
            typeID = item.TypeID;
            typeName = item.typename;
            price = item.Price;
            currentAmount = item.CurrentAmount;
        }

        #endregion

        #region 竞拍状态验证

        SalesPurchaseRecord spr1 = new SalesPurchaseRecord();
        spr1.SalesID = salesID;
        spr1.UserID = userInfo.UserID;
        spr1.NickName = userInfo.NickName;
        spr1.Price = price;
        spr1.Amount = currentAmount;
        spr1.Memo = userInfo.UserName + "取消竞拍“" + currentAmount + "”件“" + typeName + "”，锁定订单状态100";
        spr1.UserName = userInfo.UserName;
        spr1.CityID = base.UserAreaInfo().CityID.Value; 
        int rv = WSClient.SalesRoomWS().SalesVerify(spr1);
        if (rv == 0)
        {
            //竞拍中的道具，可以购买或发布道具者取消道具，方法返回后，该道具的状态已经由状态0更新成锁定状态(100)，暂时锁定，其他用户不允许购买。
            //之后会根据用户中心的返回结果再次更新该道具的状态
        }
        else if (rv == 100)
        {
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "saleconfig",
    "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('您的物品已经被锁定');</script>", false);
            BindSalesConfig();
            return;
        }
        else if (rv == -2)
        {
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "saleconfig",
"<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('您的物品已经过期');</script>", false);
            BindSalesConfig();
            BindSalesConfigOldTime();
            return;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "saleconfig",
"<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('竞拍已结束');</script>", false);
            BindSalesConfig();
            return;
        }

        #endregion

        #region 取消竞拍

        List<AcountInfo> lai = new List<AcountInfo>();
        AcountInfo ai = new AcountInfo();
        ai.A = currentAmount;
        ai.T = typeID;
        ai.N = typeName;
        lai.Add(ai);
        //
        int gameID = 0; int items = 1; SubItem subitm = SubItem.siHandBack;
        string matchName = string.Empty;
        string memo = userInfo.UserName + "取消竞拍“" + currentAmount + "”件“" + typeName + "”，返回道具";
        RichDirection direction = RichDirection.rdIn;
        int costRelationType = 0; string key = string.Empty;
        int matchID = 0; int matchNum = 0;
        //
        int ret1 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, userInfo.UserID, lai.ToArray(), costRelationType, key, matchID, matchNum);
        if (ret1 < 0)
        {
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "saleconfig",
"<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('数据异常，请联系管理员" + ret1 + "');</script>", false);
            return;
        }
        SalesPurchaseRecord spr3 = new SalesPurchaseRecord();
        spr3.SalesID = salesID;
        spr3.UserID = userInfo.UserID;
        spr3.NickName = userInfo.NickName;
        spr3.Status = -1;
        spr3.Price = price;
        spr3.Amount = currentAmount;
        spr3.Memo = memo;
        spr3.UserName = userInfo.UserName;
        WSClient.SalesRoomWS().SalesStatusUpdate(spr3);
        //
        //BindUserAcount();
        BindSalesConfig();

        #endregion
    }

    #endregion

    #region 绑定用户出售过期信息

    private void BindSalesConfigOldTime()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        int? count = 0;
        //dlSalesConfigOldTime.DataSource = SalesRoomDataContext.SalesInfo_sel_OldTime(userInfo.UserID, AspNetPager4.PageSize, AspNetPager4.CurrentPageIndex, ref count);
        dlSalesConfigOldTime.DataSource = WSClient.SalesRoomWS().GetOldTimeSalesInfoList(userInfo.UserID, AspNetPager4.PageSize, AspNetPager4.CurrentPageIndex, ref count);

        dlSalesConfigOldTime.DataBind();
        AspNetPager4.RecordCount = count.Value;
    }

    protected void AspNetPager4_PageChanged(object sender, EventArgs e)
    {
        BindSalesConfigOldTime();
    }

    protected void dlSalesConfigOldTime_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        int salesID = Convert.ToInt32(e.CommandArgument.ToString());

        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;

        #region 获取竞拍道具

        int typeID = 0;
        string typeName = string.Empty;
        int price = 0;
        int currentAmount = 0;
        //
        foreach (var item in WSClient.SalesRoomWS().GetSalesInfoByUser(userInfo.UserID, salesID))
        {
            typeID = item.TypeID;
            typeName = item.typename;
            price = item.Price;
            currentAmount = item.CurrentAmount;
        }

        #endregion

        #region 竞拍状态验证

        //int rv = SalesRoomDataContext.SalesInfo_sel_SalesVerify_OldTime(salesID, userInfo.UserID);
        int rv = WSClient.SalesRoomWS().SalesVerifyOldTime(salesID, userInfo.UserID);

        if (rv == -1)
        {

        }
        else //if (rv == -5)
        {
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "saleconfig",
    "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('您的物品过期时间已经超过30天，系统自动销毁');</script>", false);
            BindSalesConfigOldTime();
            return;
        }

        #endregion

        #region 取消竞拍

        List<AcountInfo> lai = new List<AcountInfo>();
        AcountInfo ai = new AcountInfo();
        ai.A = currentAmount;
        ai.T = typeID;
        ai.N = typeName;
        lai.Add(ai);
        //
        int gameID = 0; int items = 1; SubItem subitm = SubItem.siHandBack;
        string matchName = string.Empty;
        string memo = userInfo.UserName + "过期道具“" + currentAmount + "”件“" + typeName + "”，取消竞拍返回道具";
        RichDirection direction = RichDirection.rdIn;
        int costRelationType = 0; string key = string.Empty;
        int matchID = 0; int matchNum = 0;
        //
        int ret1 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, userInfo.UserID, lai.ToArray(), costRelationType, key, matchID, matchNum);
        if (ret1 < 0)
        {
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "saleconfig",
"<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('数据异常，请联系管理员" + ret1 + "');</script>", false);
            return;
        }
        //BindUserAcount();
        BindSalesConfigOldTime();

        #endregion

    }

    #endregion
}