using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;

public partial class UserCenter_PersonalAward : BasePage
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
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        GoodsInfo[] ginfo = UserCenter.UserRichInfo().GetUserGoods(userInfo.UserID);

        int pageCount = 0;
        int remainder = (ginfo.Length) % 18 == 0 ? 0 : (ginfo.Length) % 18;
        if (remainder == 0)
        {
            pageCount = (ginfo.Length) / 18;
        }
        else
        {
            pageCount = (ginfo.Length) / 18 + 1;
        }


        if (pageCount > 0)
        {
            string html = "";
            for (int i = 0; i < pageCount - 1; i++)
            {
                html += "<div class='pageItem'>";
                for (int j = i * 18; j < (i + 1) * 18; j++)
                {
                    html += "<div class='goodsItemContainer'><div class='backImg'><div class='goodRemark'>" + ginfo[j].M+ "</div><img src='" + ginfo[j].I + "' alt='' /><div class='goodsAmount'>" + ginfo[j].A + "</div></div><div class='goodsName'>" + ginfo[j].N + "</div></div>";
                }
                html += "</div>";
            }
            html += "<div class='pageItem'>";
            for (int i = (pageCount - 1) * 18; i < ginfo.Length; i++)
            {
                html += "<div class='goodsItemContainer'><div class='backImg'><div class='goodRemark'>" + ginfo[i].M + "</div><img src='" + ginfo[i].I + "' alt='' /><div class='goodsAmount'>" + ginfo[i].A + "</div></div><div class='goodsName'>" + ginfo[i].N + "</div></div>";
            }
            html += "</div>";
            ltlContainer.Text = html;
        }


    }
}