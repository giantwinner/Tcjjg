$(function () {

    $(".tap-reg").css("background-image", "url('../Images/SPVisit/spvisit-tap-check.png')");
    $(".tap-reg").css("color", "#0C3853");

    $(".tap-login").css("background-image", "url('../Images/SPVisit/spvisit-tap.png')");
    $(".tap-login").css("color", "#5FC0F7");
    $("#reg").show();
    $("#login").hide();


    $(".textbox-username").focus(function () {
        $(".msg").html("");
        $(".txtPrompt-un").css("color", "#BBEBFF");
        if (unpass && pwdpass && nnpass) {
            $(".txtPrompt-un").show();
        }
    }).blur(function () {
        $(".txtPrompt-un").css("color", "#BBEBFF");
        $(".txtPrompt-un").hide();
        pv_checkUID(userName, cUserName);
    });
    $(".textbox-pwd").focus(function () {
        $(".msg").html("");
        $(".txtPrompt-pwd").css("color", "#BBEBFF");
        if (unpass && pwdpass && nnpass) {
            $(".txtPrompt-pwd").show();
        }
    }).blur(function () {
        $(".txtPrompt-pwd").css("color", "#BBEBFF");
        $(".txtPrompt-pwd").hide();
        pv_B_psw1(password, cpwd);
    });
    $(".textbox-nick").focus(function () {
        $(".msg").html("");
        $(".txtPrompt-nn").css("color", "#BBEBFF");
        if (unpass && pwdpass && nnpass) {
            $(".txtPrompt-nn").show();
        }
    }).blur(function () {
        $(".txtPrompt-nn").css("color", "#BBEBFF");
        $(".txtPrompt-nn").hide();
        //pv_B_NickName(txtnick, cnick);
        CheckPwd2();
    });
    $(".tap-reg").click(function () {
        $(".tap-reg").css("background-image", "url('../Images/SPVisit/spvisit-tap-check.png')");
        $(".tap-reg").css("color", "#0C3853");

        $(".tap-login").css("background-image", "url('../Images/SPVisit/spvisit-tap.png')");
        $(".tap-login").css("color", "#5FC0F7");
        $("#reg").show();
        $("#login").hide();
    });
    $(".tap-login").click(function () {
        $(".tap-login").css("background-image", "url('../Images/SPVisit/spvisit-tap-check.png')");
        $(".tap-login").css("color", "#0C3853");

        $(".tap-reg").css("background-image", "url('../Images/SPVisit/spvisit-tap.png')");
        $(".tap-reg").css("color", "#5FC0F7");
        $("#reg").hide();
        $("#login").show();
    });

})

function changeImg(btn) //鼠标移入，更换图片
{
    btn.src = "/Images/SPVisit/btnLogin2.png";
}
function changeback(btn)//鼠标移出，换回原来的图片
{
    btn.src = "/Images/SPVisit/btnLogin.png";
}

function CheckPwd2() {
    $("#cnn").text("");
    if ($("#txtPsw").val() != $("#txtPsw2").val()) {
        $("#cnn").text("两次密码输入不一致");
        nnpass = false;
    } else {
        nnpass = true;
    }
}
//登录
function AjaxLogin() {
    $(".loginmsg").text("");
    if ($("#txtUsername").val() == "") {
        $(".loginmsg").text("请输入账号");
        return;
    }
    if ($("#txtPassword").val() == "") {
        $(".loginmsg").text("请输入密码");
        return;
    }
    if ($("#txtValidate").val() == "") {
        $(".loginmsg").text("请输入验证码");
        return;
    }

    var uid, pwd, code;
    uid = $("#txtUsername").val();
    pwd = $("#txtPassword").val();
    code = $("#txtValidate").val();
    $.post("/Ajax/Ajax_LogIn.aspx", { userName: uid, passWord: pwd, validate: code },
            function (data) {
                if (data == -403) {
                    $(".loginmsg").text("用户被锁定");
                }
                else if (data == -2) {
                    $(".loginmsg").text("验证码错误");
                }
                else if (data < 0) {
                    $(".loginmsg").text("账号或密码错误");
                }
                else if (data.length > 4) {
                    location.href = "/HallPage/HallPageFL.aspx";
                }
                ChangeCode();

            })
}

function G(id) {
    return document.getElementById(id);
}
String.prototype.length2 = function () {
    var cArr = this.match(/[^\x00-\xff]/ig);
    return this.length + (cArr == null ? 0 : cArr.length);
}
function BtnCheck() {

    pv_checkUID(userName, cUserName);
    pv_B_psw1(password, cpwd);
    //pv_B_NickName(txtnick, cnick);
    CheckPwd2();
    if (!unpass || !pwdpass || !nnpass) {
        return false
    } else {
        return true;
    }
}
/************/
var NotResource = "服务器中没有可用的资源...";
var sUserIDText = "4-15个字符，中、英文与数字组合的形式";
var userName = "txtUserName";
var cUserName = "unmsg";
var unpass = false;



function pv_checkUID(UID, CID) {
    var pun1 = pv_checkUID_0(UID, CID);
    if (pun1) {
        pv_checkUID_1(UID, CID);

    }
    else {
        G(CID).innerHTML = sUserIDText;

    }
}
function trim(str) { //删除左右两端的空格 
    return str.replace(/(^\s*)|(\s*$)/g, "");
}

