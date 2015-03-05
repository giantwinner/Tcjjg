using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Biz;
using TCJJG.Web.Biz;

public partial class UserCenter_ChangeGoldCoins : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
    private void BindData()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        if (null == userInfo)
        {
            Response.Redirect("UserLogin.aspx", true);
        }
        AcountInfo[] new_UserAcount = UserCenter.UserAcount().GetAllUserAccount(userInfo.UserID);
        userInfo = WebCommon.UpdateUserAcount(userInfo, new_UserAcount);

        foreach (var item in userInfo.Lua)
        {
            if (item.Ti == 4)
            {
                lblGoldCoins.Text = Convert.ToString(item.Ac);
                lblGoldCoins2.Text = Convert.ToString(item.Ac);
            }
            if (item.Ti == 1)
            {
                lblYuanBao.Text = Convert.ToString(item.Ac);
                lblYuanBao1.Text = Convert.ToString(item.Ac);
                ViewState["YBCount"] = Convert.ToInt32(item.Ac);
            }
        }

        ///地方币
        int? richType = null;
        string typeName = null;
        int? amount = null;
        UserCenter.UserRichInfo().GetUserCityCoinInfo(userInfo.UserID, ref richType, ref typeName, ref amount);


        //元宝兑换金币
        var data0 = UserCenter.UserRichInfo().GetRichsExchange(1, 4);
        if (null != data0)
        {
            pnelYG.Visible = true;
            lblYBCount0.Text = Convert.ToString(data0.BaseRichAmount);
            lblGoldCount0.Text = Convert.ToString(data0.ToRichAmount);
        }

        if (null != richType)
        {
            //元宝兑换地方币比例显示
            var data1 = UserCenter.UserRichInfo().GetRichsExchange(1, richType.Value);
            if (null != data1)
            {
                pnelYuanCity.Visible = true;
                lblYBCount1.Text = Convert.ToString(data1.BaseRichAmount);
                lblCityCoinCount1.Text = Convert.ToString(data1.ToRichAmount);
            }
                

            //地方币兑换金币比例显示
            var data2 = UserCenter.UserRichInfo().GetRichsExchange(richType.Value, 4);
            if (null!=data2)
            {
                pnelCityGold.Visible = true;
                lblCityCoinCount2.Text = Convert.ToString(data2.BaseRichAmount);
                lblGoldCoinCount.Text = Convert.ToString(data2.ToRichAmount);
            }

            lblCityCoinType1.Text = Convert.ToString(typeName);
            lblCityCoinType2.Text = Convert.ToString(typeName);
            lblCityCoinType3.Text = Convert.ToString(typeName);
            lblCityCoinType4.Text = Convert.ToString(typeName);
            lblCityCoinType5.Text = Convert.ToString(typeName);
            lblCityCoinType6.Text = Convert.ToString(typeName);
            lblCityCoinType7.Text = Convert.ToString(typeName);
            lblOwnCityCoin1.Text = Convert.ToString(amount) == "" ? "0" : Convert.ToString(amount);
            lblOwnCityCoin2.Text = Convert.ToString(amount) == "" ? "0" : Convert.ToString(amount);
            ViewState["CityCoinType"] = Convert.ToInt32(richType);
            ViewState["CityCoinCount"] = Convert.ToInt32(amount);
        }
    }
    /// <summary>
    /// 元宝兑换金币
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ImgBtnChange_Click(object sender, ImageClickEventArgs e)
    {
        ValidateCount(Convert.ToInt32(txtYuanBaoCount.Text), Convert.ToInt32(ViewState["YBCount"]));

        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        int baseRichType = 1;
        int toRichType = 4;
        int baseRichAmount = Convert.ToInt32(txtYuanBaoCount.Text);

        ToExchange(userInfo.UserID, baseRichType, toRichType, baseRichAmount);
    }
    /// <summary>
    /// 地方币兑换金币
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void imgBtnCityToGold_Click(object sender, ImageClickEventArgs e)
    {
        ValidateCount( Convert.ToInt32(txtCityCoin.Text),Convert.ToInt32(ViewState["CityCoinCount"]));

        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        int baseRichType = Convert.ToInt32(ViewState["CityCoinType"]);
        int toRichType = 4;
        int baseRichAmount = Convert.ToInt32(txtCityCoin.Text);
        ToExchange(userInfo.UserID, baseRichType, toRichType, baseRichAmount);
    }
    /// <summary>
    /// 元宝兑换地方币
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void imgBtnYuanBaToCity_Click(object sender, ImageClickEventArgs e)
    {
        ValidateCount(Convert.ToInt32(txtYuanbao2.Text), Convert.ToInt32(ViewState["YBCount"]));

        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        int baseRichType = 1;
        int toRichType = Convert.ToInt32(ViewState["CityCoinType"]);
        int baseRichAmount = Convert.ToInt32(txtYuanbao2.Text);
        ToExchange(userInfo.UserID, baseRichType, toRichType, baseRichAmount);
    }
    /// <summary>
    /// 验证
    /// </summary>
    /// <param name="InputCount"></param>
    /// <param name="OwnCount"></param>
    private void ValidateCount(int InputCount,int OwnCount)
    {
        string resultMsg = string.Empty;
        if (InputCount <= 0)
        {
            resultMsg = "兑换数不能小于1";
            Response.Redirect("ChangeGoldCoinsResult.aspx?rid=" + resultMsg, true);
        }
        if (InputCount > OwnCount)
        {
            resultMsg = "输入数量不能大于拥有数量";
            Response.Redirect("ChangeGoldCoinsResult.aspx?rid=" + resultMsg, true);
        }
    }

    /// <summary>
    /// 兑换
    /// </summary>
    /// <param name="userID"></param>
    /// <param name="_baseRichType"></param>
    /// <param name="_toRichType"></param>
    /// <param name="_baseRichAmount"></param>
    /// <param name="_resultMsg"></param>
    private void ToExchange(Guid userID, int _baseRichType, int _toRichType, int _baseRichAmount)
    {
        int baseRichType = _baseRichType;
        int toRichType = _toRichType;
        int baseRichAmount = _baseRichAmount;
        string resultMsg =string.Empty;
        string result = UserCenter.UserRichInfo().UserRichesExchange(userID, baseRichType, toRichType, baseRichAmount);
        if (result == "-408")
        {
            resultMsg = "余额不足";
            Response.Redirect("ChangeGoldCoinsResult.aspx?rid=" + resultMsg, true);
        }
        else if (result == "-449")
        {
            resultMsg = "系统不支持当前的财富兑换";
            Response.Redirect("ChangeGoldCoinsResult.aspx?rid=" + resultMsg, true);
        }
        else
        {
            resultMsg = "OK";
            Response.Redirect("ChangeGoldCoinsResult.aspx?rid=" + resultMsg, true);
        }
    }
}