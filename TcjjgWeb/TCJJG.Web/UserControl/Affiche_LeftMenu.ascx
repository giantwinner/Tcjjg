<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Affiche_LeftMenu.ascx.cs"
    Inherits="UserControl_Affiche_LeftMenu" %>
<script src="/Scripts/changeNavStyle.js" type="text/javascript"></script>
<div id="uc-nav-wrap">
    <div class="uc-nav-l">
        <img src="../Images/UserCenter/uc-nav-l.png" alt="" />
    </div>
    <div class="uc-nav-m">
        <a href="/Affiche/Affiche.aspx" class="uc-nav-item">
            <img src="../Images/UserCenter/navsys2.png" alt="" /><span>系统公告</span> </a>
        <a href="/Affiche/VersionLog.aspx" class="uc-nav-item">
            <img src="../Images/UserCenter/navhj2.png" alt="" /><span>版本说明</span> </a>
                    <a href="/Affiche/Interactive.aspx" class="uc-nav-item">
            <img src="../Images/UserCenter/nvit2.png" alt="" /><span>玩家互动</span> </a>
        <div class="linkToUs">
            <div class="linkToUs-item">
                <a href="http://wpa.qq.com/msgrd?v=3&uin=1793878267&site=qq&menu=yes" target="_blank">
                    <img src="../Images/UserCenter/kfqq.png" alt="" />&nbsp;客服QQ:1793878267</a>
            </div>
            <div class="linkToUs-item">
                <img src="../Images/UserCenter/qqqun.png" alt="" />&nbsp;同城玩家交流群
            </div>
            <div class="linkToUs-item">
                <img src="../Images/UserCenter/linkphone.png" alt="" />&nbsp;<span class="linkToUs-phone">4007706700</span>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">
    $(".uc-nav-m a").click(function () {
        $(this).addClass("hover");
    });
</script>
