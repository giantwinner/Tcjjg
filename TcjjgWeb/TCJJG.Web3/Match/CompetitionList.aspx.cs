using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class Match_CompetitionList : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }

    private void BindData()
    {
        var ls = TCJJGWeb.SelectCompetitionCenter();
        

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
                html += "<div class='liTop'>";
                for (int j = i * 6; j < (i + 1) * 6; j++)
                {
                    if (string.IsNullOrEmpty(ls[j].LinkToDetail) && !string.IsNullOrEmpty(ls[j].MoreListImgUrl))
                    {
                        html += "<a><img src=" + ls[j].MoreListImgUrl + " /></a>";

                    }
                    else
                    {
                        html += "<a href=" + ls[j].LinkToDetail + "><img src=" + ls[j].MoreListImgUrl + " /></a>";
                    }
                }
                html += "</div>";
            }

            html += "<div class='liTop'>";
            for (int i = (pageCount - 1) * 6; i < ls.Count; i++)
            {
                if (string.IsNullOrEmpty(ls[i].LinkToDetail) && !string.IsNullOrEmpty(ls[i].MoreListImgUrl))
                {
                    html += "<a><img src=" + ls[i].MoreListImgUrl + " /></a>";

                }
                else
                {
                    html += "<a href=" + ls[i].LinkToDetail + "><img src=" + ls[i].MoreListImgUrl + " /></a>";
                }
            }
            html += "</div>";
            ltlContainer.Text = html;
        }
    }
}