//赛事切换
$(".Match_Report").click(function () {
    $(this).removeClass("Match_Report").addClass("C_Match_Report");
    $(".Match_Intro").removeClass("Match_Report").addClass("C_Match_Report");
    $(".D_Match_Report").css("display", "");
    $("D_Match_Intro").css("display", "none");
});
$(".Match_Intro").click(function () {
    $(this).css({ "border-bottom-style": "none", "color": "rgb(6,6,6)" });
    $(".Match_Intro").css({ "border-bottom-style": "solid", "color": "rgb(173,172,172)" });
    $("D_Match_Intro").css("display", "");
    $(".D_Match_Report").css("display", "none");
})

$(function () {
    //导航默认选中
    $("#A_Index").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
    $("#ctl00_ContentPlaceHolder1_txtUserName0").focus();
    funTopImgsUpDown();
    funBulletin();
    CompetitonReport();
    CompetitonCenter();

    var LastLink = $("#MatchMore").attr("href");
    $(".Match_Intro").click(function () {
        $("#MatchMore").attr("href", "Match/CompetitionList.aspx");
    })
    $(".Match_Report").click(function () {
        $("#MatchMore").attr("href", LastLink);
    })

    //    //下载sliverLight
    //    $(".DownLoad").click(function () {
    //        CheckSl();
    //        InstallGame();
    //    });
//    $(".DownLoad").click(function () {
//        alert("此功能暂未开放！");
//    });
    $(".DownLoad3").click(function () {
        alert("此功能暂未开放！");
    });




    //登录
    $("#BtnLogin0").click(function () {
        AjaxLogin0(); //登录
    });
    $("#BtnLogin1").click(function () {
        AjaxLogin(); //登录
    });
    $("#ctl00_ContentPlaceHolder1_txtVli").keydown(function (event) {
        if (event.keyCode == 13) {
            $("#BtnLogin1").click();
        }
    })
    $("#ctl00_ContentPlaceHolder1_txtPsw").keydown(function (event) {
        if (event.keyCode == 13) {
            $("#BtnLogin1").click();
        }
    })
    $("#ctl00_ContentPlaceHolder1_txtUserName").keydown(function (event) {
        if (event.keyCode == 13) {
            $("#BtnLogin1").click();
        }
    })

    $("#ctl00_ContentPlaceHolder1_txtUserName0").keydown(function (event) {
        if (event.keyCode == 13) {
            $("#BtnLogin0").click();
        }
    })
    $("#ctl00_ContentPlaceHolder1_txtPsw0").keydown(function (event) {
        if (event.keyCode == 13) {
            $("#BtnLogin0").click();
        }
    })


    //赛事
    //默认
    $(".Match_Report").addClass("C_Match_Report");
    $(".D_Match_Intro").css("display", "none");
    //点击时
    $(".Match_Report").click(function () {
        $(this).addClass("C_Match_Report");
        $(".Match_Intro").removeClass("C_Match_Intro");
        $(".D_Match_Report").css("display", "");
        $(".D_Match_Intro").css("display", "none");
    });
    $(".Match_Intro").click(function () {
        $(this).addClass("C_Match_Intro");
        $(".Match_Report").removeClass("C_Match_Report");
        $(".D_Match_Intro").css("display", "");
        $(".D_Match_Report").css("display", "none");
    })

})
function funTopImgsUpDown() {

    //获取图片数量

    var imgCount = $(".D_Mid_Top_Minicomkvm>.divImg").length;
    //    //加载图片
    $(".D_Mid_Top_Minicomkvm> img").eq(0).show();
    //点击按钮更换图片
    $(".SwitchBtn").click(function () {
        num = $(this).index();
        //alert(num);
        //按钮、标题样式
        for (var i = 0; i < imgCount; i++) {
            $(".SwitchBtn").eq(i).css({ "color": "#DE590A", "background-color": "#FFFFFF" });
            $(".d_top1_R_Bdiv2 .d_top1_R_BTitle").eq(i).hide();
        }
        $(".SwitchBtn").eq(num).css({ "color": "#FFFFFF", "background-color": "#DE590A" });
        $(".d_top1_R_Bdiv2 .d_top1_R_BTitle").eq(num).show();

        //获得下一个元素在其父元素中的下标
        if (num < (imgCount - 1)) {
            num += 1;
        }
        else {
            num = 0;
        }
        //
        $(".D_Mid_Top_Minicomkvm> .divImg").hide();
        $(".D_Mid_Top_Minicomkvm> .divImg").eq($(this).index()).fadeIn();
    })



    var status = true;
    $(".D_Mid_Top_Minicomkvm").hover(function () {
        status = false; //鼠标悬停
    },
    function () {
        status = true; //鼠标离开
    })

    //当鼠标移动到按钮上停止切换
    $(".d_top1_R_Bdiv").hover(function () {
        status = false; //鼠标悬停
    },
    function () {
        status = true; //鼠标离开
    })
    //自动更换图片
    function showImg(val) {
        if (status) {
            //获取图片数量
            var imgCount = $(".D_Mid_Top_Minicomkvm>.divImg").length;
            //按钮、标题样式
            for (var i = 0; i < imgCount; i++) {
                $(".SwitchBtn").eq(i).css({ "color": "#DE590A", "background-color": "#FFFFFF" }).text(i + 1);
            }
            $(" .SwitchBtn").eq(val).css({ "color": "#FFFFFF", "background-color": "#DE590A" });

            //显示索引为val的图片
            $(".D_Mid_Top_Minicomkvm>.divImg").hide();
            $(".D_Mid_Top_Minicomkvm>.divImg").eq(val).fadeIn();

            if (num < (imgCount - 1)) {
                num += 1;
            }
            else {
                num = 0;
            }
        }
        //3秒后重新绑定图片
        setTimeout(function () { showImg(num); }, 5000);
    }
    //加载图片
    var num = 0; showImg(num);
}

