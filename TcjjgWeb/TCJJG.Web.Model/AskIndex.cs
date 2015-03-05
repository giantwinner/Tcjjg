using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    [DataContract]
    public class AskIndex
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
    }
}