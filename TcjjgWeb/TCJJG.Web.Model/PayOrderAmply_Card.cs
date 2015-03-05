using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    [DataContract]
    public class PayOrderAmply_Card
    {
        /// <summary>
        /// payOrderID
        /// </summary>
        [DataMember]
        public string P { set; get; }

        /// <summary>
        /// createDate
        /// </summary>
        [DataMember]
        public string D { set; get; }

        /// <summary>
        /// orderState
        /// </summary>
        [DataMember]
        public string O { set; get; }

        /// <summary>
        /// payType
        /// </summary>
        [DataMember]
        public string T { set; get; }

        /// <summary>
        /// payCount
        /// </summary>
        [DataMember]
        public string C { set; get; }

        /// <summary>
        /// payGetMoney
        /// </summary>
        [DataMember]
        public string M { set; get; }

        /// <summary>
        /// createIP
        /// </summary>
        [DataMember]
        public string I { set; get; }

        /// <summary>
        /// cardID
        /// </summary>
        [DataMember]
        public string K { set; get; }
    }
}
