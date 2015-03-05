using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using Static.Common.Operation;
using TCJJG.Web.Model;

/// <summary>
/// 像圈圈网这样的合作伙伴，通过url记录工会id和网吧id
/// </summary>
public class BasePagePid : BasePageCMOP
{
    public BasePagePid()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }

    protected override void OnInit(EventArgs e)
    {
        base.OnInit(e);
        //
        if (
            Session["ProInfoReg"] == null &&
            Request.Params["pid"] != null &&
            CommonOperation.IsNumInt32(Request.Params["pid"].ToString()) &&
            Request.Params["gid"] != null &&
            CommonOperation.IsNumInt32(Request.Params["gid"].ToString())
            )
        {
            ProInfoReg pir = new ProInfoReg();
            pir.PID = Convert.ToInt32(Request.Params["pid"].ToString());
            pir.GangsID = Convert.ToInt32(Request.Params["gid"].ToString());
            Session["ProInfoReg"] = pir;
        }
    }
}