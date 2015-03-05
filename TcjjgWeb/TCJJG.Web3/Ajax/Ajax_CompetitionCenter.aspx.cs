using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using TCJJG.Web.Biz;

public partial class Ajax_Ajax_CompetitionCenter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        var list = TCJJGWeb.SelectCompetitionCenter();
        JavaScriptSerializer j = new JavaScriptSerializer();
        string data = j.Serialize(list);
        Response.Write(data);
    }
}