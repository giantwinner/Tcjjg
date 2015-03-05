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
using TCJJG.Web.Biz;

public partial class Sales_SalesDetail : BasePageIB
{
    // #region 标题    #endregion

    protected void Page_Load(object sender, EventArgs e)
    {
        Form.DefaultButton = SalesSubmit.UniqueID;


        if (!IsPostBack)
        {
            if (null == Request.QueryString["SID"]) return;
            if (!CommonOperation.IsNumInt32(Request.QueryString["SID"].ToString())) return;
            int salesID = Convert.ToInt32(Request.QueryString["SID"].ToString().Trim());
            //绑定竞拍信息
            BinddlSalesConfig(salesID);

            labSalesRequest.Text = "等级" + ViewState["PurchaseGrade"] + "级以上可以在拍卖区内购买物品";
        }
    }

    #region 绑定竞拍信息

    private void BinddlSalesConfig(int SalesID)
    {
        #region 获取购买道具信息

        foreach (var item in WSClient.SalesRoomWS().GetSalesInfoByUser(Guid.Empty, SalesID))
        {
            this.imgIcon.ImageUrl = item.Icon;
            this.labSalesName.Text = item.typename;
            this.labGoodsMemo.Text = item.Memo;
            this.labSalesNickName.Text = item.NickName;
            this.labSalesPrice.Text = item.Price.ToString() + item.PricetypeName;
            this.labSalesTotal.Text = (item.Price * item.CurrentAmount).ToString();
            this.labPricetypeName.Text = item.PricetypeName;
            this.labCurrentAmount.Text = item.CurrentAmount.ToString();
            this.labOverTime.Text = item.OverTime.ToString();
            //
            //获得道具竞拍单价
            ViewState["price"] = item.Price.ToString();
            //获得道具类型id
            ViewState["typeID"] = item.TypeID;
            //获得道具竞拍数量
            ViewState["currentAmount"] = item.CurrentAmount.ToString();
            //获得道具名称
            ViewState["typename"] = item.typename;
            //竞拍id
            ViewState["salesID"] = item.SalesID;
            //支付财富类型ID
            ViewState["priceTypeID"] = item.PriceTypeID.ToString();
            //支付财富类型名称
            ViewState["priceTypeName"] = item.PricetypeName;
            //卖家
            ViewState["salesUserID"] = item.UserID;
        }
        //购买道具资格
        foreach (var c in WSClient.SalesRoomWS().SalesConfigSelProduct(Convert.ToInt32(ViewState["typeID"])))
       // foreach (var c in SalesRoomDataContext.SalesConfigSelProduct(Convert.ToInt32(ViewState["typeID"])))
        {
            ViewState["PurchaseCondition"] = c.PurchaseCondition;
            ViewState["PurchaseGrade"] = c.PurchaseGrade;
        }
        #endregion

        #region 判定用户财富

        if (ViewState["salesID"] == null) return;

        int price = Convert.ToInt32(ViewState["price"].ToString());
        int currentAmount = Convert.ToInt32(ViewState["currentAmount"].ToString());
        string typename = ViewState["typename"].ToString();
        int priceTypeID = Convert.ToInt32(ViewState["priceTypeID"].ToString());
        string priceTypeName = ViewState["priceTypeName"].ToString();
        //
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        //获取 用户的财富余额(金币)
        AccountAmount a3 = UserCenter.UserAcount().AccountAmount(userInfo.AppID, userInfo.UserName, priceTypeID);
        this.labMsg.Text = "您没有足够的" + priceTypeName + "，还不能竞拍该商品";
        if (a3.Amount != 0)
        {
            if (a3.Amount >= (price * currentAmount))//可以点击"确认购买"
            {
                this.labMsg.Text = string.Empty;
            }
        }

        #endregion
    }

    #endregion

    #region 购买

    protected void SalesOK()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        #region 输入验证
        //
        if (userInfo.Password != System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(this.txtUserPassword.Text.Trim(), "MD5").ToLower())
        {
            this.labMsg.Text = "请正确输入确认密码";
            return;
        }
        //
        if (userInfo.NickName.ToLower() == this.labSalesNickName.Text.ToLower())
        {
            this.labMsg.Text = "不可以购买自己的物品";
            return;
        }

        #endregion

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

        int purchaseCondition = Convert.ToInt32(ViewState["PurchaseCondition"]);
        //判断购买用户条件
        //purchaseCondition   0：用户类型不受限制  1：VIP用户   2：充值用户    3：VIP并且充过值的用户

        if (purchaseCondition == 1) //VIP可购买
        {
            if (userType != 4)//非VIP用户
            {
                this.labMsg.Text = "购买失败！只有VIP用户可以购买！";
                return;
            }
        }
        if (purchaseCondition == 2) //充值用户可拍卖
        {
            if (uin.GetUserIsPayUser(userInfo.UserID) == 0)
            {
                this.labMsg.Text = "购买失败！只有充值用户可以购买！";
                return;
            }
        }
        if (purchaseCondition == 3) //VIP并且充过值的用户
        {
            if (userType != 4 || uin.GetUserIsPayUser(userInfo.UserID) == 0)
            {
                this.labMsg.Text = "购买失败！只有充过值的VIP用户可以购买！";
                return;
            }
        }
        #endregion

