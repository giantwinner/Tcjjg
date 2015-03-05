using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.DB;
using TCJJG.Web.Biz;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;

public partial class UserControl_SalesSearch : System.Web.UI.UserControl
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            DDLData();
        }
    }

    void bindSalesName()
    {
        UserAreaInfo userAreaInfo = Session["UserAreaInfo"] as UserAreaInfo;
        this.ddlSearchAccount.DataTextField = "TypeName";
        this.ddlSearchAccount.DataValueField = "TypeID";
        this.ddlSearchAccount.DataSource = WSClient.SalesRoomWS().GetSalesConfig(userAreaInfo.CityID.Value);
        this.ddlSearchAccount.DataBind();

    }

    protected void dplType_SelectedIndexChanged(object sender, EventArgs e)
    {
        DDLData();
    }

    private void DDLData()
    {
        if (dplType.SelectedValue == "1")
        {
            this.divddlSearchAccount.Visible = true;
            this.divTxtSearchNickName.Visible = false;
            bindSalesName();
        }
        else if (dplType.SelectedValue == "2")
        {
            this.divddlSearchAccount.Visible = false;
            this.divTxtSearchNickName.Visible = true;
            this.txtSearchNickName.ReadOnly = false;
        }
        else
        {
            this.divddlSearchAccount.Visible = true;
            this.divTxtSearchNickName.Visible = false;
            this.ddlSearchAccount.Items.Clear();
            ListItem li = new ListItem("搜索名称", "0");
            this.ddlSearchAccount.Items.Insert(0, li);
        }
    }

    protected void butSearch_Click(object sender, EventArgs e)
    {
        string ty = dplType.SelectedValue;
        string ykj = this.ddlSearchAccount.SelectedValue;
        string nn = Server.UrlEncode(this.txtSearchNickName.Text);
        Response.Redirect("SalesInfo.aspx?ty=" + ty + "&ykj=" + ykj + "&nn=" + nn, true);
    }
}