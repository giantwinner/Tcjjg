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
    [System.Runtime.Serialization.DataContractAttribute(Name="PartnerAwards", Namespace="http://schemas.datacontract.org/2004/07/FFJJG.Common.UserCenter")]
    public partial class PartnerAwards : object, System.Runtime.Serialization.IExtensibleDataObject
    {
        
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private string AddressField;
        
        private string HidField;
        
        private int PartnerIDField;
        
        private int PartnerLevField;
        
        private string PartnerNameField;
        
        private int PartnerTypeField;
        
        private int SortField;
        
        private System.Guid UserIDField;
        
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
        public string Address
        {
            get
            {
                return this.AddressField;
            }
            set
            {
                this.AddressField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string Hid
        {
            get
            {
                return this.HidField;
            }
            set
            {
                this.HidField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int PartnerID
        {
            get
            {
                return this.PartnerIDField;
            }
            set
            {
                this.PartnerIDField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int PartnerLev
        {
            get
            {
                return this.PartnerLevField;
            }
            set
            {
                this.PartnerLevField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string PartnerName
        {
            get
            {
                return this.PartnerNameField;
            }
            set
            {
                this.PartnerNameField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int PartnerType
        {
            get
            {
                return this.PartnerTypeField;
            }
            set
            {
                this.PartnerTypeField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Sort
        {
            get
            {
                return this.SortField;
            }
            set
            {
                this.SortField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Guid UserID
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
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="Province", Namespace="http://schemas.datacontract.org/2004/07/FFJJG.Common.UserCenter")]
    public partial class Province : object, System.Runtime.Serialization.IExtensibleDataObject
    {
        
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private int ProvinceIDField;
        
        private System.Nullable<System.Guid> ProvinceManagerField;
        
        private string ProvinceNameField;
        
        private int SortField;
        
        private int StatusField;
        
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
        public int ProvinceID
        {
            get
            {
                return this.ProvinceIDField;
            }
            set
            {
                this.ProvinceIDField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Nullable<System.Guid> ProvinceManager
        {
            get
            {
                return this.ProvinceManagerField;
            }
            set
            {
                this.ProvinceManagerField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string ProvinceName
        {
            get
            {
                return this.ProvinceNameField;
            }
            set
            {
                this.ProvinceNameField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Sort
        {
            get
            {
                return this.SortField;
            }
            set
            {
                this.SortField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Status
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
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="City", Namespace="http://schemas.datacontract.org/2004/07/FFJJG.Common.UserCenter")]
    public partial class City : object, System.Runtime.Serialization.IExtensibleDataObject
    {
        
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private int CityIDField;
        
        private System.Nullable<System.Guid> CityManagerField;
        
        private string CityNameField;
        
        private int ProvinceIDField;
        
        private int SortField;
        
        private int StatusField;
        
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
        public int CityID
        {
            get
            {
                return this.CityIDField;
            }
            set
            {
                this.CityIDField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public System.Nullable<System.Guid> CityManager
        {
            get
            {
                return this.CityManagerField;
            }
            set
            {
                this.CityManagerField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string CityName
        {
            get
            {
                return this.CityNameField;
            }
            set
            {
                this.CityNameField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int ProvinceID
        {
            get
            {
                return this.ProvinceIDField;
            }
            set
            {
                this.ProvinceIDField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Sort
        {
            get
            {
                return this.SortField;
            }
            set
            {
                this.SortField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int Status
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
    }
    
    [System.Diagnostics.DebuggerStepThroughAttribute()]
    [System.CodeDom.Compiler.GeneratedCodeAttribute("System.Runtime.Serialization", "4.0.0.0")]
    [System.Runtime.Serialization.DataContractAttribute(Name="CityAreaInfo", Namespace="http://schemas.datacontract.org/2004/07/FFJJG.Common.UserCenter")]
    public partial class CityAreaInfo : object, System.Runtime.Serialization.IExtensibleDataObject
    {
        
        private System.Runtime.Serialization.ExtensionDataObject extensionDataField;
        
        private int AreaIDField;
        
        private string AreaNameField;
        
        private int CityIDField;
        
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
        public int AreaID
        {
            get
            {
                return this.AreaIDField;
            }
            set
            {
                this.AreaIDField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public string AreaName
        {
            get
            {
                return this.AreaNameField;
            }
            set
            {
                this.AreaNameField = value;
            }
        }
        
        [System.Runtime.Serialization.DataMemberAttribute()]
        public int CityID
        {
            get
            {
                return this.CityIDField;
            }
            set
            {
                this.CityIDField = value;
            }
        }
    }
}


[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
[System.ServiceModel.ServiceContractAttribute(ConfigurationName="IPartnerSvc")]
public interface IPartnerSvc
{
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPartnerSvc/GetPaetnerListForAwards", ReplyAction="http://tempuri.org/IPartnerSvc/GetPaetnerListForAwardsResponse")]
    FFJJG.Common.UserCenter.PartnerAwards[] GetPaetnerListForAwards(int cityID, int areaID, System.Guid userID, int pageIndex, int pageSize, string partnerName, ref System.Nullable<int> rCount);
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPartnerSvc/GetProvinceList", ReplyAction="http://tempuri.org/IPartnerSvc/GetProvinceListResponse")]
    FFJJG.Common.UserCenter.Province[] GetProvinceList();
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPartnerSvc/GetCityList", ReplyAction="http://tempuri.org/IPartnerSvc/GetCityListResponse")]
    FFJJG.Common.UserCenter.City[] GetCityList(int proviceID);
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPartnerSvc/GetAreaList", ReplyAction="http://tempuri.org/IPartnerSvc/GetAreaListResponse")]
    FFJJG.Common.UserCenter.CityAreaInfo[] GetAreaList(int cityID);
}

[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public interface IPartnerSvcChannel : IPartnerSvc, System.ServiceModel.IClientChannel
{
}

[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public partial class PartnerSvcClient : System.ServiceModel.ClientBase<IPartnerSvc>, IPartnerSvc
{
    
    public PartnerSvcClient()
    {
    }
    
    public PartnerSvcClient(string endpointConfigurationName) : 
            base(endpointConfigurationName)
    {
    }
    
    public PartnerSvcClient(string endpointConfigurationName, string remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public PartnerSvcClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public PartnerSvcClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(binding, remoteAddress)
    {
    }
    
    public FFJJG.Common.UserCenter.PartnerAwards[] GetPaetnerListForAwards(int cityID, int areaID, System.Guid userID, int pageIndex, int pageSize, string partnerName, ref System.Nullable<int> rCount)
    {
        return base.Channel.GetPaetnerListForAwards(cityID, areaID, userID, pageIndex, pageSize, partnerName, ref rCount);
    }
    
    public FFJJG.Common.UserCenter.Province[] GetProvinceList()
    {
        return base.Channel.GetProvinceList();
    }
    
    public FFJJG.Common.UserCenter.City[] GetCityList(int proviceID)
    {
        return base.Channel.GetCityList(proviceID);
    }
    
    public FFJJG.Common.UserCenter.CityAreaInfo[] GetAreaList(int cityID)
    {
        return base.Channel.GetAreaList(cityID);
    }
}
