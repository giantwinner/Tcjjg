using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    [DataContract]
    public class PC
    {
        /// <summary>
        /// CardID
        /// </summary>
        [DataMember]
        public string CA { set; get; }

        /// <summary>
        /// C_TypeID
        /// </summary>
        [DataMember]
        public int CT { set; get; }

        /// <summary>
        /// P_Amount
        /// </summary>
        [DataMember]
        public int PA { set; get; }

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
        /// CreateDate
        /// </summary>
        [DataMember]
        public string CR { set; get; }

        /// <summary>
        /// CreateIP
        /// </summary>
        [DataMember]
        public string CI { set; get; }

        /// <summary>
        /// Remarks
        /// </summary>
        [DataMember]
        public string RE { set; get; }

        /// <summary>
        /// CardState
        /// </summary>
        [DataMember]
        public int CS { set; get; }

        /// <summary>
        /// C_Amount
        /// </summary>
        [DataMember]
        public int CAM { set; get; }

        /// <summary>
        /// AbateDate
        /// </summary>
        [DataMember]
        public string AB { set; get; }
    }
}