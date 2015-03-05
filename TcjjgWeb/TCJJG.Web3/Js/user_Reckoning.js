//user reckoning
//direction

function callback_Direction(Direction) {
    var DirectionText;
    if (Direction == "0") { DirectionText = "支出"; }
    else if (Direction == "1") { DirectionText = "收入"; }
    else { DirectionText = "--"; }
    return DirectionText;
}
/////////////////////////////////////////////////////
function LoadReckoningAmply() {
    var it = QueryString("it");
    var su = QueryString("su");
    var id = QueryString("id");
    var ma = QueryString("ma");
    if ((it == "4" && su == "6") || (it == "4" && su == "0") || (it == "4" && su == "10") || (it == "3" && su == "1")) {
        LoadReckoningAmply_game(it, su, id, ma);
    }
    else if (it == "4") {
       // LoadReckoningAmplyByClaimLog(it, su, id, ma);
    }
    else if (it == "3") {
       // LoadReckoningAmplyByPY(it, su, id, ma);
    }
    else {
        LoadReckoningAmply_game(it, su, id, ma);
    }
}
/////////////////////////////////////////////////////
//ReckoningAmply
function LoadReckoningAmply_game(it, su, id, ma) {
    var url = "/RequestWebservice/User_ReckoningAmply.aspx?it=" + it + "&su=" + su + "&id=" + id + "&ma=" + ma;
    var method = "GET";
    var data = "";
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
            setRequestHeader("Content-Length", data.length);
            setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            send(data);
            onreadystatechange = function () {
                if (objXMLHttp.readyState == 4) {
                    if (objXMLHttp.status == 200 || objXMLHttp.status == 304) {
                        callBack_ReckoningAmply(objXMLHttp);
                    }
                    else {//not have resource

                    }
                }
                else {//wait...

                }
            }
        }
        catch (e) {
            alert("浏览器异常");
        }
    }
}
function callBack_ReckoningAmply(objXMLHttp) {
    try {
        var xmlDoc = objXMLHttp.responseXML.getElementsByTagName("ReckoningAmply");
        if (xmlDoc != null && xmlDoc.length != 0) {
            var Buffer = [];
            //
            var ItemName, SubItemName, CreateTime;
            var Direction, TypeID, Amount, Remain;
            var AwardName, Memo;
            //
            var s1 = "<table style=\"width: 100%;\" class=\"table1\">";
            Buffer.push(s1);
            for (var i = 0; i < xmlDoc.length; i++) {
                ItemName = xmlDoc[i].getElementsByTagName("ITE")[0].firstChild.data;
                SubItemName = xmlDoc[i].getElementsByTagName("SUB")[0].firstChild.data;
                CreateTime = xmlDoc[i].getElementsByTagName("CR")[0].firstChild.data;
                //
                Direction = xmlDoc[i].getElementsByTagName("D")[0].firstChild.data;
                Amount = xmlDoc[i].getElementsByTagName("A")[0].firstChild.data;
                Remain = xmlDoc[i].getElementsByTagName("R")[0].firstChild.data;
                //
                Memo = xmlDoc[i].getElementsByTagName("ME")[0].firstChild.data;
                AwardName = xmlDoc[i].getElementsByTagName("AN")[0].firstChild.data;
                ////
                var DirectionText = callback_Direction(Direction)//Direction
                //Amount
                if (AwardName == "-1") AwardName = "--"; //AwardName
                if (Memo == "-1") Memo = "--"; //Memo
                //CreateTime
                Buffer.push("<tr><th>费用名称：</th><td>" + ItemName + "</td></tr>");
                Buffer.push("<tr><th>费用类型：</th><td>" + SubItemName + "</td></tr>");
                Buffer.push("<tr><th>资金流向：</th><td>" + DirectionText + "</td></tr>");
                Buffer.push("<tr><th>类<span style=\"visibility: hidden\">空空</span>型：</th><td>" + AwardName + "</td></tr>");
                Buffer.push("<tr><th>金<span style=\"visibility: hidden\">空空</span>额：</th><td>" + Amount + "</td></tr>");
                Buffer.push("<tr><th>余<span style=\"visibility: hidden\">空空</span>额：</th><td>" + Remain + "</td></tr>");
                Buffer.push("<tr><th>说<span style=\"visibility: hidden\">空空</span>明：</th><td>" + Memo + "</td></tr>");
                Buffer.push("<tr><th>日<span style=\"visibility: hidden\">空空</span>期：</th><td>" + CreateTime + "</td></tr>");
            }
            Buffer.push("</table>");
            //
            G("div_ReckoningAmply_MainData").innerHTML = Buffer.join("");
        }
    }
    catch (e) { }
}
////////////////////////////////////////////////////
//user claimLog select reckoningAmply
function LoadReckoningAmplyByClaimLog(it, su, id, ma) {
    /*
    var url = "/RequestWebservice/User_ReckoningAmply.aspx?it=" + it + "&su=" + su + "&id=" + id + "&ma=" + ma;
    var method = "GET";
    var data = "";
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
    setRequestHeader("Content-Length", data.length);
    setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    send(data);
    onreadystatechange = function () {
    if (objXMLHttp.readyState == 4) {
    if (objXMLHttp.status == 200 || objXMLHttp.status == 304) {
    callBack_ByClaimLog(objXMLHttp);
    callBack_ByClaimLog_CM(objXMLHttp);
    SelAddress(objXMLHttp);
    }
    else {//not have resource

    }
    }
    else {//wait...

    }
    }
    }
    catch (e) {
    alert("浏览器异常");
    }
    }
    */
}

