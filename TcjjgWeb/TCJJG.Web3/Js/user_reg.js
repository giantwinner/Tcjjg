//user register
//
var userName = "ctl00_ContentPlaceHolder1_txtUserName";
var cUserName = "ctxtUserName";
var password = "ctl00_ContentPlaceHolder1_txtPsw1";
var cPassword = "cpassword1";
var password2 = "ctl00_ContentPlaceHolder1_txtPsw2";
var cPassword2 = "cpassword2";
var nickName = "ctl00_ContentPlaceHolder1_txtNickName";
var cNickName = "cnickName";
var valiNO = "ctl00_ContentPlaceHolder1_valiNO";
var cValiNO = "cvaliNO";
//zhao yu 修改注册 2011年12月15日12:48:25
var ddlProvince = "ctl00_ContentPlaceHolder1_ddlProvince";
var ddlCity = "ctl00_ContentPlaceHolder1_ddlCity";
var cddl = "cddl";
var vddl = "vddl";
var vtxtUserName = "vtxtUserName";
var vtxtPsw1 = "vtxtPsw1";
var vtxtPsw2 = "vtxtPsw2";
var vtxtNickName = "vtxtNickName";
var vvaliNO = "vvaliNO";
var statusYes = "<img src='../StyleSheet/img/pngyes.png' />"
var statusNo = "<img src='../StyleSheet/img/pngno.png' /> "

