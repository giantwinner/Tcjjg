using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.DB;
using TCJJG.Web.Biz;

public partial class Ajax_WinnerRound : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //try
        //{
        //    int roudID = Convert.ToInt32(Request.QueryString["id"]);
        //    List<proc_Winner_selectResult> ls = WebCommon.SelectWinnerList(roudID);
        //    if (ls.Count != 0)
        //    {
        //        string html = "<tr><th class=\"th\" id='thf'>" + ls[0].RoundName + "</th><th class=\"th\">获奖生肖票</th><th class=\"th\">获得生肖票玩家</th></tr>";
        //        for (int i = 0; i < ls.Count; i++)
        //        {
        //            html += "<tr><td class=\"td1\">" + ls[i].WinnerDays + "</td><td class=\"td2\">" + ls[i].WinnerGoods + "</td><td class=\"td3\">" + ls[i].WinnerName + "</td></tr>";
        //        }
        //        Response.Write(html);
        //    }
        //    Response.End();
        //}
        //catch
        //{ }
    }
}