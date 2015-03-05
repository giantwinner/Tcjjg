using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.UserCenter;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using Static.Common.Operation;
using System.Text.RegularExpressions;

public partial class UserCenter_UserReg_RealInfo : BasePage
{
    string spreadUser = string.Empty;//推广号
    protected void Page_Load(object sender, EventArgs e)
    {
        Response.Redirect("~/");
        if (!IsPostBack)
        {
            if (null == Session["IsLinkSpread"])
            {
                pSpreadName.Visible = true;
            }
            if (null!= Session["VR"])
            {
                pSpreadName.Visible = false;
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string idCard = txtIDCard.Text.Trim();
        string realName = txtRealName.Text.Trim();

        #region 验证

        string pattern = @"^\d{17}[\d|X]|\d{15}$";
        if (string.IsNullOrEmpty(idCard) || !Regex.IsMatch(idCard, pattern))
        {
            lblmsg.Text = "请输入正确的身份证号";
            return;
        }
        if (string.IsNullOrEmpty(realName))
        {
            lblmsg.Text = "请输入姓名";
            return;
        }

        #endregion

        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        FFJJG.Common.UserCenter.UserAmplyInfo userAmply = new FFJJG.Common.UserCenter.UserAmplyInfo();
        userAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);

        Guid userID = userInfo.UserID;
        string email = userAmply.E;
        string phone = userAmply.P;
        string recipient = userAmply.R;
        string postNum = userAmply.N;
        string address = userAmply.A;
        string qq = userAmply.Q;
        string msn = userAmply.S;
        byte gender = userAmply.G;
        string job = userAmply.J;
        string birthday = userAmply.B;
        string movePhone = userAmply.M;

        #region 填写推广号推广

        if (null == Session["IsLinkSpread"])
        {
            if (txtSpreadUser.Text == null || txtSpreadUser.Text == "")
            {
                spreadUser = txtSpreadUser.Text;
            }
            else
            {

                if (userInfo.UserName == txtSpreadUser.Text.Trim())
                {
                    this.lblmsg.Text = "自己不能推广自己";
                    return;
                }
                spreadUser = txtSpreadUser.Text;
                var data = WSClient.SpreadWS().GetUserSpreadNum(txtSpreadUser.Text);
                if (null != data)
                {
                    spreadUser = data.SpreadNumber.ToString();
                }
            }
            if (!string.IsNullOrEmpty(spreadUser.Trim()))
            {
                if (!CommonOperation.IsNumInt32(spreadUser))
                {
                    this.lblmsg.Text = "请正确输入推广账号";
                    return;
                }
                int res = WSClient.SpreadWS().Spread_UserInfo_Reg_Verify(spreadUser);
                if (res < 0)
                {
                    this.lblmsg.Text = "请正确输入推广账号";
                    return;
                }
            }
        }

        #endregion

        #region 推广

        string spreadNumber = spreadUser.Trim();
        Guid UserID = userInfo.UserID;
        string UserName = userInfo.UserName,
        NickName = userInfo.NickName;
        DateTime LastLogOnTime = DateTime.Now;
        string BarName = "网吧名称";
        int? status = -1;

        WSClient.SpreadWS().Spread_Reg_UserInfo(spreadNumber, UserID, UserName, NickName, LastLogOnTime, BarName, ref status);
        if (status == -1)
        {
            this.lblmsg.Text = "注册失败，请联系管理员";
            return;
        }

        #region 正确填写推广账号，赠送礼包 2012-9-17
        if (!string.IsNullOrEmpty(spreadNumber))
        {
            PackageSvcClient package = new PackageSvcClient();
            int packageID = 10001;/*  礼包ID       10000*/
            int amount = 1;  //礼包数量
            bool resultPackage = package.GivePackageForUser(UserID, packageID, amount);
            if (resultPackage == false)
            {
                lblmsg.Text = "礼包赠送失败,请联系管理员.";
            }
        }
        #endregion

        #endregion


        bool b = UserCenter.UserInfo().F_ChangeUserInfoAmply(userID, email, movePhone, phone, idCard, recipient, postNum, address, qq, msn, gender, realName, job, birthday);
        if (b == true)
        {
            //lblmsg.Text = "保存成功！";
            //string js = @"<Script language='JavaScript'>alert('保存成功！'); </Script>";
            //ClientScript.RegisterStartupScript(Page.GetType(), "downUpType", js);
            //破产补偿
            UserCenter.UserInfo().GuidePartLog_Add(userInfo.UserID, 2);
            Response.Redirect("~/HallPage/HallPageFL.aspx");
        }
        else
        {
            lblmsg.Text = "保存失败！";
        }
    }
}