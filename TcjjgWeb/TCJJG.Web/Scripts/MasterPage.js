$(function () {
    //ShowNowTime();
    MasterVisitorReqest();
    AfterLoginChange();
   // GetUserOnlineCount();
})

//游客试玩
function MasterVisitorReqest() {
    $("#freeTryBtn").click(function () {
        $.post("/Ajax/Ajax_Visitor.aspx", function (data) {
            if (data == "1" || data == "2") {//-1:cookie信息错误 -2：注册失败  1：注册成功 2：已登录 
                location.href = "/HallPage/HallPageFL.aspx";
            } else if (data == "-1") {
                alert("请关闭浏览器重新访问！");
            }
        });
    });
}

//获取在线人数
function GetUserOnlineCount() {
    $.post("/Ajax/Ajax_UserOnlineCount.aspx?olc=1", function (data) {
        if (data != "-1") {
            $(".onlinecount").html(data);
        }
    });
}


//回车登录
$(document).keydown(function (event) {
    if (event.keyCode == 13) {
        $(".btnlogin").click();
    }
});

function ShowNowTime() {
    var date = new Date();
    var now = date.toLocaleDateString() + " " + date.toLocaleTimeString();
    document.getElementById("nowSpan").innerHTML = now;
    setTimeout("ShowNowTime()", 1000);
}
function ShowLoginOK(nickName, msgCount) {
    $("#ctl00_lblNickName").text(nickName);
    if (msgCount > 0) {
        $(".msgImg2").text(msgCount);
    } else {
        $(".msgImg2").text("0");
    }
}
//登录
function AjaxLogin() {

    if ($("#ctl00_txtUsername").val() == "") {
        return;
    }
    if ($("#ctl00_txtPassword").val() == "") {
        return;
    }

    var uid, pwd;
    uid = $("#ctl00_txtUsername").val();
    pwd = $("#ctl00_txtPassword").val();

    $.post("/Ajax/Ajax_LogIn.aspx", { userName: uid, passWord: pwd, validate: 'login' },
            function (data) {

                if (data == -403) {
                    alert("用户被锁定");
                }
                else if (data < 0) {
                    alert("账号或密码错误,请重新登录");
                    location.href = "/UserCenter/UserLogin.aspx";
                }
                else if (data.length > 4) {
                    $("#ctl00_pnelfirst").css("display", "none");
                    $("#ctl00_pnelsecond").css("display", "block");
                    var jsonData = eval("(" + data + ")");
                    ShowLoginOK(jsonData.NickName, jsonData.MsgCount);
                    AfterLoginChange();
                }
            })
}
function AfterLoginChange() {
    if ($("#ctl00_lblNickName").html() != "") {
        $(".adreg").hide();
        $(".adtryplay").hide();
        $(".adlogin").html("进入游戏");
        $(".adlogin").attr("href", "/HallPage/HallPageFL.aspx");
        $(".btnleft").show();
    }

}