$(function () {
    $(".nav-item").eq(0).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
    TransImg();
    NewsDefault();
})

function GetFlashVersion() {
    try {
        if (typeof deconcept == "undefined") { var deconcept = new Object(); } if (typeof deconcept.util == "undefined") { deconcept.util = new Object(); } if (typeof deconcept.SWFObjectUtil == "undefined") { deconcept.SWFObjectUtil = new Object(); } deconcept.SWFObject = function (_1, id, w, h, _5, c, _7, _8, _9, _a) { if (!document.getElementById) { return; } this.DETECT_KEY = _a ? _a : "detectflash"; this.skipDetect = deconcept.util.getRequestParameter(this.DETECT_KEY); this.params = new Object(); this.variables = new Object(); this.attributes = new Array(); if (_1) { this.setAttribute("swf", _1); } if (id) { this.setAttribute("id", id); } if (w) { this.setAttribute("width", w); } if (h) { this.setAttribute("height", h); } if (_5) { this.setAttribute("version", new deconcept.PlayerVersion(_5.toString().split("."))); } this.installedVer = deconcept.SWFObjectUtil.getPlayerVersion(); if (!window.opera && document.all && this.installedVer.major > 7) { deconcept.SWFObject.doPrepUnload = true; } if (c) { this.addParam("bgcolor", c); } var q = _7 ? _7 : "high"; this.addParam("quality", q); this.setAttribute("useExpressInstall", false); this.setAttribute("doExpressInstall", false); var _c = (_8) ? _8 : window.location; this.setAttribute("xiRedirectUrl", _c); this.setAttribute("redirectUrl", ""); if (_9) { this.setAttribute("redirectUrl", _9); } }; deconcept.SWFObject.prototype = { useExpressInstall: function (_d) { this.xiSWFPath = !_d ? "expressinstall.swf" : _d; this.setAttribute("useExpressInstall", true); }, setAttribute: function (_e, _f) { this.attributes[_e] = _f; }, getAttribute: function (_10) { return this.attributes[_10]; }, addParam: function (_11, _12) { this.params[_11] = _12; }, getParams: function () { return this.params; }, addVariable: function (_13, _14) { this.variables[_13] = _14; }, getVariable: function (_15) { return this.variables[_15]; }, getVariables: function () { return this.variables; }, getVariablePairs: function () { var _16 = new Array(); var key; var _18 = this.getVariables(); for (key in _18) { _16[_16.length] = key + "=" + _18[key]; } return _16; }, getSWFHTML: function () { var _19 = ""; if (navigator.plugins && navigator.mimeTypes && navigator.mimeTypes.length) { if (this.getAttribute("doExpressInstall")) { this.addVariable("MMplayerType", "PlugIn"); this.setAttribute("swf", this.xiSWFPath); } _19 = "<embed type=\"application/x-shockwave-flash\" src=\"" + this.getAttribute("swf") + "\" width=\"" + this.getAttribute("width") + "\" height=\"" + this.getAttribute("height") + "\" style=\"" + this.getAttribute("style") + "\""; _19 += " id=\"" + this.getAttribute("id") + "\" name=\"" + this.getAttribute("id") + "\" "; var _1a = this.getParams(); for (var key in _1a) { _19 += [key] + "=\"" + _1a[key] + "\" "; } var _1c = this.getVariablePairs().join("&"); if (_1c.length > 0) { _19 += "flashvars=\"" + _1c + "\""; } _19 += "/>"; } else { if (this.getAttribute("doExpressInstall")) { this.addVariable("MMplayerType", "ActiveX"); this.setAttribute("swf", this.xiSWFPath); } _19 = "<object id=\"" + this.getAttribute("id") + "\" classid=\"clsid:D27CDB6E-AE6D-11cf-96B8-444553540000\" width=\"" + this.getAttribute("width") + "\" height=\"" + this.getAttribute("height") + "\" style=\"" + this.getAttribute("style") + "\">"; _19 += "<param name=\"movie\" value=\"" + this.getAttribute("swf") + "\" />"; var _1d = this.getParams(); for (var key in _1d) { _19 += "<param name=\"" + key + "\" value=\"" + _1d[key] + "\" />"; } var _1f = this.getVariablePairs().join("&"); if (_1f.length > 0) { _19 += "<param name=\"flashvars\" value=\"" + _1f + "\" />"; } _19 += "</object>"; } return _19; }, write: function (_20) { if (this.getAttribute("useExpressInstall")) { var _21 = new deconcept.PlayerVersion([6, 0, 65]); if (this.installedVer.versionIsValid(_21) && !this.installedVer.versionIsValid(this.getAttribute("version"))) { this.setAttribute("doExpressInstall", true); this.addVariable("MMredirectURL", escape(this.getAttribute("xiRedirectUrl"))); document.title = document.title.slice(0, 47) + " - Flash Player Installation"; this.addVariable("MMdoctitle", document.title); } } if (this.skipDetect || this.getAttribute("doExpressInstall") || this.installedVer.versionIsValid(this.getAttribute("version"))) { var n = (typeof _20 == "string") ? document.getElementById(_20) : _20; n.innerHTML = this.getSWFHTML(); return true; } else { if (this.getAttribute("redirectUrl") != "") { document.location.replace(this.getAttribute("redirectUrl")); } } return false; } }; deconcept.SWFObjectUtil.getPlayerVersion = function () { var _23 = new deconcept.PlayerVersion([0, 0, 0]); if (navigator.plugins && navigator.mimeTypes.length) { var x = navigator.plugins["Shockwave Flash"]; if (x && x.description) { _23 = new deconcept.PlayerVersion(x.description.replace(/([a-zA-Z]|\s)+/, "").replace(/(\s+r|\s+b[0-9]+)/, ".").split(".")); } } else { if (navigator.userAgent && navigator.userAgent.indexOf("Windows CE") >= 0) { var axo = 1; var _26 = 3; while (axo) { try { _26++; axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash." + _26); _23 = new deconcept.PlayerVersion([_26, 0, 0]); } catch (e) { axo = null; } } } else { try { var axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.7"); } catch (e) { try { var axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash.6"); _23 = new deconcept.PlayerVersion([6, 0, 21]); axo.AllowScriptAccess = "always"; } catch (e) { if (_23.major == 6) { return _23; } } try { axo = new ActiveXObject("ShockwaveFlash.ShockwaveFlash"); } catch (e) { } } if (axo != null) { _23 = new deconcept.PlayerVersion(axo.GetVariable("$version").split(" ")[1].split(",")); } } } return _23; }; deconcept.PlayerVersion = function (_29) { this.major = _29[0] != null ? parseInt(_29[0]) : 0; this.minor = _29[1] != null ? parseInt(_29[1]) : 0; this.rev = _29[2] != null ? parseInt(_29[2]) : 0; }; deconcept.PlayerVersion.prototype.versionIsValid = function (fv) { if (this.major < fv.major) { return false; } if (this.major > fv.major) { return true; } if (this.minor < fv.minor) { return false; } if (this.minor > fv.minor) { return true; } if (this.rev < fv.rev) { return false; } return true; }; deconcept.util = { getRequestParameter: function (_2b) { var q = document.location.search || document.location.hash; if (_2b == null) { return q; } if (q) { var _2d = q.substring(1).split("&"); for (var i = 0; i < _2d.length; i++) { if (_2d[i].substring(0, _2d[i].indexOf("=")) == _2b) { return _2d[i].substring((_2d[i].indexOf("=") + 1)); } } } return ""; } }; deconcept.SWFObjectUtil.cleanupSWFs = function () { var _2f = document.getElementsByTagName("OBJECT"); for (var i = _2f.length - 1; i >= 0; i--) { _2f[i].style.display = "none"; for (var x in _2f[i]) { if (typeof _2f[i][x] == "function") { _2f[i][x] = function () { }; } } } }; if (deconcept.SWFObject.doPrepUnload) { if (!deconcept.unloadSet) { deconcept.SWFObjectUtil.prepUnload = function () { __flash_unloadHandler = function () { }; __flash_savedUnloadHandler = function () { }; window.attachEvent("onunload", deconcept.SWFObjectUtil.cleanupSWFs); }; window.attachEvent("onbeforeunload", deconcept.SWFObjectUtil.prepUnload); deconcept.unloadSet = true; } } if (!document.getElementById && document.all) { document.getElementById = function (id) { return document.all[id]; }; } var getQueryParamValue = deconcept.util.getRequestParameter; var FlashObject = deconcept.SWFObject; var SWFObject = deconcept.SWFObject;
        var version = deconcept.SWFObjectUtil.getPlayerVersion();
        abc = version.major + "." + version.minor + "." + version.rev;
        $.get("/Ajax/Ajax_FlashVersion.aspx", { version: abc });
    } catch (e) {
    }
}
function hoverBtnUp() {
    $(".enterHallBtn").hover(function () {
        $(this).css("top", "195px");
        $(".clickEnter img").attr("src", "/Images/Default/clickEnter2.png");
    }, function () {
        $(this).css("top", "200px");
        $(".clickEnter img").attr("src", "/Images/Default/clickEnter1.png");
    });
}
function ChangeEnterHallBtn() {

    if ($("#ctl00_pnelfirst").css("display") == "none") {
        if ($("#BtnEnterHall").attr("src") == "/Images/Default/freetryBtn.png") {
            $("#BtnEnterHall").attr("src", "/Images/Default/enterHall.png");
        }
    }
}
function TransImg() {
    //点击按钮更换图片
    $(".switchbar li").click(function () {
        $(".transimg").hide();
        $(".transimg").eq($(this).index()).show();
        $(".switchbar li").css("color", "White");
        $(".switchbar li").eq($(this).index()).css("color", "#6abf37");
    })
    //点击翻页按钮
    $(".adpagelast").click(function () {
        status = false;
        imgIndex = imgIndex - 1;
        if (imgIndex < 0) {
            imgIndex = 3;
        }
        $(".transimg").hide();
        $(".transimg").eq(imgIndex).show();
        $(".switchbar li").css("color", "White");
        $(".switchbar li").eq(imgIndex).css("color", "#6abf37");


    });
    $(".adpagenext").click(function () {
        status = false;
        if (imgIndex > 3) {
            imgIndex = 0;
        }
        $(".transimg").hide();
        $(".transimg").eq(imgIndex).show();
        $(".switchbar li").css("color", "White");
        $(".switchbar li").eq(imgIndex).css("color", "#6abf37");
        imgIndex += 1;
    });
    //当鼠标移动到图片上停止切换
    var status = true;
    $(".transimg").hover(function () {
        status = false; //鼠标悬停
        $(".adpagelast").show()
        $(".adpagenext").show();
    },
    function () {
        status = true; //鼠标离开
        $(".adpagelast").hide()
        $(".adpagenext").hide();
    })
    $(".adpagelast").hover(function () {
        status = false; //鼠标悬停
        $(".adpagelast").show()
        $(".adpagenext").show();
    },
    function () {
        status = true; //鼠标离开
        $(".adpagelast").hide()
        $(".adpagenext").hide();
    })
    $(".adpagenext").hover(function () {
        status = false; //鼠标悬停
        $(".adpagelast").show()
        $(".adpagenext").show();
    },
    function () {
        status = true; //鼠标离开
        $(".adpagelast").hide()
        $(".adpagenext").hide();
    })


    //当鼠标移动到按钮上停止切换 
    $(".switchbar li").hover(function () {
        status = false; //鼠标悬停
    },
        function () {
            status = true; //鼠标离开
        })


    //自动更换图片
    function AutoTransImg() {
        if (status) {
            if (imgIndex > 3) {
                imgIndex = 0;
            }
            $(".transimg").hide();
            $(".transimg").eq(imgIndex).show();
            $(".switchbar li").css("color", "White");
            $(".switchbar li").eq(imgIndex).css("color", "#6abf37");

            imgIndex += 1;
        }
        //几秒切换图片
        setTimeout(function () { AutoTransImg(imgIndex); }, 5000);
    }
    //首次加载显示第一张图片
    var imgIndex = 0; AutoTransImg();
    $(".switchbar li").css("color", "White");
    $(".switchbar li").eq(0).css("color", "#6abf37");
}

//首页互动文章
function NewsDefault() {
    $.post(
             "/Ajax/Ajax_Bulletin.aspx?type=18",
             {},
            function (data) {
                $(".newwrap").html(""); var html = "";
                var jsonData = eval("(" + data + ")");
                var length = jsonData.length;
                if (length > 3) {
                    length = 3;
                }
                for (var i = 0; i < length; i++) {
                    if (i == 0) {
                        html += "<a class='newsTitle1' target='_blank' href='/Affiche/Interactive.aspx'>" + jsonData[i].NewsTitle + "</a>"
                    + "<div class='newsDate1'>" + jsonData[i].NewsDate + "</div>"
                    + "<div class='newsBrevity1'>" + jsonData[i].Brevity + "</div>"
                    + "<a class='newsDetail' target='_blank' href='/Affiche/AfficheDetail-" + jsonData[i].NewsID + ".html?v=2'>阅读全文</a>"
                    + "<div class='hr'></div>"
                    }
                    else if (i == 1) {
                        html += "<img class='Commentbg1' src='Images/Default/Commentbg.jpg' alt='' />"
                    + "<img class='zan1' src='Images/Default/zan.png' alt='' />"
                    + "<div class='zanNum1'>" + jsonData[i].Praise + "</div>"
                    + "<a href='/Affiche/AfficheDetail-" + jsonData[i].NewsID + ".html?v=2' target='_blank' class='newsTitle2'>" + jsonData[i].NewsTitle + "</a>"
                    + "<div class='newsDate2'>发布日期：" + jsonData[i].NewsDate + "</div>"
                    }
                    else if (i == 2) {
                        html += "<img class='Commentbg2' src='Images/Default/Commentbg.jpg' alt='' />"
                    + "<img class='zan2' src='Images/Default/zan.png' alt='' />"
                    + "<div class='zanNum2'>" + jsonData[i].Praise + "</div>"
                    + "<a href='/Affiche/AfficheDetail-" + jsonData[i].NewsID + ".html?v=2' target='_blank' class='newsTitle3'>" + jsonData[i].NewsTitle + "</a>"
                    + "<div class='newsDate3'>发布日期：" + jsonData[i].NewsDate + "</div>"
                    }

                }
                $(".newwrap").html(html);
            })
}

 