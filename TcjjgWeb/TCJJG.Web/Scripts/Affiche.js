
function Comment(typeID) {
    $.post("/Ajax/Ajax_NewsComment.aspx?type=" + typeID + "&newsID=" + $(".newid").html(), function (data) {
        var result = data.split(",")[0];
        var t = data.split(",")[1];
        var c = data.split(",")[2];
        if (result == 1) {
            if (t == 1) {
                $(".zancount").html(c);
            } else {
                $(".caicount").html(c);
            }
        } else if (result == -1) {
            alert("您已评论过！");
        }
    });
}