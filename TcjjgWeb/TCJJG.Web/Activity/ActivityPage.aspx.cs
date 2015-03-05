using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class Activity_ActivityPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
    protected string ChangShow(object rank)
    {
        string newRank = string.Empty;
        if (Convert.ToString(rank)=="1")
        {
            newRank = "冠军";
        }
        else if (Convert.ToString(rank) == "2")
        {
            newRank = "亚军";
        }
        else if (Convert.ToString(rank) == "3")
        {
            newRank = "季军";
        }
        else
        {
            newRank = rank.ToString();
        }
        return newRank;
    }
    private void BindData()
    {
        lblDate1.Text = DateTime.Now.AddDays(-1).Month + "月" + DateTime.Now.AddDays(-2).Day + "日";
        lblDate2.Text = DateTime.Now.AddDays(-1).Month + "月" + DateTime.Now.AddDays(-1).Day + "日";
        DateTime createTime = Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd"));
        rpEx.DataSource = WSClient.CMOPWebWS().GetUserRankList(createTime, 6);
        rpEx.DataBind();

        rpbonus.DataSource = WSClient.CMOPWebWS().GetUserRankList(createTime, -1);
        rpbonus.DataBind();
    }
}