<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AfficheDetail.aspx.cs" Inherits="Affiche_AfficheDetail" enableSessionState="true" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/Affiche.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="AfficheDetailContainer">
        <div class="AfficheHead">
            新闻公告
        </div>
        <div class="ReleaseDate">
            发布时间：<asp:Label ID="ReleaseDate" runat="server" Text=""></asp:Label>
            &nbsp;&nbsp;<a href="javascript:history.go(-1);">返回</a></div>
        <div class="AfficheTitle">
            <asp:Label ID="AfficheTitle" runat="server" Text=""></asp:Label>
        </div>
        <div class="AfficheContent">
            <asp:Literal ID="AfficheContent" runat="server"></asp:Literal>
        </div>
    </div>
</asp:Content>
