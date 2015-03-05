using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;
using TCJJG.Web.DB;

public partial class Spread_SpreadIndex : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoginVerify();
        }
    }
    protected void LoginVerify()
    {
        //按状态绑定样式、模板
        lbReward.Text = "奖励制度";
        lbReward.Style.Add(HtmlTextWriterStyle.Color, "#3d3d3d");
        lbWhySpread.Style.Add(HtmlTextWriterStyle.Color, "#3d3d3d");

        if (Session["UserInfo"] != null)
        {//已登录
            pLoginYes.Visible = true;
            pLoginNo.Visible = false;
            lbReward.Text = "推广员可以获得哪些奖励";
            lbReward.Style.Add(HtmlTextWriterStyle.Color, "#3d3d3d");
            lbWhySpread.Style.Add(HtmlTextWriterStyle.Color, "#3d3d3d");
            //  
            BindInfo();
        }
    }

    /// <summary>
    /// 绑定用户信息
    /// </summary>
    protected void BindInfo()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        try
        {
        var uiSel = WSClient.SpreadWS().GetSpreadUserInfo(userInfo.UserID);
        LabNickName.Text = userInfo.UserName;
        LabSpreadCount.Text = (uiSel[0].SpreadCountLevel1).ToString();
        txtSpreadURL.Text = System.Configuration.ConfigurationManager.AppSettings["SpUrl"] + uiSel[0].SpreadNumber;
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write(ex);
        }

    }
}