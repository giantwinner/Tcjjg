<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Protect_Update.aspx.cs" Inherits="SecurityCenter_Protect_Update" %>

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
        <div class="SecurityCenter_Title">
            修改密保
        </div>
        <br />
        <div id="valiDataChangePwd" runat="server">
            <div class="SecurityCenter_Prompt">
                请输入旧的密保答案：</div>
        </div>
        <br />
        <div id="verificaQuestion" class="help_right_setupQuestion">
            问题一：
            <asp:Label ID="lblQuestion1" runat="server" Text=""></asp:Label>
            <br />
            <span style="visibility: hidden">占</span>答案：
            <asp:TextBox CssClass="help_textBox" ID="valiAnswer1" runat="server" MaxLength="64" onblur="fnAnswer1()"></asp:TextBox>
            &nbsp;<span class="SecurityCenter_Error" id="errorAnswer1"></span>
            <br /><br />
            问题二：
            <asp:Label ID="lblQuestion2" runat="server" Text=""></asp:Label>
            <br />
            <span style="visibility: hidden">占</span>答案：
            <asp:TextBox CssClass="help_textBox" ID="valiAnswer2" runat="server" MaxLength="64" onblur="fnAnswer2()"></asp:TextBox>
            &nbsp;<span class="SecurityCenter_Error" id="errorAnswer2"></span>
            <br /><br />
            问题三：
            <asp:Label ID="lblQuestion3" runat="server" Text=""></asp:Label>
            <br />
            <span style="visibility: hidden">占</span>答案：
            <asp:TextBox CssClass="help_textBox" ID="valiAnswer3" runat="server" MaxLength="64" onblur="fnAnswer3()"></asp:TextBox>
            &nbsp;<span class="SecurityCenter_Error" id="errorAnswer3"></span>
            <br />
            <div id="btnVerificaQuestion" class="SecurityCenter_BtnOK" style="margin-top: 20px;
                margin-left: 85px;">
            </div>
            <span class="SecurityCenter_Error" id="errorVerifica" style="margin-left: 85px">
            </span>
        </div>
        <asp:Label ID="lblUserName" runat="server" Text="" class="SecurityCenter_Hide"></asp:Label>
    </div>
    </form>
</body>
</html>
<script type="text/javascript">
    var errorEmpty = "请输入密保答案！";
    function fnAnswer1() {
        var length1 = $("#valiAnswer1").val().replace(/[^\x00-\xff]/g, "  ").length;
        if (length1 == 0) {
            $("#errorAnswer1").html(errorEmpty);
        }
        else {
            $("#errorAnswer1").html("");
        }
    }

    function fnAnswer2() {
        var length2 = $("#valiAnswer2").val().replace(/[^\x00-\xff]/g, "  ").length;
        if (length2 == 0) {
            $("#errorAnswer2").html(errorEmpty);
        }
        else {
            $("#errorAnswer2").html("");
        }
    }

    function fnAnswer3() {
        var length3 = $("#valiAnswer3").val().replace(/[^\x00-\xff]/g, "  ").length;
        if (length3 == 0) {
            $("#errorAnswer3").html(errorEmpty);
        }
        else {
            $("#errorAnswer3").html("");
        }
    }

    $("#btnVerificaQuestion").click(function () {
        fnAnswer1();
        fnAnswer2();
        fnAnswer3();
        var length1 = $("#valiAnswer1").val().replace(/[^\x00-\xff]/g, "  ").length;
        var length2 = $("#valiAnswer2").val().replace(/[^\x00-\xff]/g, "  ").length;
        var length3 = $("#valiAnswer3").val().replace(/[^\x00-\xff]/g, "  ").length;
        var answer1 = $("#valiAnswer1").val();
        var answer2 = $("#valiAnswer2").val();
        var answer3 = $("#valiAnswer3").val();
        var userName = $("#lblUserName").html();
        if (length1 != 0 && length2 != 0 && length3 != 0) {
            $.post("/Ajax/Ajax_ValidataQuestion.aspx", { UserName: userName, Question1: answer1, Question2: answer2, Question3: answer3 }, function (data) {
                var jsondata = eval("(" + data + ")");
                if (jsondata < 0) {
                    $("#errorVerifica").html("密保答案错误，请重新输入！");
                    $("#valiAnswer1").val("");
                    $("#valiAnswer2").val("");
                    $("#valiAnswer3").val("");
                }
                else {
                    $("#errorVerifica").html("");
                    window.location = "Protect_SetUp.aspx";
                }
            })
        }
    })

</script>
