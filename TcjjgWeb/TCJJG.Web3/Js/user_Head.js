//user head
//function UserOnclickManyHead() {
//    G("head_head_sele").className = "div_RegMain25_text_head_head_sele"
//    G("head_head_sele_close").className = "div_RegMain25_text_head_close"
//    G("head_head_sele_close_true").className = "div_RegMain25_text_head_close_true"
//    //
//    G("mygodiebug_1").className = "displayNone";
//    G("mygodiebug_2").className = "displayNone";
//}
//function UserOnclickManyHead_Close() {
//    G("head_head_sele").className = "displayNone"
//    G("head_head_sele_close").className = "displayNone"
//    //
//    G("mygodiebug_1").className = "div_RegMain25_text_sex";
//    G("mygodiebug_2").className = "div_RegMain25_text_c";
//}
//
//function F_div_RegMain25_head_1_1_r() {
//    G("I_div_RegMain25_head_1").className = "div_RegMain25_head_1_1";
//    G("I_div_RegMain25_head_2").className = "div_RegMain25_head_1_4";
//    //
//    G("I_div_RegMain25_head_3").className = "div_RegMain25_head_2";
//    G("I_div_RegMain25_head_4").className = "displayNone";
//}
//function F_div_RegMain25_head_1_2_r() {
//    G("I_div_RegMain25_head_1").className = "div_RegMain25_head_1_3";
//    G("I_div_RegMain25_head_2").className = "div_RegMain25_head_1_2";
//    //
//    G("I_div_RegMain25_head_3").className = "displayNone";
//    G("I_div_RegMain25_head_4").className = "div_RegMain25_head_3";
//}
//
function F_div_RegMain25_head_1_1() {
    G("I_div_RegMain25_head_1").className = "div_RegMain25_head_1_1";
    G("I_div_RegMain25_head_2").className = "div_RegMain25_head_1_4";
    //
    G("I_div_RegMain25_head_3").className = "div_RegMain25_head_2_amp";
    G("I_div_RegMain25_head_4").className = "displayNone";
    //
    G("defaultUserHeadBtn").style.display = "block";
//    G("defaultUserSexBtn").style.display = "block";
}
function F_div_RegMain25_head_1_2() {
    G("I_div_RegMain25_head_1").className = "div_RegMain25_head_1_3";
    G("I_div_RegMain25_head_2").className = "div_RegMain25_head_1_2";
    //
    G("I_div_RegMain25_head_3").className = "displayNone";
    G("I_div_RegMain25_head_4").className = "div_RegMain25_head_3_amp";
    //
    G("defaultUserHeadBtn").style.display = "none";
//    G("defaultUserSexBtn").style.display = "none";
}
function uploadsetcss(ty) {
    F_div_RegMain25_head_1_2();
    if (ty == "1") {

    }
    else if (ty == "2") {
        alert("请正确选择上传的头像...");
    }
    else if (ty == "3") {
        alert("上传头像失败，请重试...");
    }
    else if (ty == "4") {
        alert("保存头像失败，请重试...");
    }
    else if (ty == "5") {
        alert("您还没有自定义头像卡，赶快到道具商城里购买吧...");
    }
    else if (ty == "6") {
        alert("您今天已经上传了5次头像了，明天再来上传吧...");
    }
    else if (ty == "7") {
        alert("您成功的更新了头像...");
    }
}
// get user choose head to db
//function getUserChangeHerd() {
//    try {
//        var newHead = getRadioValue("h");
//        if (newHead == null || newHead == "") {
//            return "nan00.jpg";
//        }
//        else {
//            return newHead + ".jpg";
//        }
//    }
//    catch (e) {
//        return "nan00.jpg";
//    }
//}
//switch user headImage
//function ImageChange(obj) {
//    var imageID = obj.value + ".jpg";
//    G("ctl00_ContentPlaceHolder1_img_CurrentHeadImage").src = ImgServerURL + "/Images/hu/" + imageID;
//}
//sex switch
//function sexChange(obj) {
//    var s = getRadioValue("s");
//    var sr = G("ctl00_ContentPlaceHolder1_img_CurrentHeadImage").src;
//    var fn = getImgageFileName(sr);
//    if (s == "s1") {
//        if (fn == "nv00") {
//            G("ctl00_ContentPlaceHolder1_img_CurrentHeadImage").src = ImgServerURL + "/images/hu/nan00.jpg";
//        }
//    }
//    else if (s == "s2") {
//        if (fn == "nan00") {
//            G("ctl00_ContentPlaceHolder1_img_CurrentHeadImage").src = "/images/hu/nv00.jpg";
//        }
//    }
//}
//load head
//function load_userHead(id) {
//    if (id == "1") {
//        G("H1_div_RegMain25_head_3").innerHTML = p1_1();
//        G("H2_div_RegMain25_head_3").innerHTML = p1_2();
//        G("H3_div_RegMain25_head_3").innerHTML = p1_3();
//        G("H4_div_RegMain25_head_3").innerHTML = p1_4();
//    }
//    else if (id == "2") {
//        G("H1_div_RegMain25_head_3").innerHTML = p2_1();
//        G("H2_div_RegMain25_head_3").innerHTML = p2_2();
//        G("H3_div_RegMain25_head_3").innerHTML = p2_3();
//        G("H4_div_RegMain25_head_3").innerHTML = p2_4();
//    }
//    else if (id == "3") {
//        G("H1_div_RegMain25_head_3").innerHTML = p3_1();
//        G("H2_div_RegMain25_head_3").innerHTML = p3_2();
//        G("H3_div_RegMain25_head_3").innerHTML = p3_3();
//        G("H4_div_RegMain25_head_3").innerHTML = p3_4();
//    }
//    else if (id == "4") {
//        G("H1_div_RegMain25_head_3").innerHTML = p4_1();
//        G("H2_div_RegMain25_head_3").innerHTML = p4_2();
//        G("H3_div_RegMain25_head_3").innerHTML = p4_3();
//        G("H4_div_RegMain25_head_3").innerHTML = p4_4();
//    }
//    else if (id == "5") {
//        G("H1_div_RegMain25_head_3").innerHTML = p5_1();
//        G("H2_div_RegMain25_head_3").innerHTML = p5_2();
//        G("H3_div_RegMain25_head_3").innerHTML = p5_3();
//        G("H4_div_RegMain25_head_3").innerHTML = p5_4();
//    }
//    else {
//        G("H1_div_RegMain25_head_3").innerHTML = p6_1();
//        G("H2_div_RegMain25_head_3").innerHTML = p6_2();
//        G("H3_div_RegMain25_head_3").innerHTML = p6_3();
//        G("H4_div_RegMain25_head_3").innerHTML = p6_4();
//    }
//    G("H5_div_RegMain25_head_3").innerHTML = page_Head(id, 10, 6);
//}
////set default old user head
//function setCheckedValue(newValue, v) {
//    var radios = document.getElementsByName(v);
//    for (var i = 0; i < radios.length; i++) {
//        radios[i].checked = false;
//        if (radios[i].value == newValue.toString()) {
//            radios[i].checked = true;
//        }
//    }
//}
//user_UserCenterDefault.js
function getImgageFileName(fn) {
    var re = "";
    try {
        re = fn.substring(fn.lastIndexOf("/") + 1, fn.indexOf("."));
    }
    catch (e) { }
    return re;
}
















