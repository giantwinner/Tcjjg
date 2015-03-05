using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class CustomerService_Goods : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
    private void BindData()
    {
        int? temp = 0;
        var list = TCJJGWeb.SelectByType(4, ref temp);
       
        string html = "<div style='width:15px;height:24px;float: left;'></div>";
        if (list.Count < 5)
        {
            for (int i = 0; i < list.Count; i++)
            {
                html += "<div class=\"help_nav_item\" id=\"" + list[i].HelpID + "\">" + list[i].HelpName + " </div>";
            }
            litGuid.Text = html;
        }
        else
        {
            for (int i = 0; i < 5; i++)
            {
                html += "<div class=\"help_nav_item\" id=\"" + list[i].HelpID + "\">" + list[i].HelpName + " </div>";
            }
            litGuid.Text = html;

            string htmlMore = "";
            for (int i = 5; i < list.Count; i++)
            {
                htmlMore += "<div class=\"help_nav_item\" id=\"" + list[i].HelpID + "\">" + list[i].HelpName + " </div>";
            }
            litGuidMore.Text = htmlMore;
        }
    }
}