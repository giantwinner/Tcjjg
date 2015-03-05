using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class UserControl_CustomerService : System.Web.UI.UserControl
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
        var ls = TCJJGWeb.SelectFAQInfoList();
        
       string html = "";
       for (int i = 0; i < ls.Count; i++)
       {
           html += "<a href='../Help/FAQ.aspx#"+ls[i].FAQPosition+"' class='Question'>"+ls[i].FAQTitle+"</a>";
       }
       QuestionContainer.InnerHtml=html;
    }
}