using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Static.Common.Operation;
using TCJJG.Web.Biz;

public partial class Affiche_AfficheDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            string a = Request.QueryString["a"];
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
            }
        }
        catch
        { }
    }
}