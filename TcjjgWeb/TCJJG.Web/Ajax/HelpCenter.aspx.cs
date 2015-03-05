using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class Ajax_HelpCenter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindData();
    }
    private void BindData()
    {
        int result = 0;
        int.TryParse(Request.QueryString["id"], out result);
        try
        {
            var data = TCJJGWeb.SelectContent(result);
            if (0 != data.Count)
            {
                Response.Write(TCJJGWeb.SelectContent(result).FirstOrDefault().HelpContent);
            }
            else
            {
                Response.Write("");
            }
        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write(ex);
        }
        finally
        {
            Response.End();
        }
    }
}