/************/
//加载中
function ALoading() {
    $(".LoginLoading").show();
    $(".LoginLoading").hide();
    ChangeCode();
}

//登录0
function AjaxLogin0() {

    $(".LoginLoading").show();
    if ($("#ctl00_ContentPlaceHolder1_txtUserName0").val() == "") {
        $("#ctl00_ContentPlaceHolder1_labMsg0").html("请输入用户名"); ALoading(); return;
    }
    if ($("#ctl00_ContentPlaceHolder1_txtPsw0").val() == "") {
        $("#ctl00_ContentPlaceHolder1_labMsg0").html("请输入密码"); ALoading(); return;
    }

    var uid, pwd;
    uid = $("#ctl00_ContentPlaceHolder1_txtUserName0").val();
    pwd = $("#ctl00_ContentPlaceHolder1_txtPsw0").val();

    $.post("/Ajax/Ajax_LogIn.aspx", { userName: uid, passWord: pwd, validate: 'login' },
            function (data) {
                if (data == -1 || data == -2 || data == -403 || data == -407) {

                    ALoading();
                    $("#ctl00_ContentPlaceHolder1_pnl_First").hide();
                    $("#ctl00_ContentPlaceHolder1_pnl_Again").show();

                }
                if (data == -1) {
                    $("#ctl00_ContentPlaceHolder1_labMsg").html("用户名密码错误");
                }
                else if (data == -2) {
                    $("#ctl00_ContentPlaceHolder1_labMsg").html("验证码错误");
                }
                else if (data == -403) {
                    $("#ctl00_ContentPlaceHolder1_labMsg").html("用户被锁定");
                }
                else if (data == -407) {
                    $("#ctl00_ContentPlaceHolder1_labMsg").html("此IP地址已经被禁止登录");
                }
                else {

                    /* $("#default_bar_Img").attr("src", "StyleSheet/defaultImg/Tcjjg_gb_home_14_3.gif"); //更换“进入比赛大厅”背景图片*/
                    var jsonData = eval("(" + data + ")");
                    $("#ctl00_ContentPlaceHolder1_ImgAvatar").attr("src", jsonData.HeadID);
                    $("#ctl00_ContentPlaceHolder1_lblNickName").html(jsonData.NickName);
                    for (var i = 0; i < jsonData.Lua.length; i++) {
                        if (jsonData.Lua[i].Ti == 1) {
                            $("#ctl00_ContentPlaceHolder1_lblYuanBao").html(jsonData.Lua[i].Ac)
                        }
                        if (jsonData.Lua[i].Ti == 3) {
                            $("#ctl00_ContentPlaceHolder1_lblBonus").html(jsonData.Lua[i].Ac)
                        }
                        if (jsonData.Lua[i].Ti == 4) {
                            $("#ctl00_ContentPlaceHolder1_lblGoldCoin").html(jsonData.Lua[i].Ac)
                        }
                    }
                    $("#ctl00_ContentPlaceHolder1_pnl_First").hide();
                    $("#ctl00_ContentPlaceHolder1_pnl_Again").hide();
                    $("#ctl00_ContentPlaceHolder1_pnl_Success").show();
                    $("#ctl00_ContentPlaceHolder1_AgencyLink").hide();

                    //加载母版页上的登录信息
                    ShowLoginOK(jsonData.UserName, jsonData.MsgCount);

                    for (var j = 0; j < jsonData.Roles.length; j++) {
                        if (jsonData.Roles == "8") {
                            $("#ctl00_ContentPlaceHolder1_AgencyLink").text("代理商管理");
                            $("#ctl00_ContentPlaceHolder1_AgencyLink").show();
                            $("#ctl00_ContentPlaceHolder1_LinkMyGoods").hide();
                            $("#ctl00_ContentPlaceHolder1_LinkAward").hide();
                        }
                        if (jsonData.Roles == "9") {
                            $("#ctl00_ContentPlaceHolder1_AgencyLink").text("网吧管理");
                            $("#ctl00_ContentPlaceHolder1_AgencyLink").show();
                            $("#ctl00_ContentPlaceHolder1_LinkMyGoods").hide();
                            $("#ctl00_ContentPlaceHolder1_LinkAward").hide();
                        }
                    }


                }
            })
}



