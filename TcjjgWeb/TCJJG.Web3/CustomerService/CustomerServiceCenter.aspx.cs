using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class CustomerService_CustomerServiceCenter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected string GetBBSUrl()
    {
        return WebCommon.GetFFJJGWebXML("ffjjgweb/", "DNTBBSUrl");
    }
}