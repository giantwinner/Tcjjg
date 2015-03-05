<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Poker.aspx.cs" Inherits="Poker"
    MasterPageFile="MasterPage.master"  %>
     

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="Css/Poker.css" rel="stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="Poker">
        <asp:Panel ID="panelUserInfo" runat="server" Visible="false">
          <div class="WelcomeInfo">
            欢迎
            <asp:Label ID="lblWelcomeUser" class="UserName" runat="server" Text="--"></asp:Label>
            访问同城竞技馆！请设置您的信息。
        </div>
        <br /><br />
            用户名称：
            <asp:TextBox class="TextBox" ID="txtUserName" runat="server" Enabled="False"></asp:TextBox>
            <br />
            <br />
            <asp:Panel ID="panelPwd" runat="server">
                登陆密码：
                <asp:TextBox class="TextBox" ID="txtPwd1" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                确认密码：
                <asp:TextBox class="TextBox" ID="txtPwd2" runat="server" TextMode="Password"></asp:TextBox>
            </asp:Panel>
            <br />
            <div class="IdentityInfo">为保证您的账号安全以及能够顺利领取在同城竞技馆获得的奖品，请如实填写您的有效身份证件信息，本次填写完成后，以后将不需要再填写。</div>
            <br />
            真实姓名：
            <asp:TextBox class="TextBox" ID="txtRealName" runat="server"></asp:TextBox>
            <br />
            <br />
            身份证号：
            <asp:TextBox class="TextBox" ID="txtIdentity" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:ImageButton ID="btnOK" runat="server" class="Btn" OnClick="btnOK_Click" 
                ImageUrl="~/Images/UserCenter/tcjjg_2012__UpdatePwd.jpg" />
            <br />
            <asp:Label ID="lblMsg" runat="server" ForeColor="Red"></asp:Label>
        </asp:Panel>
        <asp:Label ID="lblError" class="Error" runat="server" ></asp:Label>
    </div>
</asp:Content>
