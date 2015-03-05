//user_validate

var NotResource = "服务器中没有可用的资源...";
//zhao yu 修改注册 2011年12月15日12:48:25
var statusYes = "<img src='../StyleSheet/img/pngyes.png' />"
var statusNo = "<img src='../StyleSheet/img/pngno.png' /> "

function LoadWait1(id) {
    //G(id).innerHTML = "<img src=\"../Images/images2/loading1.gif\" alt=\"正在加载数据...\" height=\"20\" width=\"20\"  />";
    //2010-02-02
}
//userID
var sUserIDText = "6-15个字符，中、英文与数字组合的形式";
//
var bUserID = false;
function pv_checkUID(UID, CID) {
    var pun1 = pv_checkUID_0(UID, CID);
    if (pun1) {
        pv_checkUID_1(UID, CID);

    }
    else {
        //        G(vtxtUserName).innerHTML = statusNo;
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
    if (userIDLength < 6 || userIDLength > 15 || reg.test(userID)) {
        //        G(CID).innerHTML = sUserIDText;
        $("#ctxtUserName").show();
        $("#userNameError").show();
        $("#userNameFinish").hide();
        bUserID = false;
        return false;
    }
    //test
    var vuserid = /^[a-zA-Z0-9\u4e00-\u9fa5_]+$/;
    if (!vuserid.test(userID)) {
        //G(CID).innerHTML = sUserIDText;
        bUserID = false;
        $("#ctxtUserName").show();
        $("#userNameError").show();
        $("#userNameFinish").hide();
        return false;
    }
    $("#" + userName + "").removeClass("textSelect");
    $("#ctxtUserName").hide();
    $("#userNameError").hide();
    $("#userNameFinish").show();
    return true;
}
function pv_checkUID_1(UID, CID) {
    var userID = trim(G(UID).value);
    //ajax
    LoadWait1(CID);
    var url = "/RequestWebservice/Reg_CheckUserID.aspx";
    var method = "POST";
    var data = "i=" + encodeURIComponent(userID);
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
                        bUserID = callback_pv_checkUID_1(objXMLHttp, CID);
                    }
                    else {//not resource
                        G(CID).innerHTML = NotResource;
                        bUserID = false;
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
function callback_pv_checkUID_1(objXMLHttp, CID) {
    var mes = "-1";
    try {
        mes = objXMLHttp.responseXML.getElementsByTagName("mi")[0].firstChild.data;
    }
    catch (e) {

    }
    if (mes == "0") {
        G(CID).innerHTML = "";
        //        G(vtxtUserName).innerHTML = statusYes;
        $("#ctxtUserName").hide();
        $("#userNameError").hide();
        $("#userNameFinish").show();
        return true;
    }
    else if (mes == "1") {
        //        G(vtxtUserName).innerHTML = statusNo;
        G(CID).innerHTML = "该帐号已经被注册";
        $("#ctxtUserName").show();
        $("#userNameError").show();
        $("#userNameFinish").hide();
        return false;
    }
    else if (mes == "-1") {
        //        G(vtxtUserName).innerHTML = statusNo;
        G(CID).innerHTML = "帐号中有系统屏蔽字";
        $("#ctxtUserName").show();
        $("#userNameError").show();
        $("#userNameFinish").hide();
        return false;
    }
    else {
        alert("暂无数据，请重新登录！");
        return false;
    }
}
//psw1
var spsw1Text_1 = "密码长度在6-20位之间";
var spsw1Text_2 = "修改昵称需要密码确认";
var spsw1Text_3 = "请输入原密码";
var spsw1Text_4 = "修改领奖地址需要密码确认";
var spsw1Text_5 = "兑奖需要密码确认";

//G(Name)==控件
function pv_F_psw1(c_psw1, spsw1Text) {
    G(c_psw1).innerHTML = spsw1Text;
}
function pv_B_psw1(psw1) {
    var password1 = G(psw1).value;
    if (password1.length < 6 || password1.length > 20) {
        $("#" + password + "").addClass("textSelect");
        return -1;
    }
    else {
        $("#" + password + "").removeClass("textSelect");
        return 1;
    }
}
//psw2
var spsw2Text_1 = "重复密码长度在6-20位之间";
var spsw2Text_2 = "密码和重复密码不同";
//
function pv_F_psw2(c_psw2, spsw2Text) {
    G(c_psw2).innerHTML = spsw2Text;
}
function pv_B_psw2(psw1, psw2) {
    var password2 = G(psw2).value;
    if (password2.length < 6 || password2.length > 20) {
        return -1;
    }
    else if (G(psw1).value != G(psw2).value) {
        return -2;
    }
    else {
        return 1;

    }
}
//nickName
var sNickNameText_1 = "6-15个字符，中、英文与数字组合的形式,可以不填昵称，如果不填昵称，系统将随机生成一个新的昵称。请勿注册不雅昵称。注册不雅昵称者在比赛中夺冠，影响恶劣，我们有权没收冠军奖励！";
var sNickNameText_2 = "昵称中有系统屏蔽字";
var sNickNameText_3 = "该昵称已经被注册";
//
function pv_F_NickName(c_divNick_txtNickName, sNickNameText) {
    G(c_divNick_txtNickName).innerHTML = sNickNameText;
}
var bNickName = false;
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
    if (nickNameLength != 0 && (nickNameLength < 6 || nickNameLength > 15 || reg.test(nickName))) {
        bNickName = false;
        G(c_divNick_txtNickName).innerHTML = sNickNameText_1;
        $("#cnickName").show();
        $("#nickNameFinish").hide();
        $("#nickNameError").show();
        return false;
    }
    var vnickName = /^[a-zA-Z0-9\u4e00-\u9fa5_]+$/;
    if (nickNameLength != 0 && !vnickName.test(nickName)) {
        bNickName = false;
        G(c_divNick_txtNickName).innerHTML = sNickNameText_1;
        $("#cnickName").show();
        $("#nickNameFinish").hide();
        $("#nickNameError").show();
        return false;
    }
    $("#cnickName").hide();
    $("#nickNameFinish").show();
    $("#nickNameError").hide();
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
                            if (xmlDoc == "1") {
                                bNickName = true;
                                G(c_divNick_txtNickName).innerHTML = "";
                                //zhaoyu 2011年12月15日17:42:59v
                                //                                G(vtxtNickName).innerHTML = statusYes;
                                return 1;
                            }
                            else if (xmlDoc == "-1") {
                                bNickName = false;
                                G(c_divNick_txtNickName).innerHTML = sNickNameText_2;
                                $("#cnickName").show();
                                $("#nickNameFinish").hide();
                                $("#nickNameError").show();
                                return -1;
                            } else if (xmlDoc == "-2") {
                                bNickName = false;
                                G(c_divNick_txtNickName).innerHTML = sNickNameText_1;
                                $("#cnickName").show();
                                $("#nickNameFinish").hide();
                                $("#nickNameError").show();
                                return -2;
                            }
                            else if (xmlDoc == "-3") {
                                bNickName = false;
                                G(c_divNick_txtNickName).innerHTML = sNickNameText_3;
                                $("#cnickName").show();
                                $("#nickNameFinish").hide();
                                $("#nickNameError").show();
                                return -3;
                            }
                        }
                    }
                    else {
                        bNickName = false;
                        G(c_divNick_txtNickName).innerHTML = "";
                        return -100;
                    } //not resource
                }
                else {
                    //LoadWait1(c_divNick_txtNickName);
                } //wait...
            }
        }
        catch (e) {
            alert("浏览器异常");
        }
    }
}
//Recipient
var sRecipientText_1 = "真实姓名长度为2-30个字符";
var sRecipientText_2 = ""; //"完善真实姓名送1000金币";
var sRecipientText_3 = "收件人长度在2-30个字符以内";
//
function pv_F_Recipient(c_txtRecipient) {
}
function pv_B_Recipient(txtRecipient) {
    var re = G(txtRecipient).value;
    var reLength = re.length2();
    if (reLength < 2 || reLength > 30) {
        return -1;
    }
    else {
        return 1;
    }
}
//Address
var sAddressText_1 = "邮寄地址长度为10-120个字符";
var sAddressText_2 = ""; //"完善邮寄地址送500金币";
//
function pv_F_Address(div_txtAddress) {
}
function pv_B_Address(div_txtAddress) {
    var address = G(div_txtAddress).value;
    var addressLength = address.length2();
    if (addressLength < 10 || addressLength > 120) {
        return -1;
    }
    else {
        return 1;
    }
}
//Email
var sEmailText_1 = "电子邮件格式不正确";
var sEmailText_2 = ""; //"完善电子邮件送500金币";
var sEmailText_3 = "电子邮件长度在60个字符以内！";
//
function pv_F_Email() {
}
function pv_B_Email(div_txtEmail) {
    var email = G(div_txtEmail).value;
    email = lr_trim(email);
    var emailv = /^[a-zA-Z0-9_-]+@[a-zA-Z0-9_-]+(\.[a-zA-Z0-9_-]+)+$/;
    if (!emailv.test(email)) {
        return -1;
    }
    else if (email.length > 60) {
        return -2;
    }
    else {
        return 1;
    }
}
//delete left trim
function ltrim(s) {
    return s.replace(/^\s*/g, "");
}
//delete right trim
function rtrim(s) {
    return s.replace(/\s*$/g, "");
}
//delete left and right trim
function lr_trim(s) {
    return rtrim(ltrim(s));
}
//PostNumber
var sPostNumberText_1 = "邮政编码格式不正确";
//
function pv_F_PostNumber() {
}
function pv_B_PostNumber(div_txtPostNumber) {
    var postCode = G(div_txtPostNumber).value;
    var postCodev = /^[0-9]{6}$/;
    if (!postCodev.test(postCode)) {
        return -1;
    }
    else {
        return 1;
    }
}
//MovePhone
var sMovePhoneText_1 = "手机号码在11-30个数字以内！";
function pv_F_MovePhone(MovePhone) {
}
function pv_B_MovePhone(MovePhone) {
    var mphonev = /^[0-9]+$/;
    var mphone = G(MovePhone).value;
    if (!mphonev.test(mphone)) {
        return -1;
    }
    else if (mphone.length < 11 || mphone.length > 20) {
        return -2;
    }
    else {
        return 1;
    }
}
//QQ
var sQQText_1 = "QQ号码长度在30个数字以内！";
//
function pv_B_QQ(div_QQ) {
    var qq = G(div_QQ).value;
    if (qq.length > 30) {
        return -1;
    }
    else {
        return 1;
    }
}
//Remarks
var sRemarksText_1 = "备注字段在40个字符以内！";
function pv_F_Remarks() {
}
function pv_B_Remarks(div_Remarks) {
    var m = G(div_Remarks).value;
    if (m.length > 40) {
        return -1;
    }
    else {
        return 1;
    }
}
//Pro
var sProText_1 = "请正确输入推广号！";
var sProText_2 = "填写您的推广人号码系统奖励推广大礼包";
function pv_F_TuiG(pid) {
}
function pv_B_TuiG(pid) {
    var pidv = /^[0-9]+$/;
    var pids = G(pid).value;
    if (!pidv.test(pids)) {
        return -1;
    }
    else if (pids.length < 3 || pids.length > 15) {
        return -2;
    }
    else {
        return 1;
    }
}
////////////////////////////////////////////
//phone
/*
var bPhone = true;
function checkPhone() {
var phonev = /^[0-9]+$/;
var phone = G('Phone').value;
if (phone != "") {
if (!phonev.test(phone)) {
G("cphone").innerHTML = "固定电话号码格式错误";
bPhone = false;
}
else if (phone.length > 20) {
G("cphone").innerHTML = "固定电话号码格式错误";
bPhone = false;
}
else { bPhone = true; G("cphone").innerHTML = ""; }
}
}
//idcard
var bIdcard = true;
function checkIdcard() {
var idcodev = /^\d{15}(\d{2}[A-Za-z0-9])?$/;
var idcode = G('IDCard').value;
if (idcode != "") {
if (!idcodev.test(idcode)) {
G("cidcard").innerHTML = "身份证号码不正确";
bIdcard = false;
}
else {
G("cidcard").innerHTML = "";
bIdcard = true;
}
}
else {
G("cidcard").innerHTML = "";
bIdcard = true;
}
}
*/

//Added by liulj 2010-7-16
var sPwdAnswer = "如您选择了问题，必须输入此项";
var sPwdAnswer_1 = "请您最多输入64个字符";

