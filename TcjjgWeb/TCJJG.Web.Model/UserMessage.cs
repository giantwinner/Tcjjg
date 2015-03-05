using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace FFJJG.Common.UserCenter
{
    /// <summary>
    /// 用户短信类
    /// </summary>
    [DataContract]
    public class UM
    {
        /// <summary>
        /// _MsgID
        /// </summary>
        [DataMember]
        public string I { set; get; }

        /// <summary>
        /// _Type
        /// </summary>
        [DataMember]
        public string T { set; get; }

        /// <summary>
        /// _Msg
        /// </summary>
        [DataMember]
        public string M { set; get; }

        /// <summary>
        /// _SendTime
        /// </summary>
        [DataMember]
        public string D { set; get; }

        /// <summary>
        /// _IsReaded
        /// </summary>
        [DataMember]
        public string S { set; get; }

        /// <summary>
        /// _Title
        /// </summary>
        [DataMember]
        public string C { set; get; }

        /// <summary>
        /// _LinkTo
        /// </summary>
        [DataMember]
        public string LT { set; get; }
    }
}
