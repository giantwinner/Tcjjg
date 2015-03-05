using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TCJJG.Web.Model
{
    /// <summary>
    /// 像圈圈网这样的网站注册用户
    /// </summary>
    public class ProInfoReg
    {
        private int pID = 0;

        public int PID
        {
            get { return pID; }
            set { pID = value; }
        }
        private int gangsID = 0;

        public int GangsID
        {
            get { return gangsID; }
            set { gangsID = value; }
        }
    }
}
