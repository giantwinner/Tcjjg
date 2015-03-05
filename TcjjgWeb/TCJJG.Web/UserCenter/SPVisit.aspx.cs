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
using System.Text.RegularExpressions;
using TCJJG.Web.Model;
using System.Net;

public partial class UserCenter_SPVisit : System.Web.UI.Page
{
    string spreadUser = string.Empty;//推广号
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //记录导流数
            try
            {
                if (Request.QueryString["spread"] != null)
                {
                    int spreadNum = 0;
                    int.TryParse(Request.QueryString["spread"], out spreadNum);

                    if (spreadNum == 0)
                    {
                        return;
                    }
                    if (null == Session["spread"])
                    {
                        TCJJG.Web.Biz.WSClient.SpreadWS().VisitRegBySpread(spreadNum, DateTime.Now);
                    }
                }
            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
            }
        }


        txtPsw.Attributes.Add("value", txtPsw.Text);
        txtPsw2.Attributes.Add("value", txtPsw2.Text);
        regbtn.Attributes.Add("onmouseover", "this.src='/Images/SPVisit/flashReg2.png'");//鼠标移上去更换新的图片
        regbtn.Attributes.Add("onmouseout", "this.src='/Images/SPVisit/flashReg.png'");//鼠标移走更换新的图片

        regbtn.Attributes.Add("onmouseover", "this.src='/Images/SPVisit/flashReg2.png'");//鼠标移上去更换新的图片
        regbtn.Attributes.Add("onmouseout", "this.src='/Images/SPVisit/flashReg.png'");//鼠标移走更换新的图片

        if (!IsPostBack)
        {
            regbtn.Attributes.Add("OnClick", "return BtnCheck();");

            InitDDLProvince();
            InitDDLCity();

            //////判断是否是链接过来的
            //if (null == Request.UrlReferrer || Request.UrlReferrer.LocalPath == "/UserCenter/SPVisit.aspx")
            //{
            //    regbtn.Enabled = false;
            //    return;
            //}
            GetSpreadNum();
        }
    }
    private void GetSpreadNum()
    {
        //获得推广号
        if (Request.QueryString["spread"] != null)
        {
            spreadUser = Request.QueryString["spread"].ToString();
            if (string.IsNullOrEmpty(spreadUser.Trim()) || !CommonOperation.IsNumInt32(spreadUser))
            {
                regbtn.Enabled = false;
                return;
            }
            if (WSClient.SpreadWS().Spread_UserInfo_Reg_Verify(spreadUser) < 0)
            {
                regbtn.Enabled = false;
                return;
            }
            Session["spread"] = Request.QueryString["spread"];
        }
        else
        {
            regbtn.Enabled = false;
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

    protected void regbtn_Click(object sender, ImageClickEventArgs e)
    {
        string userName = this.txtUserName.Text.Trim().ToLower();
        string passWord = this.txtPsw.Text.Trim();
        string nickName = null;//this.txtNickName.Text.Trim().ToLower();
        if (!PublicValidateUser.UserNameRegValidate(userName))
        {
            lblRegMsg.Text = "账号请使用4-15个字符，中、英文与数字组合的形式";
            return;
        }
        if (!PublicValidateUser.FiltrateWordsValidate(userName))
        {
            lblRegMsg.Text = "该账号包含系统屏蔽字";
            return;
        }

        if (UserCenter.UserInfo().F_ChickUserID(0, userName))
        {
            this.lblRegMsg.Text = "帐号已经被注册";
            return;
        }

        if (!PublicValidateUser.PasswordValidate(passWord))
        {
            lblRegMsg.Text = "密码长度在6-20位之间";
            return;
        }

        if (nickName == "" || nickName == null)
        {
            nickName = txtUserName.Text;
        }
        else
        {
            if (!PublicValidateUser.NickNameValidate(nickName))
            {
                lblRegMsg.Text = "昵称请使用4-15个字符，中、英文与数字组合的形式";
                return;
            }
            else if (CommonOperation.GetStringLength(nickName) < 4 || CommonOperation.GetStringLength(nickName) > 15)
            {
                lblRegMsg.Text = "昵称请使用4-15个字符，中、英文与数字组合的形式";
                return;
            }
            else
            {
                string pattern = @"^\d+$";
                if (Regex.IsMatch(nickName, pattern))
                {
                    lblRegMsg.Text = "昵称请使用4-15个字符，中、英文与数字组合的形式";
                    return;
                }
            }

            if (!PublicValidateUser.FiltrateWordsValidate(nickName))
            {
                lblRegMsg.Text = "该昵称包含系统屏蔽字";
                return;
            }

            int tmp = 0;
            if (UserCenter.UserInfo().IsNickNameDuplicated(nickName, ref tmp))
            {
                this.lblRegMsg.Text = "昵称已经被注册";
                return;
            }

        }

        int cityID = Convert.ToInt32(ddlCity.SelectedValue);
        int provinceID = Convert.ToInt32(ddlProvince.SelectedValue);
        if (cityID == -1)
        {
            lblRegMsg.Text = "没有可用区域数据,请与客服人员联系";
            return;
        }
        if (cityID == 0 || provinceID == 0)
        {
            lblRegMsg.Text = "请选择您所在的省份与城市";
            return;
        }

        if (!CheckBox1.Checked || !CheckBox2.Checked)
        {
            this.lblRegMsg.Text = "不同意协议不能注册";
            return;
        }

        int sex = 2;
        string headID = WebCommon.GetFFJJGWebXML("ffjjgweb/", "defaulthead2");

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
        string birthday = "1988-08-08";
        //

        passWord = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(passWord, "MD5").ToLower();

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
            //普通注册
            userAcount = UserCenter.UserInfo().F_InsertUser(req_UserObject, 0, cityID, regIP, 1, ref userID, ref Lv, ref RankTitle, userType, ref ope);

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

                string spreadNumber = Convert.ToString(Session["spread"]);
                Guid UserID = user.UserID;
                string UserName = user.UserName,
                NickName = user.NickName;
                DateTime LastLogOnTime = DateTime.Now;
                string BarName = "网吧名称";
                int? status = -1;

                WSClient.SpreadWS().Spread_Reg_UserInfo(spreadNumber, UserID, UserName, NickName, LastLogOnTime, BarName, ref status);
                if (status == -1)
                {
                    this.lblRegMsg.Text = "注册失败，请联系管理员";
                    return;
                }
                Session.Remove("spread");
        #endregion

            }
            else
            {
                this.lblRegMsg.Text = "注册失败,请联系管理员.";
                return;
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
            this.lblRegMsg.Text = "注册失败，请联系管理员";
            return;
        }

        #region 蹦蹦网

        if (null != Request.QueryString["annalID"])
        {
            string annalID = Request.QueryString["annalID"];

            try
            {
                string enable = WebCommon.GetFFJJGWebXML("ffjjgweb/", "AdSpread/BengBeng/Enable");
                if (enable == "1")//如果启用
                {
                    //本地记录数据
                    WSClient.SpreadWS().AddPartnerIDMapping(Convert.ToInt32(Request.QueryString["spread"]), annalID, userName, "0", "蹦蹦网annalID" + annalID);

                    #region 调用蹦蹦网接口

                    string adID = WebCommon.GetFFJJGWebXML("ffjjgweb/", "AdSpread/BengBeng/adID");
                    string doukey = adID + annalID + userName + WebCommon.GetFFJJGWebXML("ffjjgweb/", "AdSpread/BengBeng/key");
                    doukey = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(doukey, "MD5").ToLower();
                    string url = "http://www.bengbeng.com/reannal.php?adID=" + adID + "&annalID=" + annalID + "&idCode=" + userName + "&doukey=" + doukey;
                    HttpWebResponse response = HttpWebResponseUtility.CreateGetHttpResponse(url, null, null, null);
                    System.IO.StreamReader myreader = new System.IO.StreamReader(response.GetResponseStream(), System.Text.Encoding.GetEncoding("GB2312"));
                    string responseText = myreader.ReadToEnd();
                    myreader.Close();
                    if (!responseText.Contains("It is successful"))
                    {
                        FFJJG.Server.Utils.Logging.write("蹦蹦网回发", responseText, false);
                    }

                    #endregion
                }
            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
            }

        }

        #endregion

        #region 百合网红豆工厂

        if (null != Request.QueryString["userID"] && null != Request.QueryString["taskID"] && null != Request.QueryString["params"])
        {
            string uID = Request.QueryString["userID"];
            string taskID = Request.QueryString["taskID"];
            string param = Request.QueryString["params"];

            try
            {
                string enable = WebCommon.GetFFJJGWebXML("ffjjgweb/", "AdSpread/BaiHe/Enable");
                if (enable == "1")//如果启用
                {
                    //本地记录数据
                    WSClient.SpreadWS().AddPartnerIDMapping(Convert.ToInt32(Request.QueryString["spread"]), uID, userName, taskID, "百合网红豆工厂userID" + uID + ";taskID" + taskID + ";params" + param);

                    #region 调用百合网接口

                    string key = WebCommon.GetFFJJGWebXML("ffjjgweb/", "AdSpread/BaiHe/key");
                    string mac = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(param + "|" + "SUCCESS" + "|" + key, "MD5").ToUpper();
                    string url = "http://coin.baihe.com/Outer/Ex_TaskReturn.html?mac=" + mac + "&params=" + param;
                    HttpWebResponse response = HttpWebResponseUtility.CreateGetHttpResponse(url, null, null, null);

                    #endregion
                }
            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
            }

        }

        #endregion

        #region PC蛋蛋

        if (null != Request.QueryString["pcid"])
        {
            string pcid = Request.QueryString["pcid"];

            try
            {
                string enable = WebCommon.GetFFJJGWebXML("ffjjgweb/", "AdSpread/BengBeng/Enable");
                if (enable == "1")//如果启用
                {
                    //本地记录数据
                    WSClient.SpreadWS().AddPartnerIDMapping(Convert.ToInt32(Request.QueryString["spread"]), pcid, userName, "0", "PC蛋蛋pcid" + pcid);

                    #region 调用PC蛋蛋接口

                    string adid = WebCommon.GetFFJJGWebXML("ffjjgweb/", "AdSpread/Pceggs/adid");
                    string keycode = pcid + userName + userName + WebCommon.GetFFJJGWebXML("ffjjgweb/", "AdSpread/Pceggs/key");
                    keycode = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(keycode, "MD5").ToUpper();
                    string url = "http://adtaste.pceggs.com/ADComate/WebService/AdBack.aspx?pcid=" + pcid + "&adid=" + adid + "&merid=" + userName + "&mername=" + userName + "&keycode=" + keycode;
                    HttpWebResponse response = HttpWebResponseUtility.CreateGetHttpResponse(url, null, null, null);
                    System.IO.StreamReader myreader = new System.IO.StreamReader(response.GetResponseStream(), System.Text.Encoding.GetEncoding("GB2312"));
                    string responseText = myreader.ReadToEnd();
                    myreader.Close();
                    if (responseText == "-1")
                    {
                        FFJJG.Server.Utils.Logging.write("PC蛋蛋回发", responseText+" 失败", false);
                    }

                    #endregion
                }
            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
            }

        }
        #endregion

        Response.Redirect("~/HallPage/HallPageFL.aspx");

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

    protected void ddlProvince_SelectedIndexChanged(object sender, EventArgs e)
    {
        InitDDLCity();
    }
}