using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Biz;

public partial class Ajax_Ajax_VisitCounter : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (null != Request.Params["visitWeb"])
        {
            if (null == Session["default"])
            {
                int visitWeb = Convert.ToInt32(Request.Params["visitWeb"]);
                //记录页面访问次数。
                EditWebVisitCount(visitWeb, Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd")));
                if (null == Session["default"])
                {
                    Session["default"] = "default";
                }
            }
            else
            {
                if (Request.UrlReferrer.AbsolutePath == "/UserCenter/UserReg.aspx" && null == Session["reg"])
                {
                    int visitWeb = Convert.ToInt32(Request.Params["visitWeb"]);
                    //记录页面访问次数。
                    EditWebVisitCount(visitWeb, Convert.ToDateTime(DateTime.Now.ToString("yyyy-MM-dd")));
                    if (null == Session["reg"])
                    {
                        Session["reg"] = "reg";
                    }
                }
            }
        }
    }
    private void EditWebVisitCount(int visitWeb, DateTime visitDateTime)
    {
        //string result = CMOPAwards.EditWebVisitCount(visitWeb, visitDateTime);
        //if (result != "")
        //{
        //    PublicClass.WriteErrLog(result);
        //}
        WSClient.CMOPWebWS().EditWebVisitCount(visitWeb, visitDateTime);
    }
}