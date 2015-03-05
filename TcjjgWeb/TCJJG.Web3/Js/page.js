// get radio value     
function getRadioValue(radioName) {
    var obj = document.getElementsByName(radioName);
    for (var i = 0; i < obj.length; i++) {
        if (obj[i].checked) {
            return obj[i].value;
        }
    }
}
//
function GetPageXML(pageIndex, pageCount, pageTotal) {
    if (pageTotal == 0 || pageTotal == 1) {
        return "";
    }
    var pageLabel = 5; //
    var pageBuffer = [];
    pageBuffer.push("<div class=\"divPage\">");
    if (pageTotal <= pageLabel) {
        for (var y = 1; y <= pageTotal; y++) {
            if (pageIndex == y) {
                pageBuffer.push("<span id=\"p" + y + "\" onclick=\"PageOnclick(" + y + ");\" class=\"pageCurr\">" + y + "</span>");
            }
            else {
                pageBuffer.push("<span id=\"p" + y + "\" onclick=\"PageOnclick(" + y + ");\" class=\"pageCount\">" + y + "</span>");
            }
        }
        //pageBuffer.push("<span onclick=\"PageOnclick(" + pageTotal + ");\" class=\"pageDes\">尾页</span>");
    }
    else {
        if (pageIndex <= Math.floor(pageLabel / 2)) {
            for (var i = 1; i <= pageLabel; i++) {
                if (pageIndex == i) {
                    pageBuffer.push("<span id=\"p" + i + "\" onclick=\"PageOnclick(" + i + ");\" class=\"pageCurr\">" + i + "</span>");
                }
                else {
                    pageBuffer.push("<span id=\"p" + i + "\" onclick=\"PageOnclick(" + i + ");\" class=\"pageCount\">" + i + "</span>");
                }
            }
            pageBuffer.push("<span onclick=\"PageOnclick(" + pageTotal + ");\" class='pageDes'>尾页</span>");
        }
        else {
            if (pageIndex >= pageTotal - Math.floor(pageLabel / 2)) {
                pageBuffer.push("<span onclick=\"PageOnclick(" + 1 + ");\" class='pageDes'>首页</span>");
                for (var j = pageTotal - pageLabel; j <= pageTotal; j++) {
                    if (pageIndex == j) {
                        pageBuffer.push("<span id=\"p" + j + "\" onclick=\"PageOnclick(" + j + ");\" class=\"pageCurr\">" + j + "</span>");
                    }
                    else {
                        pageBuffer.push("<span id=\"p" + j + "\" onclick=\"PageOnclick(" + j + ");\" class=\"pageCount\">" + j + "</span>");
                    }
                }
            }
            else {
                pageBuffer.push("<span onclick=\"PageOnclick(" + 1 + ");\" class='pageDes'>首页</span>");
                var pageLabelInt = Math.floor(pageLabel / 2);
                var parseFloatSum = parseInt(pageIndex) + parseInt(pageLabelInt);
                for (var x = pageIndex - pageLabelInt; x <= parseFloatSum; x++) {
                    if (pageIndex == x) {
                        pageBuffer.push("<span id=\"p" + x + "\" onclick=\"PageOnclick(" + x + ");\" class=\"pageCurr\">" + x + "</span>");
                    }
                    else {
                        pageBuffer.push("<span id=\"p" + x + "\" onclick=\"PageOnclick(" + x + ");\" class=\"pageCount\">" + x + "</span>");
                    }
                }
                pageBuffer.push("<span onclick=\"PageOnclick(" + pageTotal + ");\" class='pageDes'>尾页</span>");
            }
        }
    }
    pageBuffer.push("<span class=\"pageDes_1\">共" + pageTotal + "页</span>");
    pageBuffer.push("</div>");
    return pageBuffer.join("");
}