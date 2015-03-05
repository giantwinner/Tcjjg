
/****多开****/
$(function () {
    var moreopen = QueryString("moreopen");
    if (moreopen != null) {
        $("#hdMoreopen").val(moreopen);
    } else {
        $("#hdMoreopen").val("0");
    }
})

function ChangeTitle(title) {
    if (title == "1") {
        document.title = "同城斗地主";
    } else if (title == "3") {
        document.title = "同城德州扑克";
    }
    else if (title == "4") {
        document.title = "同城小狗快跑";
    }
}

function GetUserInfo() {
    // alert(document.getElementById("hdNickName").value + "<" + document.getElementById("hdType1").value);
    return document.getElementById("hdUid").value + "<" + document.getElementById("hdUpwd").value + "<" + document.getElementById("hdAppID").value
+ "<" + document.getElementById("hdNickName").value + "<" + document.getElementById("hdType1").value + "<" + document.getElementById("hdType4").value + "<" + document.getElementById("hdUserType").value + "<" + document.getElementById("hdMoreopen").value + "<" + document.getElementById("hdrank").value;


}
function ShowMall(url, isDisplay) {
    $("#iframe").attr("src", url);
    if (isDisplay) {
        $("#mallDiv").css("display", "block");
    } else {
        $("#mallDiv").css("display", "none");
    }
}
function GetReso() {
    if (window.innerWidth)
        winWidth = window.innerWidth;
    else if ((document.body) && (document.body.clientWidth))
        winWidth = document.body.clientWidth;
    // 获取窗口高度
    if (window.innerHeight)
        winHeight = window.innerHeight;
    else if ((document.body) && (document.body.clientHeight))
        winHeight = document.body.clientHeight;
    // 通过深入 Document 内部对 body 进行检测，获取窗口大小
    if (document.documentElement && document.documentElement.clientHeight && document.documentElement.clientWidth) {
        winHeight = document.documentElement.clientHeight;
        winWidth = document.documentElement.clientWidth;
    }
    return winWidth + "<" + winHeight;
}
function GetFlash() {
    setTimeout(function () { this.focus(); }, 1000);
}

function WindowOpen(url) {
    window.open(url, "_blank");
}



/**
* 定义ForceWindow类构造函数
* 无参数
* 无返回值
*/
function ForceWindow() {
    this.r = document.documentElement;
    this.f = document.createElement("FORM");
    this.f.target = "_blank";
    this.f.method = "post";
    this.r.insertBefore(this.f, this.r.childNodes[0]);
}
/**
* 定义open方法
* 参数sUrl：字符串，要打开窗口的URL。
* 无返回值
*/
ForceWindow.prototype.open = function (sUrl) {
    this.f.action = sUrl;
    this.f.submit();
}
/**
* 实例化一个ForceWindow对象并做为window对象的一个子对象以方便调用
* 定义后可以这样来使用：window.force.open("URL");<strong></strong>
*/
function OpenWindow(sUrl) {
    window.force = new ForceWindow();
    window.force.open(sUrl);
}
//window.force = new ForceWindow();
