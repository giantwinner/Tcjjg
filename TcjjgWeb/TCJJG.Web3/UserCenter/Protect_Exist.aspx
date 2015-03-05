<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Protect_Exist.aspx.cs" Inherits="SecurityCenter_Protect_Exist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="../js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
</head>
<body  style=" font-family:微软雅黑">
    <form id="form1" runat="server" class="subPage_form">
    <div class="SecurityCenter">
        <div id="alreadySet" runat="server">
            <div class="SecurityCenter_Title">
                <b>密保问题已设置</b><br />
                <br />
                <a href="Protect_Update.aspx"><span id="linkToChangePwd" class="SecurityCenter_BtnUpdate">
                </span></a>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
