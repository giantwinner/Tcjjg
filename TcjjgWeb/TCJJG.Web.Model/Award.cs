using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    /// <summary>
    /// 奖品根据ID加载
    /// </summary>
    [DataContract]
    public class AW
    {
        /// <summary>
        /// AwardID
        /// </summary>
        [DataMember]
        public int I { set; get; }

        /// <summary>
        /// AwardName
        /// </summary>
        [DataMember]
        public string N { set; get; }

        /// <summary>
        /// AwardTypeID
        /// </summary>
        [DataMember]
        public int? T { set; get; }

        /// <summary>
        /// AwardTypeName
        /// </summary>
        [DataMember]
        public string C { set; get; }

        /// <summary>
        /// AwardDescript
        /// </summary>
        [DataMember]
        public string D { set; get; }

        /// <summary>
        /// AwardImg
        /// </summary>
        [DataMember]
        public string M { set; get; }

        /// <summary>
        /// AwardBonus
        /// </summary>
        [DataMember]
        public int B { set; get; }

        /// <summary>
        /// ClaimCredential
        /// </summary>
        [DataMember]
        public int? L { set; get; }

        /// <summary>
        /// AwardAmply
        /// </summary>
        [DataMember]
        public string A { set; get; }

        /// <summary>
        /// AwardPostType
        /// </summary>
        [DataMember]
        public int? S { set; get; }

        /// <summary>
        /// Hot
        /// </summary>
        [DataMember]
        public int? H { set; get; }
    }
}
