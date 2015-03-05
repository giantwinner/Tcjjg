using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Model;

public partial class Ajax_Ajax_UpdateQuestion : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UpdateQuestion();
    }

    private void UpdateQuestion()
    {
        if (Request.Params["UserID"] != null)
        {
            Guid userID = new Guid(Request.Params["UserID"]);
            int question1 = Convert.ToInt32(Request.Params["Q1"]);
            int question2 = Convert.ToInt32(Request.Params["Q2"]);
            int question3 = Convert.ToInt32(Request.Params["Q3"]);
            string answer1 = Request.Params["A1"];
            string answer2 = Request.Params["A2"];
            string answer3 = Request.Params["A3"];
            bool b = UserCenter.UserInfo().UpdatePwdQuestion(userID, question1, question2, question3, answer1, answer2, answer3);
            if (b == true)
            {
                Response.Write(0);
                Response.End();
            }
            else
            {
                Response.Write(-1);
                Response.End();
            }
        }
        else
        {
            Response.Write(-1);
            Response.End();
        }

    }
}