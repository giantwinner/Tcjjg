using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using TCJJG.Web.Biz;
using Static.Common.Operation;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;

public partial class UserCenter_IdentifyHeadImg : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (null== Session["IdenHeadPass"])
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