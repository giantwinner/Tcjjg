<%@ Page Language="C#" AutoEventWireup="true" CodeFile="VpayRequest.aspx.cs" Inherits="PayCenter_VpayRequest"
    EnableViewStateMac="false" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/PayCenter.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <%--<form id="Form1" runat="server" target="_blank" action='http://s2.vnetone.com/Default.aspx' method="post">--%>
    <form target="_parent" action='<%=servadd %>' method="post" class="subPage_form">
    <div>
        <input name='spid' type="hidden" value='<%=spid%>' />
        <!--spID 5位-->
        <input name='spname' type="hidden" value='<%=spname%>' />
        <!--sp网站 客户网站名-->
        <input name='spoid' type="hidden" value='<%=orderId%>' />
        <!--sp订单   唯一订单码，长度不超过30字符-->
        <input name='spreq' type="hidden" value='<%=spreq%>' />
        <!--网站请求地址-->
        <input name='sprec' type="hidden" value='<%=sprec%>' />
        <!--网站接收地址 请直接以ASP/php/jsp结尾 不要带参数 我方会给此地址加上？参数=XXX 等格式   客户站接收GET URL数据 -->
        <input name='userid' type="hidden" value='<%=userid%>' />
        <!--客户ID-->
        <input name='userip' type="hidden" value='<%=IpAddress%>' />
        <!--客户浏览器IP-->
        <input name='spmd5' type="hidden" value='<%=md5password%>' />
        <!--MD5-->
        <input name='spcustom' type="hidden" value='<%=spcustom%>' />
        <!--用户自己定义30个字符以内 -->
        <input name='spversion' type="hidden" value='<%=spversion%>' />
        <!--支付版本号码 -->
        <input name='money' type="hidden" value='<%=money%>' />
        <!--用户根据网站自己定义的整数面值如1,2,3,4.....-->
        <input name='urlcode' type="hidden" value='<%=urlcode%>' />
    </div>
    <div class="payInfo">
        <div class="payTitle">
            确认充值订单
        </div>
        <div class="payContent">
            交易订单：<%=orderId%>
            <br />
            充值账号：<%=userName %>
            <br />
            充值金额：<%=money %>元
            <br />
            <%--<asp:Button ID="btnOk" runat="server" CssClass="div_button2" Text="确定" />--%>
            <input type="submit"  value="确定" class="paySubmit"/>
            <br />
            <%-- <b style="color: #FF0000; font-weight: 400;">注意：请牢记此订单号</b>--%>
        </div>
    </div>
    </form>
</body>
</html>


