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
using TCJJG.Web.Biz;
using TCJJG.Web.DB;

public partial class UserCenter_UserReg : BasePagePid
{
    string spreadUser = string.Empty;//推广号
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["UserInfo"] != null)
            {
                Response.Redirect("~/", true);
            }
            txtBirthday.Attributes.Add("readonly", "true");
            InitDDLProvince();
            InitDDLCity();
            #region 短信注册 zhangsw 2011年10月12日 14:51:32

            //SendMessageConfig smc = SendMessage.SendMessageConfigSel();
            var smc = WSClient.CMOPWebWS().SendMessageConfigSel();
            //
            ViewState["smcOpe"] = smc.Ope;
            ViewState["smcRegCount"] = smc.RegCount;
            //
            if (smc.Ope == 1)
            {
                this.Panel5.Visible = true;
            }
            else
            {
                this.Panel4.Visible = true;
            }
            //
            btnSubmit.Attributes.Add("OnClick", "return O_Submit_btnOK('" + smc.Ope + "');");

            #endregion
            LoadR10();
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
            ddlProvince.Items.Insert(0, new ListItem("请选择", "0"));
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
            ddlCity.Items.Insert(0, new ListItem("请选择", "0"));
        }
    }

    private void LoadR10()
    {
        if (Session["ProInfoReg"] != null)
        {
            this.Label1.Visible = false;


        }
        if (Session["spread"] != null)
        {
            pSpreadName.Visible = false;
        }

        //获得推广号
        if (Request.QueryString["spread"] != null)
        {
            Session["spread"] = Request.QueryString["spread"];
            pSpreadName.Visible = false;
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        #region 推广

        string userName = this.txtUserName.Text.Trim().ToLower();
        if (Session["spread"] == null)
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
                    //proc_SpreadBasic_SpreadNum_SelResult data = Spread.GetSpreadNum(txtSpreadUser.Text);
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
                //int res = sp.proc_userInfo_Spread_Reg_Verify(spreadUser);
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
            spreadUser = Session["spread"].ToString();
            Session.Remove("spread");
            if (string.IsNullOrEmpty(spreadUser.Trim()) || !CommonOperation.IsNumInt32(spreadUser))
            {
                this.labMsg.Text = "您的推广链接有误";
                return;
            }
            if (WSClient.SpreadWS().Spread_UserInfo_Reg_Verify(spreadUser) < 0)
            //if (sp.proc_userInfo_Spread_Reg_Verify(spreadUser) < 0)
            {
                this.labMsg.Text = "您的推广链接有误";
                return;
            }
        }

        //string spreadNumber12314 = spreadUser.Trim();
        #endregion

        #region 获得数据

        string passWord = this.txtPsw1.Text.Trim();

        string nickName = this.txtNickName.Text.Trim().ToLower();
        if (nickName == "" || nickName == null)
        {
            nickName = txtUserName.Text;
        }
        string validate = this.valiNO.Text;
        //
        //string sddl1 = this.DropDownList1.SelectedValue;
        //string sddl2 = this.DropDownList2.SelectedValue;
        //string sddl3 = this.DropDownList3.SelectedValue;
        //
        int sex = Convert.ToInt32(ddlGender.SelectedValue);
        string headID;
        if (ddlGender.SelectedValue == "2")
        {
            headID = WebCommon.GetFFJJGWebXML("ffjjgweb/", "defaulthead2");
        }
        else
        {
            headID = WebCommon.GetFFJJGWebXML("ffjjgweb/", "defaulthead1");
        }
        //
        string recipient = string.Empty; //this.txtRecipient.Text.Trim().ToLower();
        string address = this.txtContact.Text; ; //this.txtAddress.Text.Trim().ToLower();
        string email = string.Empty; // this.txtEmail.Text.Trim().ToLower();
        string movePhone = null;
        string question = this.DDLPsw.SelectedIndex.ToString();
        string answer = this.txtPwdAnswer.Text.Trim().ToLower();
        string realName = null;
        string idCard = null;
        string job = this.ddlWork.SelectedItem.Text;
        if (!string.IsNullOrEmpty(txtBirthday.Text))
        {
            if (Convert.ToDateTime(txtBirthday.Text).Year > DateTime.Now.Year)
            {
                labMsg.Text = "请选择正确的生日！";
                return;
            }
        }
        string birthday = txtBirthday.Text;
        int provinceID = Convert.ToInt32(ddlProvince.SelectedValue);
        int cityID = Convert.ToInt32(ddlCity.SelectedValue);
        if (question == "0") answer = string.Empty;

        #endregion

        #region 验证

        int GangsID = 0;
        int prid = 0;
        //
        if (Session["ProInfoReg"] != null)
        {
            ProInfoReg pir = Session["ProInfoReg"] as ProInfoReg;
            GangsID = pir.GangsID;
            prid = pir.PID;
        }

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
        //
        int smcOpe = 0; int smcRegCount = 0;
        if (null != ViewState["smcOpe"] && null != ViewState["smcRegCount"] &&
            CommonOperation.IsNumInt32(ViewState["smcOpe"].ToString()) &&
            CommonOperation.IsNumInt32(ViewState["smcRegCount"].ToString()))
        {
            smcOpe = Convert.ToInt32(ViewState["smcOpe"].ToString());
            smcRegCount = Convert.ToInt32(ViewState["smcRegCount"].ToString());
        }
        //短信注册 zhangsw 2011年10月12日 14:51:32
        if (smcOpe == 1) { validate = this.txtMovePhoneValiNO.Text; }
        if (string.IsNullOrEmpty(validate) || Session["code"] == null || validate != Session["code"].ToString())
        {
            this.labMsg.Text = "验证码错误";
            return;
        }
        //
        if (!ValidateRegUser(userName, passWord, nickName, recipient, address, email, string.Empty, question, answer))
        {
            this.labMsg.Text = "请正确输入用户信息";
            return;
        }
        //
        if (UserCenter.UserInfo().F_ChickUserID(0, userName))
        {
            this.labMsg.Text = "帐号已经被注册";
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
            headID, recipient, address, email, movePhone, question, answer, realName, idCard, job, birthday, userID.Value, appid, regIP, prid);

        #endregion

        #region 开始注册

        try
        {
            //试玩UserCenter.UserInfo().F_InsertUserTrial(req_UserObject, ref userID, ref Lv, ref RankTitle, ref userType);
            string ope = string.Empty;
            //reg user
            if (smcOpe != 1) { smcRegCount = 0; }
            userAcount = UserCenter.UserInfo().F_InsertUser(req_UserObject, smcRegCount, cityID, regIP, 1, ref userID, ref Lv, ref RankTitle, userType, ref ope);
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
                this.Panel1.Visible = false;
                //推广员系统
                string spreadNumber = spreadUser.Trim();
                Guid UserID = user.UserID;
                string UserName = user.UserName,
                NickName = user.NickName;
                DateTime LastLogOnTime = DateTime.Now;
                string BarName = "网吧名称";
                int? status = -1;
                // sp.proc_userInfo_Spread_Reg(spreadNumber, UserID, UserName, NickName, LastLogOnTime, BarName, ref status);
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
                    int packageID = 10000;/*  礼包ID       10000*/
                    byte awardType = 3;/*礼包类型     3*/
                    int amount = 1;  //礼包数量
                    bool resultPackage = package.GivePackageForUser(userID.Value, packageID, awardType, amount);
                    if (resultPackage == false)
                    {
                        labMsg.Text = "礼包赠送失败,请联系管理员.";
                    }
                }
                #endregion
                GotoCMOP(user.UserName, user.NickName);
            }
            else
            {
                this.labMsg.Text = "注册失败,请联系管理员.";
            }
        }
        catch (Exception e1)
        {
            PublicClass.WriteErrLog("register error reg1:" +
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
               " prid:" + prid +
               " grid:" + GangsID +
               " e1:" + e1);
            this.labMsg.Text = "注册失败，请联系管理员";
            return;
        }
        Response.Redirect("UserRealInfoConfirm.aspx");
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
        #region -- 验证非必填信息

        //recipient
        bool b1 = false;
        if (string.IsNullOrEmpty(recipient))
        {
            b1 = true;
        }
        else if (PublicValidateUser.RecipientValidate(recipient))
        {
            b1 = true;
        }
        //address
        bool b2 = false;
        if (string.IsNullOrEmpty(address))
        {
            b2 = true;
        }
        else if (PublicValidateUser.AddressValidate(address))
        {
            b2 = true;
        }
        //email
        bool b3 = false;
        if (string.IsNullOrEmpty(email))
        {
            b3 = true;
        }
        else if (PublicValidateUser.EmailValidate(email))
        {
            b3 = true;
        }
        //prid
        bool b4 = false;
        if (string.IsNullOrEmpty(sPrid))
        {
            b4 = true;
        }
        else if (CommonOperation.IsNumInt32(sPrid))
        {
            b4 = true;
        }
        //answer
        bool b5 = false;
        if (question == "0")
        {
            b5 = true;
        }
        else if (PublicValidateUser.AnswerValidate(answer))
        {
            b5 = true;
        }
        #endregion

        if (!b1 || !b2 || !b3 || !b4 || !b5)
        {
            return false;
        }
        return true;
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        InitDDLCity();
    }
}