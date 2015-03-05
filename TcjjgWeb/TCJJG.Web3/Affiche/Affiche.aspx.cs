using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class Affiche_Affiche : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
        BindSysData();
    }
    private void BindData()
    {
        int pageIndex = 1;
        int pageSize = 60;
        int? pageTotal = 60;
        int ReturnTypeID = 2;//新闻+公告
        int? typeid = 0;
        string typeName = string.Empty;

         var ls = TCJJGWeb.FWP_News_ByType(2, ReturnTypeID, pageIndex, pageSize, ref pageTotal, ref typeid, ref typeName);
        int pageCount = 0;
        int remainder = (ls.Count) % 6 == 0 ? 0 : (ls.Count) % 6;
        if (remainder == 0)
        {
            pageCount = (ls.Count) / 6;
        }
        else
        {
            pageCount = (ls.Count) / 6 + 1;
        }
        if (pageCount > 0)
        {
            string html = "";
            for (int i = 0; i < pageCount - 1; i++)
            {
                html += "<div class='CompetitionAfficheContent'>";
                for (int j = i * 6; j < (i + 1) * 6; j++)
                {
                    html = html + "<a class=\"RowContent\" href='/Affiche/AfficheDetail-" + ls[j].NewsID + ".html'><span class=\"Block\"></span>&nbsp;&nbsp;<span class=\"Content\">" + ls[j].NewsTitle + " </span>" +
"<span class=\"Time\">" + ls[j].NewsDate + "</span></a>";
                }
                html += "</div>";
            }

            html += "<div class='CompetitionAfficheContent'>";
            for (int i = (pageCount - 1) * 6; i < ls.Count; i++)
            {
                html = html + "<a class=\"RowContent\" href='/Affiche/AfficheDetail-" + ls[i].NewsID + ".html'><span class=\"Block\"></span>&nbsp;&nbsp;<span class=\"Content\">" + ls[i].NewsTitle + " </span>" +
"<span class=\"Time\">" + ls[i].NewsDate + "</span></a>";
            }
            html += "</div>";
            ltlContainer.Text = html;
        }
    }
    private void BindSysData()
    {
        int pageIndex = 1;
        int pageSize = 60;
        int? pageTotal = 60;
        int ReturnTypeID = 3;//新闻+公告
        int? typeid = 0;
        string typeName = string.Empty;
        var ls = TCJJGWeb.FWP_News_ByType(2, ReturnTypeID, pageIndex, pageSize, ref pageTotal, ref typeid, ref typeName).ToList();

        int pageCount = 0;
        int remainder = (ls.Count) % 6 == 0 ? 0 : (ls.Count) % 6;
        if (remainder == 0)
        {
            pageCount = (ls.Count) / 6;
        }
        else
        {
            pageCount = (ls.Count) / 6 + 1;
        }
        if (pageCount > 0)
        {
            string html = "";
            for (int i = 0; i < pageCount - 1; i++)
            {
                html += "<div class='SystemAfficheContent'>";
                for (int j = i * 6; j < (i + 1) * 6; j++)
                {
                    html = html + "<a class=\"RowContent\" href='/Affiche/AfficheDetail-" + ls[j].NewsID + ".html'><span class=\"Block\"></span>&nbsp;&nbsp;<span class=\"Content\">" + ls[j].NewsTitle + " </span>" +
"<span class=\"Time\">" + ls[j].NewsDate + "</span></a>";
                }
                html += "</div>";
            }

            html += "<div class='SystemAfficheContent'>";
            for (int i = (pageCount - 1) * 6; i < ls.Count; i++)
            {
                html = html + "<a class=\"RowContent\" href='/Affiche/AfficheDetail-" + ls[i].NewsID + ".html'><span class=\"Block\"></span>&nbsp;&nbsp;<span class=\"Content\">" + ls[i].NewsTitle + " </span>" +
"<span class=\"Time\">" + ls[i].NewsDate + "</span></a>";
            }
            html += "</div>";
            ltlContainer2.Text = html;
        }
    }
}