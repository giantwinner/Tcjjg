<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserLogin.aspx.cs" Inherits="UserCenter_UserLogin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/common.js" type="text/javascript"></script>
    <script src="/Scripts/CreateXMLHttpRequest.js" type="text/javascript"></script>
    <script src="/Scripts/ChangeCode.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#ctl00_ContentPlaceHolder1_txtUserName").focus();
            $("#ctl00_pnelfirst").css("display", "none");
            $("#beginGame").css("display", "none");
            //回车登录
            $(document).keydown(function (event) {
                if (event.keyCode == 13) {
                    $("#ctl00_ContentPlaceHolder1_BtnLogin").click();
                }
            });
        })

    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="uc-login-wrap">
        <div class="uc-login-title bigFont">
            请先登录：
        </div>
        <div class="uc-login-input-left">
            <div class="bigFont">
                账<span style="visibility: hidden">空</span>号：</div>
            <div class="bigFont">
                密<span style="visibility: hidden">空</span>码：</div>
            <div class="bigFont">
                验证码：</div>
        </div>
        <div class="uc-login-input">
            <asp:TextBox ID="txtUserName" Height="23" Width="178" runat="server" CssClass="TextBox logintxtUserName"></asp:TextBox>
            <asp:TextBox ID="txtPsw" Height="23" Width="178" runat="server" CssClass="TextBox logintxtPsw" TextMode="Password"></asp:TextBox>
            <asp:TextBox ID="txtVli" Height="23" Width="110" runat="server" CssClass="TextBox logintxtVli" MaxLength="4"></asp:TextBox>
        </div>
        <div class="uc-login-msg">
            <asp:Label ID="Label1" runat="server" Text="" class="LoginMsg" ForeColor="Red"></asp:Label>
            <asp:Label ID="Label2" runat="server" Text="" class="LoginMsg" ForeColor="Red"></asp:Label>
            <asp:Label ID="Label3" runat="server" Text="" class="LoginMsg" ForeColor="Red"></asp:Label>
        </div>
        <a class="findpwd" href="/UserCenter/FindPassWord.aspx">忘记密码? </a>
        <img id="imgCode" style="top: 93px; left: 245px;" class="txtCode" alt="看不清？点击更换"
            src="/UserCenter/ValidateCode.aspx" onclick="ChangeCode();" />
  
<%--        <asp:LinkButton ID="BtnLogin" CssClass="LoginBtn" runat="server" OnClick="BtnLogin_Click"></asp:LinkButton>--%>
        <asp:ImageButton ID="BtnLogin" CssClass="LoginBtn" OnClick="BtnLogin_Click" ImageUrl="~/Images/UserCenter/btnLogin-1.png" runat="server" />
        <a href="/UserCenter/UserReg-BaseInfo.aspx" class="LinkToReg"></a>
        <asp:CheckBox ID="RememberMe" runat="server" CssClass="CheckRememberMe" Text="记住账号" />
    </div>
                <script type="text/javascript">
                    $(".nav-item").eq(2).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
    </script>
</asp:Content>
