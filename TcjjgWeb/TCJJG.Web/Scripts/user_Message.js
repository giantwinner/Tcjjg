//user select message

//
$(function () {
    seleMessage(1);
})
var pageCount = 4;
var pageIndex = 1;
var pageTotal = 0;
function seleMessage(pageIndex) {
    createXMLHttpRequest();
    var url = "/RequestWebservice/User_SeleMessage.aspx?pi=" + pageIndex + "&pc=" + pageCount;
    xmlHttp.open("GET", url, true);
    xmlHttp.onreadystatechange = function () {
        if (xmlHttp.readyState == 4) {
            if (xmlHttp.status == 200) {
                G("uc-message-wrap").innerHTML = seleMessageAmply();
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
        var type;
        var LinkTo="-1";
        //
        for (var i = 0; i < listCount; i++) {
            MsgID = xmlDoc[i].getElementsByTagName("I")[0].firstChild.data;
            Title = xmlDoc[i].getElementsByTagName("C")[0].firstChild.data;
            if (Title == "-1") { Title = "同城竞技馆系统消息"; }
            SendTime = xmlDoc[i].getElementsByTagName("D")[0].firstChild.data;
            Msg = xmlDoc[i].getElementsByTagName("M")[0].firstChild.data;
            IsReaded = xmlDoc[i].getElementsByTagName("S")[0].firstChild.data;
            type = xmlDoc[i].getElementsByTagName("T")[0].firstChild.data;
            if (xmlDoc[i].getElementsByTagName("LT")[0].firstChild.data == -1) {
                LinkTo = "";
            } else {
                LinkTo = "<a target='_blank' style='position:absolute;bottom:28px;right:4px;text-decoration:underline;' href='" + xmlDoc[i].getElementsByTagName("LT")[0].firstChild.data + "'>详细</a>";
            }

            var fromSys = "系统消息";
            if (type == 1) {
                fromSys = "私人消息";
            }
            if (IsReaded == 1) {
                buffer.push("<div class='msgitem'><div class='msgitem-top'><div class='msgsys'>" + fromSys + "</div><div class='msgtitle'>" + Title + "</div><div class='msgTime'>" + SendTime + "</div></div><div class='msgitem-content'>" + Msg + "</div>"+LinkTo+"</div>");

            } else {
                buffer.push("<div class='msgitem'><div class='msgitem-top'><div class='msgsys'>" + fromSys + "</div><div class='msgtitle'><b>" + Title + "</b></div><div class='msgTime'>" + SendTime + "</div></div><div class='msgitem-content'><b>" + Msg + "</b></div>"+LinkTo+"</div>");
            }
        }
        pageTotal = xmlHttp.responseXML.getElementsByTagName("pt")[0].firstChild.data;
        $(".msgImg2").text(xmlHttp.responseXML.getElementsByTagName("mc")[0].firstChild.data);
        $(".pageTotalCount").text(pageTotal);
        $(".pageIndex").text(pageIndex);

    }
    else {
        buffer.push("还没有短消息要通知您...");
        G("uc-message-wrap").innerHTML = "";
    }
    return buffer.join("");
}

function next() {
    if (pageIndex < pageTotal) {
        pageIndex++;
        seleMessage(pageIndex);
    }
}
function pre() {
    if (pageIndex > 1) {
        pageIndex--;
        seleMessage(pageIndex);
    }
}




