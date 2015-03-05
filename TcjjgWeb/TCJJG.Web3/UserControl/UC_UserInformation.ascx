<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_UserInformation.ascx.cs"
    Inherits="UserControl_UC_UserInformation" %>
<div class="subPage_Left_UserInfo">
    <div class="subPage_Left_UserInfo_Title">
        信息中心
    </div>
    <div class="subPage_Left_UserInfo_Img">
        <asp:Image ID="imgUserHead" runat="server" Height="93px" Width="74px" />
    </div>
    <div class="subPage_Left_UserInfo_NickName">
        昵<span style="visibility: hidden">一</span>称：
        <asp:Label ID="lblNickName" runat="server"></asp:Label>
    </div>
    <div class="subPage_Left_UserInfo_YuanBao">
        元<span style="visibility: hidden">一</span>宝：
        <asp:Label ID="lblYuanBao" runat="server"></asp:Label>
    </div>
    <div class="subPage_Left_UserInfo_Gold">
        金<span style="visibility: hidden">一</span>币：
        <asp:Label ID="lblGold" runat="server"></asp:Label>
    </div>
    <%--    <div class="subPage_Left_UserInfo_Bonus">
        奖金券:
        <asp:Label ID="lblBonus" runat="server" ></asp:Label>
    </div>--%>
    <%--    <a href="../UserCenter/PersonalAward.aspx" class="UC_PersonalAward"><img src="../Images/Default/Default_MyGoods.jpg" /></a>
    <a href="../Sales/SalesInfo.aspx" class="UC_SalesInfo"><img src="../Images/Default/Default_GoodsHall.jpg" /></a>--%>
</div>
