﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using FFJJG.Common.UserCenter;
using TCJJG.Web.UserCenter;

public partial class UserCenter_UserBillDetail : BasePage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindReckoningInfo();
    }
    private void BindReckoningInfo()
    {
        try
        {
            WebUserInfo user = Session["UserInfo"] as WebUserInfo;
            Guid uID = user.UserID;
            Guid rID = new Guid(Request.QueryString["RID"]);
            ReckoningInfo reck = new ReckoningInfo();
            reck = UserCenter.UserAcount().UserReckoningAmply(uID, rID);
            lblAwardName.Text = reck.AwardName;
            lblAmount.Text = reck.Amount.ToString();
            lblAcountType.Text = reck.SubItemName;
            lblDate.Text = reck.CreateTime.ToString();
            lblMemo.Text = reck.Memo;
            lblRemainder.Text = reck.Remain.ToString();
            lblTypeName.Text = reck.ItemName;
            if (reck.Direction == 0)
            {
                lblDirection.Text = "支出";
            }
            else
            {
                lblDirection.Text = "收入";
            }

        }
        catch
        { }
    }
}