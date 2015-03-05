$(function () {
    CreateHeadImgList();
    $(".pageList").eq(0).show();
})
/*****选项改变时，改变当前头像显示*****/
function SelectChange(obj) {
    var imageID = obj.value + ".jpg";
    G("ctl00_ContentPlaceHolder1_img_CurrentHeadImage").src = ImgServerURL + "/Images/hu/" + imageID;
}

/******创建头像图片列表*********/
function CreateHeadImgList() {
    for (var i = 0; i < 15; i++) {
        if (i == 5 || i == 10) {
            $("#pageList1").append("<div style='clear:both;'><br /><div>");
        }
        $("#pageList1").append("<div class='headItem'><img src='" + ImgServerURL + "/images/hu/head" + i + ".jpg' class='headImg' alt='HeadImg' /><br /><input type='radio' name='headselect' onclick='SelectChange(this)' value='head" + i + "' /></div>");
    }
    for (var i = 15; i < 30; i++) {
        if (i == 20 || i == 25) {
            $("#pageList2").append("<div style='clear:both;'><br /><div>");
        }
        $("#pageList2").append("<div class='headItem'><img src='" + ImgServerURL + "/images/hu/head" + i + ".jpg' class='headImg' alt='HeadImg' /><br /><input type='radio' name='headselect' onclick='SelectChange(this)' value='head" + i + "' /></div>");
    }
    for (var i = 30; i < 45; i++) {
        if (i == 35 || i == 40) {
            $("#pageList3").append("<div style='clear:both;'><br /><div>");
        }
        $("#pageList3").append("<div class='headItem'><img src='" + ImgServerURL + "/images/hu/head" + i + ".jpg' class='headImg' alt='HeadImg' /><br /><input type='radio' name='headselect' onclick='SelectChange(this)' value='head" + i + "' /></div>");
    }
}

/******下一页********/
function NextPage() {
    var nextObj = $(".pageList:visible").next(".pageList");
    if (nextObj.length != 0) {
        $(".pageList").hide();
        nextObj.show();
    }

}
/******上一页*******/
function PreviousPage() {
    var previousObj = $(".pageList:visible").prev(".pageList");
    if (previousObj.length != 0) {
        $(".pageList").hide();
        previousObj.show();
    }
}

