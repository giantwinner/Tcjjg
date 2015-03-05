using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Biz;
using TCJJG.Web.DB;

public partial class CustomerService_Floorilla : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            BindData();
        }
    }
    private void BindData()
    {
        UserAreaInfo userAreaInfo = Session["UserAreaInfo"] as UserAreaInfo;
        this.Span_CityName.InnerText = userAreaInfo.CityName;
        int cityID = Convert.ToInt32(userAreaInfo.CityID);
        var ls =  WSClient.CMOPWebWS().GetFloorillaInfoList(cityID);

        string strInfo = "";
        for (int i = 0; i < ls.Length; i++)
        {
            strInfo += "<div class='FloorillaDetail'>" + ls[i].FloorillaName + "</div><div class='FloorillaDetail2'>" + ls[i].FloorillaQQNum + ls[i].Remark + "</div><br />";
        }
        Floorilla_Content.InnerHtml = strInfo;
    }

}