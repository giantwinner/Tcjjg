using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using TCJJG.Web.UserCenter;
using FFJJG.Common.UserCenter;
using TCJJG.Web.Biz;
using Static.Common.Operation;
using TCJJG.Web.Model;
using System.Text.RegularExpressions;

public partial class UserCenter_UserReg_BaseInfo : System.Web.UI.Page
{
    string spreadUser = string.Empty;//推广号
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (null != Session["UserInfo"])
            {
                WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
                if (userInfo.UserTypeID != 100)
                {
                    Response.Redirect("~/");
                    return;
                }
            }
            // txtBirthday.Attributes.Add("readonly", "true");
            InitDDLProvince();
            InitDDLCity();

            btnStep1.Attributes.Add("OnClick", "return O_Submit_btnOK1();");
            btnRegComplete.Attributes.Add("OnClick", "return O_Submit_btnOK2();");
            LoadR10();
        }

    }
    private void LoadR10()
    {
        //获得推广号
        if (Request.QueryString["s"] != null)
        {
            Session["s"] = Request.QueryString["s"];
        }
        else
        {
            pSpreadName.Visible = true;
        }
    }
    private void InitDDLProvince()
    {
        PartnerSvcClient psvc = new PartnerSvcClient();
        List<Province> ls = psvc.GetProvinceList().ToList();
        ls = (from l in ls where l.ProvinceID != 100 select l).ToList();
        ddlProvince.DataSource = ls;
        ddlProvince.DataTextField = "ProvinceName";
        ddlProvince.DataValueField = "ProvinceID";
        ddlProvince.DataBind();
        if (ddlProvince.Items.Count < 1)
        {
            ddlProvince.Items.Insert(0, new ListItem("-没有区域数据-", "-1"));
        }
        else
        {
            ddlProvince.Items.Insert(0, new ListItem("--请选择省份--", "0"));
        }
    }
    private void InitDDLCity()
    {
        List<City> ls = UserCenter.UserPartner().GetCityList(Convert.ToInt32(ddlProvince.SelectedValue)).ToList();
        ls = (from l in ls where l.CityID != 1000 select l).ToList();
        ddlCity.DataSource = ls;
        ddlCity.DataTextField = "CityName";
        ddlCity.DataValueField = "CityID";
        ddlCity.DataBind();
        if (ddlCity.Items.Count < 1)
        {
            ddlCity.Items.Insert(0, new ListItem("-没有城市数据-", "-1"));
        }
        else
        {
            ddlCity.Items.Insert(0, new ListItem("--请选择城市--", "0"));
        }
    }
    protected void btnStep1_Click(object sender, EventArgs e)
    {
        string userName = this.txtUserName.Text.Trim().ToLower();
        string passWord = this.txtPsw1.Text.Trim();
        string validate = this.valiNO.Text;
        if (!PublicValidateUser.UserNameRegValidate(userName) || !PublicValidateUser.FiltrateWordsValidate(userName) || !PublicValidateUser.PasswordValidate(passWord))
        {
            lblRegMsg.Text = "请正确输入用户信息";
            return;
        }

        if (UserCenter.UserInfo().F_ChickUserID(0, userName))
        {
            this.lblRegMsg.Text = "帐号已经被注册";
            return;
        }

        if (string.IsNullOrEmpty(validate) || Session["code"] == null || validate != Session["code"].ToString())
        {
            this.lblRegMsg.Text = "验证码错误";
            return;
        }
        WebUserInfo tinfo = new WebUserInfo();
        tinfo.UserName = userName;
        tinfo.Password = passWord;
        Session["TempleInfo"] = tinfo;

        lblMarkUserName.Text = userName;

        pnelStep1.Visible = false;
        pnelStep2.Visible = true;
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        InitDDLCity();
    }
    protected void btnRegComplete_Click(object sender, EventArgs e)
    {
        #region 获得数据

        WebUserInfo tinfo = Session["TempleInfo"] as WebUserInfo;
        if (null == tinfo)
        {
            return;
        }

        string passWord = tinfo.Password;

        string nickName = null; //this.txtNickName.Text.Trim().ToLower();
        if (nickName == "" || nickName == null)
        {
            nickName = txtUserName.Text;
        }
        else
        {
            if (CommonOperation.GetStringLength(nickName) < 4 || CommonOperation.GetStringLength(nickName) > 15)
            {
                labMsg.Text = "请使用4-15个字符，中、英文与数字组合的形式";
                return;
            }
            else
            {
                string pattern = @"^\d+$";
                if (Regex.IsMatch(nickName, pattern))
                {
                    labMsg.Text = "请使用4-15个字符，中、英文与数字组合的形式";
                    return;
                }
            }
        }

        int sex = 2;
        if (rbtnMale.Checked)
        {
            sex = 1;
        }
        string headID;
        if (sex == 2)
        {
            headID = WebCommon.GetFFJJGWebXML("ffjjgweb/", "defaulthead2");
        }
        else
        {
            headID = WebCommon.GetFFJJGWebXML("ffjjgweb/", "defaulthead1");
        }
        //
        string recipient = string.Empty;
        string address = string.Empty;
        string email = string.Empty;
        string movePhone = string.Empty;
        string question = "0";
        string answer = string.Empty;
        string realName = string.Empty;
        string idCard = string.Empty;
        string job = string.Empty;
        //
        int cityID = Convert.ToInt32(ddlCity.SelectedValue);
        int provinceID = Convert.ToInt32(ddlProvince.SelectedValue);
        if (cityID == -1)
        {
            labMsg.Text = "没有可用区域数据,请与客服人员联系";
            return;
        }
        if (cityID == 0 || provinceID == 0)
        {
            labMsg.Text = "请选择您所在的省份与城市";
            return;
        }

        string userName = tinfo.UserName;

        #region 推广


        if (Session["s"] == null)
        {
            if (txtSpreadUser.Text == null || txtSpreadUser.Text == "")
            {
                spreadUser = txtSpreadUser.Text;
            }
            else
            {
                try
                {
                    spreadUser = txtSpreadUser.Text;
                    var data = WSClient.SpreadWS().GetUserSpreadNum(txtSpreadUser.Text);
                    spreadUser = data.SpreadNumber.ToString();
                }
                catch
                {
                    spreadUser = "1";
                }

            }
            if (!string.IsNullOrEmpty(spreadUser.Trim()))
            {
                if (!CommonOperation.IsNumInt32(spreadUser))
                {
                    this.labMsg.Text = "请正确输入推广账号";
                    return;
                }
                int res = WSClient.SpreadWS().Spread_UserInfo_Reg_Verify(spreadUser);
                if (res < 0)
                {
                    this.labMsg.Text = "请正确输入推广账号";
                    return;
                }
            }
        }
        else
        {
            spreadUser = Session["s"].ToString();
            Session.Remove("s");
            if (string.IsNullOrEmpty(spreadUser.Trim()) || !CommonOperation.IsNumInt32(spreadUser))
            {
                this.labMsg.Text = "您的推广链接有误";
                return;
            }
            if (WSClient.SpreadWS().Spread_UserInfo_Reg_Verify(spreadUser) < 0)
            {
                this.labMsg.Text = "您的推广链接有误";
                return;
            }
        }

        #endregion

        if (!CheckBox1.Checked || !CheckBox2.Checked)
        {
            this.labMsg.Text = "不同意协议不能注册";
            return;
        }


        string birthday = "1988-08-08";

        if (question == "0") answer = string.Empty;

        #endregion

        #region 验证
        //
        if (!ValidateRegUser(userName, passWord, nickName, recipient, address, email, string.Empty, question, answer))
        {
            this.labMsg.Text = "请正确输入用户信息";
            return;
        }

        int tmp = 0;
        //
        string serror = string.Empty;
        if (UserCenter.UserInfo().IsNickNameDuplicated(nickName, ref tmp))
        {
            this.labMsg.Text = "昵称已经被注册";
            return;
        }

        //
        passWord = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(passWord, "MD5").ToLower();

        #endregion

        #region 注册前包装对象

        Guid? userID = new Guid();
        int appid = 0;
        string regIP = CommonOperation.GetIP4Address();
        string Lv = string.Empty;
        string RankTitle = string.Empty;
        int userType = 0;
        //
        AcountInfo[] userAcount = null;
        //
        RegUserInfo req_UserObject = InitRegUserInfo(userName, passWord, nickName, sex,
            headID, recipient, address, email, movePhone, question, answer, realName, idCard, job, birthday, userID.Value, appid, regIP, 0);

        #endregion

        #region 开始注册

        try
        {
            string ope = string.Empty;
            //reg user
            if (null != Session["UserInfo"])
            {
                WebUserInfo userInfo = Session["UserInfo"] as WebUserInfo;
                if (userInfo.UserTypeID == 100)
                {
                    string userName_old = userInfo.UserName;
                    string password_old = userInfo.Password;
                    string hid = userInfo.HeadID;
                    int pRID = 0;
                    int smcRegCount = 0;
                    //游客注册（实际为修改信息）
                    userAcount = UserCenter.UserInfo().VisitorToNormalUser(userName_old, password_old, userInfo.UserID, appid, userName, passWord, nickName, regIP, sex, hid, recipient, address, email, movePhone, pRID, Convert.ToInt32(question), answer, realName, idCard, job, birthday, smcRegCount, cityID, regIP, 1, userType, ref userID, ref ope);
                    Session["VR"] = 1;
                }
                else
                {
                    //普通注册
                    userAcount = UserCenter.UserInfo().F_InsertUser(req_UserObject, 0, cityID, regIP, 1, ref userID, ref Lv, ref RankTitle, userType, ref ope);
                }
            }
            else
            {
                //普通注册
                userAcount = UserCenter.UserInfo().F_InsertUser(req_UserObject, 0, cityID, regIP, 1, ref userID, ref Lv, ref RankTitle, userType, ref ope);
            }

            if (userID.Value != Guid.Empty && ope == "0")
            {
                WebUserInfo user = new WebUserInfo();
                user = WebCommon.RembSession(user, appid, userID.Value, userName, passWord, nickName, headID, Lv, sex, userType, user.Roles);
                user = WebCommon.UpdateUserAcount(user, userAcount);
                //
                user.MsgCount = UserCenter.UserMessage().GetUnReadMessageCount(user.UserID);
                //
                Session["UserInfo"] = user;
                //

                #region 推广

                string spreadNumber = spreadUser.Trim();
                Guid UserID = user.UserID;
                string UserName = user.UserName,
                NickName = user.NickName;
                DateTime LastLogOnTime = DateTime.Now;
                string BarName = "网吧名称";
                int? status = -1;

                WSClient.SpreadWS().Spread_Reg_UserInfo(spreadNumber, UserID, UserName, NickName, LastLogOnTime, BarName, ref status);
                if (status == -1)
                {
                    this.labMsg.Text = "注册失败，请联系管理员";
                    return;
                }

                #region 正确填写推广账号，赠送礼包 2012-9-17
                if (!string.IsNullOrEmpty(spreadNumber))
                {
                    PackageSvcClient package = new PackageSvcClient();
                    int packageID = 10001;/*  礼包ID       10001*/
                    int amount = 1;  //礼包数量
                    bool resultPackage = package.GivePackageForUser(userID.Value, packageID, amount);
                    if (resultPackage == false)
                    {
                        labMsg.Text = "礼包赠送失败,请联系管理员.";
                    }

                }
                #endregion

                #endregion

            }
            else
            {
                this.labMsg.Text = "注册失败,请联系管理员.";
            }
        }
        catch (Exception e1)
        {
            FFJJG.Server.Utils.Logging.write("注册失败", "register error reg1:" +
               " userName:" + userName +
               " passWord:" + passWord +
               " nickName:" + nickName +
               " sex:" + sex +
               " headID:" + headID +
               " recipient:" + recipient +
               " address:" + address +
               " email:" + email +
               " question:" + question +
               " answer:" + answer +
               " appid:" + appid +
               " regIP:" + regIP +
               " e1:" + e1.Message, true);
            this.labMsg.Text = "注册失败，请联系管理员";
            return;
        }
        if (null != Request.Cookies["tcjjgVisitor"])
        {
            HttpCookie currCookie = Request.Cookies["tcjjgVisitor"];
            currCookie.Expires = DateTime.Now.AddYears(-1);
            Response.Cookies.Add(currCookie);
        }
        Session.Remove("TempleInfo");

        Response.Redirect("~/HallPage/HallPageFL.aspx");
        #endregion
    }
    private RegUserInfo InitRegUserInfo(string userName, string passWord, string nickName, int sex, string headID, string recipient, string address, string email, string movePhone, string question, string answer, string realName, string idCard, string job, string birthday, Guid userID, int appid, string regIP, int prid)
    {
        RegUserInfo req_UserObject = new RegUserInfo();
        req_UserObject.UserID = userID;
        req_UserObject.AppID = appid;
        req_UserObject.UserName = userName;
        req_UserObject.Password = passWord;
        req_UserObject.NickName = nickName;
        req_UserObject.RegIP = regIP;
        req_UserObject.Sex = sex;
        req_UserObject.HeadID = headID;
        req_UserObject.Recipient = recipient;
        req_UserObject.Address = address;
        req_UserObject.EMail = email;
        req_UserObject.MovePhone = movePhone;
        req_UserObject.Prid = prid;
        req_UserObject.PwdQuestion = Convert.ToInt32(question);
        req_UserObject.PwdAnswer = answer;
        req_UserObject.RealName = realName;
        req_UserObject.IDCard = idCard;
        req_UserObject.Job = job;
        req_UserObject.Birthday = birthday;
        return req_UserObject;
    }

    /// <summary>
    /// validate userInfo
    /// </summary>
    /// <param name="userName"></param>
    /// <param name="psw"></param>
    /// <param name="nickName"></param>
    /// <param name="recipient"></param>
    /// <param name="address"></param>
    /// <param name="email"></param>
    /// <param name="sPrid"></param>
    /// <returns></returns>
    private bool ValidateRegUser(string userName, string psw, string nickName, string recipient, string address, string email, string sPrid, string question, string answer)
    {
        if (!PublicValidateUser.UserNameRegValidate(userName) || !PublicValidateUser.FiltrateWordsValidate(userName) || !PublicValidateUser.PasswordValidate(psw) || !PublicValidateUser.NickNameValidate(nickName) || !PublicValidateUser.FiltrateWordsValidate(nickName))
        {
            return false;
        }
        return true;
    }

    protected void chFold_CheckedChanged(object sender, EventArgs e)
    {
        pnelSpread.Visible = chFold.Checked;
    }
}