function callBack_ByClaimLog(objXMLHttp) {
    try {
        var xmlDoc = objXMLHttp.responseXML.getElementsByTagName("ClaimLog");
        if (xmlDoc != null && xmlDoc.length != 0) {
            var Buffer = [];
            //
            var AwardName, AwardCount, CCTN;
            var AwardBonus, StatesName, CreateDate, opeType;
            //
            var s1 = "<table style=\"width: 100%;\" class=\"table1\">";
            Buffer.push(s1);
            for (var i = 0; i < xmlDoc.length; i++) {
                AwardName = xmlDoc[i].getElementsByTagName("AN")[0].firstChild.data;
                AwardCount = xmlDoc[i].getElementsByTagName("AC")[0].firstChild.data;
                CCTN = xmlDoc[i].getElementsByTagName("CCTN")[0].firstChild.data;
                AwardBonus = xmlDoc[i].getElementsByTagName("AB")[0].firstChild.data;
                StatesName = xmlDoc[i].getElementsByTagName("AS")[0].firstChild.data;
                CreateDate = xmlDoc[i].getElementsByTagName("CR")[0].firstChild.data;
                opeType = xmlDoc[i].getElementsByTagName("OT")[0].firstChild.data;
                ////
                Buffer.push("<tr><th>奖品名称：</th><td>" + AwardName + "</td></tr>");
                Buffer.push("<tr><th>兑换凭据：</th><td>" + CCTN + "</td></tr>");
                Buffer.push("<tr><th>兑换数量：</th><td>" + AwardCount + "</td></tr>");
                Buffer.push("<tr><th>奖品单价：</th><td>" + AwardBonus + "</td></tr>");
                Buffer.push("<tr><th>奖品总价：</th><td>" + parseFloat(AwardCount) * parseFloat(AwardBonus) + "</td></tr>");
                Buffer.push("<tr><th>状<span style=\"visibility: hidden\">空空</span>态：</th><td>" + StatesName + "</td></tr>");
                Buffer.push("<tr><th>兑换日期：</th><td>" + CreateDate + "</td></tr>");
            }
            Buffer.push("</table>");
            //
            G("div_ReckoningAmply_MainData").innerHTML = Buffer.join("");
        }
    }
    catch (e) { }
}
function callBack_ByClaimLog_CM(objXMLHttp) {
    try {
        var xmlDoc = objXMLHttp.responseXML.getElementsByTagName("ClaimLogCM");
        if (xmlDoc != null && xmlDoc.length != 0) {
            var Buffer = [];
            //
            var AwardName, AwardCount, MatchName, Remarks;
            var StatesName, CreateDate, opeType;
            //
            var s1 = "<table style=\"width: 100%;\" class=\"table1\">";
            Buffer.push(s1);
            for (var i = 0; i < xmlDoc.length; i++) {
                AwardName = xmlDoc[i].getElementsByTagName("AN")[0].firstChild.data;
                AwardCount = xmlDoc[i].getElementsByTagName("AC")[0].firstChild.data;
                MatchName = xmlDoc[i].getElementsByTagName("MN")[0].firstChild.data;
                StatesName = xmlDoc[i].getElementsByTagName("AS")[0].firstChild.data;
                CreateDate = xmlDoc[i].getElementsByTagName("CR")[0].firstChild.data;
                opeType = xmlDoc[i].getElementsByTagName("OT")[0].firstChild.data;
                Remarks = xmlDoc[i].getElementsByTagName("RE")[0].firstChild.data;
                ////
                Buffer.push("<tr><th>比赛名称：</th><td>" + MatchName + "</td></tr>");
                Buffer.push("<tr><th>奖品名称：</th><td>" + AwardName + "</td></tr>");
                Buffer.push("<tr><th>奖品数量：</th><td>" + AwardCount + "</td></tr>");
                Buffer.push("<tr><th>状<span style=\"visibility: hidden\">空空</span>态：</th><td>" + StatesName + "</td></tr>");
                Buffer.push("<tr><th>兑换日期：</th><td>" + CreateDate + "</td></tr>");
            }
            Buffer.push("</table>");
            //
            G("div_ReckoningAmply_MainData").innerHTML = Buffer.join("");
        }
    }
    catch (e) { }
}
//LoadAddress
function SelAddress(xmlDoc1) {
    try {
        var xmlDoc = xmlDoc1.responseXML.getElementsByTagName("ClaimLogAdd");
        var Buffer = [];
        if (xmlDoc != null && xmlDoc.length != 0) {
            var Email;
            var MovePhone;
            var PostNumber;
            var Recipient;
            var Address;
            var QQ;
            var Remarks;
            //
            for (var i = 0; i < xmlDoc.length; i++) {
                MovePhone = xmlDoc[i].getElementsByTagName("M")[0].firstChild.data;
                Email = xmlDoc[i].getElementsByTagName("E")[0].firstChild.data;
                Recipient = xmlDoc[i].getElementsByTagName("T")[0].firstChild.data;
                PostNumber = xmlDoc[i].getElementsByTagName("N")[0].firstChild.data;
                Address = xmlDoc[i].getElementsByTagName("A")[0].firstChild.data;
                QQ = xmlDoc[i].getElementsByTagName("Q")[0].firstChild.data;
                Remarks = xmlDoc[i].getElementsByTagName("R")[0].firstChild.data;
            }
            if (MovePhone == "-1") MovePhone = "";
            if (Email == "-1") Email = "";
            if (Recipient == "-1") Recipient = "";
            if (PostNumber == "-1") PostNumber = "";
            if (Address == "-1") Address = "";
            if (QQ == "-1") QQ = "";
            if (Remarks == "-1") Remarks = "";
            //
            var s1 = "<table style=\"width: 100%;\" class=\"table1\">";
            Buffer.push(s1);
            Buffer.push("<tr><th>移动电话：</th><td>" + MovePhone + "</td></tr>");
            Buffer.push("<tr><th>电子邮件：</th><td>" + Email + "</td></tr>")
            Buffer.push("<tr><th>QQ号码：</th><td>" + QQ + "</td></tr>")
            Buffer.push("<tr><th>收&nbsp;货&nbsp;人：</th><td>" + Recipient + "</td></tr>");
            Buffer.push("<tr><th>邮政编码：</th><td>" + PostNumber + "</td></tr>");
            Buffer.push("<tr><th>备注信息：</th><td>" + Remarks + "</td></tr>");
            Buffer.push("<tr><th>详细地址：</th><td>" + Address + "</td></tr>");
            Buffer.push("</table>");
            G("div_ReckoningAmply_MainData2").innerHTML = Buffer.join("");
        }
    } catch (e) { }
}
//////////////////////////////////////////////////////////
//user pay yeepay reckoningamply
function LoadReckoningAmplyByPY(it, su, id, ma) {
    var url = "/RequestWebservice/User_ReckoningAmply.aspx?it=" + it + "&su=" + su + "&id=" + id + "&ma=" + ma;
    var method = "GET";
    var data = "";
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
            setRequestHeader("Content-Length", data.length);
            setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
            send(data);
            onreadystatechange = function () {
                if (objXMLHttp.readyState == 4) {
                    if (objXMLHttp.status == 200 || objXMLHttp.status == 304) {
                        callBack_ByPY(objXMLHttp);
                        callBack_ByPC(objXMLHttp);
                    }
                    else {//not have resource
                    }
                }
                else {//wait...
                }
            }
        }
        catch (e) {
            alert("浏览器异常");
        }
    }
}
function callBack_ByPY(objXMLHttp) {
    try {
        var xmlDoc = objXMLHttp.responseXML.getElementsByTagName("PY");
        if (xmlDoc != null && xmlDoc.length != 0) {
            var Buffer = [];
            //
            var UserName1, UserName2, TypeID, Amount, Status, CreateTime, CreateIP, Remark, CallBackTime, YBankName, LN;
            var s1 = "<table style=\"width: 100%;\" class=\"table1\">";
            Buffer.push(s1);
            for (var i = 0; i < xmlDoc.length; i++) {
                UserName1 = xmlDoc[i].getElementsByTagName("U1")[0].firstChild.data;
                UserName2 = xmlDoc[i].getElementsByTagName("U2")[0].firstChild.data;
                TypeID = xmlDoc[i].getElementsByTagName("TY")[0].firstChild.data;
                Amount = xmlDoc[i].getElementsByTagName("AM")[0].firstChild.data;
                Status = xmlDoc[i].getElementsByTagName("ST")[0].firstChild.data;
                CreateTime = xmlDoc[i].getElementsByTagName("CR")[0].firstChild.data;
                CreateIP = xmlDoc[i].getElementsByTagName("CI")[0].firstChild.data;
                Remark = xmlDoc[i].getElementsByTagName("RE")[0].firstChild.data;
                CallBackTime = xmlDoc[i].getElementsByTagName("CA")[0].firstChild.data;
                YBankName = xmlDoc[i].getElementsByTagName("YB")[0].firstChild.data;
                LN = xmlDoc[i].getElementsByTagName("LN")[0].firstChild.data;
                ////
                var TypeText = TypeID == "4" ? "金币" : "其他";
                var StatesText = "";
                if (Status == "2") {
                    StatesText = "完成";
                } else {
                    StatesText = "异常！请与管理员联系";
                }
                ////
                var A1, A2;
                var B1, B2;
                var C1, C2;
                var D1, D2;
                //
                A1 = TypeText;
                A2 = LN;
                B1 = Amount + "元";
                B2 = StatesText;
                C1 = YBankName;
                C2 = CreateTime;
                D1 = CallBackTime;
                //
                Buffer.push("<tr><th>账单类型：</th><td>用户充值</td></tr>");
                Buffer.push("<tr><th>充值获得：</th><td>" + A1 + "</td></tr>");
                Buffer.push("<tr><th>获得数量：</th><td>" + A2 + "</td></tr>");
                Buffer.push("<tr><th>支付金额：</th><td>" + B1 + "</td></tr>");
                Buffer.push("<tr><th>状<span style=\"visibility: hidden\">空空</span>态：</th><td>" + B2 + "</td></tr>");
                Buffer.push("<tr><th>充值银行：</th><td>" + C1 + "</td></tr>");
                Buffer.push("<tr><th>充值时间：</th><td>" + C2 + "</td></tr>");
                Buffer.push("<tr><th>完成时间：</th><td>" + D1 + "</td></tr>");
            }
            Buffer.push("</table>");
            //
            G("div_ReckoningAmply_MainData").innerHTML = Buffer.join("");
        }
    }
    catch (e) { }
}
function callBack_ByPC(objXMLHttp) {
    try {
        var xmlDoc = objXMLHttp.responseXML.getElementsByTagName("PC");
        if (xmlDoc != null && xmlDoc.length != 0) {
            var Buffer = [];
            //
            var CardID, P_Amount, C_TypeID, C_Amount, UserName1, UserName2, CreateTime, CreateIP, Remark, Status;
            var s1 = "<table style=\"width: 100%;\" class=\"table1\">";
            Buffer.push(s1);
            for (var i = 0; i < xmlDoc.length; i++) {
                UserName1 = xmlDoc[i].getElementsByTagName("U1")[0].firstChild.data;
                UserName2 = xmlDoc[i].getElementsByTagName("U2")[0].firstChild.data;
                CardID = xmlDoc[i].getElementsByTagName("CA")[0].firstChild.data;
                C_TypeID = xmlDoc[i].getElementsByTagName("CT")[0].firstChild.data;
                C_Amount = xmlDoc[i].getElementsByTagName("CAM")[0].firstChild.data;
                P_Amount = xmlDoc[i].getElementsByTagName("PA")[0].firstChild.data;
                Status = xmlDoc[i].getElementsByTagName("CS")[0].firstChild.data;
                CreateTime = xmlDoc[i].getElementsByTagName("CR")[0].firstChild.data;
                CreateIP = xmlDoc[i].getElementsByTagName("CI")[0].firstChild.data;
                // Remark = xmlDoc[i].getElementsByTagName("RE")[0].firstChild.data;
                ////
                var TypeText = C_TypeID == "4" ? "金币" : "其他";
                var StatesText = "";
                if (Status == "2") {
                    StatesText = "完成";
                } else {
                    StatesText = "卡已被锁,请联系管理员.";
                }
                ////
                var A1, A2;
                var B1, B2;
                var C1, C2;
                var D1, D2;
                //
                A1 = TypeText;
                A2 = C_Amount;
                B1 = P_Amount + "元";
                B2 = StatesText;
                C1 = CardID;
                C2 = CreateTime;
                //
                Buffer.push("<tr><th>账单类型：</th><td>用户点卡充值</td></tr>");
                Buffer.push("<tr><th>充值获得：</th><td>" + A1 + "</td></tr>");
                Buffer.push("<tr><th>获得数量：</th><td>" + A2 + "</td></tr>");
                Buffer.push("<tr><th>点卡面值：</th><td>" + B1 + "</td></tr>");
                Buffer.push("<tr><th>状<span style=\"visibility: hidden\">空空</span>态：</th><td>" + B2 + "</td></tr>");
                Buffer.push("<tr><th>点卡卡号：</th><td>" + C1 + "</td></tr>");
                Buffer.push("<tr><th>充值时间：</th><td>" + C2 + "</td></tr>");
            }
            Buffer.push("</table>");
            //
            G("div_ReckoningAmply_MainData").innerHTML = Buffer.join("");
        }
    }
    catch (e) {
    }
}









