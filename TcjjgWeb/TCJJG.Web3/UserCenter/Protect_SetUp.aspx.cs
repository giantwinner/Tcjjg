using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;

public partial class SecurityCenter_Protect_SetUp : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            BindDDLQuestion();
            BindUser();
        }
        catch
        {

        }
    }


    private void BindDDLQuestion()
    {
        ddlQuestion1.DataSource = UserCenter.UserInfo().GetQuestionList();
        ddlQuestion1.DataValueField = "QuestionID";
        ddlQuestion1.DataTextField = "QuestionName";
        ddlQuestion1.DataBind();

        ddlQuestion2.DataSource = UserCenter.UserInfo().GetQuestionList();
        ddlQuestion2.DataValueField = "QuestionID";
        ddlQuestion2.DataTextField = "QuestionName";
        ddlQuestion2.DataBind();

        ddlQuestion3.DataSource = UserCenter.UserInfo().GetQuestionList();
        ddlQuestion3.DataValueField = "QuestionID";
        ddlQuestion3.DataTextField = "QuestionName";
        ddlQuestion3.DataBind();
    }

    private void BindUser()
    {
        WebUserInfo user = Session["UserInfo"] as WebUserInfo;
        lblUserID.Text = user.UserID.ToString();
    }
}