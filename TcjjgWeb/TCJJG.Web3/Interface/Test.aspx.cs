using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;
using Static.Common.Operation;
using System.Net;

public partial class Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    private string BindUserInfo()
    {
        string userID = txtID.Text;
        string userNickName = txtName.Text;
        string sex = "1";
        int keyNum = 0;
        
        try
        {
            keyNum = Convert.ToInt32(txtKeyNum.Text);
        }
        catch
        {
        }
        string keyName = txtKeyName.Text;
        string md = string.Empty;
            
        string userPwd = string.Empty;
        string str;
        if (txtPwd.Text == null || txtPwd.Text == "")
        {
            md = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(userID + keyName, "MD5").ToLower();
            str = "ID=" + userID + "&Name=" + userNickName + "&Sex=" + sex + "&Key=" + keyNum + "&MD=" + md;
        }
        else
        {
            userPwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(userPwd, "MD5").ToLower();
            md = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(userID + userPwd + keyName, "MD5").ToLower();
            str = "ID=" + userID + "&Pwd=" + userPwd + "&Name=" + userNickName + "&Sex=" + sex + "&Key=" + keyNum + "&MD=" + md;
        }
        
        
        return str;
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        string str = BindUserInfo();
        //frameMain.Attributes.Add("src", "http://w3c.tcddz.com/Poker.aspx?" + str);
        frameMain.Attributes.Add("src", "http://yang-pc/Poker.aspx?" + str);
        //frameMain.Attributes.Add("src", "http://devserver-pc/Poker.aspx?" + str);
        
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        string str = BindUserInfo();
        //Response.Redirect("../Poker.aspx?" + str);
        Response.Redirect("http://w3c.tcddz.com/Poker.aspx?" + str);
    }

}