//登录1
function AjaxLogin() {

    $(".LoginLoading").show();
    $("#ctl00_ContentPlaceHolder1_labMsg").html("");
    if ($("#ctl00_ContentPlaceHolder1_txtUserName").val() == "") {
        $("#ctl00_ContentPlaceHolder1_labMsg").html("请输入用户名"); ALoading(); return;
    }
    if ($("#ctl00_ContentPlaceHolder1_txtPsw").val() == "") {
        $("#ctl00_ContentPlaceHolder1_labMsg").html("请输入密码"); ALoading(); return;
    }
    if ($("#txtVli").val() == "") {
        $("#ctl00_ContentPlaceHolder1_labMsg").html("请输入验证码"); ALoading(); return;
    }
    //
    var uid, pwd, vld;
    uid = $("#ctl00_ContentPlaceHolder1_txtUserName").val();
    pwd = $("#ctl00_ContentPlaceHolder1_txtPsw").val();
    vld = $("#ctl00_ContentPlaceHolder1_txtVli").val();
    //
    $.post("/Ajax/Ajax_LogIn.aspx", { userName: uid, passWord: pwd, validate: vld },
            function (data) {
                if (data == -1 || data == -2 || data == -403 || data == -407) {
                    ALoading();
                }
                if (data == -1) {
                    $("#ctl00_ContentPlaceHolder1_labMsg").html("用户名密码错误");
                }
                else if (data == -2) {
                    $("#ctl00_ContentPlaceHolder1_labMsg").html("验证码错误");
                }
                else if (data == -403) {
                    $("#ctl00_ContentPlaceHolder1_labMsg").html("用户被锁定");
                }
                else if (data == -407) {
                    $("#ctl00_ContentPlaceHolder1_labMsg").html("此IP地址已经被禁止登录");
                }
                else {
                    /*  $("#default_bar_Img").attr("src", "StyleSheet/defaultImg/Tcjjg_gb_home_14_3.gif"); //更换“进入比赛大厅”背景图片*/
                    var jsonData = eval("(" + data + ")");
                    $("#ctl00_ContentPlaceHolder1_ImgAvatar").attr("src", jsonData.HeadID);
                    $("#ctl00_ContentPlaceHolder1_lblNickName").html(jsonData.NickName);
                    for (var i = 0; i < jsonData.Lua.length; i++) {
                        if (jsonData.Lua[i].Ti == 1) {
                            $("#ctl00_ContentPlaceHolder1_lblYuanBao").html(jsonData.Lua[i].Ac)
                        }
                        if (jsonData.Lua[i].Ti == 3) {
                            $("#ctl00_ContentPlaceHolder1_lblBonus").html(jsonData.Lua[i].Ac)
                        }
                        if (jsonData.Lua[i].Ti == 4) {
                            $("#ctl00_ContentPlaceHolder1_lblGoldCoin").html(jsonData.Lua[i].Ac)
                        }
                    }
                    $("#ctl00_ContentPlaceHolder1_pnl_First").hide();
                    $("#ctl00_ContentPlaceHolder1_pnl_Again").hide();
                    $("#ctl00_ContentPlaceHolder1_pnl_Success").show();
                    $("#ctl00_ContentPlaceHolder1_AgencyLink").hide();

                    //加载母版页上的登录信息
                    ShowLoginOK(jsonData.UserName, jsonData.MsgCount);

                    for (var i = 0; i < jsonData.Roles.length; i++) {
                        if (jsonData.Roles == "8") {
                            $("#ctl00_ContentPlaceHolder1_AgencyLink").text("代理商管理");
                            $("#ctl00_ContentPlaceHolder1_AgencyLink").show();
                            $("#ctl00_ContentPlaceHolder1_LinkMyGoods").hide();
                            $("#ctl00_ContentPlaceHolder1_LinkAward").hide();
                        }
                        if (jsonData.Roles == "9") {
                            $("#ctl00_ContentPlaceHolder1_AgencyLink").text("网吧管理");
                            $("#ctl00_ContentPlaceHolder1_AgencyLink").show();
                            $("#ctl00_ContentPlaceHolder1_LinkMyGoods").hide();
                            $("#ctl00_ContentPlaceHolder1_LinkAward").hide();
                        }
                    }
                }
            })
}

