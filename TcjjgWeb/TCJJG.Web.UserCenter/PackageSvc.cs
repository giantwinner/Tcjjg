﻿//------------------------------------------------------------------------------
// <auto-generated>
//     此代码由工具生成。
//     运行时版本:4.0.30319.1008
//
//     对此文件的更改可能会导致不正确的行为，并且如果
//     重新生成代码，这些更改将会丢失。
// </auto-generated>
//------------------------------------------------------------------------------



[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
[System.ServiceModel.ServiceContractAttribute(ConfigurationName="IPackageSvc")]
public interface IPackageSvc
{
    
    [System.ServiceModel.OperationContractAttribute(Action="http://tempuri.org/IPackageSvc/GivePackageForUser", ReplyAction="http://tempuri.org/IPackageSvc/GivePackageForUserResponse")]
    bool GivePackageForUser(System.Guid userID, int packageID, int amount);
}

[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public interface IPackageSvcChannel : IPackageSvc, System.ServiceModel.IClientChannel
{
}

[System.Diagnostics.DebuggerStepThroughAttribute()]
[System.CodeDom.Compiler.GeneratedCodeAttribute("System.ServiceModel", "4.0.0.0")]
public partial class PackageSvcClient : System.ServiceModel.ClientBase<IPackageSvc>, IPackageSvc
{
    
    public PackageSvcClient()
    {
    }
    
    public PackageSvcClient(string endpointConfigurationName) : 
            base(endpointConfigurationName)
    {
    }
    
    public PackageSvcClient(string endpointConfigurationName, string remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public PackageSvcClient(string endpointConfigurationName, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(endpointConfigurationName, remoteAddress)
    {
    }
    
    public PackageSvcClient(System.ServiceModel.Channels.Binding binding, System.ServiceModel.EndpointAddress remoteAddress) : 
            base(binding, remoteAddress)
    {
    }
    
    public bool GivePackageForUser(System.Guid userID, int packageID, int amount)
    {
        return base.Channel.GivePackageForUser(userID, packageID, amount);
    }
}
