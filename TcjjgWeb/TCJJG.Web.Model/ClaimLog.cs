using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    [DataContract]
    public class ClaimLog
    {
        /// <summary>
        /// [AwardName]
        /// </summary>
        [DataMember]
        public string AN { set; get; }

        /// <summary>
        /// [AwardCount]
        /// </summary>
        [DataMember]
        public int AC { set; get; }

        /// <summary>
        /// [AccountType]
        /// </summary>
        [DataMember]
        public int AT { set; get; }

        /// <summary>
        /// [ClaimCredentialTypeName]
        /// </summary>
        [DataMember]
        public string CCTN { set; get; }

        /// <summary>
        /// [AwardBonus]
        /// </summary>
        [DataMember]
        public int AB { set; get; }

        /// <summary>
        /// [StatesName]
        /// </summary>
        [DataMember]
        public string AS { set; get; }

        /// <summary>
        /// [CreateDate]
        /// </summary>
        [DataMember]
        public string CR { set; get; }

        /// <summary>
        /// [opeType]
        /// </summary>
        [DataMember]
        public int OT { set; get; }

        /// <summary>
        /// MatchName
        /// </summary>
        [DataMember]
        public string MN { set; get; }
    }
}
