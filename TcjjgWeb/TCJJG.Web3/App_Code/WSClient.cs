using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Configuration;

namespace TCJJG.Web.Biz
{
    [System.Diagnostics.DebuggerStepThrough(), System.ComponentModel.DesignerCategory("code"),
System.Web.Services.WebServiceBinding(Name = "", Namespace = "")]
    public class CMOPWebWSDy : CMOPWebWS
    {
        public CMOPWebWSDy()
            : base()
        {
            //设置默认webService的地址
            this.Url = ConfigurationManager.AppSettings["CMOPWebWS"].ToString();
        }
        public CMOPWebWSDy(string webUrl)
            : base()
        {
            this.Url = ConfigurationManager.AppSettings["CMOPWebWS"].ToString();
        }
    }

    [System.Diagnostics.DebuggerStepThrough(), System.ComponentModel.DesignerCategory("code"),
System.Web.Services.WebServiceBinding(Name = "", Namespace = "")]
    public class DynWebService : ImageService
    {
        public DynWebService()
            : base()
        {
            //设置默认webService的地址
            this.Url = ConfigurationManager.AppSettings["ImageService"].ToString();
        }
        public DynWebService(string webUrl)
            : base()
        {
            this.Url = ConfigurationManager.AppSettings["ImageService"].ToString();
        }
    }

    [System.Diagnostics.DebuggerStepThrough(), System.ComponentModel.DesignerCategory("code"),
System.Web.Services.WebServiceBinding(Name = "", Namespace = "")]
    public class ResourceWSDy : ResourceWS
    {
        public ResourceWSDy()
            : base()
        {
            //设置默认webService的地址
            this.Url = ConfigurationManager.AppSettings["ResourceWS"].ToString();
        }
        public ResourceWSDy(string webUrl)
            : base()
        {
            this.Url = ConfigurationManager.AppSettings["ResourceWS"].ToString();
        }
    }

    [System.Diagnostics.DebuggerStepThrough(), System.ComponentModel.DesignerCategory("code"),
System.Web.Services.WebServiceBinding(Name = "", Namespace = "")]
    public class SalesRoomWSDy : SalesRoomWS
    {
        public SalesRoomWSDy()
            : base()
        {
            //设置默认webService的地址
            this.Url = ConfigurationManager.AppSettings["SalesRoomWS"].ToString();
        }
        public SalesRoomWSDy(string webUrl)
            : base()
        {
            this.Url = ConfigurationManager.AppSettings["SalesRoomWS"].ToString();
        }
    }

    [System.Diagnostics.DebuggerStepThrough(), System.ComponentModel.DesignerCategory("code"),
System.Web.Services.WebServiceBinding(Name = "", Namespace = "")]
    public class SpreadWSDy : SpreadWS
    {
        public SpreadWSDy()
            : base()
        {
            //设置默认webService的地址
            this.Url = ConfigurationManager.AppSettings["SpreadWS"].ToString();
        }
        public SpreadWSDy(string webUrl)
            : base()
        {
            this.Url = ConfigurationManager.AppSettings["SpreadWS"].ToString();
        }
    }
    [System.Diagnostics.DebuggerStepThrough(), System.ComponentModel.DesignerCategory("code"),
System.Web.Services.WebServiceBinding(Name = "", Namespace = "")]
    public class ExpSvcDy : ExpSvc
    {
        public ExpSvcDy()
            : base()
        {
            //设置默认webService的地址
            this.Url = ConfigurationManager.AppSettings["ExpSvc"].ToString();
        }
        public ExpSvcDy(string webUrl)
            : base()
        {
            this.Url = ConfigurationManager.AppSettings["ExpSvc"].ToString();
        }
    }
    [System.Diagnostics.DebuggerStepThrough(), System.ComponentModel.DesignerCategory("code"),
System.Web.Services.WebServiceBinding(Name = "", Namespace = "")]
    public class SocialCenterWSDy : SocialCenterWS
    {
        public SocialCenterWSDy()
            : base()
        {
            //设置默认webService的地址
            this.Url = ConfigurationManager.AppSettings["SocialCenterWS"].ToString();
        }
        public SocialCenterWSDy(string webUrl)
            : base()
        {
            this.Url = ConfigurationManager.AppSettings["SocialCenterWS"].ToString();
        }
    }
    public class WSClient
    {
        private static bool is_CMOPWebWSBiz = false;
        private static bool is_SpreadWSBiz = false;
        private static bool is_SalesRoomWSBiz = false;
        private static bool is_ResourceWSBiz = false;
        private static bool is_ImageService = false;
        private static bool is_ExpSvc = false;
        private static bool is_SocialCenterWS = false;
        //
        private static CMOPWebWS cMOPWebWS = null;
        private static SpreadWS spreadWS = null;
        private static SalesRoomWS salesRoomWS = null;
        private static ResourceWS resourceWS = null;
        private static ImageService imageService = null;
        private static ExpSvc expSvc = null;
        private static SocialCenterWS socialCenterWS = null;
        //
        public static CMOPWebWS CMOPWebWS()
        {
            if (!is_CMOPWebWSBiz)
            {
                cMOPWebWS = new CMOPWebWSDy();
                is_CMOPWebWSBiz = true;
            }
            return cMOPWebWS;
        }
        public static SpreadWS SpreadWS()
        {
            if (!is_SpreadWSBiz)
            {
                spreadWS = new SpreadWSDy();
                is_SpreadWSBiz = true;
            }
            return spreadWS;
        }
        public static SalesRoomWS SalesRoomWS()
        {
            if (!is_SalesRoomWSBiz)
            {
                salesRoomWS = new SalesRoomWSDy();
                is_SalesRoomWSBiz = true;
            }
            return salesRoomWS;
        }
        public static ResourceWS ResourceWS()
        {
            if (!is_ResourceWSBiz)
            {
                resourceWS = new ResourceWSDy();
                is_ResourceWSBiz = true;
            }
            return resourceWS;
        }
        public static ImageService ImageService()
        {
            if (!is_ImageService)
            {
                imageService = new DynWebService();
                is_ImageService = true;
            }
            return imageService;
        }
        public static ExpSvc ExpSvc()
        {
            if (!is_ExpSvc)
            {
                expSvc = new ExpSvcDy();
                is_ExpSvc = true;
            }
            return expSvc;
        }
        public static SocialCenterWS SocialCenterWS()
        {
            if (!is_SocialCenterWS)
            {
                socialCenterWS = new SocialCenterWS();
                is_SocialCenterWS = true;
            }
            return socialCenterWS;
        }

    }
}
