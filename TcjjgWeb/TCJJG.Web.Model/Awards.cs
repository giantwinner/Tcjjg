using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    /// <summary>
    /// 奖品(默认加载；按类型加载)
    /// </summary>
    [DataContract]
    public class AD
    {
        /// <summary>
        /// AwardID
        /// </summary>
        [DataMember]
        public string I { set; get; }

        /// <summary>
        /// AwardName
        /// </summary>
        [DataMember]
        public string N { set; get; }

        /// <summary>
        /// AwardTypeID
        /// </summary>
        [DataMember]
        public string T { set; get; }

        /// <summary>
        /// AwardBonus
        /// </summary>
        [DataMember]
        public int? B { set; get; }

        /// <summary>
        /// AwardImg
        /// </summary>
        [DataMember]
        public string M { set; get; }

        /// <summary>
        /// Hot
        /// </summary>
        [DataMember]
        public int? H { set; get; }

        /// <summary>
        /// ClaimCredentialTypeName  
        /// </summary>
        [DataMember]
        public string CCTN { set; get; }
    }
}
