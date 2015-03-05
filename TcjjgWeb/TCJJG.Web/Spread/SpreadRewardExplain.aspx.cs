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
            type2_Click(sender, e);
        }
    }
    /// <summary>
    /// 奖励说明
    /// </summary>
    /// <param name="Level">1/2：直接/间接推广</param>
    public void BinSRE()
    {
        try
        {
            rpSRE.DataSource = WSClient.SpreadWS().GetAwardConfigList();
            rpSRE.DataBind();
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write(ex);
        }

    }

    #region 选项卡

    private static string GetDivKeyUp;
    protected void BinStyle()
    {
        //声明调用JS方法
        string js = @"<Script language='JavaScript'> show2('" + GetDivKeyUp + "');</Script>";

        //调用前台中JS方法 加载样式
        ClientScript.RegisterStartupScript(Page.GetType(), "downUpType", js);
    }

    protected void type1_Click(object sender, EventArgs e)
    {
        Type2.ImageUrl = "~/Images/BtnImg/detailaward1.jpg";
        lkType1.ImageUrl = "~/Images/BtnImg/award2.jpg";
        pLeft.Visible = true;
        pRight.Visible = false;
    }
    protected void type2_Click(object sender, EventArgs e)
    {
        Type2.ImageUrl = "~/Images/BtnImg/detailaward2.jpg";
        lkType1.ImageUrl = "~/Images/BtnImg/award1.jpg";
        pLeft.Visible = false;
        pRight.Visible = true;

        BinSRE();
    }

    #endregion
}