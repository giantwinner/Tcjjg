<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_LeftNav.ascx.cs" Inherits="UserControl_UC_LeftNav" %>
<script src="/Scripts/changeNavStyle.js" type="text/javascript"></script>
<div id="uc-nav-wrap">
    <div class="uc-nav-l">
        <img src="../Images/UserCenter/uc-nav-l.png" alt="" />
    </div>
    <div class="uc-nav-m">
<%--        <a href="/UserCenter/PersonalAward.aspx" class="uc-nav-item">
            <img src="/Images/UserCenter/navmygoods2.png" alt="" /><span>我的物品</span> </a>--%>
            <a href="/UserCenter/UpdateUserInfo.aspx"
                class="uc-nav-item">
                <img src="/Images/UserCenter/navupdateinfo2.png" alt="" /><span>修改资料</span> </a>
        <a href="/UserCenter/UpdateHeadPortrait.aspx" class="uc-nav-item">
            <img src="/Images/UserCenter/navhead2.png" alt="" /><span>修改头像</span> </a><a href="/UserCenter/BindMail.aspx"
                class="uc-nav-item">
                <img src="/Images/UserCenter/navhonour2.png" alt="" /><span>绑定邮箱</span> </a>
                <a href="/UserCenter/BindMovePhone.aspx"
                class="uc-nav-item">
                <img src="/Images/UserCenter/navmovephone2.png" alt="" /><span>绑定手机</span> </a>
        <a href="/UserCenter/UserBill.aspx" class="uc-nav-item">
            <img src="/Images/UserCenter/navbill2.png" alt="" /><span>账单查询</span> </a><a href="/UserCenter/UserSeleMessage.aspx"
                class="uc-nav-item">
                <img src="/Images/UserCenter/navmsg2.png" alt="" /><span>消息中心</span> </a>
        <a href="/UserCenter/AccountNumberSafe.aspx" class="uc-nav-item">
            <img src="/Images/UserCenter/navsafe2.png" alt="" /><span>账号安全</span> </a><a href="/UserCenter/RealNameAuthentication.aspx"
                class="uc-nav-item">
                <img src="/Images/UserCenter/navreal2.png" alt="" /><span>实名认证</span> </a>
        <div class="linkToUs">
            <div class="linkToUs-item">
                <a href="http://wpa.qq.com/msgrd?v=3&uin=1793878267&site=qq&menu=yes" target="_blank">
                    <img src="/Images/UserCenter/kfqq.png" alt="" />&nbsp;客服QQ:1793878267</a>
            </div>
            <div class="linkToUs-item">
                <img src="/Images/UserCenter/qqqun.png" alt="" />&nbsp;同城玩家交流群
            </div>
            <div class="linkToUs-item">
                <img src="/Images/UserCenter/linkphone.png" alt="" />&nbsp;<span class="linkToUs-phone">4007706700</span>
            </div>
        </div>
    </div>
</div>