        #region 等级验证
        AcountInfo[] new_UserAcount = UserCenter.UserAcount().GetAllUserAccount(userInfo.UserID);

        userInfo = WebCommon.UpdateUserAcount(userInfo, new_UserAcount);
        int purchaseGrade = Convert.ToInt32(ViewState["PurchaseGrade"]);

        if (WSClient.ExpSvc().GetRank(userInfo.UserID.ToString()) < purchaseGrade)
        //if (Spread.GetRankByReqPoint(experience).Rank < purchaseGrade)
        {
            labMsg.Text = "您的等级必须达到" + purchaseGrade + "级才能在拍卖区购买该物品";
            return;
        }
        #endregion



        #region 取值

        if (ViewState["salesID"] == null) return;

        int salesID = Convert.ToInt32(ViewState["salesID"].ToString());
        int priceTypeID = Convert.ToInt32(ViewState["priceTypeID"].ToString());
        string priceTypeName = ViewState["priceTypeName"].ToString();
        int price = Convert.ToInt32(ViewState["price"].ToString());
        int currentAmount = Convert.ToInt32(ViewState["currentAmount"].ToString());
        int productTotal = (price * currentAmount);
        string typename = ViewState["typename"].ToString();
        int typeid = Convert.ToInt32(ViewState["typeID"].ToString());
        //
        Guid salesUserID = new Guid(ViewState["salesUserID"].ToString());
        string salesNickName = this.labSalesNickName.Text;

        #endregion

        #region 验证财富

        bool verifyAccount = false;

        AcountInfo[] acountInfo = TCJJG.Web.UserCenter.UserCenter.UserAcount().GetUserAccount(userInfo.UserID);

        List<AcountInfo> lai1 = null;
        List<AcountInfo> lai2 = null;
        List<AcountInfo> lai3 = null;
        List<AcountInfo> lai4 = null;
        //用户余额是否足够
        foreach (AcountInfo i in acountInfo)
        {
            if (i.T == priceTypeID) // 指定财富类型==竞拍的财富类型ID
            {
                if (i.A >= productTotal)
                {
                    //买家应扣除的财富 （卖家应获得的财富）
                    lai1 = new List<AcountInfo>();
                    AcountInfo ai1 = new AcountInfo();
                    ai1.A = productTotal;
                    ai1.T = priceTypeID;
                    ai1.N = priceTypeName;
                    lai1.Add(ai1);
                    //买家应获得的财富
                    lai2 = new List<AcountInfo>();
                    AcountInfo ai2 = new AcountInfo();
                    ai2.A = currentAmount;
                    ai2.T = typeid;
                    ai2.N = typename;
                    lai2.Add(ai2);
                    //出售用户获得财富
                    lai3 = new List<AcountInfo>();
                    AcountInfo ai3 = new AcountInfo();
                    ai3.A = productTotal;
                    ai3.T = priceTypeID;
                    ai3.N = priceTypeName;
                    lai3.Add(ai3);
                    //扣除出售用户的交易税
                    lai4 = new List<AcountInfo>();
                    AcountInfo ai4 = new AcountInfo();
                    ai4.A = Convert.ToInt32(Convert.ToDouble(productTotal)*0.05);
                    ai4.T = priceTypeID;
                    ai4.N = priceTypeName;
                    lai4.Add(ai4);
                    //
                    verifyAccount = true;
                }
            }
        }
        //
        if (!verifyAccount)
        {
            this.labMsg.Text = "您的余额不足~";
            return;
        }
        #endregion

        #region 竞拍状态验证

        SalesPurchaseRecord spr1 = new SalesPurchaseRecord();
        spr1.CityID = base.UserAreaInfo().CityID.Value;
        spr1.SalesID = salesID;
        spr1.UserID = userInfo.UserID;
        spr1.NickName = userInfo.NickName;
        spr1.Price = price;
        spr1.Amount = currentAmount;
        spr1.Memo = userInfo.UserName + "凭“" + productTotal + "”“" + priceTypeName + "”竞拍“" + salesNickName + "”“" + currentAmount + "”“" + typename + "”，锁定订单状态100";
        spr1.UserName = userInfo.UserName;
        int rv = WSClient.SalesRoomWS().SalesVerify(spr1);
        if (rv == 0)
        {
            //竞拍中的道具，可以购买或发布道具者取消道具，方法返回后，该道具的状态已经由状态0更新成锁定状态(100)，暂时锁定，其他用户不允许购买。
            //之后会根据用户中心的返回结果再次更新该道具的状态
        }
        else if (rv == -3)
        {
            this.labMsg.Text = "此道具禁止跨地区买卖...";
            return;
        }
        else if (rv == 100)
        {
            this.labMsg.Text = "您竞拍的物品已经被锁定~请竞拍其他物品...";
            return;
        }
        else if (rv == -2)
        {
            this.labMsg.Text = "您竞拍的物品已经过期~请竞拍其他物品...";
            return;
        }
        else
        {
            this.labMsg.Text = "竞拍已结束~请竞拍其他物品...";
            return;
        }

