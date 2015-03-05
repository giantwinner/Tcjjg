<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Guid.aspx.cs" Inherits="HelpCenter_Guid" %>

<%@ Register Src="~/UserControl/HC_TopBlock.ascx" TagName="HC_TopBlock" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/HC_LeftMenu.ascx" TagName="HC_LeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/HelpCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0px auto; width: 1000px;">
        <uc1:HC_TopBlock ID="HC_TopBlock" runat="server" />
        <uc2:HC_LeftMenu ID="HC_LeftMenu" runat="server" />
        <div class="uc-content-wrap" style=" width:792px">
            <div class="D_IndexRightContainer">
                <div class="help_position">
                    <div class="help_nav" id="nav1">
                        <asp:Literal ID="litGuid" runat="server"></asp:Literal>
                        <span class="help_nav_more" id="more1">&nbsp;>>&nbsp;</span>
                    </div>
                    <div class="help_nav" id="nav2" style="display: none">
                        <span class="help_nav_more" id="more2" style="float: left">&nbsp;<<&nbsp;</span>
                        <asp:Literal ID="litGuidMore" runat="server"></asp:Literal>
                    </div>
                    <div>
                        <div id="guidContent" class="help_content">
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <%--   <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>--%>
    </div>
        <script type="text/javascript">
            $(".nav-item").eq(5).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
            $(".uc-nav-item").eq(3).find("img").attr("src", $(".uc-nav-item").eq(3).find("img").attr("src").replace("2", "1"));
            $(".uc-nav-item").eq(3).addClass("hover").addClass("selected");
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            $(".help_nav_item").eq(0).addClass("help_nav_item_sel");
            $(".help_content").eq(0).show();

            var num = $(".help_nav_item").eq(0).attr("id");
            $.get("/Ajax/HelpCenter.aspx?id=" + num, function (result) {
                $("#guidContent").html(result);
            });
            $(".help_nav_item").click(function () {
                $(".help_nav_item").removeClass("help_nav_item_sel");
                $(this).addClass("help_nav_item_sel");

                var num = $(this).attr("id");
                $.get("/Ajax/HelpCenter.aspx?id=" + num, function (result) {
                    $("#guidContent").html(result);
                });
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
