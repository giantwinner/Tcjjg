<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AfficheDetail.aspx.cs" Inherits="Affiche_AfficheDetail" EnableSessionState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/Affiche.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/QueryString.js" type="text/javascript"></script>
    <script src="../Scripts/Affiche.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="AfficheDetailContainer">
        <div class="AfficheHead">
            新闻公告
        </div>
        <div class="ReleaseDate">
            发布时间：<asp:Label ID="ReleaseDate" runat="server" Text=""></asp:Label>
            &nbsp;&nbsp;<asp:HyperLink ID="hlreturn" NavigateUrl="~/Affiche/Affiche.aspx" Style="text-decoration: underline;"
                runat="server">返回</asp:HyperLink></div>
        <div class="AfficheTitle">
            <asp:Label ID="AfficheTitle" runat="server" Text=""></asp:Label>
        </div>
        <div class="AfficheContent">
            <asp:Literal ID="AfficheContent" runat="server"></asp:Literal>
        </div>
        <div class="Interactive">
            <asp:Panel ID="pnelComment" runat="server" Visible="false">
                <img class="zanimg" src="../Images/Default/zan.png" alt="" />
                <a class="zanbtn" onclick="Comment(1)">赞</a>&nbsp;<asp:Label CssClass="zancount"
                    ID="lblzancount" runat="server" Text="0"></asp:Label>
                <img class="caiimg" src="../Images/Default/cai.png" alt="" />
                <a class="caibtn" onclick="Comment(2)">踩</a>&nbsp;<asp:Label CssClass="caicount"
                    ID="lblcaicount" runat="server" Text="0"></asp:Label>
            </asp:Panel>
            <asp:Label ID="lblnewid" CssClass="newid" runat="server" Text="" Style="display: none;"></asp:Label>
        </div>
    </div>
    <div style="height: 70px;">
    </div>
    <script type="text/javascript">
        $(".nav-item").eq(1).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
    </script>
</asp:Content>
