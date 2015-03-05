<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Alipay.aspx.cs" Inherits="PayCenter_Alipay" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="/CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="/CSS/PayCenter.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" target="_parent" runat="server" class="subPage_form">
    <div style="margin-left: 50px;">
        <div class="pay_body_main2_body2">
            <div class="pay_body_main2_body_text_2">
                <div>
                    <asp:RadioButton ID="alipay_20" runat="server" Text="充值20元,可获得200元宝(可兑换20000金币)"
                        GroupName="alipay" Checked="true" /><br />
                    <asp:RadioButton ID="alipay_50" runat="server" Text="充值50元,可获得500元宝(可兑换50000金币)"
                        GroupName="alipay" /><br />
                    <asp:RadioButton ID="alipay_100" runat="server" Text="充值100元,可获得1000元宝(可兑换100000金币)"
                        GroupName="alipay" /><br />
                    <asp:RadioButton ID="alipay_300" runat="server" Text="充值300元,可获得3000元宝(可兑换300000金币)"
                        GroupName="alipay" /><br />
                    <asp:RadioButton ID="alipay_500" runat="server" Text="充值500元,可获得5000元宝(可兑换500000金币)"
                        GroupName="alipay" />
                </div>
            </div>
        </div>
        <div class="pay_body_main2_body4" style="top: 80px">
            <div class="pay_body_main2_body_text">
                帐号确认：</div>
            <div class="pay_body_main2_body_text_1_1">
                <asp:TextBox ID="txtUserName_Bank" runat="server" class="help_textBox" Enabled="false"
                    ReadOnly="true" Font-Bold="true"></asp:TextBox>
                (请您确认要充值的帐号)
            </div>
        </div>
        <div class="pay_body_main2_body5" style="top: 80px">
            <asp:ImageButton ID="btnPay" runat="server" Style="margin-left: 63px" ImageUrl="~/Images/BtnImg/enter1.png"
                OnClick="btnPay_Click" />
        </div>
        <div class="pay_body_main2_body6" style="top: 80px">
            该充值方式兑换比率为：1元=10元宝=1000金币
        </div>
    </div>
    </form>
</body>
</html>
