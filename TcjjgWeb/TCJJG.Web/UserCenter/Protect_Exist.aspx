<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Protect_Exist.aspx.cs" Inherits="SecurityCenter_Protect_Exist" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/AccountNumberSafe.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="SecurityCenter">
        <div id="alreadySet" runat="server">
            <div class="SecurityCenter_Title">
                <b>密保问题已设置</b>
                <a href="/UserCenter/Protect_Update.aspx" class="uc-pwdprotectlinkbtn">修改密保</a>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
