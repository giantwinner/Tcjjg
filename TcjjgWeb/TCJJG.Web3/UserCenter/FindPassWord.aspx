<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="FindPassWord.aspx.cs" Inherits="UserCenter_FindPassWord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/UserCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <br />
    <br />
    <br />
    <div class="D_FindPwdStep1" id="step1">
        <span class="FindPwdTitle">登录密码找回</span>
        <div class="FindPwdContent1">
            账户：<asp:TextBox ID="txtUserName" runat="server" CssClass="txtUserName" onblur="fnUserName()"
                MaxLength="64"></asp:TextBox>
            <br />
            <br />
            <div id="btnStep1" class="FindNext" style="margin-left: 41px">
            </div>
            <span id="errorTxt" class="FindPwdError" style="margin-left: 41px"></span>
        </div>
    </div>
    <div class="D_FindPwdStep2" id="step2" style="display: none">
        <span class="FindPwdTitle">登录密码找回</span>
        <div class="FindPwdContent1">
            <br />
            <br />
            <br />
            <div id="QAndA1">
                问题一：<span id="lblQ1"></span><br /><br />
                <span style="visibility: hidden">占</span>答案：<asp:TextBox ID="txtA1" CssClass="Answer"
                    runat="server" onblur="fnAnswer1()" MaxLength="64"></asp:TextBox>
                &nbsp;&nbsp;<span class="FindPwdError" id="errorA1"></span>
            </div>
            <br />
            <div id="QAndA2">
                问题二：<span id="lblQ2"></span><br /><br />
                <span style="visibility: hidden">占</span>答案：<asp:TextBox ID="txtA2" CssClass="Answer"
                    runat="server" onblur="fnAnswer2()" MaxLength="64"></asp:TextBox>
                &nbsp; &nbsp;<span class="FindPwdError" id="errorA2"></span>
            </div>
            <br />
            <div id="QAndA3">
                问题三：<span id="lblQ3"></span><br /><br />
                <span style="visibility: hidden">占</span>答案：<asp:TextBox ID="txtA3" CssClass="Answer"
                    runat="server" onblur="fnAnswer3()" MaxLength="64"></asp:TextBox>
                &nbsp; &nbsp;<span class="FindPwdError" id="errorA3"></span>
            </div>
            <br />
            <div id="Pwd1">
                新密码：<asp:TextBox ID="txtPwd1" CssClass="Answer" runat="server" onblur="fnPwd1()"
                    MaxLength="20" TextMode="Password"></asp:TextBox>
                &nbsp; &nbsp;<span class="FindPwdError" id="errorPwd1"></span>
            </div>
            <div id="Pwd2" style="margin-left: -28px; margin-top: 5px;">
                确认新密码：<asp:TextBox ID="txtPwd2" CssClass="Answer" runat="server" onblur="fnPwd2()"
                    MaxLength="20" TextMode="Password"></asp:TextBox>
                &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;<span class="FindPwdError" id="errorPwd2"></span>
            </div>
            <br />
            <div id="btnStep2" class="FindOK" style="margin-left: 55px">
            </div>
             <br />
            <span id="errorFindPwd" class="FindPwdError" style="margin-left: 55px"></span>
             <br />
            
        </div>
    </div>
    <div class="D_FindPwdStep3" id="step3" style="display: none">
        <span class="FindPwdTitle">登录密码找回</span>
        <div class="FindPwdContent1">
            <img src="../Images/UserCenter/tcjjg_2012__pwdFindOK.jpg" />
            密码找回成功！
            <br />
            <br />
            <a href="/default.aspx" target="_parent">
                <div id="linkToHomePage" class="ReturnIndex">
                </div>
            </a>
        </div>
            <br />
    <br />
    </div>
    <br />
    <br />
    <br />
