using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserCenter_ChangeGoldCoinsResult : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Convert.ToString( Request.QueryString["rid"])=="OK")
            {
                pnel_ok.Visible = true;
                pnel_msg.Visible = false;
            }
            else
            {
                pnel_msg.Visible = true;
                pnel_ok.Visible = false;
            }
            lblMsg.Text =Convert.ToString( Request.QueryString["rid"]);
        }
    }
    protected void imgBtnRedirect_Click(object sender, ImageClickEventArgs e)
    {
        Response.Redirect("ChangeGoldCoins.aspx",true);
    }
}