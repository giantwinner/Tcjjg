using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    /// <summary>
    /// 最新公告
    /// </summary>
    [DataContract]
    public class AF
    {
        /// <summary>
        /// AfficheID
        /// </summary>
        [DataMember]
        public int I { set; get; }

        /// <summary>
        /// AfficheName
        /// </summary>
        [DataMember]
        public string N { set; get; }

        /// <summary>
        /// cutTitle
        /// </summary>
        [DataMember]
        public string CN { set; get; }

        /// <summary>
        /// DateTime
        /// </summary>
        [DataMember]
        public string D { set; get; }

        /// <summary>
        /// Content
        /// </summary>
        [DataMember]
        public string C { set; get; }

        /// <summary>
        /// IsNew
        /// </summary>
        [DataMember]
        public int? S { set; get; }

        /// <summary>
        /// stype
        /// </summary>
        [DataMember]
        public int? ST { set; get; }
    }
}
