using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using System.Web.Script.Serialization;

public partial class Ajax_Ajax_ValidataQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ValiDataQuestion();
    }

    public class valiReturn
    {
        public  int errorNo
        { get; set; }
    }

    private void ValiDataQuestion()
    {
        if (Request.Params["UserName"] != null)
        {
            string userName = Request.Params["UserName"];
            string question1 = Request.Params["Question1"];
            string question2 = Request.Params["Question2"];
            string question3 = Request.Params["Question3"];

            int error = UserCenter.UserInfo().ValidatePwdQuestion(userName, question1, question2, question3);
            Response.Write(error);
            Response.End();
        }
    }
}