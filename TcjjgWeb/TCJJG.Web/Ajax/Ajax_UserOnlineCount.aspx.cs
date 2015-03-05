using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Ajax_Ajax_UserOnlineCount : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Convert.ToString(Request.QueryString["olc"]) == "1")
        {
            try
            {
                int userCount = TCJJG.Web.UserCenter.UserCenter.UserInfo().GetOnLineUserCount();
                userCount = (int)Math.Sqrt(Convert.ToDouble(userCount) * 10000) + 316;
                Response.Write(userCount);
            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
                Response.Write("-1");
            }
        }
    }
}