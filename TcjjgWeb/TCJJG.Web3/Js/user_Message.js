//user select message

//
var pageCount = 8;
function seleMessage(pageIndex) {
    if (pageIndex == null) { pageIndex = 1; }
    createXMLHttpRequest();
    var url = "/RequestWebservice/User_SeleMessage.aspx?pi=" + pageIndex + "&pc=" + pageCount;
    xmlHttp.open("GET", url, true);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            if (xmlHttp.status == 200) {
                G("dateUserMsg").innerHTML = seleMessageAmply();
            }
        } else {
        }
    };
    xmlHttp.send(null);
}

function seleMessageAmply() {
    var xmlDoc = xmlHttp.responseXML.getElementsByTagName("UM");
    var buffer = [];
    if (xmlDoc != null && xmlDoc.length != 0) {
        var listCount = xmlDoc.length;
        //
        var MsgID;
        var SendTime;
        var Title;
        var IsReaded;
        //
        for (var i = 0; i < listCount; i++) {
            MsgID = xmlDoc[i].getElementsByTagName("I")[0].firstChild.data;
            Title = xmlDoc[i].getElementsByTagName("C")[0].firstChild.data;
            SendTime = xmlDoc[i].getElementsByTagName("D")[0].firstChild.data;
            IsReaded = xmlDoc[i].getElementsByTagName("S")[0].firstChild.data;
            var fromSys = "系统消息";
            if (Title == "-1") { Title = "同城竞技馆系统消息"; }
            buffer.push("<div class=\"divUserMessageTitle\">");
            buffer.push("<div class=\"divUserMessageTime\">" + fromSys + "&nbsp;&nbsp;&nbsp;&nbsp;" + SendTime + "</div>");
            //
            if (IsReaded == "0") {
                buffer.push("<div class=\"divUserMessageData_B\">"); //bold
            } else {
                buffer.push("<div class=\"divUserMessageData\">");
            }
            buffer.push("<a href=\"/UserCenter/UserSeleMessageAmply.aspx?msgid=" + MsgID + "\">" + Title + "</a>");
            buffer.push("</div>");
            buffer.push("</div>");
        }
        SelePage(); // load page code
    }
    else {
        buffer.push("还没有短消息要通知您...");
        G("divUserMessagePage").innerHTML = "";
    }
    return buffer.join("");
}
function SelePage() {
    var xmlPi = xmlHttp.responseXML.getElementsByTagName("pi")[0].firstChild.data;
    var xmlPt = xmlHttp.responseXML.getElementsByTagName("pt")[0].firstChild.data;
    G("divUserMessagePage").innerHTML = GetPageXML(xmlPi, pageCount, xmlPt);
}
function PageOnclick(pageIndex) {
    seleMessage(pageIndex);
}
