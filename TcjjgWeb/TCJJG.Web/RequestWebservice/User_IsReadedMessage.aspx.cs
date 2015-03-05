using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;

public partial class RequestWebservice_User_IsReadedMessage : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.ContentType = "text/xml";
        int i = 0;
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        if (null != user)
        {
            //i = UserCenter.UserMessage().user.UserIsReadedMessage(user.UserID);
        }
        else
        {
            i = -1;// user session is null 
        }
        Response.Write("<i>" + i + "</i>");
        Response.End();
    }
}
