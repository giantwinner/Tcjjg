<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Test.aspx.cs" Inherits="Test" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div style="position: relative;  font-family: 微软雅黑; font-size: 12px;">
    <div style="width: 200px; height: 720px; background-color: #99CCFF; position: absolute; top: 0px; left: 0px; padding-left: 20px;"  >
        <br />
        <asp:Label ID="Label1" runat="server" Text="账号"></asp:Label>
        &nbsp;
        <asp:TextBox ID="txtID" runat="server" Width="100px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label2" runat="server" Text="密码"></asp:Label>
        &nbsp;
        <asp:TextBox ID="txtPwd" runat="server" TextMode="Password" Width="100px"></asp:TextBox>
        <br />
        <br />
        <asp:Label ID="Label3" runat="server" Text="昵称"></asp:Label>
        &nbsp;
        <asp:TextBox ID="txtName" runat="server" Width="100px"></asp:TextBox>
        <br />
        <br />
        密钥1
        <asp:TextBox ID="txtKeyNum" runat="server" Width="100px">15000</asp:TextBox>
        <br />
        <br />
        密钥2
        <asp:TextBox ID="txtKeyName" runat="server" Width="100px">adsgdesd</asp:TextBox>
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="嵌入TCJJG游戏"
            Width="150px" Height="30px" />
        &nbsp;<br />
        &nbsp;&nbsp;&nbsp;
        <br />
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="跳转到TCJJG游戏"
            Height="30px" Width="150px" />
    </div>
    <div style="position: absolute; left: 200px">
        <iframe id="frameMain" runat="server" width="1200px" height="720"></iframe>
    </div>
    </div>
    </form>
</body>
</html>
