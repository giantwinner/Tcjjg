using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;
using TCJJG.Web.DB;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;

public partial class Spread_SpreadRewardGet : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.txtDate1.Text = System.DateTime.Now.AddDays(-7).ToString("yyyy-MM-dd");
            this.txtDate2.Text = System.DateTime.Now.ToString("yyyy-MM-dd");
            BindSpreadReward();
            BindSpreadRewardAll();
            AutoGetSpreadSumAward();
        }
    }
    /// <summary>
    /// 自动领取累计10个5级直接或者间接推广给的奖励
    /// </summary>
    private void AutoGetSpreadSumAward()
    {
       
        int? addCount = 0;
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;

        //string result = Spread.AutoGetSpreadSumAward(userInfo.UserID, ref addCount);
        //if (result != "")
        //{
        //    PublicClass.WriteErrLog("自动领取累计10个直接或者间接推广给的奖励," + result);
        //    return;
        //}
        bool result = WSClient.SpreadWS().AutoGetSpreadSumAward(userInfo.UserID, ref addCount);
        if (result==false)
        {
            
        }
        else
        {
            if (addCount.Value > 0)
            {
                List<AcountInfo> lai = new List<AcountInfo>(); //应添加的财富
                AcountInfo ai = new AcountInfo();
                ai.A = addCount.Value;
                ai.T = 4;
                ai.N = "金币";
                lai.Add(ai);
                //
                int gameID = 0;
                int items = 14;
                SubItem subitm = SubItem.siGive;
                string matchName = string.Empty;
                string memo = userInfo.UserName + "推广累积10个好友都达到5级额外赠送" + ai.A + ai.N + "。";
                RichDirection direction = RichDirection.rdIn;
                //
                int costRelationType = 0; string key = string.Empty;
                int matchID = 0; int matchNum = 0;
                int ret2 = TCJJG.Web.UserCenter.UserCenter.UserAcount().UpdateAcount(gameID, items, subitm, matchName, memo, direction, userInfo.UserID, lai.ToArray(), costRelationType, key, matchID, matchNum);
            }
        }

    }
    /// <summary>
    /// 查看可领取的推广信息
    /// </summary>
    public void BindSpreadReward()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        string createTime = null;
        //List<CMOP.Web.DB.proc_Reward_selResult> prss1 = Sp.proc_Reward_sel(userInfo.UserID, 0, createTime, createTime).ToList();
        var prss1 = WSClient.SpreadWS().GetUserSpreadRewardInfo(userInfo.UserID, 0, createTime, createTime).ToList();

        rpRewardGet.DataSource = prss1;
        rpRewardGet.DataBind();
        //
        lbNoneInfo1.Text = "<br />您还没有可领取的财富<br />";
        if (prss1.Count > 0)
        {
            lbNoneInfo1.Text = "";
        }
    }

    /// <summary>
    /// 查看所有推广信息
    /// </summary>
    public void BindSpreadRewardAll()
    {
        string createTime = this.txtDate1.Text == string.Empty ? DateTime.Now.ToString("G") : txtDate1.Text;
        string createTime2 = this.txtDate2.Text == string.Empty ? DateTime.Now.ToString("G") : txtDate2.Text;

        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        string create = DateTime.Now.ToString("G");

        List<proc_Reward_selResult> prss2 = WSClient.SpreadWS().GetUserSpreadRewardInfo(userInfo.UserID, -1, createTime, createTime2).ToList();
        //
        lbNoneInfo2.Text = "<br />您还没有奖励记录<br />";
        if (prss2.Count > 0)
        {
            lbNoneInfo2.Text = "";
        }
        rpSpreadInfo.DataSource = prss2;
        rpSpreadInfo.DataBind();
        // rpRewardGet.DataBind();
    }

    //查询
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        BindSpreadRewardAll();
    }

    #region 领取奖励

    protected void lbGetReward_Click(object sender, EventArgs e)
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        //应获得的财富
        //List<proc_Reward_VerifyResult> pRV = Sp.proc_Reward_Verify(userInfo.UserID).ToList();
        var pRV = WSClient.SpreadWS().VerifySpreadReward(userInfo.UserID);
        if (pRV.Length < 1)
        {
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "pswcallback", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('暂时没有可领取奖励');</script>", false);
            return;
        }

        ////////////////////获得道具
        bool res = true;
        foreach (var prv in pRV)
        {
            if (!TCJJG.Web.UserCenter.UserCenter.UserAcount().UserRecharge(userInfo.UserID, prv.TypeID, prv.Amount, 14, 6, 1, "推广获得" + prv.TypeName))
            {
                res = false;
            }
        }
        if (!res)
        {
            PublicClass.WriteErrLog("推广赚金系统--用户“" + userInfo.UserName + "”领取奖励失败" + DateTime.Now.ToString("F"));
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "pswcallback", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('暂时没有可领取奖励');</script>", false);
            return;
        }
        else
        {
            ScriptManager.RegisterStartupScript(this.Page, GetType(), "pswcallback", "<script language=\"javascript\" type=\"text/javascript\" defer=\"defer\" >alert('恭喜您领取成功');</script>", false);
            BindSpreadReward();
            BindSpreadRewardAll();
        }
    }

    #endregion
}