using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TCJJG.Web.Model
{
    /// <summary>
    /// user account
    /// </summary>
    public class UA
    {
        private int ti = 0;
        /// <summary>
        /// TypeID
        /// </summary>
        public int Ti
        {
            get { return ti; }
            set { ti = value; }
        }

        private string tn = string.Empty;
        /// <summary>
        /// TypeName
        /// </summary>
        public string Tn
        {
            get { return tn; }
            set { tn = value; }
        }

        private int ac = 0;
        /// <summary>
        /// Amount
        /// </summary>
        public int Ac
        {
            get { return ac; }
            set { ac = value; }
        }
    }
}
