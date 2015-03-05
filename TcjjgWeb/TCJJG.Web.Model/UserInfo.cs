using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TCJJG.Web.Model
{
    /// <summary>
    /// user session
    /// </summary>
    public class WebUserInfo
    {
        /// <summary>
        /// 用户基本信息类
        /// </summary>
        public WebUserInfo() { }

        /// <summary>
        /// 应用
        /// </summary>
        public int AppID = 0;

        /// <summary>
        /// 用户ID
        /// </summary>
        public Guid UserID;

        /// <summary>
        /// 用户名
        /// </summary>
        public string UserName = string.Empty;

        /// <summary>
        /// 昵称
        /// </summary>
        public string NickName = string.Empty;

        /// <summary>
        /// 用户密码
        /// </summary>
        public string Password = string.Empty;

        /// <summary>
        /// 等级
        /// </summary>
        public string Lv = string.Empty;

        /// <summary>
        /// 头衔
        /// </summary>
        public string RankTitle = string.Empty;

        /// <summary>
        /// 头像
        /// </summary>
        public string HeadID = string.Empty;

        /// <summary>
        /// 性别
        /// </summary>
        public int Sex = 0;

        /// <summary>
        /// 用户类型
        /// </summary>
        public int UserTypeID = 0;

        /// <summary>
        /// 消息数量
        /// </summary>
        public int MsgCount = 0;

        private string[] roles = { "1" };
        /// <summary>
        /// 用户角色列表
        /// </summary>
        public string[] Roles
        {
            get { return roles; }
            set { roles = value; }
        }

        /// <summary>
        /// user account
        /// </summary>
        private List<UA> lua = new List<UA>();

        public List<UA> Lua
        {
            get { return lua; }
            set { lua = value; }
        }
    }
}
