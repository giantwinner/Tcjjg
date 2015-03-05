<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="WinGoldMatch.aspx.cs" Inherits="Match_WinGoldMatch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/Match.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="MatchContainer">
        <div class="TopImg">
            <img src="../Images/Match/WinGold.jpg" />
        </div>
        <div class="MidIntro">
            一个专门赢取金币的精彩赛事，每场都有20000金币的丰厚奖励<br />
            夺金赛每天2场，分别为<br />
            下午16:30和晚上22:30<br />
            报名条件:200金币<br />
            <br />
            赛事相关信息请详见赛事平台<br />
        </div>
        <br />
        <a href="#" class="BtnTakeInMatch"></a>
        <br /><br /><br />
    </div>
</asp:Content>
