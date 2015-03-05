using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using FFJJG.Common.UserCenter;

namespace TCJJG.Web.UserCenter
{
    public static class UserCenter
    {
        #region

        private static bool IsInit_UserInfo = false;
        private static bool IsInit_UserAcount = false;
        private static bool IsInit_UserClaim = false;
        private static bool IsInit_UserMessage = false;
        private static bool IsInit_UserRichInfo = false;

        private static bool IsInit_UserGangsControl = false;
        private static bool IsInit_PartnerSvc = false;
        private static bool IsInit_Package = false;

        #endregion

        #region

        private static UserInfoSvcClient userInfo = null;
        private static UserAcountSvcClient userAcount = null;
        private static UserClaimSvcClient userClaim = null;
        private static UserMessageSvcClient userMessage = null;
        private static RichInfoSvcClient userRichInfo = null;

        private static GangsControlSvcClient userGangsControl = null;
        private static PartnerSvcClient userPartner = null;
        private static PackageSvcClient userPackage = null;

        #endregion

        #region

        public static UserInfoSvcClient UserInfo()
        {
            if (!IsInit_UserInfo)
            {
                userInfo = new UserInfoSvcClient("BasicHttpBinding_IUserInfoSvc");
                IsInit_UserInfo = true;
            }
            return userInfo;
        }

        public static UserAcountSvcClient UserAcount()
        {
            if (!IsInit_UserAcount)
            {
                userAcount = new UserAcountSvcClient("BasicHttpBinding_IUserAcountSvc");
                IsInit_UserAcount = true;
            }
            return userAcount;
        }

        public static UserClaimSvcClient UserClaim()
        {
            if (!IsInit_UserClaim)
            {
                userClaim = new UserClaimSvcClient("BasicHttpBinding_IUserClaimSvc");
                IsInit_UserClaim = true;
            }
            return userClaim;
        }

        public static UserMessageSvcClient UserMessage()
        {
            if (!IsInit_UserMessage)
            {
                userMessage = new UserMessageSvcClient("BasicHttpBinding_IUserMessageSvc");
                IsInit_UserMessage = true;
            }
            return userMessage;
        }

        public static RichInfoSvcClient UserRichInfo()
        {
            if (!IsInit_UserRichInfo)
            {
                userRichInfo = new RichInfoSvcClient("BasicHttpBinding_IRichInfoSvc");
                IsInit_UserRichInfo = true;
            }
            return userRichInfo;
        }

        public static GangsControlSvcClient UserGangsControl()
        {
            if (!IsInit_UserGangsControl)
            {
                userGangsControl = new GangsControlSvcClient("BasicHttpBinding_IGangsControlSvc");
                IsInit_UserGangsControl = true;
            }
            return userGangsControl;
        }

        public static PartnerSvcClient UserPartner()
        {
            if (!IsInit_PartnerSvc)
            {
                userPartner = new PartnerSvcClient("BasicHttpBinding_IPartnerSvc");
                IsInit_PartnerSvc = true;
            }
            return userPartner;
        }

        public static PackageSvcClient UserPackage()
        {
            if (!IsInit_Package)
            {
                userPackage = new PackageSvcClient("BasicHttpBinding_IPackageSvc");
                IsInit_Package = true;
            }
            return userPackage;
        }

        #endregion
    }
}
