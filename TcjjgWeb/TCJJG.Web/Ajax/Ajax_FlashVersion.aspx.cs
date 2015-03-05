using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using Static.Common.Operation;

public partial class Ajax_Ajax_FlashVersion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string iP = CommonOperation.GetIP4Address();
        string version = Convert.ToString(Request.QueryString["version"]);
        if (!string.IsNullOrEmpty(iP) && !string.IsNullOrEmpty(version))
        {
            WSClient.CMOPWebWS().ColletFlashVersion(iP, version);
        }
    }
}