//选择省市
function reg_ddl() {
    $("#ctl00_ContentPlaceHolder1_txtUserName").addClass("textRegSel");
    $("#ctxtUserName").html("6-15个字符，中、英文与数字组合的形式");
    $("#ctxtUserName").css("color", "#484747");
    $("#ctxtUserName").show();
    $("#userNameFinish").hide();
    $("#userNameError").hide();
    if (G(ddlProvince).value == "0") {
        $("#cddError").show();
        $("#cddFinish").hide();
        $("#cddl").show();
    }
    else if (G(ddlCity).value == "0") {
        $("#cddError").show();
        $("#cddFinish").hide();
        $("#cddl").show();
    }
    else {
        $("#cddError").hide();
        $("#cddFinish").show();
        $("#cddl").hide();
    }

}
//userID
function reg_UserID() {
    $("#ctl00_ContentPlaceHolder1_txtUserName").removeClass("textRegSel");
    $("#ctxtUserName").css("color", "#ff0000");
    //    G(CID).innerHTML = "";
    //    G(vtxtUserName).innerHTML = statusYes;
    //    $("#" + CID + "").css("color", "#501908");

    //    G(vtxtUserName).innerHTML = statusNo;
    //    $("#" + cUserName + "").css("color", "red");
    //    //
    pv_checkUID(userName, cUserName);
    var ss = bUserID;

}
//psw1
function reg_F_psw1() {

    pv_F_psw1(cPassword, spsw1Text_1);
    
}
function reg_psw1() {
    $("#ctl00_ContentPlaceHolder1_txtPsw1").removeClass("textRegSel");
    $("#cpassword1").css("color", "#ff0000");
    G("cpassword1").innerHTML = "";
    var p1 = pv_B_psw1(password);
    if (p1 == "1") {
        $("#cpassword1").hide();
        $("#password1Error").hide();
        $("#password1Finish").show();
        return true;
    }
    else {
        //        G(vtxtPsw1).innerHTML = statusNo;
        G(cPassword).innerHTML = spsw1Text_1;
        $("#cpassword1").show();
        $("#password1Error").show();
        $("#password1Finish").hide();
        return false;
    }
}
//psw2
function reg_F_psw2() {
    pv_F_psw2(cPassword2, spsw2Text_1);
   
}
function reg_psw2() {
    $("#ctl00_ContentPlaceHolder1_txtPsw2").removeClass("textRegSel");
    $("#cpassword2").css("color", "#ff0000");
    var p2 = pv_B_psw2(password, password2);

    if (p2 == "1") {
        G(cPassword2).innerHTML = "";
        $("#cpassword2").hide();
        $("#password2Error").hide();
        $("#password2Finish").show();
        return true;
    }
    else if (p2 == "-1") {
        $("#cpassword2").show();
        $("#password2Error").show();
        $("#password2Finish").hide();
        G(cPassword2).innerHTML = spsw2Text_1;
        return false;
    }
    else {
        $("#cpassword2").show();
        $("#password2Error").show();
        $("#password2Finish").hide();
        G(cPassword2).innerHTML = spsw2Text_2;
        return false;
    }
}
//NickName
function reg_NickName() {
    //    G(vtxtNickName).innerHTML = statusNo;
    //    $("#" + cNickName + "").css("color", "red");
    //    //
    $("#ctl00_ContentPlaceHolder1_txtNickName").removeClass("textRegSel");
    $("#cnickName").css("color", "#ff0000");
    pv_B_NickName(nickName, cNickName)
}
//validate no
function checkValiRegOnblur(id) {
    $("#ctl00_ContentPlaceHolder1_valiNO").removeClass("textRegSel");
    $("#cvaliNO").css("color", "#ff0000");
    var valiNO = G(id).value;
    if (valiNO.length != 4) {
        G('cvaliNO').innerHTML = "请正确输入验证码";
        $("#cvaliNO").show();
        $("#valiFinish").hide();
        $("#valiError").show();
        return false;
    }
    else {
        G('cvaliNO').innerHTML = "";
        $("#cvaliNO").hide();
        $("#valiFinish").show();
        $("#valiError").hide();
        return true;
    }
}
//isOKcheckbox
function isOKcheckbox() {
    var bIsOk = false;
    var r = document.getElementsByName("isOKcheckbox");
    for (var i = 0; i < r.length; i++) {
        if (r[i].checked) {
            bIsOk = true;
        }
    }
    if (bIsOk) {
        G("cisOK").innerHTML = "";
        return true;
    }
    else {
        G("cisOK").innerHTML = "不同意许可协议不能注册";
        return false;
    }
}
//recipient
function reg_Recipient() {
    var txtRecipient = G("txtRecipient").value;
    if (txtRecipient == null || txtRecipient == "") {
        G("c_div_txtRecipient").innerHTML = sRecipientText_2;
        G("c_div_txtRecipient").className = "textPromptSpan1";
        return true;
    }
    else {
        var s = pv_B_Recipient("txtRecipient");
        if (s == "1") {
            G("c_div_txtRecipient").innerHTML = "";
            return true;
        }
        else {
            G("c_div_txtRecipient").className = "textPromptSpan2";
            G("c_div_txtRecipient").innerHTML = sRecipientText_1;
            return false;
        }
    }
}
//Address
function reg_Address() {
    var txtAddress = G("txtAddress").value;
    if (txtAddress == null || txtAddress == "") {
        G("c_div_txtAddress").innerHTML = sAddressText_2;
        G("c_div_txtAddress").className = "textPromptSpan1";
        return true;
    }
    else {
        var as = pv_B_Address("txtAddress");
        if (as == "1") {
            G("c_div_txtAddress").innerHTML = "";
            return true;
        }
        else {
            G("c_div_txtAddress").className = "textPromptSpan2";
            G("c_div_txtAddress").innerHTML = sAddressText_1;
            return false;
        }
    }
}
//Email
function reg_Email() {
    var txtEmail = G("txtEmail").value;
    if (txtEmail == null || txtEmail == "") {
        G("div_txtEmailAndAdd").innerHTML = sEmailText_2;
        G("div_txtEmailAndAdd").className = "textPromptSpan1";
        return true;
    }
    else {
        var se = pv_B_Email("txtEmail");
        if (se == "1") {
            G("div_txtEmailAndAdd").innerHTML = "";
            return true;
        }
        else if (se == "-1") {
            G("div_txtEmailAndAdd").className = "textPromptSpan2";
            G("div_txtEmailAndAdd").innerHTML = sEmailText_1;
            return false;
        }
        else {
            G("div_txtEmailAndAdd").className = "textPromptSpan2";
            G("div_txtEmailAndAdd").innerHTML = sEmailText_3;
            return false;
        }
    }
}

