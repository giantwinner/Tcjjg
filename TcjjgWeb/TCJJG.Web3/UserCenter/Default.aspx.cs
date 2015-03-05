using System;
using System.Web.UI;
using TCJJG.Web.Model;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;

public partial class UserCenter_Default : BasePageIB
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;

            AcountInfo[] new_UserAcount = UserCenter.UserAcount().GetAllUserAccount(userInfo.UserID);
            userInfo = WebCommon.UpdateUserAcount(userInfo, new_UserAcount);

            //ViewState["userInfo"] = userInfo;

            foreach (var item in userInfo.Lua)
            {
                if (item.Ti == 1)
                {
                    lblYuanBao.Text = item.Ac.ToString();
                }
                if (item.Ti == 4)
                {
                    lblGold.Text = item.Ac.ToString();
                }
            }
            lblExperience.Text = Convert.ToString(WSClient.ExpSvc().GetExp(userInfo.UserID.ToString()));
            lblLevel.Text = Convert.ToString(WSClient.ExpSvc().GetRank(userInfo.UserID.ToString()))=="0"?"1":Convert.ToString(WSClient.ExpSvc().GetRank(userInfo.UserID.ToString()));
            lblNick.Text = userInfo.NickName;
            lblSpread.Text = userInfo.UserName;
            imgHead.ImageUrl = userInfo.HeadID + "?temp=" + DateTime.Now.Millisecond.ToString();

            BindUserInfo();
        }
    }

    private void BindUserInfo()
    {
        WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
        FFJJG.Common.UserCenter.UserAmplyInfo user = new FFJJG.Common.UserCenter.UserAmplyInfo();
        user = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);
        lblName.Text = user.RM;
        lblIDCard.Text = user.C;
        if (user.J == "--请选择--")
        {
            lblJob.Text = "";
        }
        else
        {
            lblJob.Text = user.J;
        }
        lblMovePhone.Text = user.M;
        if (user.G == 2)
        {
            lblGender.Text = "女";
        }
        else
        {
            lblGender.Text = "男";
        }
        if (user.B == null || user.B == "")
        {
            lblBirthday.Text = "";
        }
        else
        {
            try
            {
                lblBirthday.Text = Convert.ToDateTime(user.B).ToString("yyyy-MM-dd");
            }
            catch
            {
                lblBirthday.Text = DateTime.Now.ToString("yyyy-MM-dd");
            }
        }
    }
    protected void btnBeginIdentify_Click(object sender, EventArgs e)
    {
        BeoforeIdentifyHead();
    }
    private void BeoforeIdentifyHead()
    {
        int needRank = Convert.ToInt32(WebCommon.GetFFJJGWebXML("ffjjgweb/HeadImgIdentify/", "Rank"));
       
        WebUserInfo userInfo = (WebUserInfo)Session["UserInfo"];
        long rank = WSClient.ExpSvc().GetRank(userInfo.UserID.ToString());
        if (rank < needRank)
        {
            IdentifyDiv.Style.Add("display", "none");
            promptInfo.Style.Add("display", "block");
            promptInfo.InnerHtml = "<div class='CloseBtn' onclick='HideIdentifyDiv()'> x</div><span>*您的平台等级" + rank + "级，请" + needRank + "级后在来申请</span>";
            return;
        }
        FFJJG.Common.UserCenter.UserAmplyInfo userInfoAmply = UserCenter.UserInfo().F_SelectUserInfoAmply(userInfo.UserID);
        if (string.IsNullOrEmpty(userInfoAmply.J) || string.IsNullOrEmpty(userInfoAmply.B) || string.IsNullOrEmpty(userInfoAmply.RM) || string.IsNullOrEmpty(userInfoAmply.M) || string.IsNullOrEmpty(userInfoAmply.C))
        {
            IdentifyDiv.Style.Add("display", "none");
            promptInfo.Style.Add("display", "block");
            promptInfo.InnerHtml = "<div class='CloseBtn' onclick='HideIdentifyDiv()'> x</div>*您的注册资料部分填写不完整<br /><a href='UpdateUserInfo.aspx'>》填写《</a>";
            return;
        }
        Session["IdenHeadPass"] = 1;
        Response.Redirect("~/UserCenter/IdentifyHeadImg.aspx", true);
    }

}