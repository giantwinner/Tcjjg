//user amply info change
//////////////////////////head
//defaultUserHead//defaultUserHeadBtn
function O_head_btn() {
    var newHead = $("input[name!='s']:radio:checked").val();
    var sex = $("#ctl00_ContentPlaceHolder1_DivSex").text();
    if (newHead == null || newHead == "") {
        newHead = $("#ctl00_ContentPlaceHolder1_img_CurrentHeadImage").attr("src");
    }
    else {
        newHead = newHead + ".jpg";
    }
    G("div_defaultUserHeadBtn_callback_lab").innerHTML = "";
    G("defaultUserHeadBtn").style.display = "none";
    //TODO
    var url = "/RequestWebservice/User_Head.aspx";
    var method = "POST";
    var data = "h=" + newHead + "&s=" + sex;
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
                        callbackUserHeadID(objXMLHttp);
                    }
                    else {
                        G("div_defaultUserHeadBtn_callback_lab").innerHTML = "服务器中没有可用的资源...";
                        G("div_defaultUserHeadBtn_wait").innerHTML = "";
                    } //not resource
                }
                else { } //wait...
            }
        }
        catch (e) {
            alert("浏览器异常");
        }
    }
}
function callbackUserHeadID(xmlHttp) {
    var xmlHP = xmlHttp.responseXML.getElementsByTagName("hp");
    if (xmlHP != null && xmlHP[0] != null) {
        xmlHP = xmlHP[0].firstChild.data;
    } else {
        xmlHP = "-100";
    }
    switch (xmlHP) {
        case "1":
            G("div_defaultUserHeadBtn_callback_lab").innerHTML = "您成功的更新了头像！";


            break;
        default: //-
            G("div_defaultUserHeadBtn_callback_lab").innerHTML = "暂无数据，请重新登录";
    }
    G("div_defaultUserHeadBtn_wait").innerHTML = "";
    G("defaultUserHeadBtn").style.display = "block";
}
//old user head
function Load_UserHeadID(headID, sex, question, answer) {
    G("ctl00_ContentPlaceHolder1_img_CurrentHeadImage").src = headID;
    headID = getImgageFileName(headID);
    if (headID == "head0" || headID == "head0") {
        if (headID == "head0") {
            setCheckedValue("s1", "s");
        }
        else {
            setCheckedValue("s2", "s");
        }
    }
    else {
        setCheckedValue("s" + sex, "s");
    }
    if (question > 0) {
        //jsSelectItemByValue(G("divChangePsw_question"), question);
    }
    else {
        //jsSelectItemByValue(G("divChangePsw_question"), 0);
    }
    if (answer != "") {
        //G("divChangePsw_answer").value = answer;
    }
}
//////////////////////////psw
//loadWait_divChangePsw_btnOK//loadWait_divChangePsw
function O_ChangePsw_btnOK() {
    if (!B_ChangePsw_oldPassword_I()) {
        return;
    }
    if (!B_divChangePsw_password1_I()) {
        return;
    }
    if (!B_divChangePsw_password2_I()) {
        return;
    }
    if (!reg_PwdAnswer()) {
        return;
    }
    //
    G("divChangePsw_callback_lab").innerHTML = "";
    G("loadWait_divChangePsw_btnOK").style.display = "none";
    //TODO 
    var oldPassword = G("divChangePsw_oldPassword").value;
    var password1 = G("divChangePsw_password1").value;
    var content = "op=" + encodeURIComponent(MD5(oldPassword));
    content += "&p=" + encodeURIComponent(MD5(password1));
    content += "&q=" + encodeURIComponent(getSelectedValue());
    content += "&a=" + encodeURIComponent(G("divChangePsw_answer").value);
    var url = "../RequestWebservice/User_ChangePsw.aspx";
    var method = "POST";
    var data = content;
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
                        callbackUserChangePsw(objXMLHttp);
                    }
                    else {
                        G("divChangePsw_callback_lab").innerHTML = "服务器中没有可用的资源...";
                        G("loadWait_divChangePsw").innerHTML = "";
                        G("loadWait_divChangePsw_btnOK").style.display = "block";
                    } //not resource
                }
                else { } //wait...
            }
        }
        catch (e) {
            alert("浏览器异常");
        }
    }
}
function callbackUserChangePsw(xmlHttp) {
    var mes = xmlHttp.responseXML.getElementsByTagName("pt");
    if (mes != null && mes[0] != null) {
        mes = mes[0].firstChild.data;
    } else {
        mes = "-100";
    }
    switch (mes) {
        case "-100":
            SessOrErrorUserChangePsw("-100");
            break;
        case "-3":
            SessOrErrorUserChangePsw("-1005");
            break;
        case "1":
            SessOrErrorUserChangePsw("9000");
            break;
        default: //-1
            SessOrErrorUserChangePsw("-1017");
    }
}
function SessOrErrorUserChangePsw(status) {
    var opeStr;
    //
    if (status == "9000") {
        opeStr = "您成功的修改了密码!";
        //
        jsSelectItemByValue(G("divChangePsw_question"), 0);
        G("divChangePsw_answer").value = "";
    }
    else if (status == "-1017") {
        opeStr = "您的原始密码错误，请重试...";
    }
    else if (status == "-100") {
        opeStr = "暂无数据，请重新登录";
    }
    G("loadWait_divChangePsw").innerHTML = "";
    G("divChangePsw_callback_lab").innerHTML = opeStr;
    G("loadWait_divChangePsw_btnOK").style.display = "block";
    G("divChangePsw_oldPassword").value = "";
    G("divChangePsw_password1").value = "";
    G("divChangePsw_password2").value = "";
}
//divChangePsw_oldPassword //c_divChangePsw_oldPassword
function F_ChangePsw_oldPassword_I() {
    pv_F_psw1("c_divChangePsw_oldPassword", spsw1Text_3);
}
function B_ChangePsw_oldPassword_I() {
    var p = pv_B_psw1("divChangePsw_oldPassword");
    if (p == "1") {
        G("c_divChangePsw_oldPassword").innerHTML = "";
        return true;
    }
    else {
        G("c_divChangePsw_oldPassword").innerHTML = "";
        return false;
    }
}
//divChangePsw_password1//c_divChangePsw_password1
function F_divChangePsw_password1_I() {
    pv_F_psw1("c_divChangePsw_password1", spsw1Text_1);
}
function B_divChangePsw_password1_I() {
    var p = pv_B_psw1("divChangePsw_password1");
    if (p == "1") {
        G("c_divChangePsw_password1").innerHTML = "";
        return true;
    }
    else {
        G("c_divChangePsw_password1").innerHTML = spsw1Text_1;
        return false;
    }
}
//divChangePsw_password2//c_divChangePsw_password2
function F_divChangePsw_password2_I() {
    pv_F_psw2("c_divChangePsw_password2", spsw2Text_1);
}
function B_divChangePsw_password2_I() {
    var p2 = pv_B_psw2("divChangePsw_password1", 'divChangePsw_password2');
    if (p2 == "1") {
        G("c_divChangePsw_password2").innerHTML = "";
        return true;
    }
    else if (p2 == "-1") {
        G("c_divChangePsw_password2").innerHTML = spsw2Text_1;
        return false;
    }
    else {
        G("c_divChangePsw_password2").innerHTML = spsw2Text_2;
        return false;
    }
}
////////////////////////////awardAddress
//loadWait_divAwardAdd_btnOK//loadWait_divAwardAdd
function O_AwardAdd_btnOK() {
    if (!B_AwardAdd_txtAddress() || !B_AwardAdd_txtPostNumber() || !B_AwardAdd_txtRecipient() || !B_AwardAdd_txtEmail() || !B_AwardAdd_txtPsw()) {
        return;
    }
    //
    G("divAwardAdd_callback_lab").innerHTML = "";
    G("loadWait_divAwardAdd_btnOK").style.display = "none";
    //TODO
    var ps = MD5(G("divAwardAdd_txtPsw").value);
    var recipient = G("divAwardAdd_txtRecipient").value;
    var email = G("divAwardAdd_txtEmail").value;
    var address = G("divAwardAdd_txtAddress").value;
    var postNumber = G("divAwardAdd_txtPostNumber").value;
    //
    var content = "r=" + encodeURIComponent(recipient);
    content += "&e=" + encodeURIComponent(email);
    content += "&a=" + encodeURIComponent(address);
    content += "&n=" + postNumber;
    content += "&ps=" + ps;
    content += "&ty=1";
    //
    var url = "/RequestWebservice/User_ChangeUserInfoAmply.aspx";
    var method = "POST";
    var data = content;
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
                        SessOrErrorUserChangeInfo(objXMLHttp);
                    }
                    else {
                        G("divAwardAdd_callback_lab").innerHTML = "服务器中没有可用的资源...";
                        G("loadWait_divAwardAdd").innerHTML = "";
                        G("loadWait_divAwardAdd_btnOK").style.display = "block";
                    } //not resource
                }
                else { } //wait...
            }
        }
        catch (e) {
            alert("浏览器异常");
        }
    }
}
//divAwardAdd_txtAddress//c_divAwardAdd_txtAddress
function F_AwardAdd_txtAddress() {
}
function B_AwardAdd_txtAddress() {
    var p = pv_B_Address("divAwardAdd_txtAddress");
    if (p == "1") {
        G("c_divAwardAdd_txtAddress").innerHTML = "";
        return true;
    }
    else {
        G("c_divAwardAdd_txtAddress").innerHTML = sAddressText_1;
        return false;
    }
}
//divAwardAdd_txtPostNumber//c_divAwardAdd_txtPostNumber
function F_AwardAdd_txtPostNumber() {

}
function B_AwardAdd_txtPostNumber() {
    var p = pv_B_PostNumber('divAwardAdd_txtPostNumber');
    if (p == "1") {
        G("c_divAwardAdd_txtPostNumber").innerHTML = "";
        return true;
    }
    else {
        G("c_divAwardAdd_txtPostNumber").innerHTML = sPostNumberText_1;
        return false;
    }
}
//divAwardAdd_txtRecipient//cdivAwardAdd_txtRecipient
function F_AwardAdd_txtRecipient() {

}
function B_AwardAdd_txtRecipient() {
    var p = pv_B_Recipient("divAwardAdd_txtRecipient");
    if (p == "1") {
        G("cdivAwardAdd_txtRecipient").innerHTML = "";
        return true;
    }
    else {
        G("cdivAwardAdd_txtRecipient").innerHTML = sRecipientText_3;
        return false;
    }
}
//divAwardAdd_txtEmail//c_divAwardAdd_txtEmail
function F_AwardAdd_txtEmail() {

}
function B_AwardAdd_txtEmail() {
    var se = pv_B_Email('divAwardAdd_txtEmail');
    if (se == "1") {
        G("c_divAwardAdd_txtEmail").innerHTML = "";
        return true;
    }
    else if (se == "-1") {
        G("c_divAwardAdd_txtEmail").innerHTML = sEmailText_1;
        return false;
    }
    else {
        G("c_divAwardAdd_txtEmail").innerHTML = sEmailText_3;
        return false;
    }
}
//divAwardAdd_txtPsw//c_divAwardAdd_txtPsw
function F_AwardAdd_txtPsw() {
    pv_F_psw1("c_divAwardAdd_txtPsw", spsw1Text_4);
}
function B_AwardAdd_txtPsw() {
    var p = pv_B_psw1("divAwardAdd_txtPsw");
    if (p == "1") {
        G("c_divAwardAdd_txtPsw").innerHTML = "";
        return true;
    }
    else {
        G("c_divAwardAdd_txtPsw").innerHTML = spsw1Text_1;
        return false;
    }
}
//
 
