<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PhoneRecharge.aspx.cs" Inherits="PayCenter_PhoneRecharge" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/PayCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="Form1" action="VpayRequest.aspx" method="post" runat="server" onsubmit="return check()"
    class="subPage_form">
    <div class="phoneRecharge">
        <div class="phoneRechargeRB">
            <asp:RadioButton ID="vPayRMB10" runat="server" Text="充值10元，可获得50元宝(可兑换5000金币)" GroupName="vPayRMB"
                Height="30" /><br />
            <asp:RadioButton ID="vPayRMB20" runat="server" Text="充值20元，可获得100元宝(可兑换10000金币)"
                GroupName="vPayRMB" Height="30" /><br />
            <asp:RadioButton ID="vPayRMB50" runat="server" Text="充值50元，可获得250元宝(可兑换25000金币，附赠1颗经验丹)"
                GroupName="vPayRMB" Height="30" /><br />
            <asp:RadioButton ID="vPayRMB100" runat="server" Text="充值100元，可获得500元宝(可兑换50000金币，附赠2颗经验丹)"
                GroupName="vPayRMB" Height="30" />
        </div>
        <br />
        账号确认：
        <asp:TextBox ID="txtUserName" runat="server" ReadOnly="True" CssClass="help_textBox"
            Enabled="False"></asp:TextBox>(请您确认要充值的帐号)
        <div class="phoneRechargeBTN">
<%--            <asp:LinkButton ID="btnOk" Style="margin-left: 63px" CssClass="savebtn" runat="server">确定</asp:LinkButton>
--%>                      <asp:ImageButton ID="btnOk" runat="server"  Style="margin-left: 63px"   ImageUrl="~/Images/BtnImg/enter1.png" />

      </div>
        <div class="phoneRechargeRatio">
            该充值方式兑换比率为：1元=5元宝=500金币
            <br />
            <br />
            <br />
            <div>
                V币兑换比率为：1元=1V币
                <br />
                V币电话支付方法：<a target="_blank" href="http://www.vpay8.com/Buyvb.aspx" style="color: #0000FF;
                    text-decoration: underline;">详情点击查看</a>
                <br />
                <br />
                <div style="color: #FF0000;">
                    <b>温馨提示：</b>&nbsp;具体充值方法各地区不一样,如果您是第一次使用V币电话支付,
                    <br />
                    <div style="margin-left: 73px">
                        请您点击详情查看具体充值方法!!</div>
                </div>
            </div>
        </div>
    </div>
    <input id="money" name='money' type="hidden " value='' style="display: none" />
    </form>
</body>
</html>
<script type="text/javascript">

    //获取充值金额
    function check() {
        var money = $('input:radio:checked').val()
        if (money == 'vPayRMB10') {
            money = 10;
        }
        else if (money == 'vPayRMB20') {
            money = 20;
        }
        else if (money == 'vPayRMB50') {
            money = 50;
        }
        else if (money == 'vPayRMB100') {
            money = 100;
        }
        if (undefined == money) {
            return false;
        }
        $("#money").attr("value", money);
    }
 
</script>