        #endregion

        #region 购买道具

        ////////////////////扣费
        int gameID = 0; int items = 1; SubItem subitm = SubItem.siDeduct;
        string matchName = string.Empty;
        string memo = userInfo.UserName + "凭“" + productTotal + "”“" + priceTypeName + "”竞拍“" + salesNickName + "”“" + currentAmount + "”“" + typename + "”，竞拍道具扣除";
        RichDirection direction = RichDirection.drOut;
        int costRelationType = 0; string key = string.Empty;
        int matchID = 0; int matchNum = 0;
        //
        int ret = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, userInfo.UserID, lai1.ToArray(), costRelationType, key, matchID, matchNum);
        if (ret < 0)
        {
            if (ret == -408)
            {
                this.labMsg.Text = "您的账户余额不足...";
            }
            else
            {
                this.labMsg.Text = "其他错误，请联系管理员" + ret;
            }
            //更新道具状态为可以竞拍
            SalesPurchaseRecord spr2 = new SalesPurchaseRecord();
            spr2.SalesID = salesID;
            spr2.UserID = userInfo.UserID;
            spr2.NickName = userInfo.NickName;
            spr2.Status = 0;
            spr2.Price = price;
            spr2.Amount = currentAmount;
            spr2.Memo = userInfo.UserName + "竞拍失败" + ret;
            spr2.UserName = userInfo.UserName;
            WSClient.SalesRoomWS().SalesStatusUpdate(spr2);
            return;
        }
        ////////////////////获得道具
        gameID = 0; items = 1; subitm = SubItem.siHandBack;
        matchName = string.Empty;
        memo = userInfo.UserName + "凭“" + productTotal + "”“" + priceTypeName + "”竞拍“" + salesNickName + "”“" + currentAmount + "”“" + typename + "”，获得道具";
        direction = RichDirection.rdIn;
        costRelationType = 0; key = string.Empty;
        matchID = 0; matchNum = 0;
        //
        int ret2 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, userInfo.UserID, lai2.ToArray(), costRelationType, key, matchID, matchNum);
        ////////////////////出售用户获得财富
        gameID = 0; items = 1; subitm = SubItem.siHandBack;
        matchName = string.Empty;
        memo = "出售“" + currentAmount + "”“" + typename + "”被“" + userInfo.NickName + "”凭“" + productTotal + "”“" + priceTypeName + "”竞拍";
        direction = RichDirection.rdIn;
        costRelationType = 0; key = string.Empty;
        matchID = 0; matchNum = 0;
        //
        int ret3 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, salesUserID, lai3.ToArray(), costRelationType, key, matchID, matchNum);

        /////////扣除卖家5%的交易税
        gameID = 0; items = 1; subitm = SubItem.siDeduct;
        matchName = string.Empty;
        memo = "出售" + currentAmount +""+ typename + ",系统扣除5%的交易税共计" + Convert.ToInt32(Convert.ToDouble(productTotal) * 0.05) + "" + priceTypeName;
        direction = RichDirection.drOut;
        costRelationType = 0; key = string.Empty;
        matchID = 0; matchNum = 0;
        //
        int ret4 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, salesUserID, lai4.ToArray(), costRelationType, key, matchID, matchNum);


        ////////////////////竞拍完毕更新状态
        if (ret2 < 0 || ret3 < 0)
        {
            this.labMsg.Text = "道具购买失败请联系管理员." + ret2 + "." + ret3;
            this.SalesSubmit.Enabled = false;
            return;
        }
        if (ret4<0)
        {
            PublicClass.WriteErrLog("竞拍扣除交易税失败");
        }
        //
        SalesPurchaseRecord spr3 = new SalesPurchaseRecord();
        spr3.SalesID = salesID;
        spr3.UserID = userInfo.UserID;
        spr3.NickName = userInfo.NickName;
        spr3.Status = 1;
        spr3.Price = price;
        spr3.Amount = currentAmount;
        spr3.Memo = userInfo.UserName + "凭“" + productTotal + "”“" + priceTypeName + "”竞拍“" + salesNickName + "”“" + currentAmount + "”“" + typename + "”，获得道具";
        spr3.UserName = userInfo.UserName;
        WSClient.SalesRoomWS().SalesStatusUpdate(spr3);
        this.labMsg.Text = "道具购买成功";
        this.SalesSubmit.Enabled = false;

        //为卖家发送通知
        Guid to = salesUserID;
        Guid from = Guid.Empty;
        MessageType messageType = MessageType.mtSystem;
        string title = "竞拍物品卖出通知";
        string msg = "您出售的‘" + currentAmount + typename + "’已被玩家" + userInfo.NickName + "买走，收入" + productTotal + priceTypeName;

        TCJJG.Web.UserCenter.UserCenter.UserMessage().NewMessage(to, from, messageType, title, msg);

        #endregion

    }

    #endregion

    protected void SalesSubmit_Click(object sender, EventArgs e)
    {
        SalesOK();
    }
}