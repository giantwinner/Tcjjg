var request =
{
    QueryString: function (val) {
        var uri = window.location.search;
        var re = new RegExp("" + val + "=([^&?]*)", "ig");
        return ((uri.match(re)) ? (uri.match(re)[0].substr(val.length + 1)) : "");
    }
}
//
function G(id) {
    return document.getElementById(id);
}
//
String.prototype.length2 = function () {
    var cArr = this.match(/[^\x00-\xff]/ig);
    return this.length + (cArr == null ? 0 : cArr.length);
}
//common
function setCss(divName, cssName) {
    try {
        G(divName).className = cssName;
    }
    catch (e) { }
}
var sIsLogin = false;
var sAppid = "0"; //appid
function IsLogin(isl, appid) {
    if (isl != "" && isl != null) {
        sIsLogin = true;
    }
    else {
        sIsLogin = false;
    }
    sAppid = appid;
}
//
function f_gotoHall() {
    window.location.href = "/hallpage/HallPageFL.aspx";
}
//
//var isInstallSilverlightForWeb = false;
//function CheckSl() {
//    if (Silverlight.isInstalled("4.0.5")) {
//        isInstallSilverlightForWeb = true;
//    }
//    else {
//        isInstallSilverlightForWeb = false;
//    }
//}
//function InstallGame() {
//    if (isInstallSilverlightForWeb) {
//        alert("尊敬的用户您好！您已经成功安装了游戏插件，无需再次安装！祝您比赛旗开得胜！");
//    }
//    else {
//        window.location.href = "/index/csw.html";
//    }
//}
function hallcs() {
    //    CheckSl();
    //    if (isInstallSilverlightForWeb) {
    //    }
    //    else {
    //    //20120730修改为若没安装SL插件则跳转到flash版本页面
    //        window.location.href = " /hallpage/HallPageFL.aspx";
    //        //window.location.href = "/index/csw.html";
    //    }
    window.location.href = " /hallpage/HallPageFL.aspx";
}















