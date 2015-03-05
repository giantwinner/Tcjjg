using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Model;

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
        int remainder = (ginfo.Length) % 10 == 0 ? 0 : (ginfo.Length) % 10;
        if (remainder == 0)
        {
            pageCount = (ginfo.Length) / 10;
        }
        else
        {
            pageCount = (ginfo.Length) / 10 + 1;
        }


        if (pageCount > 0)
        {
            string html = "";
            for (int i = 0; i < pageCount - 1; i++)
            {
                html += "<div class='PersonalAwardContainer'>";
                for (int j = i * 10; j < (i + 1) * 10; j++)
                {
                    string d = string.Empty;
                    //if (!string.IsNullOrEmpty(ginfo[j].D))
                    //{
                    //    d = "[有效期：" + ginfo[j].D + "]";
                    //}
                    html += "<div class='AwardItemContainer'><div class='AD_Remark'>" + ginfo[j].M + d + "</div><div class='AD_ImgUrl'><img src='" + ginfo[j].I + "' /></div><div class='AD_Name'>" + ginfo[j].N + "</div><div class='AD_Count'>" + ginfo[j].A + "</div></div>";
                }
                html += "</div>";
            }
            html += "<div class='PersonalAwardContainer'>";
            for (int i = (pageCount - 1) * 10; i < ginfo.Length; i++)
            {
                string d = string.Empty;
                //if (!string.IsNullOrEmpty(ginfo[i].D))
                //{
                //    d = "[有效期：" + ginfo[i].D + "]";
                //}
                html += "<div class='AwardItemContainer'><div class='AD_Remark'>" + ginfo[i].M + d + "</div><div class='AD_ImgUrl'><img src='" + ginfo[i].I + "' /></div><div class='AD_Name'>" + ginfo[i].N + "</div><div class='AD_Count'>" + ginfo[i].A + "</div></div>";
            }
            html += "</div>";
            ltlContainer.Text = html;
        }


    }
}