function SessOrErrorUserChangeInfo(xmlHttp) {
    var ms = xmlHttp.responseXML.getElementsByTagName("ms");
    if (ms != null && ms[0] != null) {
        ms = ms[0].firstChild.data;
    }
    else {
        ms = "-100";
    }
    //
    if (ms == "9001") {
        G("divAwardAdd_callback_lab").innerHTML = "您成功的修改了领奖地址!";
    }
    else if (ms == "-900") {
        G("divAwardAdd_callback_lab").innerHTML = "用户密码错误，请重试...";
    }
    else {
        G("divAwardAdd_callback_lab").innerHTML = "暂无数据，请重新登录";
    }
    //
    G("loadWait_divAwardAdd").innerHTML = "";
    G("loadWait_divAwardAdd_btnOK").style.display = "block";
    G("divAwardAdd_txtPsw").value = "";
}

//设置select中text="paraText"的第一个Item为选中 Added by liulj 2010-7-19
function jsSelectItemByValue(objSelect, objItemText) {
    for (var i = 0; i < objSelect.options.length; i++) {
        if (objSelect.options[i].value == objItemText) {
            objSelect.options[i].selected = true;
            break;
        }
    }
}

//获取当前选定的div_stPwdQuestion选定的值   Added by liulj 2010-7-16
function getSelectedValue() {
    try {
        return G("divChangePsw_question").options[G("divChangePsw_question").selectedIndex].value;
    } catch (e) { return "0" }
}

//提示问题答案：Added by liulj 2010-7-16
function reg_PwdAnswer() {
    if (getSelectedValue() != "0") {
        var tmpStr = Trim(G("divChangePsw_answer").value);
        if (tmpStr == "") {
            G("c_divChangePsw_answer").innerHTML = sPwdAnswer;
            G("c_divChangePsw_answer").focus();
            return false;
        } else if (tmpStr.length > 64) {
            G("c_divChangePsw_answer").innerHTML = sPwdAnswer_1;
            G("c_divChangePsw_answer").focus();
            return false;
        }
    }
    return true;
}

//Added by liulj 2010-7-20 对字符串空格进行处理
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
/////////////////////////////////

