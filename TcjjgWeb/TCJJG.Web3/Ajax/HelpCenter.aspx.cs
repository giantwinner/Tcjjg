using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class Ajax_HelpCenter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }
    private void BindData()
    {
        int? id = Convert.ToInt32(Request.QueryString["id"]);
        Response.Write(TCJJGWeb.SelectContent(id).First().HelpContent);
        Response.End();
    }
}