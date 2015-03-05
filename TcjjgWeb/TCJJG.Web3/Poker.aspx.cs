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

public partial class Poker : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                string userName = Server.UrlDecode(Request.QueryString["ID"]);  //用户ID
                string nickName = Server.UrlDecode(Request.QueryString["Name"]);//用户昵称

                ViewState["NickName"] = nickName;
                int sex = Convert.ToInt32(Request.QueryString["Sex"]);//性别 1：男   2：女
                ViewState["Sex"] = sex.ToString();
                int keyNum = Convert.ToInt32(Request.QueryString["Key"]);//网站标识
                ViewState["KeyNum"] = keyNum.ToString();
                string keyName = UserCenter.UserInfo().GetKeyName(keyNum);//网站密钥
                ViewState["KeyName"] = keyName;
                string md5 = Request.QueryString["MD"].ToLower(); //MD5[用户ID+密码(或者为空)+密钥]

                string str = string.Empty;//用户信息字符串[验证md5]

                //判断参数中是否有密码
                string userPwd = string.Empty; //用户密码[MD5]
                if (Request.QueryString["Pwd"] == null)
                {
                    str = userName + keyName;
                }
                else
                {
                    userPwd = Request.QueryString["Pwd"];
                    ViewState["UserPwd"] = userPwd;
                    str = userName + userPwd + keyName;
                }
                str = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(str, "MD5").ToLower();

                if (str == md5)//验证成功
                {
                    //获取合作网站信息，给用户名+前缀
                    ApplicationsInfo appInfo = new ApplicationsInfo();
                    appInfo = UserCenter.UserInfo().GetAppInfo(keyNum);
                    userName = appInfo.UserNameFlag + userName;
                    ViewState["UserName"] = userName;

                    #region 登陆信息

                    string regIP = CommonOperation.GetIP4Address();//客户端 IP
                    string serverIP = string.Empty;//本机IP
                    string strHostName = Dns.GetHostName(); //得到本机的主机名
                    IPHostEntry ipEntry = Dns.GetHostEntry(strHostName);
                    serverIP = ipEntry.AddressList[1].ToString();//获取本机IP
                    int appid = keyNum;

                    string Lv = string.Empty;
                    string RankTitle = string.Empty;
                    string ope = string.Empty;
                    int cityID;
                    PartnerInfo partner = UserCenter.UserInfo().GetPartnerInfo(keyNum);
                    cityID = partner.CityID;
                    int error = 0;

                    #endregion

                    int i = UserCenter.UserInfo().ValidateUserExist(userName, keyNum);//验证用户是否登录过tcjjg游戏
                    if (i == 1)//用户已登录过TCJJG游戏
                    {
                        if (userPwd == string.Empty)//客户网站未传密码
                        {
                            //从数据库获取密码
                            userPwd = UserCenter.UserInfo().GetUserPwd(userName, appid);
                        }
                        else
                        {
                            //更新用户密码
                            UserCenter.UserInfo().UpdatePassWordForPartner(userName, appid, userPwd);
                        }
                        //登陆
                        AbstractUserInfo uInfo = UserCenter.UserInfo().UserLogOn(userName, userPwd, keyNum, false, serverIP, regIP, false, ref error);
                        //保存Session
                        WebUserInfo user = new WebUserInfo();
                        user = WebCommon.RembSession(user, appid, uInfo.I, userName, userPwd, uInfo.N, uInfo.H, "", uInfo.G, uInfo.UT, uInfo.RL);
                        Session["UserInfo"] = user;
                        Response.Redirect("/HallPage/HallPagefl.aspx");
                    }

                    else //用户未注册TCJJG账号
                    {
                        txtUserName.Text = userName;
                        lblWelcomeUser.Text = userName;
                        panelUserInfo.Visible = true;//填写用户信息
                        if (userPwd == string.Empty)//客户网站未传密码
                        {
                            panelPwd.Visible = true;
                        }
                        else
                        {
                            panelPwd.Visible = false;
                        }
                    }

                }
                else//验证失败
                {
                    lblError.Text = "未通过身份验证！";
                }
            }
            catch
            {
                lblError.Text = "用户信息错误！";
            }
        }
    }

    /// <summary>
    /// 获取注册信息
    /// </summary>
    /// <param name="userName"></param>
    /// <param name="passWord"></param>
    /// <param name="nickName"></param>
    /// <param name="sex"></param>
    /// <param name="headID"></param>
    /// <param name="recipient"></param>
    /// <param name="address"></param>
    /// <param name="email"></param>
    /// <param name="movePhone"></param>
    /// <param name="question"></param>
    /// <param name="answer"></param>
    /// <param name="realName"></param>
    /// <param name="idCard"></param>
    /// <param name="job"></param>
    /// <param name="birthday"></param>
    /// <param name="userID"></param>
    /// <param name="appid"></param>
    /// <param name="regIP"></param>
    /// <param name="prid"></param>
    /// <returns></returns>
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
    /// 注册用户并登入游戏
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnOK_Click(object sender, ImageClickEventArgs e)
    {
        #region 注册信息

        string headID;
        int sex = Convert.ToInt32(ViewState["Sex"]);
        if (sex == 2)
        {
            headID = WebCommon.GetFFJJGWebXML("ffjjgweb/", "defaulthead2");
        }
        else
        {
            sex = 1;
            headID = WebCommon.GetFFJJGWebXML("ffjjgweb/", "defaulthead1");
        }
        //
        string recipient = string.Empty;
        string address = string.Empty;
        string email = string.Empty;
        string movePhone = string.Empty;
        string question = "0";
        string answer = string.Empty;
        string job = string.Empty;
        string birthday = string.Empty;
        string regIP = CommonOperation.GetIP4Address();//客户端 IP
        string serverIP = string.Empty;//本机IP
        string strHostName = Dns.GetHostName(); //得到本机的主机名
        IPHostEntry ipEntry = Dns.GetHostEntry(strHostName);
        serverIP = ipEntry.AddressList[1].ToString();//获取本机IP
        int prid = 0;
        int appid = Convert.ToInt32(ViewState["KeyNum"]);
        int keyNum = Convert.ToInt32(ViewState["KeyNum"]);
        string userName = ViewState["UserName"].ToString();
        string nickName = ViewState["NickName"].ToString();
        string userPwd = string.Empty;
        if (panelPwd.Visible == true)//商户网站未传入密码
        {
            if (txtPwd1.Text.Length < 6 || txtPwd1.Text.Length > 20 || txtPwd2.Text.Length < 6 || txtPwd2.Text.Length > 20)
            {
                lblMsg.Text = "密码长度在6-20位之间！";
                return;
            }
            else if (txtPwd1.Text != txtPwd2.Text)
            {
                lblMsg.Text = "密码和重复密码不同！";
                return;
            }
            else
            {
                lblMsg.Text = "";
                userPwd = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(txtPwd1.Text, "MD5").ToLower();
            }
        }
        else//商户网站传入密码
        {
            userPwd = ViewState["UserPwd"].ToString();
        }
        string realName = string.Empty;//真实姓名
        if (txtRealName.Text.Length == 0)
        {
            lblMsg.Text = "请输入您的真实姓名！";
            return;
        }
        else
        {
            lblMsg.Text = "";
            realName = txtRealName.Text;
        }
        string idCard = string.Empty;//身份证号
        if (txtIdentity.Text.Length == 0)
        {
            lblMsg.Text = "请输入您的身份证号！";
            return;
        }
        else
        {
            lblMsg.Text = "";
            idCard = txtIdentity.Text;
        }


        Guid? userID = new Guid();
        RegUserInfo userInfo = InitRegUserInfo(userName, userPwd, nickName, sex, headID, recipient, address, email, movePhone, question, answer, realName, idCard, job, birthday, userID.Value, appid, regIP, prid);
        int smcRegCount = 0;
        string Lv = string.Empty;
        string RankTitle = string.Empty;
        string ope = string.Empty;
        int userType = 0;
        int cityID;
        PartnerInfo partner = UserCenter.UserInfo().GetPartnerInfo(keyNum);
        cityID = partner.CityID;
        int error = 0;

        #endregion
        //注册TCJJG账号                            
        AcountInfo[] userAcount = null;
        userAcount = UserCenter.UserInfo().F_InsertUser(userInfo, smcRegCount, cityID, regIP, 1, ref userID, ref Lv, ref RankTitle, userType, ref ope);

        //添加礼包
        int packageID = 10000;  // 礼包ID 10000
        byte awardType = 3;     // 礼包类型 3
        int amount = 1;         // 礼包数量 1
        bool resultPackage = UserCenter.UserPackage().GivePackageForUser(userID.Value, packageID, awardType, amount);
        //登陆
        AbstractUserInfo uInfo = UserCenter.UserInfo().UserLogOn(userName, userPwd, keyNum, false, serverIP, regIP, false, ref error);
        //保存Session
        WebUserInfo user = new WebUserInfo();
        user = WebCommon.RembSession(user, appid, uInfo.I, userName, userPwd, uInfo.N, uInfo.H, "", uInfo.G, uInfo.UT, uInfo.RL);
        user = WebCommon.UpdateUserAcount(user, userAcount);
        Session["UserInfo"] = user;
        Response.Redirect("/HallPage/HallPagefl.aspx");
    }
}