//公告
function funBulletin() {
    $.post(
             "/Ajax/Ajax_Bulletin.aspx?type=0",
             {},
            function (data) {
                $(".D_News_Container").html(""); var html = "";
                var jsonData = eval("(" + data + ")");
                for (var i = 0; i < jsonData.length; i++) {
                    var types = "<span style=\"font-size: 12px; float:left; width: 49px;height: 18px;background-color: #8eab1f; color: white;display:inline-block;text-align:center;line-height:18px;} \">系统</span>";
                    if (jsonData[i].newsTypeID == 2) {
                        types = "<span style=\"font-size: 12px;width: 49px;height: 18px;background-color: #FF7F00; color: white;display:inline-block;text-align:center;line-height:18px;\">赛事</span>";
                    }
                    html = html + "&nbsp;<div class=\"D_News_Container1\">" + types +
                        "<a class=\"NewTitle\" href='/Affiche/AfficheDetail-" + jsonData[i].NewsID + ".html'>&nbsp;&nbsp;&nbsp;"
                         + jsonData[i].NewsTitle + "</a><span class=\"NewsDate\">" + jsonData[i].NewsDate + "</span></div>";

                }
                $(".D_News_Container").html(html);

            })
}

//赛事报道
function CompetitonReport() {
    $.post("/Ajax/Ajax_CompetitionReport.aspx", {}, function (data) {
        var jsonData = eval("(" + data + ")");
        for (var i = 0; i < jsonData.length; i++) {
            $(".CRTitle").eq(i).text(jsonData[i].CompetitionTitle);
            $(".CRContent").eq(i).text(jsonData[i].CompetitionContent);
            $(".PlayerImg1 img").eq(i).attr("src", jsonData[i].CompetitionImgUrl);
            $(".PlayerImg1").eq(i).attr("href", jsonData[i].CompetitionLinkToUrl);
            $(".TxtUrl").eq(i).attr("href", jsonData[i].CompetitionLinkToUrl);
        }
    });
}
//赛事中心
function CompetitonCenter() {
    $.post("/Ajax/Ajax_CompetitionCenter.aspx", {}, function (data) {
        var jsonData = eval("(" + data + ")");
        for (var i = 0; i < jsonData.length; i++) {
            if (i == 3) {
                $(".D_Match_Intro").append("<br /><br />");
            }
            if (jsonData[i].LinkToDetail.length == 0 && jsonData[i].IndexImgUrl.length > 0) {
                $(".D_Match_Intro").append("<a class='D_Match_Intro_img'><img src='" + jsonData[i].IndexImgUrl + "' /></a>");
            } else {
                $(".D_Match_Intro").append("<a href='" + jsonData[i].LinkToDetail + "' class='D_Match_Intro_img'><img src='" + jsonData[i].IndexImgUrl + "' /></a>");
            }
        }
    });
}
function CheckCookie() {
    if (window.navigator.cookieEnabled) {
        return true;
    } else {
        alert("浏览器配置错误，Cookie不可用！");
        return false;
    }
}