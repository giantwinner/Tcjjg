﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.1
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------

namespace FFJJG.Common.UserCenter
{
    using System.Runtime.Serialization;
    
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="UMA", Namespace="http://schemas.datacontract.org/2004/07/FFJJG.Common.UserCenter")]
    public partial class UMA : object, System.Runtime.Serialization.IExtensibleDataObject
    {
        
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private string AField;
        
        private string CField;
        
        private int IField;
        
        private string MField;
        
        private string RField;
        
        private string TField;
        
        private int YField;
        
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData
        {
            get
            {
                return this.extensionDataField;
            }
            set
            {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string A
        {
            get
            {
                return this.AField;
            }
            set
            {
                this.AField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string C
        {
            get
            {
                return this.CField;
            }
            set
            {
                this.CField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int I
        {
            get
            {
                return this.IField;
            }
            set
            {
                this.IField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string M
        {
            get
            {
                return this.MField;
            }
            set
            {
                this.MField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string R
        {
            get
            {
                return this.RField;
            }
            set
            {
                this.RField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string T
        {
            get
            {
                return this.TField;
            }
            set
            {
                this.TField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Y
        {
            get
            {
                return this.YField;
            }
            set
            {
                this.YField = value;
            }
        }
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="ResAwardInfo", Namespace="http://schemas.datacontract.org/2004/07/FFJJG.Common.UserCenter")]
    public partial class ResAwardInfo : object, System.Runtime.Serialization.IExtensibleDataObject
    {
        
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private int ApplicationIdField;
        
        private string AwardNameField;
        
        private System.Nullable<int> CountField;
        
        private System.DateTime CreateTimeField;
        
        private string MatchNameField;
        
        private System.Nullable<System.DateTime> MatchStartTimeField;
        
        private int ProductIDField;
        
        private int ResIDField;
        
        private System.Nullable<int> StatusField;
        
        private System.DateTime TakeOffTimeField;
        
        private int TypeField;
        
        private System.Nullable<System.Guid> UserIDField;
        
        private string UserNameField;
        
        public System.Runtime.Serialization.ExtensionDataObject ExtensionData
        {
            get
            {
                return this.extensionDataField;
            }
            set
            {
                this.extensionDataField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int ApplicationId
        {
            get
            {
                return this.ApplicationIdField;
            }
            set
            {
                this.ApplicationIdField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string AwardName
        {
            get
            {
                return this.AwardNameField;
            }
            set
            {
                this.AwardNameField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Nullable<int> Count
        {
            get
            {
                return this.CountField;
            }
            set
            {
                this.CountField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.DateTime CreateTime
        {
            get
            {
                return this.CreateTimeField;
            }
            set
            {
                this.CreateTimeField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string MatchName
        {
            get
            {
                return this.MatchNameField;
            }
            set
            {
                this.MatchNameField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Nullable<System.DateTime> MatchStartTime
        {
            get
            {
                return this.MatchStartTimeField;
            }
            set
            {
                this.MatchStartTimeField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int ProductID
        {
            get
            {
                return this.ProductIDField;
            }
            set
            {
                this.ProductIDField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int ResID
        {
            get
            {
                return this.ResIDField;
            }
            set
            {
                this.ResIDField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Nullable<int> Status
        {
            get
            {
                return this.StatusField;
            }
            set
            {
                this.StatusField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.DateTime TakeOffTime
        {
            get
            {
                return this.TakeOffTimeField;
            }
            set
            {
                this.TakeOffTimeField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Type
        {
            get
            {
                return this.TypeField;
            }
            set
            {
                this.TypeField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Nullable<System.Guid> UserID
        {
            get
            {
                return this.UserIDField;
            }
            set
            {
                this.UserIDField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string UserName
        {
            get
            {
                return this.UserNameField;
            }
            set
            {
                this.UserNameField = value;
            }
        }
    }
}


[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
[System.ServiceModel.ServiceContractAttribute(ConfigurationName="IUserClaimSvc")]
public interface IUserClaimSvc
{
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IUserClaimSvc/UserSelMatchAward", ReplyAction="http://tempuri.org/IUserClaimSvc/UserSelMatchAwardResponse")]
    FFJJG.Common.UserCenter.UMA[] UserSelMatchAward(System.Guid userID, int pageIndex, int pageCount, ref System.Nullable<int> pageTotal);
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IUserClaimSvc/GetResAwardInfo", ReplyAction="http://tempuri.org/IUserClaimSvc/GetResAwardInfoResponse")]
    FFJJG.Common.UserCenter.ResAwardInfo GetResAwardInfo(int resID, System.Guid userID);
}

[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public interface IUserClaimSvcChannel : IUserClaimSvc, System.ServiceModel.IClientChannel
{
}

[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public partial class UserClaimSvcClient : System.ServiceModel.ClientBase<IUserClaimSvc>, IUserClaimSvc
{
    
    public UserClaimSvcClient()
    {
    }
    
    public UserClaimSvcClient(string endpointConfigurationName) : 
            base(endpointConfigurationName)
    {
    }
    
    public UserClaimSvcClient(string endpointConfigurationName, string remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public UserClaimSvcClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public UserClaimSvcClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(binding, remoteAddress)
    {
    }
    
    public FFJJG.Common.UserCenter.UMA[] UserSelMatchAward(System.Guid userID, int pageIndex, int pageCount, ref System.Nullable<int> pageTotal)
    {
        return base.Channel.UserSelMatchAward(userID, pageIndex, pageCount, ref pageTotal);
    }
    
    public FFJJG.Common.UserCenter.ResAwardInfo GetResAwardInfo(int resID, System.Guid userID)
    {
        return base.Channel.GetResAwardInfo(resID, userID);
    }
}
