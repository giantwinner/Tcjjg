$(function () {

    $(".uc-nav-item").hover(function () {
        $(this).find("img").attr("src", $(this).find("img").attr("src").replace("2", "1"));
    }, function () {
        if (!$(this).hasClass("selected")) {
            $(this).find("img").attr("src", $(this).find("img").attr("src").replace("1", "2"));
        }
    });

});