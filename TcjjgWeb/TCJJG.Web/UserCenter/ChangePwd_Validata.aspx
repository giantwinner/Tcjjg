<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ChangePwd_Validata.aspx.cs"
    Inherits="SecurityCenter_ChangePwd_Validata" %>

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
    <div id="valiDataChangePwd"  class="uc-accountsafe-font" runat="server">
        <div class="SecurityCenter_Prompt">
            请输入您的密保答案：</div>
        <br />
        问题一：<asp:Label ID="lblQuestion1" runat="server"></asp:Label><br />
        答<span style="visibility: hidden">空</span>案：<asp:TextBox ID="txtAnswer1" runat="server"
            onblur="fnquestion1()" MaxLength="64"></asp:TextBox>&nbsp;<span class="SecurityCenter_Error"
                id="questionError1"></span>
        <br />
        <br />
        问题二：<asp:Label ID="lblQuestion2" runat="server"></asp:Label><br />
        答<span style="visibility: hidden">空</span>案：<asp:TextBox ID="txtAnswer2" runat="server"
            onblur="fnquestion2()" MaxLength="64"></asp:TextBox>&nbsp;<span class="SecurityCenter_Error"
                id="questionError2"></span>
        <br />
        <br />
        问题三：<asp:Label ID="lblQuestion3" runat="server"></asp:Label><br />
        答<span style="visibility: hidden">空</span>案：<asp:TextBox ID="txtAnswer3" runat="server"
            onblur="fnquestion3()" MaxLength="64"></asp:TextBox>&nbsp;<span class="SecurityCenter_Error"
                id="questionError3"></span>
        <br />
        <br />
        <div id="btnChangePwd2" class="savebtn" style="margin-left: 52px" onclick="fnValidataQuestion()">
            确定
        </div>
        <span class="SecurityCenter_Error" id="validataReturn" style="margin-left: 52px">
        </span>
    </div>
    <asp:Label ID="lblUserName" runat="server" CssClass="SecurityCenter_Hide"></asp:Label>
    </form>
</body>
</html>
<script type="text/javascript">
    var txtQuestionEmpty = "请输入密保答案！";
    function fnquestion1() {
        var LengthQ1 = $("#txtAnswer1").val().replace(/[^\x00-\xff]/g, "  ").length;
        if (LengthQ1 == 0) {
            $("#questionError1").html(txtQuestionEmpty);
        }
        else {
            $("#questionError1").html("");
        }
    }
    function fnquestion2() {
        var LengthQ2 = $("#txtAnswer2").val().replace(/[^\x00-\xff]/g, "  ").length;
        if (LengthQ2 == 0) {
            $("#questionError2").html(txtQuestionEmpty);
        }
        else {
            $("#questionError2").html("");
        }
    }
    function fnquestion3() {
        var LengthQ3 = $("#txtAnswer3").val().replace(/[^\x00-\xff]/g, "  ").length;

        if (LengthQ3 == 0) {
            $("#questionError3").html(txtQuestionEmpty);
        }
        else {
            $("#questionError3").html("");
        }
    }

    //点击按钮 验证密保问题
    function fnValidataQuestion() {
        var LengthQ1 = $("#txtAnswer1").val().replace(/[^\x00-\xff]/g, "  ").length;
        var LengthQ2 = $("#txtAnswer2").val().replace(/[^\x00-\xff]/g, "  ").length;
        var LengthQ3 = $("#txtAnswer3").val().replace(/[^\x00-\xff]/g, "  ").length;
        var q1 = $("#txtAnswer1").val();
        var q2 = $("#txtAnswer2").val();
        var q3 = $("#txtAnswer3").val();
        var userName = $("#lblUserName").html();

        if (LengthQ1 == 0) {
            $("#questionError1").html(txtQuestionEmpty);
        }
        else {
            $("#questionError1").html("");
        }
        if (LengthQ2 == 0) {
            $("#questionError2").html(txtQuestionEmpty);
        }
        else {
            $("#questionError2").html("");
        }
        if (LengthQ3 == 0) {
            $("#questionError3").html(txtQuestionEmpty);
        }
        else {
            $("#questionError3").html("");
        }

        if (LengthQ1 != 0 && LengthQ2 != 0 && LengthQ3 != 0) {
            $.post("../Ajax/Ajax_ValidataQuestion.aspx", { UserName: userName, Question1: q1, Question2: q2, Question3: q3 }, function (data) {
                var jsonData = eval("(" + data + ")");
                if (jsonData < 0) {
                    $("#validataReturn").html("密保答案错误,请重新输入！");
                    $("#txtAnswer1").val("");
                    $("#txtAnswer2").val("");
                    $("#txtAnswer3").val("");

                }
                else {
                    $("#validataReturn").html("");
                    window.location = "ChangePwd_Change.aspx";
                }
            })
        }

    }
</script>
