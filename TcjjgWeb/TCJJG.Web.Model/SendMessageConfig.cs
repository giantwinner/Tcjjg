using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace TCJJG.Web.Model
{
    public class SendMessageConfig
    {
        private string uid = string.Empty;

        public string Uid
        {
            get { return uid; }
            set { uid = value; }
        }

        private string psw = string.Empty;

        public string Psw
        {
            get { return psw; }
            set { psw = value; }
        }

        private int regCount = 0;

        public int RegCount
        {
            get { return regCount; }
            set { regCount = value; }
        }

        private int ope = 0;

        public int Ope
        {
            get { return ope; }
            set { ope = value; }
        }
    }
}
