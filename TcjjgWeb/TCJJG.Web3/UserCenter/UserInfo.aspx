<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="UserInfo.aspx.cs"
    Inherits="UserCenter_UserInfo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" class="subPage_form">
    <div class="UserCenter_Right_Layout">
        <div class="UserCenter_Right_Title">
            基本信息
        </div>
        <div class="UserInfo_Content">
            <div class="UserInfo_Content_ImgHead">
                <asp:Image ID="imgHead" runat="server" Height="94px" Width="73px" />
            </div>
            <div class="UserInfo_Content_Item" style="top: 15px; left: 110px">
                昵称：
                <asp:Label ID="lblNick" runat="server"></asp:Label>
            </div>
            <div class="UserInfo_Content_Item" style="top: 40px; left: 110px">
                等级：
                <asp:Label ID="lblLevel" runat="server"></asp:Label>
            </div>
            <div class="UserInfo_Content_Item" style="top: 65px; left: 110px">
                经验值：
                <asp:Label ID="lblExperience" runat="server"></asp:Label>
            </div>
            <div class="UserInfo_Content_Item" style="top: 90px; left: 110px">
                推广号：
                <asp:Label ID="lblSpread" runat="server"></asp:Label>
            </div>
            <div class="UserInfo_Content_Item" style="top: 15px; left: 330px">
                金币：
                <asp:Label ID="lblGold" runat="server"></asp:Label>
            </div>
            <div class="UserInfo_Content_Item" style="top: 40px; left: 330px">
                奖金券：
                <asp:Label ID="lblBonus" runat="server"></asp:Label>
            </div>
            <div class="UserInfo_BtnUpdateImg" onclick="document.location='UserAmplyInfo.aspx'">
            </div>
            <div class="UserInfo_BtnSpread" onclick="document.location='../Spread/SpreadIndex.aspx'">
            </div>
            <div class="UserInfo_BtnPay" onclick="document.location='../PayCenter/PayCenter.aspx'">
            </div>
            <div class="UserInfo_BtnAward" onclick="document.location='../AwardCenter/AwardCenter.aspx'">
            </div>
            <div class="UserInfo_BtnUpdateInfo">
            </div>
        </div>
        <div class="UserInfo_Detail">
            <div class="UserInfo_Detail_Title">
                个人资料</div>
            <div>
                姓名：<asp:Label ID="lblName" runat="server"></asp:Label>
            </div>
            <div>
                性别：<asp:Label ID="lblGender" runat="server"></asp:Label>
            </div>
            <div>
                职业：<asp:Label ID="lblJob" runat="server"></asp:Label>
            </div>
            <div>
                生日：<asp:Label ID="lblBirthday" runat="server"></asp:Label>
            </div>
            <div>
                电话：<asp:Label ID="lblMovePhone" runat="server"></asp:Label>
            </div>
            <br />
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="UpdateUserInfo.aspx" Target="frameMain">
            <div class="btnChangeUserInfo"></div>
            </asp:HyperLink>
        </div>
    </div>
    </form>
</body>
</html>
