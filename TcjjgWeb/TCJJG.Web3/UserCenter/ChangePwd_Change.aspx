<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePwd_Change.aspx.cs"
    Inherits="SecurityCenter_ChangePwd_Change" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title></title>
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../js/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body style=" font-family:微软雅黑">
    <form id="form1" runat="server" class="subPage_form">
    <div class="SecurityCenter">
     <div class="SecurityCenter_Title">
            修改登录密码
        </div>
        <br />
        <div id="startChangePwd" runat="server">
            请输入旧的登录密码：<asp:TextBox CssClass="help_textBox" ID="txtPwdOld" runat="server" onblur="fnPwdOld()"
                MaxLength="20" TextMode="Password"></asp:TextBox>&nbsp;<span class="SecurityCenter_Error"
                    id="errorPwdOld"></span>
            <br />
            <br />
            请输入新的登录密码：<asp:TextBox CssClass="help_textBox" ID="txtPwdNew" runat="server" onblur="fnPwdNew()"
                MaxLength="20" TextMode="Password"></asp:TextBox>&nbsp;<span class="SecurityCenter_Error"
                    id="errorPwdNew"></span>
            <br />
            <br />
            请确认新的登录密码：<asp:TextBox CssClass="help_textBox" ID="txtPwdNew2" runat="server" onblur="fnPwdNew2()"
                MaxLength="20" TextMode="Password"></asp:TextBox>&nbsp;<span class="SecurityCenter_Error"
                    id="errorPwdNew2"></span>
            <br />
            <br />
            <div id="btnChangePwd1" class="SecurityCenter_BtnOK" style="margin-left: 163px" onclick="fnChangePwd()">
            </div>
            <span class="SecurityCenter_Error" id="validataReturn" style="margin-left: 163px">
            </span>
            <asp:Label ID="lblUserID" runat="server" Text="" CssClass="SecurityCenter_Hide"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
<script type="text/javascript">

    var errorEmpty = "密码不能为空！";
    var errorLength = "密码长度为6-20位！";
    var errorDifferent = "密码和确认密码不同！";

    function fnPwdOld() {
        var lengthOld = $("#txtPwdOld").val().replace(/[^\x00-\xff]/g, "  ").length;
        if (lengthOld == 0) {
            $("#errorPwdOld").html(errorEmpty);
        }
        else if (lengthOld < 6) {
            $("#errorPwdOld").html(errorLength);
        }
        else {
            $("#errorPwdOld").html("");
        }

    }

    function fnPwdNew() {
        var lengthNew = $("#txtPwdNew").val().replace(/[^\x00-\xff]/g, "  ").length;
        var lengthNew2 = $("#txtPwdNew2").val().replace(/[^\x00-\xff]/g, "  ").length;
        var pwdNew = $("#txtPwdNew").val();
        var pwdNew2 = $("#txtPwdNew2").val();
        if (lengthNew == 0) {
            $("#errorPwdNew").html(errorEmpty);
        }
        else if (lengthNew < 6) {
            $("#errorPwdNew").html(errorLength);
        }
        else {
            $("#errorPwdNew").html("");
        }

        if (lengthNew >= 6 && pwdNew == pwdNew2) {
            $("#errorPwdNew2").html("");
        }
        else if (lengthNew >= 6 && lengthNew2 != 0 && pwdNew != pwdNew2) {
            $("#errorPwdNew2").html(errorDifferent);
        }
    }

    function fnPwdNew2() {
        var lengthNew = $("#txtPwdNew").val().replace(/[^\x00-\xff]/g, "  ").length;
        var lengthNew2 = $("#txtPwdNew2").val().replace(/[^\x00-\xff]/g, "  ").length;
        var pwdNew = $("#txtPwdNew").val();
        var pwdNew2 = $("#txtPwdNew2").val();
        if (lengthNew2 == 0) {
            $("#errorPwdNew2").html(errorEmpty);
        }
        else if (lengthNew2 < 6) {
            $("#errorPwdNew2").html(errorLength);
        }
        else if (pwdNew != pwdNew2 && lengthNew != 0 && lengthNew2 != 0) {
            $("#errorPwdNew2").html(errorDifferent);
        }
        else {
            $("#errorPwdNew2").html("");
        }
    }

    function fnChangePwd() {
        fnPwdOld();
        fnPwdNew();
        fnPwdNew2();
        var lengthOld = $("#txtPwdOld").val().replace(/[^\x00-\xff]/g, "  ").length;
        var lengthNew = $("#txtPwdNew").val().replace(/[^\x00-\xff]/g, "  ").length;
        var lengthNew2 = $("#txtPwdNew2").val().replace(/[^\x00-\xff]/g, "  ").length;
        var userID = $("#lblUserID").html();
        var pwdOld = $("#txtPwdOld").val();
        var pwdNew = $("#txtPwdNew").val();
        var pwdNew2 = $("#txtPwdNew2").val();
        if (pwdNew != pwdNew2) {
            $("#txtPwdNew").val("");
            $("#txtPwdNew2").val("");
        }

        if (lengthOld >= 6 && lengthNew >= 6 && lengthNew2 >= 6 && pwdNew == pwdNew2) {
            $.post("/Ajax/Ajax_ValidataPassWord.aspx", { UserID: userID, PwdOld: pwdOld, PwdNew: pwdNew, PwdNew2: pwdNew2 }, function (data) {
                var jsonData = eval("(" + data + ")");
                if (jsonData == 0) {
                    window.location = "ChangePwd_Complete.aspx";
                }
                else if (jsonData == -1) {
                    $("#validataReturn").html("旧密码输入错误！");
                    $("#txtPwdOld").val("");
                }
                else if (jsonData == -2) {
                    $("#validataReturn").html("密码和确认密码不同！");
                }
                else if (jsonData == -3) {
                    $("#validataReturn").html("您的输入有误！");
                }
            })

        }
    }

</script>
