<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IdentifyHeadImg-Validate.aspx.cs"
    Inherits="UserCenter_IdentifyHeadImg_Validate" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="IdentifyDiv" runat="server" id="IdentifyDiv">
        <br />
        <b>真人认证头像说明：</b>
        <br />
        通过认证头像的玩家可以用自己的真实照片做为游戏头像，头像下方将显示尊贵“R”字，不仅易于辨识，同时大厅也将对认证头像的用户进行重点展示，在游戏时使您备受关注！<br />
        <br />
        申请头像认证的用户需要满足如下条件：<br />
        1.认证头像前须将系统头像修改为玩家本人真实照片&nbsp;<a target="_blank" href="/UserCenter/UpdateHeadPortrait.aspx">马上修改</a><br />
        2.必须完成实名认证&nbsp;<a target="_blank" href="/UserCenter/RealNameAuthentication.aspx">马上完成</a><br />
        3.必须填写性别、职业、生日&nbsp;<a target="_blank" href="/UserCenter/UpdateUserInfo.aspx">马上填写</a><br />
        <br />
        <div style="color: Red">
            <b>温馨提示</b>：<br />
            1.认证头像为经过认证后合格的照片，如果用户更换头像将不在显示认证头像信息；<br />
            2.上传图片为JPG格式，文件大小不得超过200K；<br />
            3.头像认证过程需要三个工作日，审查结果将会在消息中心告知。<br />
        </div>
        <br />
        <asp:ImageButton ID="btnSubmit2" Style="display: block; margin: 0 auto;" runat="server"
            OnClick="btnBeginIdentify_Click" ImageUrl="~/Images/BtnImg/kaishirenzheng1.png" />
        <asp:Label ID="lblVIPMsg" runat="server" Text="" ForeColor="Red" Style="margin-left: 272px;"></asp:Label>
    </div>
    </form>
</body>
</html>
