<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IdentifyHeadImg.aspx.cs"
    Inherits="UserCenter_IdentifyHeadImg" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="FirstStep" runat="server" id="First">
        <b>请选择认证方式：</b><br />
        <div class="FirstStep-Left" style="margin-left: 0px;">
            <asp:ImageButton ID="LinkButton1" Style="display: block; margin: 0 auto;" runat="server"
                OnClick="LinkButton1_Click" ImageUrl="~/Images/BtnImg/shenfenzhenrenzheng1.png" />
            <br />
            <div class="IDCardBtn2">
                提供身份证正面照和一张不大于200k的真人头像图片<br />
                <br />
            </div>
        </div>
        <div class="FirstStep-Right">
            <asp:ImageButton ID="LinkButton2" Style="display: block; margin: 0 auto;" runat="server"
                OnClick="LinkButton2_Click" ImageUrl="~/Images/BtnImg/videorenzheng1.png" />
            <br />
            <div class="IDCardBtn2">
                提供与账号实名认证相同的身份证在摄像头前认证<br />
                <br />
            </div>
        </div>
        <b>注</b>:认证头像前需将系统头像修改为玩家本人真实照片！！
        <div style="color: Red">
            <b>提示</b>：<br />
            *认证头像只在工作日进行审核<br />
        </div>
    </div>
    </form>
</body>
</html>
