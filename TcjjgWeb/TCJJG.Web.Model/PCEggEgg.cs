using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TCJJG.Web.Model
{
    public class PCEggEgg
    {
        private string pcid = string.Empty;
        /// <summary>
        /// PC蛋蛋网站用户ID
        /// </summary>
        public string Pcid
        {
            get { return pcid; }
            set { pcid = value; }
        }

        private string adid = string.Empty;
        /// <summary>
        /// 广告ID（由PC蛋蛋分配）
        /// </summary>
        public string Adid
        {
            get { return adid; }
            set { adid = value; }
        }

        private string merid = string.Empty;
        /// <summary>
        /// 商家网站用户ID（唯一值）
        /// </summary>
        public string Merid
        {
            get { return merid; }
            set { merid = value; }
        }

        private string mername = string.Empty;
        /// <summary>
        /// 商家网站用户注册帐号或通行证（唯一值）
        /// </summary>
        public string Mername
        {
            get { return mername; }
            set { mername = value; }
        }

        private string key = string.Empty;
        /// <summary>
        /// 密钥
        /// </summary>
        public string Key
        {
            get { return key; }
            set { key = value; }
        }

        private string keycode = string.Empty;
        /// <summary>
        /// 公钥
        /// </summary>
        public string Keycode
        {
            get { return keycode; }
            set { keycode = value; }
        }
    }
}
