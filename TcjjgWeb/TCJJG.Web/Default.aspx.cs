using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Biz;
using FFJJG.Common.UserCenter;
using Static.Common.Operation;

public partial class Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            this.Form.DefaultButton = "btnNothing";
            GetPageAllContent();
            GetTopImgs();
        }
    }
    /// <summary>
    /// 顶部切换图片
    /// </summary>
    private void GetTopImgs()
    {
        try
        {
            var LY = TCJJGWeb.GetIndexADImg().Take(4).ToList();
            string imgStr = string.Empty;
            for (int i = 0; i < LY.Count; i++)
            {

                imgStr += "<a href='" + LY[i].LinkURL + "'><img src='" + LY[i].ImageName + "' class='transimg' alt='' /></a>";
            }

            ltaTopImgs.Text = imgStr;

        }
        catch (Exception ex)
        {
            FFJJG.Server.Utils.Logging.write(ex);
        }

    }

    private void GetPageAllContent()
    {
        var data = TCJJGWeb.GetPageAllContent();
        if (null != data)
        {
            for (int i = 0; i < data.Count; i++)
            {
                //if (data[i].PositionType == 2)
                //{
                //    ltl2.Text = data[i].TextContent;
                //}
                //else if (data[i].PositionType == 3)
                //{
                //    ltl3.Text = data[i].TextContent;
                //}
                //else 
                if (data[i].PositionType == 4)
                {
                    ltl4.Text = data[i].TextContent;
                }
            }
        }
    }

}