function pv_checkUID_0(UID, CID) {
    var userID = trim(G(UID).value);
    //length
    var userIDLength = userID.length2();
    //不能为纯数字
    var reg = /^\d+$/;
    if (userIDLength < 4 || userIDLength > 15 || reg.test(userID)) {
        unpass = false;
        return false;
    }
    //test
    var vuserid = /^[a-zA-Z0-9\u4e00-\u9fa5_]+$/;
    if (!vuserid.test(userID)) {
        unpass = false;
        return false;
    }
    unpass = true;
    return true;
}
function pv_checkUID_1(UID, CID) {
    var userID = trim(G(UID).value);
    //ajax
    var url = "/RequestWebservice/Reg_CheckUserID.aspx";
    var method = "POST";
    var data = "i=" + encodeURIComponent(userID);
    $.ajax({
        type: "POST",
        async: false,  // 设置同步方式
        cache: false,
        url: url,
        data: data,
        success: function (result) {
            result = $(result).text();
            if (result == "0") {
                G(CID).innerHTML = "";
                return true;
            }
            else if (result == "1") {
                G(CID).innerHTML = "该帐号已经被注册";
                return false;
            }
            else if (result == "-1") {
                G(CID).innerHTML = "帐号中有系统屏蔽字";
                return false;
            }
            else {
                alert("暂无数据，请重新登录！" + result);
                return false;
            }
        }
    });
}

var password = "txtPsw";
var pwdtext = "密码长度在6-20位之间";
var cpwd = "cpassword";
var pwdpass = false;

function pv_B_psw1(password, cpwd) {
    G(cpwd).innerHTML = "";
    var password1 = G(password).value;
    if (password1.length < 6 || password1.length > 20) {
        G(cpwd).innerHTML = pwdtext;
        pwdpass = false;
    }
    else {
        pwdpass = true;
    }
}


//nickName
var sNickNameText_1 = "4-15个字符，中、英文与数字组合的形式。";
var sNickNameText_2 = "昵称中有系统屏蔽字";
var sNickNameText_3 = "该昵称已经被注册";
var cnick = "cnn";
var txtnick = "txtNickName";
//
var nnpass = false;
function pv_B_NickName(divNick_txtNickName, c_divNick_txtNickName) {
    var pun1 = pv_B_NickName_0(divNick_txtNickName, c_divNick_txtNickName)
    var nickName = G(divNick_txtNickName).value;
    var nickNameLength = nickName.length2();
    if (nickNameLength != 0 && pun1) {
        pv_B_NickName_1(divNick_txtNickName, c_divNick_txtNickName);
    }
    else {
    }
}

function pv_B_NickName_0(divNick_txtNickName, c_divNick_txtNickName) {
    var nickName = trim(G(divNick_txtNickName).value);
    var nickNameLength = nickName.length2();
    //不能为纯数字
    var reg = /^\d+$/;
    if (nickNameLength != 0 && (nickNameLength < 4 || nickNameLength > 15 || reg.test(nickName))) {
        nnpass = false;
        G(c_divNick_txtNickName).innerHTML = sNickNameText_1;
        return false;
    }
    var vnickName = /^[a-zA-Z0-9\u4e00-\u9fa5_]+$/;
    if (nickNameLength != 0 && !vnickName.test(nickName)) {
        nnpass = false;
        G(c_divNick_txtNickName).innerHTML = sNickNameText_1;
        return false;
    }
    return true;
}
function pv_B_NickName_1(divNick_txtNickName, c_divNick_txtNickName) {
    var nickName = trim(G(divNick_txtNickName).value);
    var url = "/RequestWebservice/Reg_CheckNickName.aspx";
    var method = "POST";
    var data = "n=" + encodeURIComponent(nickName);
    var objXMLHttp = xmlHttpPool._getInstance();
    with (objXMLHttp) {
        try {
            if (url.indexOf("?") > 0) {
                url += "&randnum=" + Math.random();
            }
            else {
                url += "?randnum=" + Math.random();
            }
            open(method, url, true);
            setRequestHeader("Content-Length", data.length);
            setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            send(data);
            onreadystatechange = function () {
                if (objXMLHttp.readyState == 4) {
                    if (objXMLHttp.status == 200 || objXMLHttp.status == 304) {
                        var xmlDoc = objXMLHttp.responseXML.getElementsByTagName("mu");
                        if (xmlDoc != null && xmlDoc[0] != null) {
                            xmlDoc = xmlDoc[0].firstChild.data;
                            G(c_divNick_txtNickName).innerHTML = "";
                            if (xmlDoc == "1") {
                                nnpass = true;
                                G(c_divNick_txtNickName).innerHTML = "";
                                return 1;
                            }
                            else if (xmlDoc == "-1") {
                                nnpass = false;
                                G(c_divNick_txtNickName).innerHTML = sNickNameText_2;
                                return -1;
                            } else if (xmlDoc == "-2") {
                                nnpass = false;
                                G(c_divNick_txtNickName).innerHTML = sNickNameText_1;
                                return -2;
                            }
                            else if (xmlDoc == "-3") {
                                nnpass = false;
                                G(c_divNick_txtNickName).innerHTML = sNickNameText_3;
                                return -3;
                            }
                        }
                    }
                    else {
                        nnpass = false;
                        G(c_divNick_txtNickName).innerHTML = "";
                        return -100;
                    } //not resource
                }
                else {
                } //wait...
            }
        }
        catch (e) {
            alert("浏览器异常");
        }
    }
}