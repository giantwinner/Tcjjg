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
            ��ӭ
            <asp:Label ID="lblWelcomeUser" class="UserName" runat="server" Text="--"></asp:Label>
            ����ͬ�Ǿ����ݣ�������������Ϣ��
        </div>
        <br /><br />
            �û����ƣ�
            <asp:TextBox class="TextBox" ID="txtUserName" runat="server" Enabled="False"></asp:TextBox>
            <br />
            <br />
            <asp:Panel ID="panelPwd" runat="server">
                ��½���룺
                <asp:TextBox class="TextBox" ID="txtPwd1" runat="server" TextMode="Password"></asp:TextBox>
                <br />
                <br />
                ȷ�����룺
                <asp:TextBox class="TextBox" ID="txtPwd2" runat="server" TextMode="Password"></asp:TextBox>
            </asp:Panel>
            <br />
            <div class="IdentityInfo">Ϊ��֤�����˺Ű�ȫ�Լ��ܹ�˳����ȡ��ͬ�Ǿ����ݻ�õĽ�Ʒ������ʵ��д������Ч���֤����Ϣ��������д��ɺ��Ժ󽫲���Ҫ����д��</div>
            <br />
            ��ʵ������
            <asp:TextBox class="TextBox" ID="txtRealName" runat="server"></asp:TextBox>
            <br />
            <br />
            ���֤�ţ�
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
