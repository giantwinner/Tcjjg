using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class Match_MatchDetail : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindInfo();
    }
    private void BindInfo()
    {
        string ID = Request.QueryString["m"];
        if (!string.IsNullOrEmpty(ID))
        {
            try
            {
               var data = TCJJGWeb.GetCompetitionCenterDetail(Convert.ToInt32(ID)).Single();
               ltrl.Text = data.DetailedContent;
            }
            catch
            {
                Response.Redirect("~/", true);
            }
        }
    }

}