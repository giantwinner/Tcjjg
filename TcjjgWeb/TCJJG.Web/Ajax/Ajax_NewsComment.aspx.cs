using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;
using Static.Common.Operation;
using TCJJG.Web.Model;

public partial class Ajax_Ajax_NewsComment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
             WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
                if (null == userInfo)
                {
                    return;
                }
            int commentType = 1;
            int newsID = Convert.ToInt32(Request.QueryString["newsID"]);
            string userID = userInfo.UserID.ToString(); 
            if (Request.QueryString["type"] == "2")
            {
                commentType = 2;
            }
            int? newCount = 0;
            int result = TCJJGWeb.FWT_News_Comment(newsID, userID, commentType, ref newCount);
            string r = Convert.ToString(result) + "," + commentType + "," + newCount;
            Response.Write(r);
        }
    }
}