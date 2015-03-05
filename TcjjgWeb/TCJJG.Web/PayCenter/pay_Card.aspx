<%@ Page Language="C#" AutoEventWireup="true" CodeFile="pay_Card.aspx.cs" Inherits="PayCenter_pay_Card" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/PayCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/ChangeCode.js" type="text/javascript"></script>
    <title></title>
</head>
<body style="font-family: 微软雅黑;">
    <form id="form1" runat="server" defaultfocus="txtCardPsw">
    <div class="pay_Card">
        <div class="pay_Card_Text">
            充值账号：
        </div>
        <asp:TextBox ID="txtUserID1" runat="server" CssClass="pay_Card_TxtBox" Enabled="false"
            ReadOnly="true" Font-Bold="true"></asp:TextBox>
        <br />
        <div class="pay_Card_Text">
            点卡密码：
        </div>
        <asp:TextBox ID="txtCardPsw" runat="server" CssClass="pay_Card_TxtBox"></asp:TextBox>
        <br />
        <div class="pay_Card_Text">
            验证码：
        </div>
        <div class="pay_Card_DIV">
            <asp:TextBox ID="txtVli" runat="server" CssClass="pay_Card_Vli" MaxLength="4">
            </asp:TextBox>&nbsp;<img id="imgCode" class="pay_Card_Vli_Img" style="top: 9px;*top:4px;" alt="看不清？点击更换" src="/UserCenter/ValidateCode.aspx"
                onclick="ChangeCode();" />
        </div>
        <div class="pay_Card_Btn">
                    <asp:ImageButton ID="btnCharge" runat="server"  OnClick="btnCharge_Click" ImageUrl="~/Images/BtnImg/enter1.png" />
<%--            <asp:LinkButton ID="btnCharge" CssClass="savebtn" runat="server" 
                onclick="btnCharge_Click">确定</asp:LinkButton>--%>
            <asp:Label ID="labMsg" runat="server" Font-Bold="true" CssClass="payCard_Msg"></asp:Label>
        </div>
        <br />
        <div class="payItem_prompt" style="width: 375px;">
            注：充值10元，可获得100元宝(可兑换10000金币)<br />
            <span style="visibility: hidden">注：</span>充值20元，可获得200元宝(可兑换20000金币)<br />
            <span style="visibility: hidden">注：</span>充值50元，可获得500元宝(可兑换50000金币)
        </div>
    </div>
    </form>
</body>
</html>
