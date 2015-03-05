using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Interface_TopUpTest : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnOK_Click(object sender, EventArgs e)
    {
        string userName = txtUserName.Text;
        string orderID = txtOrder.Text;
        int amount =100;
        try
        {
            amount = Convert.ToInt32(txtAmount.Text);
        }
        catch
        {

        }
        int keyNum = 15000;
        try
        {
            keyNum = Convert.ToInt32(txtKeyNum.Text);
        }
        catch
        {

        }
        string keyName = txtKeyName.Text;
        string md = userName + orderID + keyName + amount;
        md = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(md, "MD5").ToLower();
        string str = "ID=" + userName + "&OrderID=" + orderID + "&Amount=" + amount + "&Key=" + keyNum + "&MD=" + md;
        
        
        //Response.Redirect("http://w3c.tcddz.com/Recharge.aspx?" + str);
        Response.Redirect("../Recharge.aspx?" + str);
    }
}