//提示问题答案：Added by liulj 2010-7-16
function reg_PwdAnswer() {
    if (getSelectedValue() != "0") {
        var tmpStr = Trim(G("txtPwdAnswer").value);
        if (tmpStr == "") {
            G("c_div_txtPwdAnswer").className = "textPromptError";
            G("c_div_txtPwdAnswer").innerHTML = sPwdAnswer;
            G("c_div_txtPwdAnswer").focus();
            return false;
        } else if (tmpStr.length > 64) {
            G("c_div_txtPwdAnswer").className = "textPromptError";
            G("c_div_txtPwdAnswer").innerHTML = sPwdAnswer_1;
            G("c_div_txtPwdAnswer").focus();
            return false;
        }
    }
    return true;
}

//Pro
function reg_O_TuiG() {
    var txtTuiG = G("txtTuiG").value;
    if (txtTuiG == null || txtTuiG == "") {
        G("c_div_txtTuiG").innerHTML = sProText_2;
        return true;
    }
    else {
        var se = pv_B_TuiG("txtTuiG");
        if (se == "1") {
            G("c_div_txtTuiG").innerHTML = "";
            return true;
        }
        else {
            G("c_div_txtTuiG").innerHTML = sProText_1;
            return false;
        }
    }
}
//submit
function O_Submit_btnOK(ms) {

    reg_ddl();
    reg_UserID();
    reg_psw1();
    reg_psw2();
    reg_NickName();
   // reg_RealName();
    //reg_identityCard();
    reg_Servies1();
    reg_Servies2();
    checkValiRegOnblur('ctl00_ContentPlaceHolder1_valiNO');
    //必填
    if (!pv_checkUID_0(userName, cUserName)) {
        return false;
    }
    if (!reg_psw1()) {
        G(cPassword).className = "textPromptError";
        return false;
    }
    if (!reg_psw2()) {
        G(cPassword2).className = "textPromptError";
        return false;
    }
    if (!pv_B_NickName_0(nickName, cNickName)) {
        G(cNickName).className = "textPromptError";
        return false;
    }
//    if (!reg_RealName()) {
//        return false;
//    }
//    if (!reg_identityCard()) {
//        return false;
//    }
    if (!reg_Servies1()) {
        return false;
    }
    if (!reg_Servies2()) {
        return false;
    }

    //
    if (ms == "0") {
        if (!checkValiRegOnblur(valiNO)) {
            return false;
        }
    }
    else {//SendMessage == 1
        if (!checkValiRegOnblur('ctl00_ContentPlaceHolder1_txtMovePhoneValiNO')) {
            return false;
        }
    }
    //
    return true;
}
//get user pid
function load_prid() {
    var pid = request.QueryString("pid");
    if (null == pid || "" == pid) {
        G("div_prid_d").className = "div_RegMain25_text_c_div";
    }
}
//
function f_reg_isLogin() {
    window.location.href = "/UserCenter/UserLogin.aspx";
}
//顺手填点信息
function f_reg_must_cla() {
    try {
        var bmOk = false;
        var r = document.getElementsByName("isNotMustWr");
        for (var i = 0; i < r.length; i++) {
            if (r[i].checked) {
                bmOk = true;
            }
        }
        if (bmOk) {
            G("reg_must_sum").className = "regdiv_must_smod1"; //
        }
        else {
            G("reg_must_sum").className = "displayNone";
        }
        G("div_must_smod").className = "regdiv_must_smod1";
    } catch (e) { }
}
//获取当前选定的div_stPwdQuestion选定的值   Added by liulj 2010-7-16
function getSelectedValue() {
    try {
        return G("DDLPsw").options[G("DDLPsw").selectedIndex].value;
    } catch (e) { return "0" }
}
function LTrim(str) {
    var i;
    for (i = 0; i < str.length; i++) {
        if (str.charAt(i) != " " && str.charAt(i) != " ") break;
    }
    str = str.substring(i, str.length);
    return str;
}
function RTrim(str) {
    var i;
    for (i = str.length - 1; i >= 0; i--) {
        if (str.charAt(i) != " " && str.charAt(i) != " ") break;
    }
    str = str.substring(0, i + 1);
    return str;
}
function Trim(str) {
    return LTrim(RTrim(str));
}
//
function F_sendMessages() {
    var msg = "1";
    var url = "/requestwebservice/regsendmessages.aspx";
    var method = "POST";
    var data = "un=" + encodeURI(encodeURI(G(userName).value)) + "&nn=" + encodeURI(encodeURI(G(nickName).value));
    data += "&mp=" + encodeURI(encodeURI(G("ctl00_ContentPlaceHolder1_txtMovePhone").value));
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
                        F_sendMessages_CallBack(objXMLHttp);
                    }
                    else {//not resource
                    }
                }
                else { //wait...
                }
            }
        }
        catch (e) {
            alert("浏览器异常");
        }
    }
}
function F_sendMessages_CallBack(objXMLHttp) {
    var mi = "-1";
    try {
        mi = objXMLHttp.responseXML.getElementsByTagName("mi")[0].firstChild.data;
        if (mi == "-100") {
            G('ctl00_ContentPlaceHolder1_labMsg').innerHTML = "帐号或昵称为空";
        }
        else if (mi == "-101") {
            G('ctl00_ContentPlaceHolder1_labMsg').innerHTML = "手机号码不正确";
        }
        else if (mi == "-102" || mi == "-103" || mi == "-104") {
            G('ctl00_ContentPlaceHolder1_labMsg').innerHTML = "您今天已经发送10条短信了，明天再来吧";
        }
        else if (mi == "-105") {
            G('ctl00_ContentPlaceHolder1_labMsg').innerHTML = "您的手机号码已经被注册";
        }
        else if (mi == "-300") {
            window.location.href = "/UserCenter/userReg.aspx";
        }
        else if (mi == "0") {
            G('ctl00_ContentPlaceHolder1_labMsg').innerHTML = "";
            //
            G('btnSendMessages').disabled = true;
        }
    }
    catch (e) {
    }
}

