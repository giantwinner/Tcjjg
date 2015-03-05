using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    [DataContract]
    public class Ask
    {
        /// <summary>
        /// ID
        /// </summary>
        [DataMember]
        public int I { set; get; }

        /// <summary>
        /// title
        /// </summary>
        [DataMember]
        public string T { set; get; }

        /// <summary>
        /// dateTime
        /// </summary>
        [DataMember]
        public string D { set; get; }

        /// <summary>
        /// state
        /// </summary>
        [DataMember]
        public string S { set; get; }


        /// <summary>
        /// answerCreate
        /// </summary>
        [DataMember]
        public string A { set; get; }

        /// <summary>
        /// answerContents
        /// </summary>
        [DataMember]
        public string C { set; get; }
    }
}
