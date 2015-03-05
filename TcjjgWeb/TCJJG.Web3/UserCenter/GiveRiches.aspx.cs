using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using Static.Common.Operation;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Biz;

public partial class UserCenter_GiveRiches : BasePageIB
{
    //public static string dplvalue = "3";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //zws 2012-8-21 赠送财富列表分区
            RichTypePresenter[] rtp = UserCenter.UserRichInfo().RichTypePresenterList(base.UserAreaInfo().CityID.Value);
            for (int i = 0; i < rtp.Length; i++)
            {
                //绑定赠送类型
                dplZStype.Items.Insert(i, new ListItem(rtp[i].TypeName, rtp[i].TypeID.ToString()));
            }
            //调用前台JS验证
            this.Button3.Attributes.Add("OnClick", "return send10();");
            //
            txtDate1.Text = DateTime.Now.AddMonths(-1).ToString("yyyy-MM-dd");
            txtDate2.Text = DateTime.Now.ToString("yyyy-MM-dd");
            InitInfo();
        }
    }

    #region 查询

    private void InitInfo()
    {
        //zhaoyu 2011年7月22日11:11:32  增加“赠送类型”
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;

        //获取 用户的财富余额
        try
        {
            AccountAmount a3 = UserCenter.UserAcount().AccountAmount(userInfo.AppID, userInfo.UserName, Convert.ToInt32(dplZStype.SelectedValue));
            RichTypePresenter rt = UserCenter.UserRichInfo().RichTypePresenter(Convert.ToInt32(dplZStype.SelectedValue));
            if (a3.Amount != 0)
            {

                lblBonus.Text = "(*)您最多可赠送:" + (a3.Amount / rt.PresenterMultiple) * rt.PresenterMultiple + a3.TypeName + "，数量须是" + rt.PresenterMultiple + "的整数倍" + "，最少赠送数量为:" + rt.MinAmount;
                lblBonus.Visible = true;

            }
            else
            {
                lblBonus.Text = "(*)您还没有" + a3.TypeName;
            }
        }
        catch
        {


        }

        int beginTime = Convert.ToInt32(txtDate1.Text.ToString().Replace("-", ""));
        int endTime = Convert.ToInt32(txtDate2.Text.ToString().Replace("-", ""));
        if (beginTime > endTime)
        {
            lblMsg2.Text = "开始日期不能大于结束日期！";
            gvData.DataSource = null;
            gvData.DataBind();
            return;
        }
        //zhaoyu 2011年7月22日11:11:32  增加“赠送类型”

        if (base.IsCityManager())//代理登录
        {
            //this.txtZSuserName.Text = "54jjgadmin";
            //this.txtZSuserName.ReadOnly = true;
            //this.txtZSuserName.Enabled = true;
            //代理可以赠送玩家，zhangsw-2012年7月26日11:28:37
            this.txtZSuserName.Text = "中游公司~";//"54jjgadmin";
        }
        //
        int? pageTotal = 0;
        //
        GangsReckoning gr = new GangsReckoning();
        gr.UserID = userInfo.UserID;
        gr.CreateTime = (this.txtDate1.Text == string.Empty ? DateTime.Now.ToString("yyyyMMdd") : this.txtDate1.Text.Replace("-", "")) + "," + (this.txtDate2.Text == string.Empty ? DateTime.Now.AddDays(1).ToString("yyyyMMdd") : Convert.ToDateTime(this.txtDate2.Text).AddDays(1).ToString("yyyyMMdd").Replace("-", ""));
        gr.Item = 6;
        gr.SubItem = 0;
        gr.Direction = 0;
        gr.PageIndex = AspNetPager1.CurrentPageIndex;
        gr.PageSize = AspNetPager1.PageSize;
        gvData.DataSource = UserCenter.UserGangsControl().GangsGetReckoning(gr, ref pageTotal); // 
        gvData.DataBind();
        this.AspNetPager1.RecordCount = pageTotal.Value * AspNetPager1.PageSize;

    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        lblMsg2.Text = "";
        InitInfo();
    }

    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        InitInfo();
    }

    #endregion

    #region 赠送

    protected void Button3_Click(object sender, EventArgs e)
    {

        #region 取值

        string zsUserName = this.txtZSuserName.Text;
        if (zsUserName == "中游公司~") { zsUserName = "54jjgadmin"; }
        //
        if (dplZStype.SelectedValue == "")
        {
            return;
        }

        string sCount = this.txtCount.Text;
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        if (!CommonOperation.IsNumInt32(sCount))
        {
            this.lblMsg.Text = "请正确输入赠送数量";
            return;
        }
        int iCount = Convert.ToInt32(sCount);
        RichTypePresenter rt = UserCenter.UserRichInfo().RichTypePresenter(Convert.ToInt32(dplZStype.SelectedValue));

        #endregion
        try
        {


            #region 基本验证

            if (!CommonOperation.IsNumInt32(sCount))
            {
                this.lblMsg.Text = "请正确输入赠送数量";
                return;
            }
            //

            if (iCount <= 0)
            {
                this.lblMsg.Text = "请正确输入赠送数量";
                return;
            }

            if (iCount < rt.MinAmount)
            {
                this.lblMsg.Text = "最少赠送数量为:" + rt.MinAmount;
                return;
            }

            if (iCount % rt.PresenterMultiple != 0)
            {
                this.lblMsg.Text = "只能赠送" + rt.PresenterMultiple + "的倍数";
                return;
            }




            #endregion

            #region 赠送基本验证

            UserProperty[] aup1 = UserCenter.UserInfo().GetUserProperty(userInfo.AppID, userInfo.UserName);
            int statusID = 0, userType = 0;
            foreach (var item in aup1)
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
                this.lblMsg.Text = "限制交易，请联系管理员...";
                return;
            }


            //是否为充值用户。是返回1 否返回0
            UserInfoSvcClient uin = new UserInfoSvcClient();

            //判断赠送用户条件
            //PresenteCondition   0：用户类型不受限制  1：VIP用户   2：充值用户    3：VIP并且充过值的用户

            if (rt.PresenteCondition == 1) //VIP可赠送
            {
                if (userType != 4)//非VIP用户
                {
                    this.lblMsg.Text = "赠送失败！只有VIP用户可以赠送！";
                    return;
                }
            }
            if (rt.PresenteCondition == 2) //充值用户可赠送
            {
                if (uin.GetUserIsPayUser(userInfo.UserID) == 0)
                {
                    this.lblMsg.Text = "赠送失败！只有充值用户可以赠送！";
                    return;
                }
            }
            if (rt.PresenteCondition == 3) //VIP并且充过值的用户
            {
                if (userType != 4 || uin.GetUserIsPayUser(userInfo.UserID) == 0)
                {
                    this.lblMsg.Text = "赠送失败！只有充过值的VIP用户可以赠送！";
                    return;
                }
            }

            #endregion

            #region 受赠基本验证

            if (string.IsNullOrEmpty(zsUserName) || zsUserName.Length < 2)
            {
                this.lblMsg.Text = "请正确输入赠送昵称";
                return;
            }
            //
            if (userInfo.NickName == zsUserName)
            {
                this.lblMsg.Text = "您不能赠送给自己呀~";
                return;
            }
            //
            if (!UserCenter.UserInfo().F_ChickUserID(userInfo.AppID, zsUserName))
            {
                this.lblMsg.Text = "该昵称不存在...";
                return;
            }
            //
            UserProperty[] aup2 = UserCenter.UserInfo().GetUserProperty(userInfo.AppID, zsUserName);//受赠账户必须是VIP账户
            int zsStatusID = 0, zsUserType = 0;
            foreach (var item in aup2)
            {
                zsStatusID = item.StatusID;
                zsUserType = item.UserType;
            }

            if (zsStatusID == -1)
            {
                this.lblMsg.Text = "赠送失败！受赠账户已经被禁用！";
                return;
            }

            //判断受赠用户条件
            //ReceiveCondition   0:用户类型不受限制   1：VIP用户 2：充值用户 3：VIP并且充过值的用户

            if (rt.ReceiveCondition == 1) //VIP可受赠
            {
                if (zsUserType != 4)//非VIP用户
                {
                    this.lblMsg.Text = "赠送失败！必须是VIP账户才可受赠该物品！";
                    return;
                }
            }
            //zhangsw-2012年10月4日16:22:50
            if (rt.ReceiveCondition == 2)//充值用户可受赠
            {
                if (uin.GetUserIsPayUser(uin.GetUserIDByUserName(zsUserName, userInfo.AppID)) == 0)
                {
                    this.lblMsg.Text = "赠送失败！只有充值用户可以受赠！";
                    return;
                }
            }
            if (rt.ReceiveCondition == 3)//VIP并且充过值的用户
            {
                if (zsUserType != 4 || uin.GetUserIsPayUser(uin.GetUserIDByUserName(zsUserName, userInfo.AppID)) == 0)
                {
                    this.lblMsg.Text = "赠送失败！只有充值的VIP用户可以受赠！";
                    return;
                }
            }
            //zhangsw-2012年10月4日16:22:48

            #endregion

            #region 赠送和受赠验证

            UserAreaInfo UserArea2 = UserCenter.UserInfo().GetUserAreaInfo(zsUserName);
            if (zsUserName == "54jjgadmin" && base.IsCityManager())
            {
                //代理送公司，不限制
            }
            //else if (base.UserAreaInfo().CityID != UserArea2.CityID)
            //{
            //    this.lblMsg.Text = "禁止跨地区赠送...";
            //    return;
            //}

            #endregion
        }
        catch (Exception ex)
        {
            PublicClass.WriteErrLog(ex.Message);
        }


        #region 开始赠送

        try
        {
            int TypeID = 3; byte GiveType = 0;
            DateTime deuTime = Convert.ToDateTime("2100-01-01");
            //zhaoyu 2011年7月22日11:11:32  增加“赠送类型”
            TypeID = Convert.ToInt32(dplZStype.SelectedValue);// 获取类型   
            int ope = UserCenter.UserRichInfo().GiveGood(userInfo.UserID, userInfo.UserName, zsUserName, userInfo.AppID, TypeID, GiveType, iCount, deuTime);
            //zhaoyu 2011年7月22日11:11:32  增加“赠送类型”
            //
            if (ope == -465)//RichType is null 
            {
                this.lblMsg.Text = "暂无数据，请重新登录";
                return;
            }
            if (ope == -467)//无赠送资格
            {
                this.lblMsg.Text = "您还没有赠送资格，继续努力吧。";
                return;
            }
            if (ope == -451 || ope == -460)//余额不足
            {
                this.lblMsg.Text = "赠送余额不足";
                return;
            }
            if (ope == -461)
            {
                this.lblMsg.Text = "受赠用户不存在...";
                return;
            }
            if (ope == -475)
            {
                this.lblMsg.Text = "禁止跨地区赠送...";
                return;
            }
            //
            this.lblMsg.Text = "赠送成功";
            //
            // RichTypePresenter rt = UserCenter.UserRichInfo().RichTypePresenter(Convert.ToInt32(dplZStype.SelectedValue));
            ///扣除赠送金币税
            if (TypeID == 4 && rt.TaxPercentage != 0)
            {
                List<AcountInfo> lai4 = new List<AcountInfo>();
                AcountInfo ai4 = new AcountInfo();
                ai4.A = Convert.ToInt32(Convert.ToDouble(iCount) * Convert.ToDouble(rt.TaxPercentage) / 100);
                ai4.T = TypeID;
                ai4.N = "金币";
                lai4.Add(ai4);

                int gameID = 0; int items = 1; SubItem subitm = SubItem.siDeduct;
                string matchName = string.Empty;
                string memo = "赠送金币,系统扣除" + rt.TaxPercentage + "%的税共计" + Convert.ToInt32(Convert.ToDouble(iCount) * Convert.ToDouble(rt.TaxPercentage) / 100) + "金币";

                RichDirection direction = RichDirection.drOut;
                int costRelationType = 0; string key = string.Empty;
                int matchID = 0; int matchNum = 0;
                Guid receUserID = UserCenter.UserInfo().GetUserIDByUserName(zsUserName, 0);
                //
                int ret4 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, receUserID, lai4.ToArray(), costRelationType, key, matchID, matchNum);

            }


            AcountInfo[] new_UserAcount = UserCenter.UserAcount().GetUserAccount(userInfo.UserID);
            userInfo = WebCommon.UpdateUserAcount(userInfo, new_UserAcount);

        }
        catch (Exception)
        {
            this.lblMsg.Text = "暂无数据，请重新登录";
        }
        this.Button3.Enabled = false;
        InitInfo();

        #endregion
    }

    #endregion


    //zhaoyu 2011年7月22日11:11:32  增加“赠送类型”
    //更改赠送类型
    protected void dplZStype_SelectedIndexChanged(object sender, EventArgs e)
    {
        //获取赠送类型
        InitInfo();

    }
    //zhaoyu 2011年7月22日11:11:32  增加“赠送类型”
}