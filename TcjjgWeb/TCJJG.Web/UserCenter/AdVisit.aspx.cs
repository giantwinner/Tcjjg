using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserCenter_AdVisit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //记录进入广告页面的数
            try
            {
                if (Request.QueryString["spread"] != null)
                {
                    int spreadNum = 0;
                    int.TryParse(Request.QueryString["spread"], out spreadNum);

                    if (spreadNum == 0)
                    {
                        return;
                    }
                    if (null == Session["spread"])
                    {
                        TCJJG.Web.Biz.WSClient.SpreadWS().VisitRegBySpread(spreadNum, DateTime.Now);
                        Session["spread"] = Request.QueryString["spread"].ToString();
                    }
                }
            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
            }
        }
    }
}