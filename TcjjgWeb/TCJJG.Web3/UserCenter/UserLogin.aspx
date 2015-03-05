<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserLogin.aspx.cs" Inherits="UserCenter_UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/UserLogin.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/Silverlight.js" type="text/javascript"></script>
    <script src="../Js/common.js" type="text/javascript"></script>
    <script src="../Js/CreateXMLHttpRequest.js" type="text/javascript"></script>
    <script src="../Js/ChangeCode.js" type="text/javascript"></script>
    <script type="text/javascript">
        if (window != top)
            top.location.href = location.href;

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_UserLoginContainer">
        <div class="D_UserLoginTitle">
            用户登录
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <div class="InsertContainer">
            用户账号：<asp:TextBox ID="txtUserName" runat="server" CssClass="TextBox"></asp:TextBox>&nbsp;&nbsp;<asp:Label
                ID="Label1" runat="server" Text="" class="LoginMsg" ForeColor="Red"></asp:Label>
        </div>
        <div class="InsertContainer">
            <span style="visibility: hidden;">空空</span>密码：<asp:TextBox ID="txtPsw" runat="server"
                CssClass="TextBox" TextMode="Password"></asp:TextBox>&nbsp;&nbsp;<asp:Label ID="Label2"
                    runat="server" Text="" class="LoginMsg" ForeColor="Red"></asp:Label>
        </div>
        <div class="InsertContainer" runat="server" id="divViliCode" visible="false">
            <span style="visibility: hidden;">空</span>验证码：<asp:TextBox ID="txtVli" runat="server"
                CssClass="TextBox" MaxLength="4"></asp:TextBox>
            <img id="imgCode" class="txtCode" alt="看不清？点击更换" src="/Index/ValidateCode.aspx" onclick="ChangeCode();" />
            <asp:Label ID="Label3" runat="server" Text="" class="LoginMsg" ForeColor="Red"></asp:Label>
        </div>
        <asp:CheckBox ID="RememberMe" runat="server" CssClass="CheckRememberMe" />&nbsp;<span
            class="RememberMe">记住账号</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="FindPassWord.aspx"
                class="FindPwd">忘记密码</a>
        <br />
        <br />
        <asp:ImageButton ID="BtnLogin" runat="server" ImageUrl="~/Images/UserCenter/tcjjg_2012__LoginOK.jpg"
            OnClick="BtnLogin_Click" CssClass="CheckRememberMe" />&nbsp;<a href="UserReg.aspx"
                class="RegUrl">我要注册</a>
    </div>
</asp:Content>
