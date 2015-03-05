using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;

public partial class UserCenter_UserReckoning : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.DDLGetData();
            getData();
        }
    }
    private void getData()
    {
        string selectDate1 = this.DropDownList1.SelectedValue;
        if (string.IsNullOrEmpty(selectDate1)) return;
        //
        string selectDate2 = this.DropDownList2.SelectedValue;
        if (string.IsNullOrEmpty(selectDate2)) return;
        //
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        //
        int? pageTotal = 0;
        //
        FFJJG.Common.UserCenter.Reckoning[] rk = UserCenter.UserAcount().UserReckoningSel(user.UserID, selectDate1, selectDate2, AspNetPager1.CurrentPageIndex, AspNetPager1.PageSize, ref pageTotal);
        this.gvData.DataSource = rk;
        this.gvData.DataBind();
        this.AspNetPager1.RecordCount = pageTotal.Value * AspNetPager1.PageSize;
    }

    protected void gvData_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex != -1)
        {
            int iRowNum = e.Row.RowIndex + 1;
            e.Row.Cells[0].Text = iRowNum.ToString();
        }
    }

    protected void AspNetPager1_PageChanged(object sender, EventArgs e)
    {
        getData();
    }

    #region

    private List<SelectDate> getFormDate()
    {
        List<SelectDate> lsd = new List<SelectDate>();
        DateTime dt = DateTime.Now;
        for (int i = 0; i < 30; i++)
        {
            SelectDate sd = new SelectDate();
            sd.DataValue = dt.AddDays(-i).ToString("yyyyMMdd");
            sd.DataText = dt.AddDays(-i).ToString("yyyy-MM-dd");

            lsd.Add(sd);
        }
        return lsd;
    }

    #endregion

    #region

    private void DDLGetData()
    {
        this.DropDownList1.DataTextField = "DataText";
        this.DropDownList1.DataValueField = "DataValue";
        this.DropDownList1.DataSource = getFormDate();
        this.DropDownList1.DataBind();
        //
        this.DropDownList2.DataTextField = "DataText";
        this.DropDownList2.DataValueField = "DataValue";
        this.DropDownList2.DataSource = getFormDate();
        this.DropDownList2.DataBind();
    }

    #endregion

    protected void btnOK_Click(object sender, EventArgs e)
    {
        this.getData();
    }
}
/// <summary>
/// 账单选择日期实体类
/// </summary>
public class SelectDate
{
    private string dataValue = string.Empty;
    /// <summary>
    /// 日期值
    /// </summary>
    public string DataValue
    {
        get { return dataValue; }
        set { dataValue = value; }
    }

    private string dataText = string.Empty;
    /// <summary>
    /// 日期文本
    /// </summary>
    public string DataText
    {
        get { return dataText; }
        set { dataText = value; }
    }
}
