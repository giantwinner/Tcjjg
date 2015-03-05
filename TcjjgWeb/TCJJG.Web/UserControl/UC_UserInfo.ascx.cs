using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.Model;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Biz;
using TCJJG.Web.UserCenter;

public partial class UserControl_UC_UserInfo : System.Web.UI.UserControl
{
    public string r = "0px";
    public double scoreWith = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
            if (null == userInfo)
            {
                pnelUserInfo.Visible = false;
                return;
            }
            foreach (string item in userInfo.Roles)
            {
                if (item == "10003")
                {
                    imgRole.Visible = true;
                }
                else
                {
                    imgRole.Visible = false;
                }
            }

            var city = UserCenter.UserInfo().GetCityByUser(userInfo.UserID);
            if (null != city)
            {
                lblCity.Text = city.CityName;
            }
            AcountInfo[] new_UserAcount = UserCenter.UserAcount().GetAllUserAccount(userInfo.UserID);

            if (null != new_UserAcount)
            {
                userInfo = WebCommon.UpdateUserAcount(userInfo, new_UserAcount);

                foreach (var item in userInfo.Lua)
                {
                    if (item.Ti == 1)
                    {
                        lblYBValue.Text = item.Ac.ToString();
                    }
                    if (item.Ti == 4)
                    {
                        lblGoldValue.Text = item.Ac.ToString();
                    }
                }
                if (userInfo.Sex == 2)
                {
                    imgGender.ImageUrl = "~/Images/UserCenter/gender-female.png";
                }
                else
                {
                    imgGender.ImageUrl = "~/Images/UserCenter/gender-male.png";
                }

                lblNickName.Text = userInfo.NickName;
                imgHead.Src = userInfo.HeadID + "?temp=" + DateTime.Now.Millisecond.ToString();
                int currExp = 0;
                var rankInfo = TCJJG.Web.UserCenter.UserCenter.UserInfo().GetRankByExperience(userInfo.UserID);
                if (null != rankInfo)
                {
                    currExp = Convert.ToInt32(rankInfo.Experience);
                    lblRankValue.Text = Convert.ToString(rankInfo.Rank);
                }
                else
                {
                    lblRankValue.Text = "1";
                }

                double[] ExpArr = {0, 10, 50, 200, 500, 1500
		, 2500, 4000, 5500, 7000, 9500, 15000, 22000, 30000, 45000, 60000, 80000
		, 105000, 130000, 160000, 200000, 250000, 300000, 350000, 410000, 480000
		, 560000, 650000, 740000, 840000, 950000, 1070000, 1200000, 1350000, 1500000
		, 1660000, 1840000, 2030000, 2230000, 2440000, 2700000, 2900000, 3200000
		, 3400000, 3700000, 4000000, 4300000, 4600000, 5000000, 5500000
        ,6000000,7000000,8000000,9000000,10000000,12000000,14000000,16000000,18000000,
		20000000,25000000,30000000,35000000,40000000,45000000,50000000,60000000,
		70000000,80000000,90000000};
                double rankBarWith = 0;
                if (!string.IsNullOrEmpty(lblRankValue.Text))
                {
                    for (int i = 0; i < ExpArr.Length; i++)
                    {
                        if (currExp >= ExpArr[i] && currExp < ExpArr[i + 1])
                        {
                            rankBarWith = (currExp - ExpArr[i]) / (ExpArr[i + 1] - ExpArr[i]) * 69;
                            break;
                        }
                    }

                    r = rankBarWith + "px";
                }
            }
        }
    }
}