////真是姓名
//function reg_RealName() {
//    $("#ctl00_ContentPlaceHolder1_txtRealName").removeClass("textRegSel");
//    $("#promptRealName").css("color", "#ff0000");
//    var realName = $("#ctl00_ContentPlaceHolder1_txtRealName").val().replace(/[^\x00-\xff]/g, "  ").length;
//    if (realName < 4) {
//        $("#promptRealName").show();
//        $("#realNameError").show();
//        $("#realNameFinish").hide();
//        return false;
//    }
//    else {
//        $("#promptRealName").hide();
//        $("#realNameError").hide();
//        $("#realNameFinish").show();
//        return true;
//    }

//}

////身份证号
//function reg_identityCard() {
//    $("#ctl00_ContentPlaceHolder1_txtIdentityCard").removeClass("textRegSel");
//    $("#promptIdentityCard").css("color", "#ff0000");
//    var identityCard = $("#ctl00_ContentPlaceHolder1_txtIdentityCard").val().replace(/[^\x00-\xff]/g, "  ").length;
//    if (identityCard == 18) {
//        $("#promptIdentityCard").hide();
//        $("#idCardError").hide();
//        $("#idCardFinish").show();
//        return true;
//    }
//    else {
//        $("#promptIdentityCard").show();
//        $("#idCardError").show();
//        $("#idCardFinish").hide();
//        return false;
//    }
//}

//服务条款
function reg_Servies1() {
    if ($("#ctl00_ContentPlaceHolder1_CheckBox1").attr("checked")) {
        $("#check1").hide();
        $("#check1Finish").show();
        $("#check1Error").hide();
        return true;
    }
    else {

        $("#check1").show();
        $("#check1Finish").hide();
        $("#check1Error").show();
        return false;
    }
}

