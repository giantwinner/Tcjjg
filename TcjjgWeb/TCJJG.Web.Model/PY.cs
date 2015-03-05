using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    [DataContract]
    public class PY
    {
        /// <summary>
        /// UserName1
        /// </summary>
        [DataMember]
        public string U1 { set; get; }

        /// <summary>
        /// UserName2
        /// </summary>
        [DataMember]
        public string U2 { set; get; }

        /// <summary>
        /// TypeID
        /// </summary>
        [DataMember]
        public int TY { set; get; }

        /// <summary>
        /// Amount
        /// </summary>
        [DataMember]
        public int AM { set; get; }

        /// <summary>
        /// Status
        /// </summary>
        [DataMember]
        public int ST { set; get; }

        /// <summary>
        /// CreateTime
        /// </summary>
        [DataMember]
        public string CR { set; get; }

        /// <summary>
        /// CreateIP
        /// </summary>
        [DataMember]
        public string CI { set; get; }

        /// <summary>
        /// Remark
        /// </summary>
        [DataMember]
        public string RE { set; get; }

        /// <summary>
        /// CallBackTime
        /// </summary>
        [DataMember]
        public string CA { set; get; }

        /// <summary>
        /// YBankName
        /// </summary>
        [DataMember]
        public string YB { set; get; }

        /// <summary>
        /// LnterestRateValue
        /// </summary>
        [DataMember]
        public int LN { set; get; }
    }
}

