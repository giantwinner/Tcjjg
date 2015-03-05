using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TCJJG.Web.Model
{
    /// <summary>
    /// 联合运营用户实体类
    /// </summary>
    public class SUserInfo
    {
        #region

        private Guid userID = new Guid();
        /// <summary>
        /// userID
        /// </summary>
        public Guid UserID
        {
            get { return userID; }
            set { userID = value; }
        }

        private string userName = string.Empty;
        /// <summary>
        /// 帐号
        /// </summary>
        public string UserName
        {
            get { return userName; }
            set { userName = value; }
        }

        private string nickName = string.Empty;
        /// <summary>
        /// 昵称
        /// </summary>
        public string NickName
        {
            get { return nickName; }
            set { nickName = value; }
        }

        private int appID = 1;
        /// <summary>
        /// 应用id
        /// </summary>
        public int AppID
        {
            get { return appID; }
            set { appID = value; }
        }

        private string appKey = string.Empty;
        /// <summary>
        /// 应用key
        /// </summary>
        public string AppKey
        {
            get { return appKey; }
            set { appKey = value; }
        }

        private string appSecretKey = string.Empty;
        /// <summary>
        /// 应用私钥
        /// </summary>
        public string AppSecretKey
        {
            get { return appSecretKey; }
            set { appSecretKey = value; }
        }

        private string appPublicKey = string.Empty;
        /// <summary>
        /// 应用公钥
        /// </summary>
        public string AppPublicKey
        {
            get { return appPublicKey; }
            set { appPublicKey = value; }
        }

        private string passWord = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        public string PassWord
        {
            get { return passWord; }
            set { passWord = value; }
        }

        private int sex = 1;
        /// <summary>
        /// 
        /// </summary>
        public int Sex
        {
            get { return sex; }
            set { sex = value; }
        }

        private string headImg = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        public string HeadImg
        {
            get { return headImg; }
            set { headImg = value; }
        }

        private string lv = string.Empty;
        /// <summary>
        /// 等级
        /// </summary>
        public string Lv
        {
            get { return lv; }
            set { lv = value; }
        }

        private string rankTitle = string.Empty;
        /// <summary>
        /// 头衔
        /// </summary>
        public string RankTitle
        {
            get { return rankTitle; }
            set { rankTitle = value; }
        }

        private int userTypeID = 0;
        /// <summary>
        /// 用户类型
        /// </summary>
        public int UserTypeID
        {
            get { return userTypeID; }
            set { userTypeID = value; }
        }

        private List<UA> lua = new List<UA>();
        /// <summary>
        /// 用户财富
        /// </summary>
        public List<UA> Lua
        {
            get { return lua; }
            set { lua = value; }
        }

        #endregion

        #region

        private string logoUrl = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        public string LogoUrl
        {
            get { return logoUrl; }
            set { logoUrl = value; }
        }

        private string mainPageUrl = string.Empty;

        /// <summary>
        /// 
        /// </summary>
        public string MainPageUrl
        {
            get { return mainPageUrl; }
            set { mainPageUrl = value; }
        }

        private string payCenterUrl = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        public string PayCenterUrl
        {
            get { return payCenterUrl; }
            set { payCenterUrl = value; }
        }

        private string awardCenterUrl = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        public string AwardCenterUrl
        {
            get { return awardCenterUrl; }
            set { awardCenterUrl = value; }
        }

        private string bbsUrl = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        public string BbsUrl
        {
            get { return bbsUrl; }
            set { bbsUrl = value; }
        }

        private string userCenterUrl = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        public string UserCenterUrl
        {
            get { return userCenterUrl; }
            set { userCenterUrl = value; }
        }

        private string helpCenterUrl = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        public string HelpCenterUrl
        {
            get { return helpCenterUrl; }
            set { helpCenterUrl = value; }
        }

        private string serverUrl = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        public string ServerUrl
        {
            get { return serverUrl; }
            set { serverUrl = value; }
        }

        private string siteUrl = string.Empty;
        /// <summary>
        /// 
        /// </summary>
        public string SiteUrl
        {
            get { return siteUrl; }
            set { siteUrl = value; }
        }

        private string logoutUrl = string.Empty;

        public string LogoutUrl
        {
            get { return logoutUrl; }
            set { logoutUrl = value; }
        }

        #endregion
    }
}
