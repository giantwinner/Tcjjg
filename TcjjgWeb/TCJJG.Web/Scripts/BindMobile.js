var s = 60;
var timer;
var isEnable = true;

//手机号格式验证
function IsTelephone(obj) {
    
    reg = /^[0-9]{11}$/;
    if (!reg.test(obj)) {
        $("#ctl00_ContentPlaceHolder1_lblBindMobileMsg").text("请填写正确手机号");
        return false;
    } else {
        return true;
    }
}

//计时器
function Timers() {
    s--;
    var btntext = s + "秒后重新获取";
    $(".getcheckNum").text(btntext);
    if (s == 0) {
        clearInterval(timer);
        isEnable = true;
        $(".getcheckNum").text("获取验证码");
        $(".getcheckNum").css("color", "#005cab");
    }
}

function SendMsg() {

    var mobileNum = $("#ctl00_ContentPlaceHolder1_txtMobile").val();

    if (IsTelephone(mobileNum)) {

        if (isEnable) {
            isEnable = false;
            $(".getcheckNum").css("color", "#FFFFFF");
            s = 60;
            
            AjaxSend(mobileNum);
        }
    }

}
function SendMsg2() {

    var mobileNum = $("#ctl00_ContentPlaceHolder1_HideNum").text();

    if (IsTelephone(mobileNum)) {
        if (isEnable) {
            isEnable = false;
            $(".getcheckNum").css("color", "#FFFFFF");
            s = 60;
            
            AjaxSend2(mobileNum);
        }
    }

}

//发送异步发送短信的请求
function AjaxSend2(mobileNum) {
    var num = GetRandomNum(1000, 9999);
    $.post("/Ajax/Ajax_SendMsg.aspx?m=" + mobileNum + "&n=" + num, function (data) {
        data = data.split(" = ");
        if (data[0] == "1") {
            timer = setInterval("Timers()", 1000);
            $("#ctl00_ContentPlaceHolder1_lblBindMobileMsg2").text(data[1]);
        } else if (data[0] == "-100") {
            $("#ctl00_ContentPlaceHolder1_lblBindMobileMsg2").text(data[1]);
        }
        else if (data[0] == "-1") {
            $("#ctl00_ContentPlaceHolder1_lblBindMobileMsg2").text(data[1]);
        }
        else if (data[0] == "-2") {
            $("#ctl00_ContentPlaceHolder1_lblBindMobileMsg2").text(data[1]);
        }
    });
}
function AjaxSend(mobileNum) {
    var num = GetRandomNum(1000, 9999);
    $.post("/Ajax/Ajax_SendMsg.aspx?m=" + mobileNum + "&n=" + num, function (data) {
        data = data.split(" = ");
        if (data[0] == "1") {
            timer = setInterval("Timers()", 1000);
            $("#ctl00_ContentPlaceHolder1_lblBindMobileMsg").text(data[1]);
        } else if (data[0] == "-100") {
            $("#ctl00_ContentPlaceHolder1_lblBindMobileMsg").text(data[1]);
        }
        else if (data[0] == "-1") {
            $("#ctl00_ContentPlaceHolder1_lblBindMobileMsg").text(data[1]);
        }
        else if (data[0] == "-2") {
            $("#ctl00_ContentPlaceHolder1_lblBindMobileMsg").text(data[1]);
        }
    });
}

//获取随机数
function GetRandomNum(Min, Max) {
    var Range = Max - Min;
    var Rand = Math.random();
    return (Min + Math.round(Rand * Range));
}
        