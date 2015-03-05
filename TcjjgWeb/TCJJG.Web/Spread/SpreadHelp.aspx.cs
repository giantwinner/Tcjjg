using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.DB;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;

public partial class Spread_SpreadHelp : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindInfo();
    }
    /// <summary>
    /// 绑定用户信息
    /// </summary>
    protected void BindInfo()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        if (null==userInfo)
        {
            return;
        }
        var uiSel = WSClient.SpreadWS().GetSpreadUserInfo(userInfo.UserID);

        txtLink1.Text = System.Configuration.ConfigurationManager.AppSettings["SpUrl"] + uiSel[0].SpreadNumber;
        txtLink2.Text = System.Configuration.ConfigurationManager.AppSettings["SpUrl"] + uiSel[0].SpreadNumber;
        txtLink3.Text = System.Configuration.ConfigurationManager.AppSettings["SpUrl"] + uiSel[0].SpreadNumber;
    }
}