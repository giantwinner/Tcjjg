<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_UserInfo.ascx.cs" Inherits="UserControl_UC_UserInfo" %>
<div id="uc-userinfo-wrap">
    <div class="uc-userinfo-l">
        <img src="../Images/UserCenter/uc-userinfo-l.png" alt="" />
    </div>
    <div class="uc-userinfo-m">
        <asp:Panel ID="pnelUserInfo" runat="server">
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
        </asp:Panel>
        <img src="../Images/UserCenter/uc-userinfo-split.png" alt="" class="uc-userinfo-split" />
        <div class="dataDetect-wrap">
            <div class="dataDetect-top">
                <span class="dataDetect-top-lefttext">资料完善度:</span>
                <div class="dataDetect-img-wrap">
                    <img alt="" src="../Images/UserCenter/dataDetect-l.png" class="dataDetect-img" /><div
                        class="dataDetect-img-m dataDetect-img">
                    </div>
                    <img src="../Images/UserCenter/dataDetect-r.png" alt="" class="dataDetect-img" />
                </div>
                <div class="dataDetect-exists" style="background-color: Red">
                    <img class="dataDetect-img-exists" src="/Images/UserCenter/dataDetect-m-exists.png"
                        width="0" height="19" />
                </div>
                <span class="dataDetect-top-righttext"><span id="DetectScore" style="color: Red">0</span>分</span>
                <a class="dataDetectBtn" runat="server">重新检测</a>
            </div>
            <div class="dataDetect-middle">
                <span>建议您进行如下操作:</span>
            </div>
            <div class="dataDetect-bottom" id="uc-info-phone">
                <div>
                    <span style="color: Red">绑定手机</span><span>&nbsp;&nbsp;&nbsp;绑定手机不仅可以保护帐号安全，还可以立即获得100金币！</span>
                </div>
                <a href="/UserCenter/BindMovePhone.aspx" class="bindPhoneBtn">立即绑定</a>
            </div>
            <div class="dataDetect-bottom" id="uc-info-realname">
                <div>
                    <span style="color: Red">填写姓名</span><span>&nbsp;&nbsp;&nbsp;填写姓名可以更便利的结识更多好友哦！</span>
                </div>
                <a href="/UserCenter/RealNameAuthentication.aspx" class="bindPhoneBtn">立即填写</a>
            </div>
            <%--            <div class="dataDetect-bottom" id="uc-info-address">
                <div>
                    <span style="color: Red">填写居住地</span><span>&nbsp;&nbsp;&nbsp;填写居住地可以更便利的结识更多好友！</span>
                </div>
                <a href="#" class="bindPhoneBtn">立即填写</a>
            </div>--%>
            <div class="dataDetect-bottom" id="uc-info-idcard">
                <div>
                    <span style="color: Red">绑定身份证</span><span>&nbsp;&nbsp;&nbsp; 绑定身份证保护账号安全，实名领取大奖不错过！</span>
                </div>
                <a href="/UserCenter/RealNameAuthentication.aspx" class="bindPhoneBtn">立即绑定</a>
            </div>
            <div class="dataDetect-bottom" id="uc-info-pwdpro">
                <div>
                    <span style="color: Red">设置密保问题 </span><span>&nbsp;&nbsp;&nbsp;账号安全不容忽视，设置密保问题保护账号安全！</span>
                </div>
                <a href="/UserCenter/AccountNumberSafe.aspx" class="bindPhoneBtn">立即设置</a>
            </div>
            <div class="dataDetect-bottom" id="uc-info-bindmail">
                <div>
                    <span style="color: Red">绑定邮箱</span><span>&nbsp;&nbsp;&nbsp;绑定邮箱保护账号安全，并立即获赠50游戏币！</span>
                </div>
                <a href="/UserCenter/BindMail.aspx" class="bindPhoneBtn">立即绑定</a>
            </div>
            <div class="dataDetect-bottom" id="uc-info-birthday    ">
                <div>
                    <span style="color: Red">填写生日</span><span>&nbsp;&nbsp;&nbsp;填写生日可以更便利的结识更多好友哦！</span>
                </div>
                <a href="/UserCenter/UpdateUserInfo.aspx" class="bindPhoneBtn">立即填写</a>
            </div>
            <div class="dataDetect-bottom" id="uc-info-job">
                <div>
                    <span style="color: Red">填写职业</span><span>&nbsp;&nbsp;&nbsp;填写职业可以更便利的结识更多好友哦！</span>
                </div>
                <a href="/UserCenter/UpdateUserInfo.aspx" class="bindPhoneBtn">立即填写</a>
            </div>
        </div>
    </div>
    <div class="uc-userinfo-r">
        <img src="../Images/UserCenter/uc-userinfo-r.png" alt="" />
    </div>
    <asp:Label ID="lblRankBarWith" runat="server" Text="" Style="display: none"></asp:Label>
</div>
<script type="text/javascript">
    $(function () {
        DefaultDetectReqest();
        $(".dataDetectBtn").click(DetectReqest);
    })
    function DefaultDetectReqest() {
        $.post("/Ajax/Ajax_DetectSocre.aspx", function (data) {
            var detect = data.split(",")[1] + "px";
            $("#DetectScore").html(data.split(",")[0]);
            $(".dataDetect-exists img").animate({ "width": detect }, 0);
            if (data.split(",")[0] < 100) {
                if (data.split(",")[2].length > 0) {
                    ExileInfo(data.split(",")[2]);
                }
            } else {
                $(".dataDetect-middle").css("display", "none");
            }
        });
    }
    function DetectReqest() {
        $.post("/Ajax/Ajax_DetectSocre.aspx", function (data) {
            var detect = data.split(",")[1] + "px";
            $("#DetectScore").html(data.split(",")[0]);
            $(".dataDetect-exists img").animate({ "width": "0px" }, 0);
            $(".dataDetect-exists img").animate({ "width": detect }, 2000);
        });
    }
    function ExileInfo(id) {
        $("#" + id).css("display", "block");
    }
</script>