<script type="text/javascript">
            function fnUserName() {
                var length = $("#ctl00_ContentPlaceHolder1_txtUserName").val().replace(/[^\x00-\xff]/g, "  ").length;
                if (length == 0) {
                    $("#errorTxt").html("请输入用户账号！");
                }
                else {
                    $("#errorTxt").html("");
                }
            }

            $("#btnStep1").click(function () {
                var length = $("#ctl00_ContentPlaceHolder1_txtUserName").val().replace(/[^\x00-\xff]/g, "  ").length;
                var userName = $("#ctl00_ContentPlaceHolder1_txtUserName").val();
                fnUserName();
                if (length != 0) {
                    $.post("/Ajax/Ajax_ValidataUserName.aspx", { UserName: userName }, function (data) {
                        var jsondata = eval("(" + data + ")");
                        if (jsondata.sign == 0) {
                            $("#lblQ1").html(jsondata.Q1);
                            $("#lblQ2").html(jsondata.Q2);
                            $("#lblQ3").html(jsondata.Q3);
                            $("#step1").hide();
                            $("#step2").show();
                        }
                        else if (jsondata.sign == -1) {
                            $("#errorTxt").html("该用户不存在！");
                        }
                        else if (jsondata.sign == -2) {
                            $("#errorTxt").html("该用户未注册密保！");
                        }
                    })
                }

            })


            var errorEmpty = "请输入密保答案！";
            var errorPwdMin = "请输入6-20位密码！";
            var errorPwdDiff = "密码和确认密码不同！";
            function fnAnswer1() {
                var lengthA1 = $("#ctl00_ContentPlaceHolder1_txtA1").val().replace(/[^\x00-\xff]/g, "  ").length;
                if (lengthA1 == 0) {
                    $("#errorA1").html(errorEmpty);
                }
                else {
                    $("#errorA1").html("");
                }
            }
            function fnAnswer2() {
                var lengthA2 = $("#ctl00_ContentPlaceHolder1_txtA2").val().replace(/[^\x00-\xff]/g, "  ").length;
                if (lengthA2 == 0) {
                    $("#errorA2").html(errorEmpty);
                }
                else {
                    $("#errorA2").html("");
                }
            }
            function fnAnswer3() {
                var lengthA3 = $("#ctl00_ContentPlaceHolder1_txtA3").val().replace(/[^\x00-\xff]/g, "  ").length;
                if (lengthA3 == 0) {
                    $("#errorA3").html(errorEmpty);
                }
                else {
                    $("#errorA3").html("");
                }
            }

            function fnPwd1() {
                var lengthPwd1 = $("#ctl00_ContentPlaceHolder1_txtPwd1").val().replace(/[^\x00-\xff]/g, "  ").length;
                var lengthPwd2 = $("#ctl00_ContentPlaceHolder1_txtPwd2").val().replace(/[^\x00-\xff]/g, "  ").length;
                var pwdText1 = $("#ctl00_ContentPlaceHolder1_txtPwd1").val();
                var pwdText2 = $("#ctl00_ContentPlaceHolder1_txtPwd2").val();
                if (lengthPwd1 < 6) {
                    $("#errorPwd1").html(errorPwdMin);
                }
                else {
                    $("#errorPwd1").html("");
                    if (pwdText1 != pwdText2 && lengthPwd2 >= 6) {
                        $("#errorPwd2").html(errorPwdDiff);
                    }
                    else {
                        $("#errorPwd2").html("");
                    }
                }
            }
            function fnPwd2() {
                var lengthPwd1 = $("#ctl00_ContentPlaceHolder1_txtPwd1").val().replace(/[^\x00-\xff]/g, "  ").length;
                var lengthPwd2 = $("#ctl00_ContentPlaceHolder1_txtPwd2").val().replace(/[^\x00-\xff]/g, "  ").length;
                var pwdText1 = $("#ctl00_ContentPlaceHolder1_txtPwd1").val();
                var pwdText2 = $("#ctl00_ContentPlaceHolder1_txtPwd2").val();
                if (lengthPwd2 < 6) {
                    $("#errorPwd2").html(errorPwdMin);
                }
                else {
                    $("#errorPwd2").html("");
                    if (pwdText1 != pwdText2 && lengthPwd1 >= 6) {
                        $("#errorPwd2").html(errorPwdDiff);
                    }
                }
            }

            $("#btnStep2").click(function () {
                var userName = $("#ctl00_ContentPlaceHolder1_txtUserName").val();
                var lengthA1 = $("#ctl00_ContentPlaceHolder1_txtA1").val().replace(/[^\x00-\xff]/g, "  ").length;
                var lengthA2 = $("#ctl00_ContentPlaceHolder1_txtA2").val().replace(/[^\x00-\xff]/g, "  ").length;
                var lengthA3 = $("#ctl00_ContentPlaceHolder1_txtA3").val().replace(/[^\x00-\xff]/g, "  ").length;
                var txtA1 = $("#ctl00_ContentPlaceHolder1_txtA1").val();
                var txtA2 = $("#ctl00_ContentPlaceHolder1_txtA2").val();
                var txtA3 = $("#ctl00_ContentPlaceHolder1_txtA3").val();
                var lengthPwd1 = $("#ctl00_ContentPlaceHolder1_txtPwd1").val().replace(/[^\x00-\xff]/g, "  ").length;
                var lengthPwd2 = $("#ctl00_ContentPlaceHolder1_txtPwd2").val().replace(/[^\x00-\xff]/g, "  ").length;
                var pwdText1 = $("#ctl00_ContentPlaceHolder1_txtPwd1").val();
                var pwdText2 = $("#ctl00_ContentPlaceHolder1_txtPwd2").val();

                fnAnswer1();
                fnAnswer2();
                fnAnswer3();

                if (lengthPwd1 < 6) {
                    $("#errorPwd1").html(errorPwdMin);
                }
                else {
                    $("#errorPwd1").html("");
                    if (pwdText1 != pwdText2 && lengthPwd2 >= 6) {
                        $("#errorPwd2").html(errorPwdDiff);
                        $("#ctl00_ContentPlaceHolder1_txtPwd1").val("");
                        $("#ctl00_ContentPlaceHolder1_txtPwd2").val("");
                    }
                    else {
                        $("#errorPwd2").html("");
                    }
                }

                if (lengthA1 > 0 && lengthA2 > 0 && lengthA3 > 0 && lengthPwd1 >= 6 && lengthPwd2 >= 6 && pwdText1 == pwdText2) {
                    $.post("/Ajax/Ajax_FindPassWord.aspx", { UserName: userName, A1: txtA1, A2: txtA2, A3: txtA3, P1: pwdText1, P2: pwdText2 }, function (data) {
                        var jsondata = eval("(" + data + ")");
                        if (jsondata == 0) {
                            $("#step2").hide();
                            $("#step3").show();
                        }
                        else if (jsondata == -1) {
                            $("#errorFindPwd").html("密码和确认密码不同！");
                        }
                        else if (jsondata == -2) {
                            $("#errorFindPwd").html("密码找回失败！");
                        }
                        else if (jsondata == -3) {
                            $("#errorFindPwd").html("密保答案错误！");
                            $("#ctl00_ContentPlaceHolder1_txtA1").val("");
                            $("#ctl00_ContentPlaceHolder1_txtA2").val("");
                            $("#ctl00_ContentPlaceHolder1_txtA3").val("");
                        }
                        else if (jsondata == -4) {
                            $("#errorFindPwd").html("用户名不存在！");
                        }
                    })
                }
            })
    </script>
</asp:Content>
