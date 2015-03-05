<%@ Page Language="C#" AutoEventWireup="true" CodeFile="InPayRequest.aspx.cs" Inherits="PayCenter_InPayRequest" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/PayCenter.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form target="_parent" action='<%=servadd %>' method="post" class="subPage_form">
    <div>
        <input name='sp' type='hidden' value='<%=sp %>' />
        <input name='od' type='hidden' value='<%=od %>' />
        <input name='mz' type='hidden' value='<%=mz %>' />
        <input name='md5' type='hidden' value='<%=md5 %>' />
        <input name='spzdy' type='hidden' value='<%=spzdy %>' />
        <input name='uid' type='hidden' value='<%=userName %>' />
        <input name='spreq' type='hidden' value='<%=spreq %>' />
        <input name='spsuc' type='hidden' value='<%=spsuc %>' />
    </div>
    <div class="payInfo">
        <div class="payTitle">
            确认充值订单
        </div>
        <div class="payContent">
            交易订单：<%=od%>
            <br />
            充值账号：<%=userName %>
            <br />
            充值金额：<%=mz %>元
            <br />
            <%--<asp:Button ID="btnOk" runat="server" CssClass="div_button2" Text="确定" />--%>
            <input type="submit"  value="确定"  class="paySubmit" />
            <br />
            <%-- <b style="color: #FF0000; font-weight: 400;">注意：请牢记此订单号</b>--%>
        </div>
    </div>
    </form>
</body>
</html>
