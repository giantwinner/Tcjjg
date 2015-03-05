<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Protect_SetUp.aspx.cs" Inherits="SecurityCenter_Protect_SetUp" %>

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
        <div id="setupQuestion">
            <div class="SecurityCenter_Title">
                设置密保问题
            </div>
            <br />
            问题一：
            <asp:DropDownList ID="ddlQuestion1" runat="server" Width="170">
            </asp:DropDownList>
            <span class="SecurityCenter_Error" id="errorDDL1"></span>
            <div style="_margin-top: 6px">
                <span style="visibility: hidden">占</span>答案：
                <asp:TextBox CssClass="help_textBox" ID="setAnswer1" runat="server" onblur="fnQuestion1()"
                    MaxLength="64" Width="164px"></asp:TextBox>
                &nbsp;<span class="SecurityCenter_Error" id="errorTXT1"></span>
            </div>
            <br />
            问题二：
            <asp:DropDownList ID="ddlQuestion2" runat="server" Width="170">
            </asp:DropDownList>
            &nbsp;<span class="SecurityCenter_Error" id="errorDDL2"></span>
            <div style="_margin-top: 6px">
                <span style="visibility: hidden">占</span>答案：
                <asp:TextBox CssClass="help_textBox" ID="setAnswer2" runat="server" onblur="fnQuestion2()"
                    MaxLength="64" Width="164px"></asp:TextBox>
                &nbsp;<span class="SecurityCenter_Error" id="errorTXT2"></span>
            </div>
            <br />
            问题三：
            <asp:DropDownList ID="ddlQuestion3" runat="server" Width="170">
            </asp:DropDownList>
            &nbsp;<span class="SecurityCenter_Error" id="errorDDL3"></span>
            <div style="_margin-top: 6px">
                <span style="visibility: hidden">占</span>答案：
                <asp:TextBox CssClass="help_textBox" ID="setAnswer3" runat="server" onblur="fnQuestion3()"
                    MaxLength="64" Width="164px"></asp:TextBox>
                &nbsp;<span class="SecurityCenter_Error" id="errorTXT3"></span>
            </div>
            <div id="btnSetupQuestion" class="SecurityCenter_BtnOK" style="margin-top: 20px;
                margin-left: 88px;">
            </div>
            <span class="SecurityCenter_Error" id="validataReturn" style="margin-left: 88px">
            </span>
        </div>
        <div id="verificaQuestion" style="display: none">
            <div class="SecurityCenter_Title">
                验证密保问题
            </div>
            <br />
            问题一：
            <asp:Label ID="lblQuestion2" runat="server" Text=""></asp:Label>
            <br />
            <span style="visibility: hidden">占</span>答案：
            <asp:TextBox CssClass="help_textBox" ID="valiAnswer2" runat="server" onblur="fnAnswer2()"
                MaxLength="64"></asp:TextBox>
            &nbsp;<span class="error" id="errorAnswer2"></span>
            <br />
            <br />
            问题二：
            <asp:Label ID="lblQuestion3" runat="server" Text=""></asp:Label>
            <br />
            <span style="visibility: hidden">占</span>答案：
            <asp:TextBox ID="valiAnswer3" CssClass="help_textBox" runat="server" onblur="fnAnswer3()"
                MaxLength="64"></asp:TextBox>
            &nbsp;<span class="error" id="errorAnswer3"></span>
            <br />
            <br />
            问题三：
            <asp:Label ID="lblQuestion1" runat="server" Text=""></asp:Label>
            <br />
            <span style="visibility: hidden">占</span>答案：
            <asp:TextBox ID="valiAnswer1" CssClass="help_textBox" runat="server" onblur="fnAnswer1()"
                MaxLength="64"></asp:TextBox>
            &nbsp;<span class="error" id="errorAnswer1"></span>
            <br />
            <div id="btnVerificaQuestion" class="SecurityCenter_BtnOK" style="margin-top: 20px;
                margin-left: 88px;">
            </div>
            <span class="SecurityCenter_Error" id="errorVerifica" style="margin-left: 145px">
            </span>
        </div>
        <div id="setUpComplete" class="help_right_setupQuestion" style="display: none;">
            <br />
            <div class="SecurityCenter_Title">
                <div class="changePwdComplete">
                    密保问题设置成功！
                </div>
                <div style="margin-left: 18px">
                <a href="../Default.aspx" target="_parent"><span class="changePwdComplete_Link"></span>
                </a>
                </div>
            </div>
            <br />
            <br />
            <%--            <a href="/default.aspx" target="_parent">
                <div id="linkToHomePage" class="help_button" style="margin-left: 50px">
                    返回首页</div>
            </a>--%>
        </div>
    </div>
    <asp:Label ID="lblUserID" runat="server" Text="" CssClass="SecurityCenter_Hide"></asp:Label>
    </form>
