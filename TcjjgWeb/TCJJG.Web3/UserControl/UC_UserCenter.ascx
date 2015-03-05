<%@ Control Language="C#" AutoEventWireup="true" CodeFile="UC_UserCenter.ascx.cs"
    Inherits="UserControl_UC_UserCenterl" %>
<div class="userCenter_Left_Nav" id="userCenter_Left_Nav">
    <%--账号信息--%>
    <div class="userCenter_Left_Nav_Title">
        账号信息
    </div>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../UserCenter/Default.aspx'">
        <img alt="" src="../Images/SubPage/tcjjg_2012__pInfo.jpg" class="userCenter_Left_Nav_Item_Img" />
        个人资料
    </div>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../UserCenter/UpdateUserInfo.aspx'">
        <img alt="" src="../Images/SubPage/tcjjg_2012__upInfo.jpg" class="userCenter_Left_Nav_Item_Img" />
        修改资料
    </div>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../UserCenter/UserAmplyInfo.aspx'">
        <img alt="" src="../Images/SubPage/tcjjg_2012__upHead.jpg" class="userCenter_Left_Nav_Item_Img" />
        修改头像
    </div>
    <%--账号安全--%>
    <div class="userCenter_Left_Nav_Title">
        账号安全
    </div>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../UserCenter/PasswordChange.aspx'">
        <img alt="" src="../Images/SubPage/tcjjg_2012__uppwd.jpg" class="userCenter_Left_Nav_Item_Img" />
        修改密码
    </div>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../UserCenter/PasswordProtect.aspx'">
        <img alt="" src="../Images/SubPage/tcjjg_2012__proctectPwd.jpg" class="userCenter_Left_Nav_Item_Img" />
        密码保护
    </div>
    <%--财富中心--%>
    <div class="userCenter_Left_Nav_Title">
        财富中心
    </div>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../UserCenter/PersonalAward.aspx'">
        <img alt="" src="../Images/SubPage/nav_myaward.jpg" class="userCenter_Left_Nav_Item_Img" />
        我的物品
    </div>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../PayCenter/PayCenter.aspx'">
        <img alt="" src="../Images/SubPage/tcjjg_2012__charge.jpg" class="userCenter_Left_Nav_Item_Img" />
        我要充值
    </div>
    <%--2012-10-18--%>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../UserCenter/ChangeGoldCoins.aspx'">
        <img alt="" src="../Images/SubPage/dh_left.jpg" class="userCenter_Left_Nav_Item_Img" />
        兑换金币
    </div>
    <%--2012-10-18--%>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../AwardCenter/AwardList.aspx'">
        <img alt="" src="../Images/SubPage/tcjjg_2012__exchange.jpg" class="userCenter_Left_Nav_Item_Img" />
        我要兑奖
    </div>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../UserCenter/GiveRiches.aspx'">
        <img alt="" src="../Images/SubPage/tcjjg_2012__sendfortune.jpg" class="userCenter_Left_Nav_Item_Img" />
        财富赠送
    </div>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../UserCenter/UserReckoning.aspx'">
        <img alt="" src="../Images/SubPage/tcjjg_2012__selectbill.jpg" class="userCenter_Left_Nav_Item_Img" />
        账单查询
    </div>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../AwardCenter/MatchAwardList.aspx'">
        <img alt="" src="../Images/SubPage/GetAward.jpg" class="userCenter_Left_Nav_Item_Img" />
        实物获奖
    </div>
    <%--    <div class="userCenter_Left_Nav_Item" onclick="document.location='../UserCenter/AwardLog.aspx'">
        <img alt="" src="../Images/SubPage/tcjjg_2012__exchangeRecord.jpg" class="userCenter_Left_Nav_Item_Img" />
        兑奖记录
    </div>--%>
    <%--消息中心--%>
    <div class="userCenter_Left_Nav_Title">
        消息中心
    </div>
    <div class="userCenter_Left_Nav_Item" onclick="document.location='../UserCenter/UserSeleMessage.aspx'">
        <img alt="" src="../Images/SubPage/tcjjg_2012__ShortMessage.jpg" class="userCenter_Left_Nav_Item_Img"
            style="margin-top: 2px" />
        短消息
    </div>
</div>
