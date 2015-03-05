<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="FindPassWord.aspx.cs" Inherits="UserCenter_FindPassWord" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="uc-findpwd-wrap">
        <div class="findpwdText">
            登录密码找回：
        </div>
        <div class="div-findpwd-step1" id="step1">
            <div class="findpwd-stepImg-wrap">
                <img src="../Images/UserCenter/findpwdstep1-a.png" alt="" /><img src="../Images/UserCenter/findpwdstep2-b.png"
                    alt="" /><img src="../Images/UserCenter/findpwdstep3-b.png" alt="" />
            </div>
            <div class="findpwd-input-wrap">
                <div class="bigFont">
                    账<span style="visibility: hidden">空</span>号：<asp:TextBox ID="txtUserName" runat="server"
                        CssClass="findpwd-txtUserName" onblur="fnUserName()" MaxLength="64"></asp:TextBox>
                </div>
                <div id="btnStep1" class="findpwdUserNameBg" style="margin-left: 95px;">
                    下一步
                </div>
                <span id="errorTxt" class="FindPwdError" style="margin-left: 95px; margin-bottom: 50px;">
                </span>
            </div>
        </div>
        <div class="div-findpwd-step2" id="step2" style="display: none">
            <div class="findpwd-stepImg-wrap">
                <img src="../Images/UserCenter/findpwdstep1-b.png" alt="" /><img src="../Images/UserCenter/findpwdstep2-a.png"
                    alt="" /><img src="../Images/UserCenter/findpwdstep3-b.png" alt="" />
            </div>
            <div class="findpwdsplit">
                <img src="../Images/UserCenter/findpwdsplit.png" alt="" />
            </div>
            <div class="findpwdtext">
                你正在尝试找回账号<span class="findpwd-username"></span>的密码，你可以选择以下几种途径
            </div>
            <div class=" findpwdway">
                <a style="margin-left: 0; cursor: pointer" id="btnStep2">
                    <img src="../Images/UserCenter/findway-question.png" alt="" /></a> <a href="/UserCenter/FindPassWordStep3.aspx?t=p">
                        <img src="../Images/UserCenter/findway-phone.png" alt="" /></a> <a href="/UserCenter/FindPassWordStep3.aspx?t=m">
                            <img src="../Images/UserCenter/findway-mail.png" alt="" /></a>
            </div>
            <div class="findpwdsplit">
                <img src="../Images/UserCenter/findpwdsplit.png" alt="" />
            </div>
            <div class="findpwdtext">
                如果你无法通过上述方法修复密码，建议你尝试以下方式进行处理：
            </div>
            <img class="findpwdphonenum" src="../Images/UserCenter/findpwdphonenum.png" alt="" />
            <a class="kfQQ findpwdQQ" href="http://wpa.qq.com/msgrd?v=3&uin=1793878267&site=qq&menu=yes"
                target="_blank">
                <img src="/Images/HelpCenter/kfqq.png" alt="" /></a>
            <div class="findpwdtext">
                修改密码客服服务时间为：周一至周五10:00-17:30
            </div>
            <div style="height: 50px;">
            </div>
        </div>
        <div class="div-findpwd-step3" id="step3" style="display: none;">
            <div class="findpwd-stepImg-wrap">
                <img src="../Images/UserCenter/findpwdstep1-b.png" alt="" /><img src="../Images/UserCenter/findpwdstep2-b.png"
                    alt="" /><img src="../Images/UserCenter/findpwdstep3-a.png" alt="" />
            </div>
            <div class="findpwdtext" style="margin-top: 24px; margin-bottom: 24px; font-size: 14px;">
                提示问题密码找回
            </div>
            <div class="div-findinput">
                <div class="findpwdtext">
                    问题一：<span id="lblQ1"></span>
                </div>
                <div class="findpwdtext">
                    答<span style="visibility: hidden;">空</span>案：<asp:TextBox ID="txtA1" CssClass="Answer"
                        runat="server" onblur="fnAnswer1()" MaxLength="64"></asp:TextBox>
                    &nbsp;&nbsp;<span class="FindPwdError" id="errorA1"></span>
                </div>
                <div class="findpwdtext">
                    问题二：<span id="lblQ2"></span>
                </div>
                <div class="findpwdtext">
                    答<span style="visibility: hidden;">空</span>案：<asp:TextBox ID="txtA2" CssClass="Answer"
                        runat="server" onblur="fnAnswer2()" MaxLength="64"></asp:TextBox>
                    &nbsp;&nbsp;<span class="FindPwdError" id="errorA2"></span>
                </div>
                <div class="findpwdtext">
                    问题三：<span id="lblQ3"></span>
                </div>
                <div class="findpwdtext">
                    答<span style="visibility: hidden;">空</span>案：<asp:TextBox ID="txtA3" CssClass="Answer"
                        runat="server" onblur="fnAnswer3()" MaxLength="64"></asp:TextBox>
                    &nbsp;&nbsp;<span class="FindPwdError" id="errorA3"></span>
                </div>
                <br />
                <div class="findpwdtext" id="Pwd1">
                    新密码：<asp:TextBox ID="txtPwd1" CssClass="Answer" runat="server" onblur="fnPwd1()"
                        MaxLength="20" TextMode="Password"></asp:TextBox>
                    &nbsp; &nbsp;<span class="FindPwdError" id="errorPwd1"></span>
                </div>
                <div class="findpwdtext" id="Pwd2" style="margin-left: -26px;">
                    确认新密码：<asp:TextBox ID="txtPwd2" CssClass="Answer" runat="server" onblur="fnPwd2()"
                        MaxLength="20" TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;<span class="FindPwdError" id="errorPwd2"></span>
                </div>
                <br />
                <div id="btnStep3" class="FindOK">
                    确&nbsp;认
                </div>
                <br />
                <span id="errorFindPwd" class="FindPwdError" style="margin-left: 55px"></span>
                <br />
            </div>
        </div>
        <div class="div-findpwd-step4" id="step4" style="display: none">
            <img class="findokimg" src="/Images/UserCenter/findok.png" alt="" />
            <div class="findsuccess">
                &nbsp;恭喜,密码找回成功！<span id="second">5</span>秒后跳转到主页！
            </div>
            <a class="FindOK" style="display: block; position: absolute; top: 86px;" href="/">立即跳转
            </a>
        </div>
    </div>
    <script type="text/javascript">
        var t = 5;
        var timer;
        function TimerRedirect() {
            t--;
            $("#second").text(t);
            if (t <= 0) {
                location.href = "/";
                clearInterval(timer);
            }
        }

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
                    if (jsondata.sign != -1) {
                        $("#step1").hide();
                        $(".findpwd-username").html(userName);
                        $("#step2").show();
                    }
                    else if (jsondata.sign == -1) {
                        $("#errorTxt").html("该用户不存在！");
                    }
                })
            }

        })


        $("#btnStep2").click(function () {
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
                        $("#step2").hide();
                        $("#step3").show();
                    }
                    else if (jsondata.sign == -1) {
                        alert("该用户不存在！");
                    }
                    else if (jsondata.sign == -2) {
                        alert("该用户未注册密保！");


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
        //        $("#btnStep2").click(function () {
        //            $("#step1").hide();
        //            $("#step2").hide();
        //            $("#step3").show();
        //        });
        $("#btnStep3").click(function () {
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
                        $("#step3").hide();
                        $("#step4").show();
                        timer = setInterval("TimerRedirect()", 1000);
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
