using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    [DataContract]
    public class ClaimLogAdd
    {
        /// <summary>
        /// Email
        /// </summary>
        [DataMember]
        public string E { set; get; }

        /// <summary>
        /// MovePhone
        /// </summary>
        [DataMember]
        public string M { set; get; }

        /// <summary>
        /// Recipient
        /// </summary>
        [DataMember]
        public string T { set; get; }

        /// <summary>
        /// PostNumber
        /// </summary>
        [DataMember]
        public string N { set; get; }

        /// <summary>
        /// Address
        /// </summary>
        [DataMember]
        public string A { set; get; }

        /// <summary>
        /// Remarks
        /// </summary>
        [DataMember]
        public string R { set; get; }

        /// <summary>
        /// QQ
        /// </summary>
        [DataMember]
        public string Q { set; get; }
    }
}
