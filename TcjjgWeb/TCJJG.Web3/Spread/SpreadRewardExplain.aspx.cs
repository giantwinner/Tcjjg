using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class Spread_SpreadRewardExplain : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            GetDivKeyUp = "dType1";
            BinStyle();
        }
    }
    /// <summary>
    /// 奖励说明
    /// </summary>
    /// <param name="Level">1/2：直接/间接推广</param>
    public void BinSRE(int Level)
    {
        //rpSRE.DataSource = sp.proc_Award_GetAwardConfigList(Level);
        rpSRE.DataSource = WSClient.SpreadWS().GetSpreadAwardConfigList(Level);
        rpSRE.DataBind();
    }

    #region 选项卡

    private static string GetDivKeyUp;
    protected void BinStyle()
    {
        //声明调用JS方法
        string js = @"<Script language='JavaScript'> show2('" + GetDivKeyUp + "'); </Script>";

        //调用前台中JS方法 加载样式
        ClientScript.RegisterStartupScript(Page.GetType(), "downUpType", js);
    }

    protected void type1_Click(object sender, EventArgs e)
    {
        GetDivKeyUp = "dType1";
        BinStyle();
        pLeft.Visible = true;
        pRight.Visible = false;
    }
    protected void type2_Click(object sender, EventArgs e)
    {
        GetDivKeyUp = "dType2";
        BinStyle();
        pLeft.Visible = false;
        pRight.Visible = true;

        BinSRE(1);
        RadioButtonList1.SelectedValue = "1";

    }

    #endregion

    protected void RadioButtonList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GetDivKeyUp = "dType2";
        BinStyle();
        lbAwardDes1.Text = RadioButtonList1.SelectedItem.Text;
        //lbAwardDes2.Text = RadioButtonList1.SelectedItem.Text;
        int lev = Convert.ToInt32(RadioButtonList1.SelectedValue);
        BinSRE(lev);
        //
        if (RadioButtonList1.SelectedValue == "1")
            lbText.Text = "提示：累积10个好友都达到5级则额外赠送20000金币！";
        else
            lbText.Text = "提示：累积10个间接邀请的好友都达到5级则额外赠送4000金币！";
    }
}