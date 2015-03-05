using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Biz;
using Static.Common.Operation;
using FFJJG.Common.UserCenter;
using TCJJG.Web.DB;
using TCJJG.Web.Biz;

public partial class AwardCenter_SalesConfig : BasePageIB
{

    protected void Page_Load(object sender, EventArgs e)
    {
        Form.DefaultButton = ButGoodsSubmit.UniqueID;
        if (!IsPostBack)
        {
            BindUserAcount();
            BindSalesConfig();
            BindSalesConfigOldTime();
        }

    }

    #region 绑定用户财富及数量

    /// <summary>
    /// 绑定用户财富及数量
    /// </summary>
    private void BindUserAcount()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        List<GoodsInfo> userGoodsInfo = null;
        List<SalesConfig_selResult> salesConfig = null;
        List<GoodsInfo> lgi = new List<GoodsInfo>();
        //
        userGoodsInfo = TCJJG.Web.UserCenter.UserCenter.UserRichInfo().GetUserGoods(userInfo.UserID).ToList();
        salesConfig = WSClient.SalesRoomWS().GetSalesConfig(base.UserAreaInfo().CityID.Value).ToList();
        //
        foreach (GoodsInfo gi in userGoodsInfo)
        {
            foreach (SalesConfig_selResult sc in salesConfig)
            {
                //允许竞拍的道具（类型ID）
                if (gi.T == sc.TypeID)
                {
                    //将允许竞拍的道具绑定到新的GoodsInfo[]中
                    GoodsInfo newGoodInfo = new GoodsInfo();
                    newGoodInfo.A = gi.A;
                    newGoodInfo.I = gi.I;
                    newGoodInfo.N = gi.N;
                    newGoodInfo.T = gi.T;
                    newGoodInfo.M = gi.M;
                    lgi.Add(newGoodInfo);
                }
            }
        }
        //zhangsw-增加分页2012年7月25日11:23:34
        List<GoodsInfo> lgi2 = new List<GoodsInfo>();
        if (AspNetPager3.CurrentPageIndex == 1)
        {
            if (lgi.Count >= 6)
            {
                lgi2 = lgi.Take(6).ToList();
            }
            else
            {
                lgi2 = lgi;
            }
        }
        else if (AspNetPager3.CurrentPageIndex == 2)
        {
            if (lgi.Count >= 12)
            {
                lgi2 = lgi.Skip(6).Take(6).ToList();
            }
            else
            {
                lgi2 = lgi.Skip(6).Take(lgi.Count - 6).ToList();
            }
        }
        else if (AspNetPager3.CurrentPageIndex == 3)
        {
            if (lgi.Count >= 18)
            {
                lgi2 = lgi.Skip(12).Take(6).ToList();
            }
            else
            {
                lgi2 = lgi.Skip(12).Take(lgi.Count - 12).ToList();
            }
        }
        AspNetPager3.RecordCount = lgi.Count;
        //zhangsw-增加分页2012年7月25日11:23:34
        this.dlUserAcount.DataSource = lgi2;
        this.dlUserAcount.DataBind();
        if (lgi.Count < 1)
        {
            this.labMiddleLeftNone.Text = "您暂时还没有可以出售的商品";
        }
    }

    //
    protected void AspNetPager3_PageChanged(object sender, EventArgs e)
    {
        BindUserAcount();
    }
    //
    #endregion

    #region 选择出售的道具

    protected void dlUserAcount_ItemCommand(object source, DataListCommandEventArgs e)
    {
        //初始化
        this.labMsg.Text = string.Empty;
        this.txtGoodsNum.Text = "1";
        this.txtGoodsPrice.Text = string.Empty;
        this.txtVli.Text = string.Empty;
        //财富类型
        int typeID = Convert.ToInt32(e.CommandArgument);
        //
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        foreach (var c in WSClient.SalesRoomWS().SalesConfigSelProduct(typeID))
        {
            this.imgGoodsIcon.ImageUrl = c.Icon;
            this.imgGoodsIcon.ToolTip = c.Memo;
            this.lblGoodsName.Text = c.TypeName;
            this.labGoodsMemo.Text = WebCommon.cutTitle(c.Memo, 40);
            this.labGoodsMemo.ToolTip = c.Memo;
            this.labMaxPrice.Text = c.MaxPrice.ToString();
            this.labMinPrice.Text = c.MinPrice.ToString();
            this.labTypeName1.Text = this.labTypeName2.Text = c.PricetypeName;
            //
            ViewState["typeID"] = typeID;
            ViewState["typeName"] = c.TypeName;
            ViewState["maxPrice"] = c.MaxPrice.ToString();
            ViewState["minPrice"] = c.MinPrice.ToString();
            ViewState["priceTypeID"] = c.PriceTypeID.ToString();
            ViewState["defaultValidTime"] = c.DefaultValidTime.ToString();

            //
            ViewState["PurchaseCondition"] = c.PurchaseCondition;
            ViewState["SaleCondition"] = c.SaleCondition;
            ViewState["PurchaseGrade"] = c.PurchaseGrade;
            ViewState["SaleGrade"] = c.SaleGrade;
        }
    }

    #endregion

    #region 确认出售

    protected void ButGoodsSubmit_Click(object sender, EventArgs e)
    {
        #region 取值

        if (ViewState["typeID"] == null)
        {
            this.labMsg.Text = "请选择要出售的道具";
            return;
        }
        //
        int typeID = Convert.ToInt32(ViewState["typeID"].ToString());
        string typeName = ViewState["typeName"].ToString();
        int maxPrice = Convert.ToInt32(ViewState["maxPrice"].ToString());
        int minPrice = Convert.ToInt32(ViewState["minPrice"].ToString());
        int priceTypeID = Convert.ToInt32(ViewState["priceTypeID"].ToString());
        //竞拍的生命周期
        int selectedTime = Convert.ToInt32(this.rblGoodsTime.SelectedValue);
        int defaultValidTime = Convert.ToInt32(ViewState["defaultValidTime"].ToString()) * selectedTime;
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;

        //拍卖资格
        int saleCondition = Convert.ToInt32(ViewState["SaleCondition"]);
        int saleGrade = Convert.ToInt32(ViewState["SaleGrade"]);


        #endregion

        #region 验证
        //验证码 
        if (string.IsNullOrEmpty(this.txtVli.Text) || Session["code"] == null || this.txtVli.Text != Session["code"].ToString())
        {
            this.txtVli.Focus();
            this.labMsg.Text = "请正确输入验证码！";
            return;
        }
        //价格整数倍限制
        if (Convert.ToInt32(txtGoodsPrice.Text) % 100 != 0)
        {
            labMsg.Text = "价格限100的整数倍";
            return;
        }
        #region 用户状态验证

        UserProperty[] aup = TCJJG.Web.UserCenter.UserCenter.UserInfo().GetUserProperty(userInfo.AppID, userInfo.UserName);
        int statusID = 0;
        int userType = 0;
        foreach (var item in aup)
        {
            statusID = item.StatusID;
            userType = item.UserType;
        }
        if (statusID == -1)//禁用
        {
            Session.Abandon();
            Response.Redirect("~/", true);
            return;
        }
        if (statusID == 2)//限制交易
        {
            this.labMsg.Text = "限制交易，请联系管理员...";
            return;
        }
        #endregion

        #region 资格验证

        //是否为充值用户。是返回1 否返回0
        UserInfoSvcClient uin = new UserInfoSvcClient();

        //判断拍卖用户条件
        //saleCondition   0：用户类型不受限制  1：VIP用户   2：充值用户    3：VIP并且充过值的用户

        if (saleCondition == 1) //VIP可拍卖
        {
            if (userType != 4)//非VIP用户
            {
                this.labMsg.Text = "拍卖失败！只有VIP用户可以拍卖！";
                return;
            }
        }
        if (saleCondition == 2) //充值用户可拍卖
        {
            if (uin.GetUserIsPayUser(userInfo.UserID) == 0)
            {
                this.labMsg.Text = "拍卖失败！只有充值用户可以拍卖！";
                return;
            }
        }
        if (saleCondition == 3) //VIP并且充过值的用户
        {
            if (userType != 4 || uin.GetUserIsPayUser(userInfo.UserID) == 0)
            {
                this.labMsg.Text = "拍卖失败！只有充过值的VIP用户可以拍卖！";
                return;
            }
        }
        #endregion

        #region 等级验证
        AcountInfo[] new_UserAcount = UserCenter.UserAcount().GetAllUserAccount(userInfo.UserID);

        userInfo = WebCommon.UpdateUserAcount(userInfo, new_UserAcount);

        if (WSClient.ExpSvc().GetRank(userInfo.UserID.ToString()) < saleGrade)
        {
            labMsg.Text = "您的等级必须达到" + saleGrade + "级才能拍卖此物品";
            return;
        }
        #endregion

        //出售数量
        string sGoodsNum = this.txtGoodsNum.Text.Trim();
        if (!CommonOperation.IsNumInt32(sGoodsNum))
        {
            this.labMsg.Text = "请正确输入出售数量";
            return;
        }
        int goodsNum = Convert.ToInt32(sGoodsNum);
        if (goodsNum == 0)
        {
            this.labMsg.Text = "请正确输入出售数量";
            return;
        }
        AccountAmount a3 = UserCenter.UserAcount().AccountAmount(userInfo.AppID, userInfo.UserName, typeID);
        if (a3.Amount == 0 || a3.Amount < goodsNum)
        {
            this.labMsg.Text = "请正确输入出售数量";
            return;
        }
        //出售单价
        string sGoodsPrice = this.txtGoodsPrice.Text.Trim();
        if (!CommonOperation.IsNumInt32(sGoodsPrice))
        {
            this.labMsg.Text = "请正确输入出售单价";
            return;
        }
        int goodsPrice = Convert.ToInt32(sGoodsPrice);
        if (goodsPrice == 0 || goodsPrice < minPrice || goodsPrice > maxPrice)
        {
            this.labMsg.Text = "请正确输入出售单价";
            return;
        }

        //扣除金币功能开通后加入
        #region 验证财富

        //bool verifyAccount = false;

        //AcountInfo[] acountInfo = TCJJG.Web.UserCenter.UserCenter.UserAcount().GetUserAccount(userInfo.UserID);
        //List<AcountInfo> lai1 = null;
        ////卖家余额是否足够
        //foreach (AcountInfo i in acountInfo)
        //{
        //    if (i.T == 4) // 指定财富类型 == 4（金币）
        //    {
        //        if (i.A >= 500)
        //        {
        //            //卖家出售扣除财富 （未来要在库中读取数值）
        //            lai1 = new List<AcountInfo>();
        //            AcountInfo ai1 = new AcountInfo();
        //            ai1.A = 500;    //出售扣除数量
        //            ai1.T = 4;      //出售扣除类型ID
        //            ai1.N = "金币"; //出售扣除类型名称
        //            lai1.Add(ai1);
        //            verifyAccount = true;
        //        }
        //    }
        //}
        //
        //if (!verifyAccount)
        //{
        //    this.labMsg.Text = "您的余额不足~";
        //    return;
        //}
        #endregion

        #endregion

        #region 出售

        List<AcountInfo> lai2 = new List<AcountInfo>(); //应扣除的财富
        AcountInfo ai2 = new AcountInfo();
        ai2.A = goodsNum;
        ai2.T = typeID;
        ai2.N = typeName;
        lai2.Add(ai2);
        //
        int gameID = 0;
        int items = 1;
        SubItem subitm = SubItem.siDeduct;
        string matchName = string.Empty;
        string memo = userInfo.UserName + "出售“" + goodsNum + "”件“" + typeName + "”扣除";
        RichDirection direction = RichDirection.drOut;
        //
        int costRelationType = 0; string key = string.Empty;
        int matchID = 0; int matchNum = 0;

        //扣除金币功能开通后加入
        ////扣财富 可考虑与扣除金币合并扣除
        //int ret = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, userInfo.UserID, lai1.ToArray(), costRelationType, key, matchID, matchNum);
        //if (ret < 0)
        //{
        //    this.labMsg.Text = "其他错误，请联系管理员" + ret;
        //    return;

        //}
        //扣道具
        int ret2 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, userInfo.UserID, lai2.ToArray(), costRelationType, key, matchID, matchNum);
        if (ret2 < 0)
        {
            if (ret2 == -408)
            {
                this.labMsg.Text = "您的账户余额不足~";
                return;
            }
            else
            {
                this.labMsg.Text = "其他错误，请联系管理员" + ret2;
                return;
            }
        }
        //
        SalesInfo si = new SalesInfo();
        si.UserID = userInfo.UserID;
        si.NickName = userInfo.NickName;
        si.TypeID = typeID;
        si.PriceTypeID = priceTypeID;
        si.Price = goodsPrice;
        si.OverTime = DateTime.Now.AddHours(defaultValidTime);
        si.CurrentAmount = goodsNum;
        si.Memo = memo;
        si.SalesStatus = 0;
        si.UserName = userInfo.UserName;
        si.CityID = base.UserAreaInfo().CityID.Value;
        //竞拍信息表
        WSClient.SalesRoomWS().AddSalesInfo(si);
        this.labMsg.Text = "您已成功发布竞拍商品";
        //
        BindUserAcount();
        BindSalesConfig();

        #endregion
    }

    #endregion

    #region 绑定用户出售信息

    private void BindSalesConfig()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        int SalesStatus = 0;
        int? count = 0;
        //dlSalesConfig.DataSource = SalesRoomDataContext.SalesInfo_sel(userInfo.UserID, SalesStatus, AspNetPager1.PageSize, AspNetPager1.CurrentPageIndex, ref count);
        dlSalesConfig.DataSource = WSClient.SalesRoomWS().GetSalesInfoList(userInfo.UserID, SalesStatus, AspNetPager1.PageSize, AspNetPager1.CurrentPageIndex, ref count);

        AspNetPager1.RecordCount = count.Value;
        dlSalesConfig.DataBind();
    }

    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
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
        //凭帐号和竞拍id，未能获取到竞拍的道具
        if (currentAmount == 0 || string.IsNullOrEmpty(typeName))
        {
            Session.Abandon();
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "saleconfig",
"<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('获取竞拍道具错误，请关闭浏览器重试~');</script>", false);
            return;
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
        BindUserAcount();
        BindSalesConfig();

        #endregion
    }

    #endregion

    #region 绑定用户出售过期信息

    private void BindSalesConfigOldTime()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        int? count = 0;
        //dlSalesConfigOldTime.DataSource = SalesRoomDataContext.SalesInfo_sel_OldTime(userInfo.UserID, AspNetPager2.PageSize, AspNetPager2.CurrentPageIndex, ref count);
        dlSalesConfigOldTime.DataSource = WSClient.SalesRoomWS().GetOldTimeSalesInfoList(userInfo.UserID, AspNetPager2.PageSize, AspNetPager2.CurrentPageIndex, ref count);

        dlSalesConfigOldTime.DataBind();
        AspNetPager2.RecordCount = count.Value;
    }

    protected void AspNetPager2_PageChanged(object sender, EventArgs e)
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
        BindUserAcount();
        BindSalesConfigOldTime();

        #endregion

    }

    #endregion


    protected void butSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("SalesInfo.aspx");
    }
}
