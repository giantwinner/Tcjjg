using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using TCJJG.Web.DB;

public partial class MatchInfo_Match_sxs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
           // BindRound();
        }

    }
    /// <summary>
    /// 绑定轮次
    /// </summary>
    //private void BindRound()
    //{
    //    List<proc_WinnerRound_selectResult> ls = WebCommon.SelectWinnerRound();
    //    string round = "";
    //    if (ls.Count < 5)
    //    {
    //        for (int i = 0; i < ls.Count; i++)
    //        {
    //            if (ls[i].PitchOn == 1)
    //            {
    //                round += "<div class=\"sxs_winner_nav_item\" id='pitchon' roundid='" + ls[i].RoundID + "' heights='" + ls[i].height + "'>" + ls[i].RoundName + "获奖名单</div> ";
    //            }
    //            else
    //            {
    //                round += "<div class=\"sxs_winner_nav_item\" roundid='" + ls[i].RoundID + "' heights='" + ls[i].height + "'>" + ls[i].RoundName + "获奖名单</div> ";
    //            }
    //        }
    //    }
    //    else
    //    {
    //        for (int i = 0; i < 5; i++)
    //        {
    //            if (ls[i].PitchOn == 1)
    //            {
    //                round += "<div class=\"sxs_winner_nav_item\" id='pitchon' roundid='" + ls[i].RoundID + "' heights='" + ls[i].height + "'>" + ls[i].RoundName + "获奖名单</div> ";
    //            }
    //            else
    //            {
    //                round += "<div class=\"sxs_winner_nav_item\" roundid='" + ls[i].RoundID + "' heights='" + ls[i].height + "'>" + ls[i].RoundName + "获奖名单</div> ";
    //            }
    //        }
    //    }
    //    ltlRound.Text = round;

    //    string round2 = "";
    //    if (ls.Count > 5)
    //    {
    //        int tempCount=10;
    //        if (ls.Count<11)
    //        {
    //            tempCount = ls.Count;
    //        }
    //        for (int i = 5; i < tempCount; i++)
    //        {
    //            if (ls[i].PitchOn == 1)
    //            {
    //                round2 += "<div class=\"sxs_winner_nav_item\" id='pitchon' roundid='" + ls[i].RoundID + "' heights='" + ls[i].height + "'>" + ls[i].RoundName + "获奖名单</div> ";
    //            }
    //            else
    //            {
    //                round2 += "<div class=\"sxs_winner_nav_item\" roundid='" + ls[i].RoundID + "' heights='" + ls[i].height + "'>" + ls[i].RoundName + "获奖名单</div> ";
    //            }
    //        }
    //    }

    //    ltlRound2.Text = round2;
    //    string round3 = "";
    //    if (ls.Count > 10)
    //    {
    //        for (int i = 10; i < ls.Count; i++)
    //        {
    //            if (ls[i].PitchOn == 1)
    //            {
    //                round3 += "<div class=\"sxs_winner_nav_item\" id='pitchon' roundid='" + ls[i].RoundID + "' heights='" + ls[i].height + "'>" + ls[i].RoundName + "获奖名单</div> ";
    //            }
    //            else
    //            {
    //                round3 += "<div class=\"sxs_winner_nav_item\" roundid='" + ls[i].RoundID + "' heights='" + ls[i].height + "'>" + ls[i].RoundName + "获奖名单</div> ";
    //            }
    //        }
    //    }
    //    ltlRound3.Text = round3;
    //}
    //private void BindWinnerList()
    //{
    //    int roudID = Convert.ToInt32(Request.QueryString["id"]);
    //    List<proc_Winner_selectResult> ls = WebCommon.SelectWinnerList(roudID);
    //    string html = "<table class=\"sxs_winner_table\"><tr><th class=\"th\">" + ls[0].RoundName + "</th><th class=\"th\">获奖生肖票</th><th class=\"th\">获得生肖票玩家</th></tr>";
    //    for (int i = 0; i < ls.Count; i++)
    //    {
    //        html += "<tr><td class=\"td1\">" + ls[i].WinnerDays + "</td><td class=\"td2\">" + ls[i].WinnerGoods + "</td><td class=\"td3\">" + ls[i].WinnerName + "</td></tr></table>";
    //    }
    //    Response.Write(html);

    //    List<proc_Winner_selectResult> ls2 = WebCommon.SelectWinnerList(2);
    //    string html2 = "";
    //    for (int i = 0; i < ls2.Count; i++)
    //    {
    //        html2 += "<tr><td class=\"td1\">" + ls2[i].WinnerDays + "</td><td class=\"td2\">" + ls2[i].WinnerGoods + "</td><td class=\"td3\">" + ls2[i].WinnerName + "</td></tr>";
    //    }
    //    LiteralWinner2.Text = html2;

    //    List<proc_Winner_selectResult> ls3 = WebCommon.SelectWinnerList(3);
    //    string html3 = "";
    //    for (int i = 0; i < ls3.Count; i++)
    //    {
    //        html3 += "<tr><td class=\"td1\">" + ls3[i].WinnerDays + "</td><td class=\"td2\">" + ls3[i].WinnerGoods + "</td><td class=\"td3\">" + ls3[i].WinnerName + "</td></tr>";
    //    }
    //    LiteralWinner3.Text = html3;
    //}
}