using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace TCJJG.Web.Model
{
    [DataContract]
    public class AF_Index
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

    [DataContract]
    public class FF_Index
    {
        /// <summary>
        /// ID
        /// </summary>
        [DataMember]
        public int I { set; get; }

        /// <summary>
        /// ImageName
        /// </summary>
        [DataMember]
        public string N { set; get; }

        /// <summary>
        /// LinkURL
        /// </summary>
        [DataMember]
        public string L { set; get; }
    }
}
