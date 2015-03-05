using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    [DataContract]
    public class Index_DJ
    {
        /// <summary>
        /// UserName
        /// </summary>
        [DataMember]
        public string N { set; get; }

        /// <summary>
        /// AwardName
        /// </summary>
        [DataMember]
        public string A { set; get; }

        /// <summary>
        /// CreateDate
        /// </summary>
        [DataMember]
        public string C { set; get; }

        /// <summary>
        /// AwardCount
        /// </summary>
        [DataMember]
        public int AC { set; get; }
    }
}