function reg_Servies2() {
    if ($("#ctl00_ContentPlaceHolder1_CheckBox2").attr("checked")) {

        $("#check2").hide();
        $("#check2Finish").show();
        $("#check2Error").hide();
        return true;
    }
    else {
        $("#check2").show();
        $("#check2Finish").hide();
        $("#check2Error").show();
        return false;
    }
}

function regFous_Pass1() {
    $("#ctl00_ContentPlaceHolder1_txtPsw1").addClass("textRegSel");
    $("#cpassword1").html("密码长度在6-20位之间");
    $("#cpassword1").css("color", "#484747");
    $("#cpassword1").show();
    $("#password1Finish").hide();
    $("#password1Error").hide();
}
function regFous_Pass2() {
    $("#ctl00_ContentPlaceHolder1_txtPsw2").addClass("textRegSel");
    $("#cpassword2").html("重复密码长度在6-20位之间");
    $("#cpassword2").css("color", "#484747");
    $("#cpassword2").show();
    $("#password2Finish").hide();
    $("#password2Error").hide();
}
function regFous_NickName() {
    $("#ctl00_ContentPlaceHolder1_txtNickName").addClass("textRegSel");
    $("#cnickName").html("6-15个字符，中、英文与数字组合的形式,可以不填昵称，如果不填昵称，系统将随机生成一个新的昵称。请勿注册不雅昵称。注册不雅昵称者在比赛中夺冠，影响恶劣，我们有权没收冠军奖励！");
    $("#cnickName").css("color", "#484747");
    $("#cnickName").show();
    $("#nickNameFinish").hide();
    $("#nickNameError").hide();
}
function regFous_RealName() {
    $("#ctl00_ContentPlaceHolder1_txtRealName").addClass("textRegSel");
    $("#promptRealName").show();
    $("#promptRealName").css("color", "#484747");
    $("#realNameFinish").hide();
    $("#realNameError").hide();
}
function regFous_IdentityCard() {
    $("#ctl00_ContentPlaceHolder1_txtIdentityCard").addClass("textRegSel");
    $("#promptIdentityCard").show();
    $("#promptIdentityCard").css("color", "#484747");
    $("#idCardFinish").hide();
    $("#idCardError").hide();
}
function regFous_valiNO() {
    $("#ctl00_ContentPlaceHolder1_valiNO").addClass("textRegSel");
    $("#cvaliNO").css("color", "#484747");
    $("#cvaliNO").html("请输入4位验证码");
    $("#cvaliNO").show();
    $("#valiFinish").hide();
    $("#valiError").hide();
}


function regFous_SpreadUser() {
    $("#ctl00_ContentPlaceHolder1_txtSpreadUser").addClass("textRegSel");
}
function regBlur_SpreadUser() {
    $("#ctl00_ContentPlaceHolder1_txtSpreadUser").removeClass("textRegSel");
}
function regFous_Gender() {
    $("#ctl00_ContentPlaceHolder1_ddlGender").addClass("textRegSel");
}
function regBlur_Gender() {
    $("#ctl00_ContentPlaceHolder1_ddlGender").removeClass("textRegSel");
}
function regFous_Job() {
    $("#ctl00_ContentPlaceHolder1_ddlWork").addClass("textRegSel");
}
function regBlur_Job() {
    $("#ctl00_ContentPlaceHolder1_ddlWork").removeClass("textRegSel");
}
function regFous_Birthday() {
    $("#ctl00_ContentPlaceHolder1_txtBirthday").addClass("textRegSel");
}
function regBlur_Birthday() {
    $("#ctl00_ContentPlaceHolder1_txtBirthday").removeClass("textRegSel");
}
function regFous_Phone() {
    $("#ctl00_ContentPlaceHolder1_txtPhone").addClass("textRegSel");
}
function regBlur_Phone() {
    $("#ctl00_ContentPlaceHolder1_txtPhone").removeClass("textRegSel");
}




