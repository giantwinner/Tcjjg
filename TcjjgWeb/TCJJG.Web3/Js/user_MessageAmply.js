// user select message amply


function seleMessageAmply() {
    LoadMsg();
}
function LoadMsg() {
    createXMLHttpRequest();
    var url = "/RequestWebservice/User_SeleMessageAmply.aspx?MisID=" + request.QueryString("msgid");
    xmlHttp.open("GET", url, true);
    xmlHttp.onreadystatechange = function() {
        if (xmlHttp.readyState == 4) {
            if (xmlHttp.status == 200) {
                var xmlDoc = xmlHttp.responseXML.getElementsByTagName("UM");
                var buffer = [];
                if (xmlDoc != null && xmlDoc.length != 0) {
                    var listCount = xmlDoc.length;
                    //
                    var SendTime;
                    var Title;
                    var Msg;
                    //
                    for (var i = 0; i < listCount; i++) {
                        Title = xmlDoc[i].getElementsByTagName("C")[0].firstChild.data;
                        SendTime = xmlDoc[i].getElementsByTagName("D")[0].firstChild.data;
                        Msg = xmlDoc[i].getElementsByTagName("M")[0].firstChild.data;
                        var fromSys = "系统消息";
                        if (Title == "-1") { Title = "同城竞技馆系统消息"; }
                        G("div_SystemMsgTitle").innerHTML = Title;
                        G("div_SystemMsgTime").innerHTML = "发布时间：" + SendTime + "&nbsp;&nbsp;&nbsp;<a href=\"javascript:history.go(-1)\";\"\">返回</a>";
                        G("div_SystemMsgC").innerHTML = Msg;
                    }
                }
            }
        } else {
        }
    };
    xmlHttp.send(null);
}




