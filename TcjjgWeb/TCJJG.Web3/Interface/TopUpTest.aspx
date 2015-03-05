<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TopUpTest.aspx.cs" Inherits="Interface_TopUpTest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <br />
        用户名：<span style="visibility: hidden">空</span><asp:TextBox ID="txtUserName" runat="server"></asp:TextBox>
        <br />
        <br />
        订单号：<span style="visibility: hidden">空</span><asp:TextBox ID="txtOrder" runat="server"></asp:TextBox>
        <br />
        <br />
        充值数量：<asp:TextBox ID="txtAmount" runat="server">100</asp:TextBox>
        <br />
        <br />
        
        数字密钥：<asp:TextBox ID="txtKeyNum" runat="server">15000</asp:TextBox>
        <br />
        <br />
        字符密钥：<asp:TextBox ID="txtKeyName" runat="server">adsgdesd</asp:TextBox>
        <br />
        <br />
        <asp:Button ID="btnOK" runat="server" Text="充值" onclick="btnOK_Click" 
            Width="80px" />
    </div>
    </form>
</body>
</html>
