<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Goods.aspx.cs" Inherits="CustomerService_Goods" %>

<%@ Register Src="../UserControl/HelpCenter.ascx" TagName="HelpCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/CustomerService.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_IndexContainer">
        <uc1:HelpCenter ID="HelpCenter1" runat="server" />
        <div class="D_IndexRightContainer">
            <div class="help_position">
                <div class="help_nav" id="nav1">
                    <asp:Literal ID="litGuid" runat="server"></asp:Literal>
                    <span class="help_nav_more" id="more1">&nbsp;>>&nbsp;</span>
                </div>
                <div class="help_nav" id="nav2" style="display: none">
                    <span class="help_nav_more" id="more2" style="float: left">&nbsp;&nbsp;</span>
                    <asp:Literal ID="litGuidMore" runat="server"></asp:Literal>
                </div>
                <div>
                    <div id="guidContent" class="help_content" style="position: relative">
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="clearF">
    </div>
    <script type="text/javascript">
        //导航默认选中
        $("#A_CustomerServiceCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });

        $("#Goods").css("background-image", "url('../Images/CustomerService/tcjjg_2012__ucbg.jpg')");

        $(document).ready(function () {
            $(".help_content").eq(0).show();
            $(".help_right_goods_text").hide();

            var num = $(".help_nav_item").eq(0).attr("id");
            $.get("/Ajax/HelpCenter.aspx?id=" + num, function (result) {
                $("#guidContent").html(result);


                $(".help_right_goods_image").click(function () {
                    var n = $(this).parent().index();
                    $(".help_right_goods_text").hide();
                    $(".help_right_goods_text").eq(n).show();
                })
            });

            $(".help_nav_item").eq(0).addClass("help_nav_item_sel");
            $(".help_nav_item").click(function () {
                $(".help_right_goods_text").hide();
                $(".help_nav_item").removeClass("help_nav_item_sel");
                $(this).addClass("help_nav_item_sel");
                //                var num = $(this).index();
                //                $(".help_content").hide();
                //                $(".help_content").eq(num).show();


                var num = $(this).attr("id");
                $.get("/Ajax/HelpCenter.aspx?id=" + num, function (result) {
                    $("#guidContent").html(result);

                    $(".help_right_goods_image").click(function () {
                        var n = $(this).parent().index();
                        $(".help_right_goods_text").hide();
                        $(".help_right_goods_text").eq(n).show();
                    })

                })
            })

            if ($(".help_nav_item").eq(5).attr("id") == null) {
                $("#more1").css("display", "none");
            }
            $("#nav2 > .help_nav_item").click(function () {
                $(".help_nav_item").removeClass("help_nav_item_sel");
                $(this).addClass("help_nav_item_sel");

                var num = $(this).attr("id");
                $.get("/Ajax/HelpCenter.aspx?id=" + num, function (result) {
                    $("#guidContent").html(result);
                });
            })

            $("#more1").click(function () {
                $("#nav1").hide();
                $("#nav2").show();
                $(".help_nav_item").removeClass("help_nav_item_sel");
                $(".help_nav_item").eq(5).addClass("help_nav_item_sel");

                var num = $(".help_nav_item").eq(5).attr("id");
                $.get("/Ajax/HelpCenter.aspx?id=" + num, function (result) {
                    $("#guidContent").html(result);
                });


            })
            $("#more2").click(function () {
                $("#nav2").hide();
                $("#nav1").show();
                $(".help_nav_item").removeClass("help_nav_item_sel");
                $(".help_nav_item").eq(0).addClass("help_nav_item_sel");
                $(".help_content").hide();
                $(".help_content").eq(0).show();

                var num = $(".help_nav_item").eq(0).attr("id");
                $.get("/Ajax/HelpCenter.aspx?id=" + num, function (result) {
                    $("#guidContent").html(result);
                });
            })
        })
    </script>
</asp:Content>
