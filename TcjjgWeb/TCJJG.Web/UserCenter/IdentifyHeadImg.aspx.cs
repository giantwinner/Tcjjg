using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class UserCenter_IdentifyHeadImg : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (null == Session["IdenHeadPass"])
            {
                Response.Redirect("~/UserCenter/Default.aspx", true);
            }
        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserCenter/IdentifyHead_IDCard.aspx", true);
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/UserCenter/IdentifyHead_Video.aspx", true);
    }
}