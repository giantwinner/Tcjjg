using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Script.Serialization;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Biz;

public partial class Ajax_Ajax_Bulletin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        int pageIndex = 1;
        int pageCount = 6;
        int? pageTotal = 0;
        int ReturnTypeID = 0;//新闻+公告


        if (Request.QueryString["type"] == "0")
        {
            ReturnTypeID = 0;
        }
        else if (Request.QueryString["type"] == "2")//新闻公告
        {
            ReturnTypeID = 2;
            pageCount = 60;
        }
        else if (Request.QueryString["type"] == "3")//系统
        {
            ReturnTypeID = 3;
            pageCount = 60;
        }


        //
        int? typeid = 0;
        string typeName = string.Empty;
        ////////////
        var list = TCJJGWeb.FWP_News_ByType(2, ReturnTypeID, pageIndex, pageCount, ref pageTotal, ref typeid, ref typeName).ToList();
        JavaScriptSerializer j = new JavaScriptSerializer();
        string data = j.Serialize(list);
        Response.Write(data);


    }

}