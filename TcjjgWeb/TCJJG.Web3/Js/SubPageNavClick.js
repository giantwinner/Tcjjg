$(document).ready(function () {
    //左侧导航
    $(".subPage_Left_Nav_Item").eq(0).addClass("subPage_Left_Nav_Item_Selected");
    $(".subPage_Left_Nav_Item").click(function () {
        $(".subPage_Left_Nav_Item").removeClass("subPage_Left_Nav_Item_Selected");
        $(this).addClass("subPage_Left_Nav_Item_Selected");
    })

    //充值中心右侧导航
    $(".payCenter_Right_Content_Main_Nav_Item").click(function () {
        $(".payCenter_Right_Content_Main_Nav_Item").removeClass("payCenter_Right_Content_Main_Nav_Item_Selected");
        $(this).addClass("payCenter_Right_Content_Main_Nav_Item_Selected");
    })
})