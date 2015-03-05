using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TCJJG.Web.Model
{
    /// <summary>
    /// 上传头像session类
    /// </summary>
    public class UpLoadHead
    {
        private string bigHead = string.Empty;
        /// <summary>
        /// 大头像地址
        /// </summary>
        public string BigHead
        {
            get { return bigHead; }
            set { bigHead = value; }
        }

        private string smallHead = string.Empty;
        /// <summary>
        /// 小头像地址
        /// </summary>
        public string SmallHead
        {
            get { return smallHead; }
            set { smallHead = value; }
        }

        private string headID = string.Empty;
        /// <summary>
        /// 头像文件名
        /// </summary>
        public string HeadID
        {
            get { return headID; }
            set { headID = value; }
        }
    }
}
