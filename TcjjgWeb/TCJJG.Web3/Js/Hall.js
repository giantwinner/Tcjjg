
function $(id) {
    return document.getElementById(id); //用M()方法代替document.getElementById(id)
}

function ViliLogon() {

    SendLoginMsg();
}
function SendLoginMsg() {
    try {
        var i = $("hdUid").value;
        var p = $("hdUpwd").value;
        var slPlugin = $('xaml1');
        // alert(i + '_' + p);
        slPlugin.content.HallUi.SendLogonMsg(i, p);
    } catch (e)
    { }
}


var isFlashTitle = false;
var flashTitle;
function StartFlashTitle(title) {
    flashTitle = title;
    if (isFlashTitle)
    { return; }
    else {
        isFlashTitle = true;

        FlashTitle();
    }
}
function StopFlashTitle() {
    isFlashTitle = false;
}
var homeTitle = "首页--棋牌 斗地主";
var flashFlag = true;
function FlashTitle() {
    if (flashFlag) {
        window.document.title = flashTitle;
        flashFlag = false;
    }
    else {
        window.document.title = "【              】";
        flashFlag = true;
    }
    if (isFlashTitle) {
        setTimeout(FlashTitle, 1000);
    } else {
        window.document.title = homeTitle;
    }
}

function SetWindowFocus() {
    window.focus();
}
var isOutClose = false;
function CloseWindow() {
    isConnectErr = true;
    isAutoClose = true;
    window.opener = null;
    window.open('', '_self');
    window.close();
}
//window.onbeforeunload = function () {
//    alert('1');
//    if (event.clientX > 360 && event.clientY < 0 || event.altKey || isAutoClose) {

//    }
//    else {
//        window.event.returnValue = "确定要离开当前页面吗？";
//    }
//}
function LogonOut() {
    window.opener = null;
    window.open('', '_self');
    window.location.href = "/UserCenter/userLogout.aspx";
}
function WindowGo(awardID) {
    isConnectErr = true;
    if (awardID == "") {
        window.location.href = "http://www.tcjjg.com/AwardCenter/Default.aspx";
    } else {
        window.location.href = "http://www.tcjjg.com/UserCenter/default.aspx?t=2&awardID=" + awardID;
    }
}