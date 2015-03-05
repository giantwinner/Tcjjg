<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="BarLeague.aspx.cs" Inherits="Match_BarLeague" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Css/Match.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="MatchContainer">
        <div class="TopImg">
            <img src="../Images/Match/BarLeague.jpg" />
        </div>
        <div class="MidIntro">
            高额的奖金，持续的火暴！<br />
            网吧联赛每天共6场，从中午13:15至晚上23:15 每2小时一场<br />
           每场奖金高达千元<br />
            <br />
            玩家需在赛事指定合作网吧进行报名参赛（合作网吧名单详见平台公告）<br />
            <br />
            <span class="Notice">注：独立开设网吧联赛的城市，相关信息详见平台公告</span>
             <br />
        </div>
         <br />
        <br />
        <a href="#" class="BtnTakeInMatch"></a>
        <br /><br /><br />
    </div>
</asp:Content>

