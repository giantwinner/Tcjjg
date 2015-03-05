<%@ Page Language="C#" AutoEventWireup="true" CodeFile="payFinish.aspx.cs" Inherits="PayCenter_payFinish" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server" class="subPage_form">
    <div>
        <div class="payResult_Img">
        </div>
        <div class="payResult_Info">
            恭喜您充值成功！
        </div>
        <div class="payResult_Link">
            <div class="payResult_Link1" onclick="document.location='PayCenter.aspx'">
            </div>
            <a href="../HallPage/HallPageFL.aspx" target="_blank"><span class="payResult_Link2"></span>
            </a>
        </div>
    </div>
    </form>
</body>
</html>
