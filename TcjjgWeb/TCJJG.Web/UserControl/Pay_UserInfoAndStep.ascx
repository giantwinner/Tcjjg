<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Pay_UserInfoAndStep.ascx.cs"
    Inherits="UserControl_Pay_UserInfoAndStep" %>
<div id="uc-userinfo-wrap">
    <div class="uc-userinfo-l">
        <img src="../Images/UserCenter/uc-userinfo-l.png" alt="" />
    </div>
    <div class="uc-userinfo-m">
        <img class="uc-headimg" src="#" alt="" id="imgHead" runat="server" />
                    <asp:Image class="uc-role" ID="imgRole" Visible="false" runat="server" ImageUrl="~/Images/UserCenter/role.png" />

        <a class="uc-updatelinkbtn" href="/UserCenter/UpdateUserInfo.aspx">修改资料</a> <span
            class="userCity">
            <asp:Label ID="lblCity" runat="server" Text=""></asp:Label></span>
        <asp:Label ID="lblNickName" runat="server" Text="" CssClass="lblNickName"></asp:Label>
        <asp:Image ID="imgGender" runat="server" CssClass="img-gender" ImageUrl="~/Images/UserCenter/gender-male.png" />
        <div class="rank-wrap">
            <span class="accountName accountRank">等级</span><asp:Label ID="lblRankValue" runat="server"
                Text="0" CssClass="accountValue lblRankValue"></asp:Label>
            <span class="rankBar" style="width: <%=r %>"></span>
            <img class="account-r rank-img-r" src="../Images/UserCenter/rank-img-r.png" alt="" />
            <span class="accountName accountYB">元宝</span><asp:Label ID="lblYBValue" runat="server"
                Text="0" CssClass="accountValue lblYBValue"></asp:Label><a href="/PayCenter/PayCenter.aspx"
                    class="account-r uc-link-btn charge-link">充值</a> <span class="accountName accountGold">
                        金币</span><asp:Label ID="lblGoldValue" runat="server" Text="0" CssClass="accountValue lblGoldValue"></asp:Label><a
                            href="/Spread/SpreadIndex.aspx" class="account-r uc-link-btn Spread-link">推广</a>
        </div>
        <img src="../Images/UserCenter/uc-userinfo-split.png" alt="" class="uc-userinfo-split" />
        <div class="pay-step-wrap">
            <img class="pay-step1" src="../Images/PayCenter/pay-step-1-d.png" alt="" /><img class="step-arrow"
                src="../Images/PayCenter/step-arrow.png" alt="" /><img class="pay-step2" src="../Images/PayCenter/pay-step-2-c.png"
                    alt="" /><img class="step-arrow" src="../Images/PayCenter/step-arrow.png" alt="" /><img
                        class="pay-step3" src="../Images/PayCenter/pay-step-3-d.png" alt="" />
        </div>
    </div>
    <div class="uc-userinfo-r">
        <img src="../Images/UserCenter/uc-userinfo-r.png" alt="" />
    </div>
    <asp:Label ID="lblRankBarWith" runat="server" Text="" Style="display: none"></asp:Label>
</div>
