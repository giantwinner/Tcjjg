<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SPVisit.aspx.cs" Inherits="UserCenter_SPVisit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/SPVisit.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/ChangeCode.js" type="text/javascript"></script>
    <script src="../Scripts/CreateXMLHttpRequest.js" type="text/javascript"></script>
    <script src="../Scripts/SPVisit.js" type="text/javascript"></script>
</head>
<body style="background-color: #00525F">
    <form id="form1" runat="server">
    <div style="width: 1003px; height: 600px; margin: 0 auto; position: relative;">
        <div id="input-wrap">
            <div class="tap-reg">
                新用户
            </div>
            <div class="tap-login">
                老用户
            </div>
            <div id="reg" style="display: none;">
                <span class="text text-username">创建账号:</span> <span class="text text-pwd">密<span
                    style="visibility: hidden">空空</span>码:</span> <span class="text text-nick">确认密码:</span>
                <span class="text text-area">居住城市:</span>
                <asp:TextBox ID="txtUserName" runat="server" MaxLength="30" CssClass="textbox textbox-username"></asp:TextBox>
                <asp:TextBox ID="txtPsw" runat="server" MaxLength="30" CssClass="textbox textbox-pwd"
                    TextMode="Password"></asp:TextBox>
                <asp:TextBox ID="txtPsw2" runat="server" MaxLength="30" TextMode="Password" CssClass="textbox textbox-nick"></asp:TextBox>
                <asp:DropDownList ID="ddlProvince" CssClass="ddl ddl-province" AutoPostBack="true"
                    runat="server" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged">
                </asp:DropDownList>
                <asp:DropDownList ID="ddlCity" CssClass="ddl ddl-city" runat="server">
                </asp:DropDownList>
                <span class="txtPrompt-un">4-15个字符，中、英文与数字组合的形式</span> <span class="txtPrompt-pwd">密码长度在6-20位之间</span>
                <span class="txtPrompt-nn">重复密码长度在6-20位之间</span> <span id="unmsg" style="color: Red;
                    font-size: 12px; position: absolute; left: 160px; top: 79px;"></span><span id="cpassword"
                        style="color: Red; font-size: 12px; position: absolute; left: 160px; top: 130px;">
                    </span><span id="cnn" style="color: Red; font-size: 12px; position: absolute; left: 160px;
                        top: 185px;"></span>
                <div style="font-size: 12px;">
                    <asp:CheckBox CssClass="check1" ID="CheckBox1" runat="server" Checked="True" />
                    <span class="cktext1">我已查看并同意</span> <a href="/CustomerService/regService.html" class="ck1"
                        target="_blank">《中游竞技文化股份有限公司用户服务协议》</a>
                    <asp:CheckBox CssClass="check2" ID="CheckBox2" runat="server" Checked="True" />
                    <span class="cktext2">我已查看并同意</span> <a href="/CustomerService/regfcm.html" class="ck2"
                        target="_blank">《网络游戏防沉迷系统及实名认证服务协议》</a></div>
                <asp:ImageButton ID="regbtn" CssClass="regbtn" ImageUrl="~/Images/SPVisit/flashReg.png"
                    runat="server" OnClick="regbtn_Click" /><asp:Label ID="lblRegMsg" runat="server"
                        Text="" ForeColor="Red" CssClass="msg"></asp:Label>
            </div>
            <div id="login">
                <span class="text text-username">账<span style="visibility: hidden">空</span>号:</span>
                <span class="text text-pwd">密<span style="visibility: hidden">空</span>码:</span>
                <span class="text text-vali">验证码:</span>
                <input type="text" maxlength="30" id="txtUsername" class="textbox textbox-username"
                    value="" />
                <input type="password" maxlength="30" id="txtPassword" class="textbox textbox-pwd"
                    value="" />
                <input type="text" maxlength="4" id="txtValidate" class="textbox2 textbox-vali" value="" />
                <img id="imgCode" class="txtCode" alt="看不清？点击更换" src="/UserCenter/ValidateCode.aspx"
                    onclick="ChangeCode();" />
                <img src="/Images/SPVisit/btnLogin.png" class="LoginBtn" onmouseout="changeback(this)"
                    onmouseover="changeImg(this)" onclick="AjaxLogin()" alt="" />
                <span class="loginmsg"></span>
            </div>
        </div>
        <div style=" position:absolute ;z-index:1000; left:0; bottom:0;">
            <script src="http://s132.cnzz.com/stat.php?id=1443449&web_id=1443449&show=pic" language="JavaScript"
                type="text/javascript" charset="gb2312"></script>
        </div>
        <object classid="clsid:d27cdb6e-ae6d-11cf-96b8-444553540000" class="swf" id="load"
            align="middle">
            <param name="movie" value="/Images/SPVisit/bgflash.swf" />
            <param name="quality" value="high" />
            <param name="bgcolor" value="#000000" />
            <param name="play" value="true" />
            <param name="loop" value="true" />
            <param name="wmode" value="opaque" />
            <param name="scale" value="showall" />
            <param name="menu" value="false" />
            <param name="devicefont" value="false" />
            <param name="salign" value="" />
            <param name="allowScriptAccess" value="sameDomain" />
            <!--[if !IE]>-->
            <object type="application/x-shockwave-flash" data="/Images/SPVisit/bgflash.swf" class="swf">
                <param name="movie" value="/Images/SPVisit/bgflash.swf" />
                <param name="quality" value="high" />
                <param name="bgcolor" value="#000000" />
                <param name="play" value="true" />
                <param name="loop" value="true" />
                <param name="wmode" value="opaque" />
                <param name="scale" value="showall" />
                <param name="menu" value="false" />
                <param name="devicefont" value="false" />
                <param name="salign" value="" />
                <param name="allowScriptAccess" value="sameDomain" />
                <!--<![endif]-->
                <a href="http://www.adobe.com/go/getflash">
                    <img src="http://www.adobe.com/images/shared/download_buttons/get_flash_player.gif"
                        alt="获得 Adobe Flash Player" />
                </a>
                <!--[if !IE]>-->
            </object>
            <!--<![endif]-->
        </object>
    </div>
    </form>
</body>
</html>
