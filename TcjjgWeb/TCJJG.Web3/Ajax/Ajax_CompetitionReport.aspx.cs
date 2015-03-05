using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using System.Web.Script.Serialization;

public partial class Ajax_Ajax_CompetitionReport : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var list = TCJJGWeb.SelectCompetitionReport();

        JavaScriptSerializer j = new JavaScriptSerializer();
        string data = j.Serialize(list);
        Response.Write(data);
    }
}