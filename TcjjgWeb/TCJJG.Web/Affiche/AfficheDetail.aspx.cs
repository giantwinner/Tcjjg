using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Static.Common.Operation;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;

public partial class Affiche_AfficheDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (Convert.ToString(Request.QueryString["v"]) == "1")
            {
                hlreturn.NavigateUrl = "~/Affiche/VersionLog.aspx";
            }
            if (Convert.ToString(Request.QueryString["v"]) == "2")
            {
                WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
                if (null == userInfo)
                {
                    if (Request.Url != null)
                    {
                        Session["topUrl"] = Request.Url.ToString();
                    }
                    Response.Redirect("~/UserCenter/UserLogin.aspx", true);
                }
                hlreturn.NavigateUrl = "~/Affiche/Interactive.aspx";
                pnelComment.Visible = true;
            }
            string a = Request.QueryString["a"];
            lblnewid.Text = a;
            if (!CommonOperation.IsNumInt32(a))
            {
                return;
            }
            int id = Convert.ToInt32(a);
            int? last = 0;
            int? next = 0;

            var IindexAffiche = TCJJGWeb.FWP_News_SelectContent(id, ref last, ref next);

            foreach (var item in IindexAffiche)
            {
                this.AfficheTitle.Text = item.NewsTitle;
                this.ReleaseDate.Text = item.NewsDate;
                this.AfficheContent.Text = item.NewsContent;
                lblcaicount.Text = Convert.ToString(item.Batch);
                lblzancount.Text = Convert.ToString(item.Praise);
            }
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write(ex);
        }
    }
}