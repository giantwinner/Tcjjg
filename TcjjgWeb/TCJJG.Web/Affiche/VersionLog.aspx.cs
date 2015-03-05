using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class Affiche_VersionLog : System.Web.UI.Page
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
        int pageIndex = 1;
        int pageSize = 60;
        int? pageTotal = 60;
        int ReturnTypeID = 17;
        int? typeid = 0;
        string typeName = string.Empty;

        var ls = TCJJGWeb.FWP_News_ByType(1, ReturnTypeID, pageIndex, pageSize, ref pageTotal, ref typeid, ref typeName);
        int pageCount = 0;
        int remainder = (ls.Count) % 10 == 0 ? 0 : (ls.Count) % 10;
        if (remainder == 0)
        {
            pageCount = (ls.Count) / 10;
        }
        else
        {
            pageCount = (ls.Count) / 10 + 1;
        }
        if (pageCount > 0)
        {
            string html = "";
            for (int i = 0; i < pageCount - 1; i++)
            {
                html += "<div class='affiche-page'>";
                for (int j = i * 10; j < (i + 1) * 10; j++)
                {
                    html = html + "<div class='affiche-item'><div class='affiche-item-top2'><div class='affiche-type1'>系统</div><div class='affiche-title'>" + ls[j].NewsTitle + "</div><div class='affiche-date'>" + ls[j].NewsDate + "</div><a class='affiche-link' href='/Affiche/AfficheDetail-" + ls[j].NewsID + ".html?v=1'>详情>></a></div></div>";
                }
                html += "</div>";
            }

            html += "<div class='affiche-page'>";
            for (int i = (pageCount - 1) * 10; i < ls.Count; i++)
            {
                html = html + "<div class='affiche-item'><div class='affiche-item-top2'><div class='affiche-type1'>系统</div><div class='affiche-title'>" + ls[i].NewsTitle + "</div><div class='affiche-date'>" + ls[i].NewsDate + "</div><a class='affiche-link' href='/Affiche/AfficheDetail-" + ls[i].NewsID + ".html?v=1'>详情>></a></div></div>";
            }
            html += "</div>";
            ltlContainer.Text = html;
        }
    }
}