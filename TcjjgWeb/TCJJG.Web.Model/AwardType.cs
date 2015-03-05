using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    /// <summary>
    /// 奖品类型(AwardType)
    /// </summary>
    [DataContract]
    public class AT
    {
        /// <summary>
        /// AwardTypeID
        /// </summary>
        [DataMember]
        public string I { set; get; }

        /// <summary>
        /// AwardTypeName
        /// </summary>
        [DataMember]
        public string N { set; get; }
    }
}
