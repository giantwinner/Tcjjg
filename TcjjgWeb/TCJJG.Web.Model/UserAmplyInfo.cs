using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    /// <summary>
    /// 用户基本信息(兑奖)
    /// </summary>
    [DataContract]
    public class UserAmplyInfo
    {
        /// <summary>
        ///email
        /// </summary>
        [DataMember]
        public string E { set; get; }
        /// <summary>
        ///固定电话
        /// </summary>
        [DataMember]
        public string P { set; get; }
        /// <summary>
        ///地址
        /// </summary>
        [DataMember]
        public string A { set; get; }
        /// <summary>
        ///邮编
        /// </summary>
        [DataMember]
        public string N { set; get; }
        /// <summary>
        ///身份证
        /// </summary>
        [DataMember]
        public string C { set; get; }
        /// <summary>
        ///移动电话
        /// </summary>
        [DataMember]
        public string M { set; get; }
        /// <summary>
        ///收件人
        /// </summary>
        [DataMember]
        public string R { set; get; }
    }
}
