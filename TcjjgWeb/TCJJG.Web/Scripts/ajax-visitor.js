function VisitorReqest() {
    $.post("/Ajax/Ajax_Visitor.aspx", function (data) {
        if (data == "1" || data == "2") {//-1:cookie信息错误 -2：注册失败  1：注册成功 2：已登录 
            location.href = "/HallPage/HallPageFL.aspx";
        } else if (data == "-1") {
            alert("请关闭浏览器重新访问！");
        }
    });
}