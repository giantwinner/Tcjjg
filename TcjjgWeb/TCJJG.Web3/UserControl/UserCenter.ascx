<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UserCenter.ascx.cs" Inherits="UserControl_UserCenter" %>
<div class="D_Header">
    <img src="../Images/UserCenter/tcjjg_2012__uc.jpg" />&nbsp;用户中心
</div>
<div class="ascx_UCContainer">
    <br />
    <div class="P_Title">
        账号信息</div>
    <br />
    <div class="C_Title" id="UserInfo">
        <a href="../UserCenter/UserInfo.aspx">
            <img src="../Images/UserCenter/tcjjg_2012__pInfo.jpg" align="absmiddle" />&nbsp;个人资料</a></div>
    <div class="C_Title" id="UpdateUserInfo">
        <a href="../UserCenter/UpdateUserInfo.aspx">
            <img src="../Images/UserCenter/tcjjg_2012__upInfo.jpg" align="absmiddle" />&nbsp;修改资料</a></div>
    <div class="C_Title"  id="UserAmplyInfo">
        <a href="../UserCenter/UserAmplyInfo.aspx">
            <img src="../Images/UserCenter/tcjjg_2012__upHead.jpg" align="absmiddle" />&nbsp;修改头像</a></div>
    <div class="C_Title" id="UpdateUserPwd">
        <a href="<%=linkPwd %>">
            <img src="../Images/UserCenter/tcjjg_2012__uppwd.jpg" align="absmiddle" />&nbsp;修改密码</a></div>
    <div class="C_Title" id="Cryptoguard">
        <a href="<%=iframeLink %>">
            <img src="../Images/UserCenter/tcjjg_2012__proctectPwd.jpg" align="absmiddle" />&nbsp;密码保护</a></div>
    <br />
    <br />
    <br />
    <br />
    <div class="P_Title">
        财富中心</div>
    <br />
    <div class="C_Title" >
        <a href="../PayCenter/PayCenter.aspx">
            <img src="../Images/UserCenter/tcjjg_2012__charge.jpg" align="absmiddle" />&nbsp;我要充值</a></div>
    <div class="C_Title" >
        <a href="../AwardCenter/AwardCenter.aspx">
            <img src="../Images/UserCenter/tcjjg_2012__exchange.jpg" align="absmiddle" />&nbsp;我要兑奖</a></div>
    <div class="C_Title" id="UserGiveGood">
        <a href="../UserCenter/UserGiveGood.aspx">
            <img src="../Images/UserCenter/tcjjg_2012__sendfortune.jpg" align="absmiddle" />&nbsp;财富赠送</a></div>
    <div class="C_Title" id="UserReckoning">
        <a href="../UserCenter/UserReckoning.aspx">
            <img src="../Images/UserCenter/tcjjg_2012__select%20bill%20.jpg" align="absmiddle" />&nbsp;账单查询</a></div>
    <div class="C_Title" id="AwardLog">
        <a href="../UserCenter/AwardLog.aspx">
            <img src="../Images/UserCenter/tcjjg_2012__exchangeRecord.jpg" align="absmiddle" />&nbsp;兑奖记录</a></div>
    <br />
    <br />
    <br />
    <br />
    <div class="P_Title">
        消息中心</div>
    <br />
    <div class="C_Title" id="UserSeleMessage">
        <a href="../UserCenter/UserSeleMessage.aspx">
            <img src="../Images/UserCenter/tcjjg_2012__message.jpg" align="absmiddle" />&nbsp;&nbsp;短消息</a></div>
</div>
