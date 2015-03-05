using System;
using TCJJG.Web.Model;
using TCJJG.Web.DB;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using Static.Common.Operation;
using System.Collections.Generic;

public partial class PayCenter_pay_Card : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WebUserInfo user = Session["UserInfo"] as WebUserInfo;
            string UserName = "试玩勿充值~";
            if (user.UserTypeID != 100) UserName = user.UserName;
            this.txtUserID1.Text = UserName;
        }
    }

    protected void Button1_Click(object sender, System.Web.UI.ImageClickEventArgs e)
    {
        #region

        string validate = this.txtVli.Text;
        //验证码错误
        if (string.IsNullOrEmpty(validate) || Session["code"] == null || validate != Session["code"].ToString())
        {
            this.labMsg.Text = "请正确输入验证码";
            this.txtVli.Focus();
            return;
        }

        //string cardID = this.txtCardID.Text;
        //if (cardID.Length < 5 || cardID.Length > 30)
        //{
        //    this.txtCardID.Focus();
        //    this.labCardID.Text = "请正确输入点卡卡号";
        //    this.labUserName1.Text = this.labCardPsw.Text = this.labMsg.Text = string.Empty;
        //    return;
        //}
        //

        string cardPsw = this.txtCardPsw.Text;
        if (cardPsw.Length < 5 || cardPsw.Length > 40)
        {
            this.txtCardPsw.Focus();
            this.labMsg.Text = "请正确输入点卡密码";
            return;
        }
        //
        //cardID = cardID.Trim().ToLower();
        cardPsw = cardPsw.Trim().ToLower();
        //
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        //
        string cardPswMD5 = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(cardPsw, "MD5").ToLower();
        this.labMsg.Text = string.Empty;

        #endregion

        #region

        try
        {
            int? cardLogID = 0, p_Amount = 0, c_Amount = 0, cardTypeID = 0, cardValue = 0;
            int? c_TypeID = 1;



            //int payOrderOpe = userPayCard.FWP_Card1(user.UserID, user.UserID, user.UserName, user.UserName, user.NickName, cardPswMD5,
            //    c_TypeID, CommonOperation.GetIP4Address(), string.Empty,
            //    pi.Pro1, pi.Pro2, pi.Pro1UserName, ref cardLogID, ref p_Amount, ref c_Amount);
            PaySvcClient paySvc = new PaySvcClient();

            int[] listCity = paySvc.GetCityListByCardBatch(cardPsw);

            bool isAllowCity = false;
            if (listCity.Length > 0)
            {
                foreach (int i in listCity)
                {
                    if (i == UserAreaInfo().CityID)
                    {
                        isAllowCity = true;
                        break;
                    }
                }
            }
            else
            {
                isAllowCity = true;
            }
            if (!isAllowCity)
            {
                this.labMsg.Text = "您使用的点卡不可以跨区域使用！";
                this.Button1.Enabled = true;
                return;
            }
            int payOrderOpe = paySvc.CardUse(user.UserName, user.UserName, cardPswMD5, CommonOperation.GetIP4Address(), "点卡充值", ref c_TypeID, ref cardLogID, ref p_Amount, ref c_Amount, ref cardTypeID, ref cardValue);
            //by zhangsw-2011-1-17每个用户只能使用一次体验卡。返回-100 用户使用过体验卡
            if (payOrderOpe == -100)
            {
                this.labMsg.Text = "点卡充值失败！每个用户只能使用一次体验卡！";
                this.Button1.Enabled = true;
                this.txtCardPsw.Focus();
                return;
            }
            if (payOrderOpe == -101)
            {
                this.labMsg.Text = "点卡充值失败！充值在线体验卡必须和申请用户是同一人！";
                this.Button1.Enabled = true;
                this.txtCardPsw.Focus();
                return;
            }
            //
            if (payOrderOpe == -1)
            {
                this.labMsg.Text = "点卡充值失败！点卡密码错误！请重试...";
                this.Button1.Enabled = true;
                this.txtCardPsw.Focus();
                return;
            }
            if (payOrderOpe == -2)
            {
                this.labMsg.Text = "点卡充值失败！卡已经被使用！";
                this.txtCardPsw.Focus();
                return;
            }
            if (payOrderOpe == -3)
            {
                this.labMsg.Text = "点卡充值失败！卡已经被锁住，请联系系统管理员！";
                this.txtCardPsw.Focus();
                return;
            }
            if (payOrderOpe == -4)
            {
                this.labMsg.Text = "点卡充值失败！利率错误，请联系系统管理员！";
                this.Button1.Enabled = true;
                return;
            }
            if (payOrderOpe == -6)
            {
                this.labMsg.Text = "点卡充值失败！点卡已经被停止使用！";
                this.Button1.Enabled = true;
                return;
            }
            if (payOrderOpe == -5)
            {
                this.labMsg.Text = "点卡充值失败！点卡状态未知，请联系系统管理员！";
                this.Button1.Enabled = true;
                return;
            }
            //更新财富
            int gameID = 0; int items = 3; SubItem subitm = SubItem.siFill;
            string matchName = string.Empty;
            string memo = "点卡充值。充值金额：" + p_Amount.Value + "（元）。点卡卡号：**。序列：**" + cardLogID.Value;
            RichDirection direction = RichDirection.rdIn;
            int costRelationType = 0; string key = string.Empty;
            int matchID = 0;
            int matchNum = 0;
            //
            List<AcountInfo> lai = new List<AcountInfo>();
            AcountInfo ai = new AcountInfo();
            ai.A = c_Amount.Value;
            ai.T = c_TypeID.Value;
            ai.N = "元宝";
            lai.Add(ai);
            //
            int ret3 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, user.UserID, lai.ToArray(), costRelationType, key, matchID, matchNum);
            //
            if (ret3 < 0)
            {
                if (ret3 == -408)
                {
                    this.labMsg.Text = "您的账户余额不足...";
                }
                else
                {
                    this.labMsg.Text = "其他错误，请联系管理员" + ret3;
                }
                return;
            }
            else
            {
                // userPayCard.FWP_Card2(cardLogID.Value);
                paySvc.CardUseCallBack(cardLogID.Value);
                RichInfoSvcClient rc = new RichInfoSvcClient();
                rc.PayLogAdd(cardTypeID.Value, user.UserName, user.UserName, cardValue.Value, 1, c_Amount.Value, CommonOperation.GetIP4Address(), "");
            }
            //zhangsw 2011年9月14日 16:32:07 - 统一财富接口
            //int item = 3, subItem = 8;
            //AcountInfo[] acountInfo = UserCenter.UserAcount().UserAccountLog(user.UserID, item, subItem, cardLogID.Value, 0, p_Amount.Value, c_TypeID, c_Amount.Value, "点卡充值");
            //if (acountInfo != null)
            //{
            //    WebCommon.UpdateUserAcount(user, acountInfo);
            //    userPayCard.FWP_Card2(cardLogID.Value);
            //}
        }
        catch (Exception e1)
        {
            this.labMsg.Text = "呀~出错啦！请联系管理员吧。";
            string emsg = "异常-充值中心-点卡充值";
            PublicClass.WriteErrLog(emsg +
                " UserID=" + user.UserID +
                " Appid=" + user.AppID +
                " UserName=" + user.UserName +
                " cardPsw:" + cardPsw +
                " IP:" + CommonOperation.GetIP4Address() +
                " ex:" + e1.Message);
            Response.Redirect("/paycenter/payresult.html?r1=-1&r2=0", true);
        }
        Response.Redirect("/paycenter/payresult.html?r1=1&r2=0", true);
        #endregion
    }
}
