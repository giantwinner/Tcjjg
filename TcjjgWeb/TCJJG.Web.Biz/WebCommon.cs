using System;
using System.Xml;
using System.Text;
using System.Collections.Generic;
using TCJJG.Web.Model;
using TCJJG.Web.UserCenter;
using System.Web.UI.WebControls;
using TCJJG.Web.DB;
using System.Linq;
using FFJJG.Common.UserCenter;

namespace TCJJG.Web.Biz
{
    public static class WebCommon
    {
        /// <summary>
        /// 获得FFJJWebxml
        /// </summary>
        /// <param name="key"></param>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string GetFFJJGWebXML(string key, string value)
        {
            XmlDocument xd = new XmlDocument();
            try
            {
            string path = System.Web.HttpContext.Current.Server.MapPath("~/") + "ffjjgweb.config";
            xd.Load(path);
            XmlNode xn = xd.SelectSingleNode(key + value);
            return xn.InnerText;
            }
            catch (Exception ex)
            {
                FFJJG.Server.Utils.Logging.write(ex);
                return null;
            }

        }

        /// <summary>
        /// 获得充值信息
        /// </summary>
        /// <param name="value"></param>
        /// <returns></returns>
        public static string GetYeePayPayInfo(string value)
        {
            return GetFFJJGWebXML("ffjjgweb/payConfig/", value);
        }

        /// <summary>
        /// 更新用户财富
        /// </summary>
        /// <param name="user"></param>
        /// <param name="acountInfo"></param>
        /// <returns></returns>
        public static WebUserInfo UpdateUserAcount(WebUserInfo user, AcountInfo[] acountInfo)
        {
            if (null != acountInfo)
            {
                user.Lua.Clear();
                foreach (var item in acountInfo)
                {
                    UA ua = new UA();
                    ua.Ti = item.T;
                    ua.Tn = item.N;
                    ua.Ac = item.A;
                    user.Lua.Add(ua);
                }
            }
            return user;
        }

        /// <summary>
        /// 记录session
        /// </summary>
        /// <param name="user"></param>
        /// <param name="appid"></param>
        /// <param name="userID"></param>
        /// <param name="userName"></param>
        /// <param name="psw"></param>
        /// <param name="nickName"></param>
        /// <param name="headID"></param>
        /// <param name="Lv"></param>
        /// <param name="RankTitle"></param>
        /// <param name="sex"></param>
        /// <param name="userType"></param>
        /// <returns></returns>
        public static WebUserInfo RembSession(WebUserInfo user, int appid, Guid userID, string userName, string psw, string nickName, string headID, string Lv, int sex, int userType, string[] roles)
        {
            user.AppID = appid;
            user.UserID = userID;
            user.UserName = userName;
            user.Password = psw;
            user.NickName = nickName;
            user.HeadID = headID;
            user.Lv = Lv;

            user.Sex = sex;
            user.UserTypeID = userType;
            user.Roles = roles;
            return user;
        }

        /// <summary>
        /// 
        /// </summary>
        /// <returns></returns>
        public static List<ListItem> DDL24Hour()
        {
            List<ListItem> lli = new List<ListItem>();
            for (int i = 0; i < 24; i++)
            {
                ListItem it = new ListItem(i.ToString().PadLeft(2, '0'), i.ToString().PadLeft(2, '0'));
                lli.Add(it);
            }
            return lli;
        }

        /// <summary>
        /// 主要作用：截取字符串.前台根据规定的长度显示字符，超出部分用"..."
        /// </summary>
        /// <param name="str"></param>
        /// <param name="len"></param>
        /// <returns></returns>
        public static string cutTitle(string str, int len)
        {
            int intLen = str.Length;
            int start = 0;
            int end = intLen;
            int single = 0;
            char[] chars = str.ToCharArray();
            for (int i = 0; i < chars.Length; i++)
            {
                if (Convert.ToInt32(chars[i]) > 255)
                {
                    start += 2;
                }
                else
                {
                    start += 1;
                    single++;
                }
                if (start >= len)
                {
                    if (end % 2 == 0)
                    {
                        if (single % 2 == 0)
                        {
                            end = i + 1;
                        }
                        else
                        {
                            end = i;
                        }
                    }
                    else
                    {
                        end = i + 1;
                    }
                    break;
                }
            }
            string temp = str.Substring(0, end);
            if (str.Length > end)
            {
                return temp + "...";
            }
            else
            {
                return temp;
            }
        }
    }
}
