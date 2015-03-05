﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MessageRecharge.aspx.cs"
    Inherits="PayCenter_MessageRecharge" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/PayCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server" class="subPage_form">
    <div id="phoneRecharge" class="phoneRecharge">
        <div class="phoneRechargeRB">
            <%--<asp:RadioButton ID="vPayRMB5" runat="server" Text="充值5元，可获得250金币" GroupName="vPayRMB"
                Checked="true" Height="30" /><br />--%>
            <asp:RadioButton ID="vPayRMB10" runat="server" Text="充值10元，可获得50元宝(可兑换5000金币)" GroupName="vPayRMB"
                Height="30" Checked="True" /><br />
            <asp:RadioButton ID="vPayRMB20" runat="server" Text="充值20元，可获得100元宝(可兑换10000金币)" GroupName="vPayRMB"
                Height="30" /><br />
            <asp:RadioButton ID="vPayRMB30" runat="server" Text="充值30元，可获得150元宝(可兑换15000金币)" GroupName="vPayRMB"
                Height="30" />
        </div>
        账号确认：
        <asp:TextBox ID="txtUserName" runat="server" ReadOnly="True" CssClass="help_textBox"
            Enabled="False"></asp:TextBox>(请您确认要充值的帐号)
        <div class="phoneRechargeBTN">
            <asp:ImageButton ID="Button1" runat="server" Style="margin-left: 63px"  OnClick="Button1_Click" ImageUrl="~/Images/BtnImg/enter1.png" />
<%--                            <asp:LinkButton ID="Button1" Style="margin-left: 63px" CssClass="savebtn" OnClick="Button1_Click" runat="server">确定</asp:LinkButton>
--%>        </div>
        <div class="phoneRechargeRatio">
            该充值方式兑换比率为：1元=5元宝=500金币
            <br />
            <br />
            <br />
            <div>
                V币兑换比率为：1元=1V币
                <br />
                手机短信充值方法：<a target="_blank" href="http://www.vpay8.com/Buyvb.aspx" style="color: #0000FF;
                    text-decoration: underline;">详情点击查看</a>
                <br />
                <br />
                <div style="color: #FF0000;">
                    <b>温馨提示：</b>&nbsp;具体充值方法各地区不一样,如果您是第一次通过手机短信充值,
                    <br />
                    <div style="margin-left: 73px">
                        请您点击详情查看具体充值方法!!</div></div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
