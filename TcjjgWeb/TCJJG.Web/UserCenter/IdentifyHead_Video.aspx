<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IdentifyHead_Video.aspx.cs"
    Inherits="UserCenter_IdentifyHead_Video" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
        <script src="/Scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="SecondStep-Video" id="Video" runat="server">
        <b>视频预约认证</b>：
        <br />
        <div class="Video-info">
            <br /><br /><br />
            <span style="visibility: hidden">空空</span><b>Q Q</b>：
            <asp:TextBox ID="txtQQ" CssClass="video-text" MaxLength="20" runat="server"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtQQ"
                ErrorMessage="格式错误" Operator="DataTypeCheck" Type="Double" ValidationGroup="格式错误"></asp:CompareValidator>
            <br />
            <br />
            <b>预约时间</b>：<asp:TextBox ID="txtDate" onclick="WdatePicker()" CssClass="video-text" runat="server"></asp:TextBox>
            <asp:DropDownList ID="ddlHour" runat="server">
                <asp:ListItem Selected="True" Value="09"></asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
                <asp:ListItem Value="11"></asp:ListItem>
                <asp:ListItem Value="12"></asp:ListItem>
                <asp:ListItem Value="13"></asp:ListItem>
                <asp:ListItem Value="14"></asp:ListItem>
                <asp:ListItem Value="15"></asp:ListItem>
                <asp:ListItem Value="16"></asp:ListItem>
                <asp:ListItem Value="17"></asp:ListItem>
            </asp:DropDownList>
            ：<asp:DropDownList ID="ddlMini" runat="server">
                <asp:ListItem Selected="True" Value="00"></asp:ListItem>
                <asp:ListItem Value="15"></asp:ListItem>
                <asp:ListItem Value="30"></asp:ListItem>
                <asp:ListItem Value="45"></asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
                <asp:ImageButton ID="btnSubmit2" runat="server" style=" display:block; margin-left:63px;" OnClick="btnSubmit2_Click"  ImageUrl="~/Images/BtnImg/submit1.png" />
                            <a href="javascript:history.go(-1);" style=" position:absolute; right:192px; bottom:78px; text-decoration:none;">返回上一步</a>
                  <asp:Label ID="lblMsg" runat="server" CssClass="lblMsg" Text="" ForeColor="Red" style=" margin-left:63px;"></asp:Label>
        </div>
        <div class="video-promt">
            <b>提示</b>：
            <br />
            *系统只接受3日内的预约
            <br />
            *视频认证只在工作日的工作时间段9：00—18：00进行
            <br />
        </div>
    </div>
    </form>
</body>
</html>
