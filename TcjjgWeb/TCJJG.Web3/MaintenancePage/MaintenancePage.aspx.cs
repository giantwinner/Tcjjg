using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class MaintenancePage_MaintenancePage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LoadContent();
        }
    }
    private void LoadContent()
    {
        var data = TCJJGWeb.GetMaintenancePage();
        if (null!=data)
        {
            LtlContent.Text = data.Contents;
        }
    }
}