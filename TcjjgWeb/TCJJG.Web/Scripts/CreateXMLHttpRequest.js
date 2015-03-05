//create xml http request
//
var xmlHttp = false;
function createXMLHttpRequest() {
    if (window.ActiveXObject) {
        try {
            xmlHttp = new ActiveXObject("Microsoft.XMLHTTP");
        } catch (e) {
            try {
                xmlHttp = new ActiveXObject("Msxml2.XMLHTTP");
            } catch (e) { }

        }
    } else if (window.XMLHttpRequest) {
        xmlHttp = new XMLHttpRequest();
        if (xmlHttp.overrideMimeType) {
            xmlHttp.overrideMimeType("text/xml");
        }
    }
    if (!xmlHttp) {
        alert("浏览器异常");
        return false;
    }
}

///
var xmlHttpPool = {
    _objPool: [],
    _getInstance: function() {
        for (var i = 0; i < this._objPool.length; i++) {
            if (this._objPool[i].readyState == 0 || this._objPool[i].readyState == 4) {
                return this._objPool[i];
            }
        }
        // IE5中不支持push方法
        this._objPool[this._objPool.length] = this._createObj();
        return this._objPool[this._objPool.length - 1];
    },
    _createObj: function() {
        if (window.ActiveXObject) {
            try {
                objXMLHttp = new ActiveXObject("Microsoft.XMLHTTP");
            } catch (e) {
                try {
                    objXMLHttp = new ActiveXObject("Msxml2.XMLHTTP");
                } catch (e) { }

            }
        } else if (window.XMLHttpRequest) {
            objXMLHttp = new XMLHttpRequest();
            if (objXMLHttp.overrideMimeType) {
                objXMLHttp.overrideMimeType("text/xml");
            }
        }
        if (!objXMLHttp) {
            alert("浏览器异常");
            return false;
        }
        // mozilla某些版本没有readyState属性
        if (objXMLHttp.readyState == null) {
            objXMLHttp.readyState = 0;
            objXMLHttp.addEventListener("load", function() {
                objXMLHttp.readyState = 4;
                if (typeof objXMLHttp.onreadystatechange == "function") {
                    objXMLHttp.onreadystatechange();
                }
            }, false);
        }
        return objXMLHttp;
    }
};
/**

// 发送请求(方法[post,get], 地址, 数据, 回调函数)
function sendReq(method, url, data, callback) {
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
xmlHttp.setRequestHeader("Content-Length", data.length);
setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
send(data);
onreadystatechange = function() {
if (objXMLHttp.readyState == 4) {
if (objXMLHttp.status == 200 || objXMLHttp.status == 304) {
callbackResource();
}
else {
notHaveResource();
}
}
else {
waitRequest();
}
}
}
catch (e) {
alert("浏览器异常");
}
}
}
function callbackResource() {

}
function notHaveResource() {

}
function waitRequest() {

}

*/