</body>
</html>
<script type="text/javascript">

    var errorDDLEmpty = "请选择密保问题！";
    var errorTXTEmpty = "请输入密保答案！";
    function fnQuestion1() {
        var length1 = $("#setAnswer1").val().replace(/[^\x00-\xff]/g, "  ").length;
        if (length1 == 0) {
            $("#errorTXT1").html(errorTXTEmpty);
        }
        else {
            $("#errorTXT1").html("");
        }
    }

    function fnQuestion2() {
        var length2 = $("#setAnswer2").val().replace(/[^\x00-\xff]/g, "  ").length;
        if (length2 == 0) {
            $("#errorTXT2").html(errorTXTEmpty);
        }
        else {
            $("#errorTXT2").html("");
        }

    }

    function fnQuestion3() {
        var length3 = $("#setAnswer3").val().replace(/[^\x00-\xff]/g, "  ").length;
        if (length3 == 0) {
            $("#errorTXT3").html(errorTXTEmpty);
        }
        else {
            $("#errorTXT3").html("");
        }
    }

    //设置密保 按钮"下一步"
    $("#btnSetupQuestion").click(function () {
        fnQuestion1();
        fnQuestion2();
        fnQuestion3();

        var length1 = $("#setAnswer1").val().replace(/[^\x00-\xff]/g, "  ").length;
        var length2 = $("#setAnswer2").val().replace(/[^\x00-\xff]/g, "  ").length;
        var length3 = $("#setAnswer3").val().replace(/[^\x00-\xff]/g, "  ").length;

        var valDDL1 = $("#ddlQuestion1").val();
        var valDDL2 = $("#ddlQuestion2").val();
        var valDDL3 = $("#ddlQuestion3").val();

        var textDDL1 = $("#ddlQuestion1").find("option:selected").text();
        var textDDL2 = $("#ddlQuestion2").find("option:selected").text();
        var textDDL3 = $("#ddlQuestion3").find("option:selected").text();

        if (length1 != 0 && length2 != 0 && length3 != 0) {
            if (valDDL1 != 0 && valDDL2 != 0 && valDDL3 != 0) {
                if (valDDL1 == valDDL2 || valDDL1 == valDDL3 || valDDL2 == valDDL3) {
                    alert("为了您的安全，请选择不同的问题！")
                }
                else {
                    $("#validataReturn").html("");
                    $("#lblQuestion1").html(textDDL1);
                    $("#lblQuestion2").html(textDDL2);
                    $("#lblQuestion3").html(textDDL3);
                    $("#setupQuestion").hide();
                    $("#verificaQuestion").show();
                }
            }
            else {
                $("#validataReturn").html(errorDDLEmpty);
            }
        }
    })


    var errorAnswer = "请输入正确的密保答案！";
    function fnAnswer1() {
        var valiAnswer1 = $("#valiAnswer1").val();
        var setAnswer1 = $("#setAnswer1").val();
        if (valiAnswer1 != setAnswer1) {
            $("#errorAnswer1").html(errorAnswer);
            $("#valiAnswer1").val("");
        }
        else {
            $("#errorAnswer1").html("");
        }
    }

    function fnAnswer2() {
        var valiAnswer2 = $("#valiAnswer2").val();
        var setAnswer2 = $("#setAnswer2").val();
        if (valiAnswer2 != setAnswer2) {
            $("#errorAnswer2").html(errorAnswer);
            $("#valiAnswer2").val("");
        }
        else {
            $("#errorAnswer2").html("");
        }
    }

    function fnAnswer3() {
        var valiAnswer3 = $("#valiAnswer3").val();
        var setAnswer3 = $("#setAnswer3").val();
        if (valiAnswer3 != setAnswer3) {
            $("#errorAnswer3").html(errorAnswer);
            $("#valiAnswer3").val("");
        }
        else {
            $("#errorAnswer3").html("");
        }
    }

    //验证密保 按钮"下一步"
    $("#btnVerificaQuestion").click(function () {
        fnAnswer1();
        fnAnswer2();
        fnAnswer3();
        var userID = $("#lblUserID").html();
        var valDDL1 = $("#ddlQuestion1").val();
        var valDDL2 = $("#ddlQuestion2").val();
        var valDDL3 = $("#ddlQuestion3").val();
        var valiAnswer1 = $("#valiAnswer1").val();
        var setAnswer1 = $("#setAnswer1").val();
        var valiAnswer2 = $("#valiAnswer2").val();
        var setAnswer2 = $("#setAnswer2").val();
        var valiAnswer3 = $("#valiAnswer3").val();
        var setAnswer3 = $("#setAnswer3").val();
        if (valiAnswer1 == setAnswer1 && valiAnswer2 == setAnswer2 && valiAnswer3 == setAnswer3) {
            $.post("/Ajax/Ajax_UpdateQuestion.aspx", { UserID: userID, Q1: valDDL1, Q2: valDDL2, Q3: valDDL3, A1: valiAnswer1, A2: valiAnswer2, A3: valiAnswer3 }, function (data) {
                var jsondata = eval("(" + data + ")");
                if (jsondata == 0) {
                    $("#verificaQuestion").hide();
                    $("#setUpComplete").show();
                }
                else {
                    $("#errorVerifica").html("密保设置失败！");
                }
            })
        }
    })

</script>
