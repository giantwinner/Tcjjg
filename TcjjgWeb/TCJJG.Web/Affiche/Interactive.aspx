<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Interactive.aspx.cs" Inherits="Affiche_Interactive" %>

<%@ Register Src="~/UserControl/Affiche_UserInfo.ascx" TagName="Affiche_UserInfo"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/Affiche_LeftMenu.ascx" TagName="Affiche_LeftMenu"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../CSS/Affiche.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="affiche-wrap">
        <div class="top">
            <uc1:Affiche_UserInfo ID="Affiche_UserInfo" runat="server" />
        </div>
        <div id="affiche-topright">
            <img src="/Images/Affiche/xinwen1.gif" alt="" />
        </div>
        <div id="affiche-content-wrap">
            <asp:Literal ID="ltlContainer" runat="server"></asp:Literal>
            <div class="pageBar2">
                <div>
                    <img class="pager_pre" src="../Images/UserCenter/pre1.png" alt="" /></div>
                <div class="pageCount2">
                    <span class="pageIndex"></span>/<span class="pageTotalCount"></span></div>
                <div>
                    <img class="pager_next" src="../Images/UserCenter/next1.png" alt="" /></div>
            </div>
        </div>
        <div id="affiche-leftmenu">
            <uc2:Affiche_LeftMenu ID="Affiche_LeftMenu" runat="server" />
        </div>
        <script type="text/javascript">
            $(".uc-nav-item").eq(2).find("img").attr("src", $(".uc-nav-item").eq(1).find("img").attr("src").replace("2", "1"));
            $(".uc-nav-item").eq(2).addClass("hover").addClass("selected");
            $(".affiche-page").eq(0).show();
            $(".pageTotalCount").html($(".affiche-page").length);
            var pageIndex = 1;
            $(".pageIndex").html(pageIndex);
            showRemark();
            pageNext();
            pagePre();
            function showRemark() {
                $(".backImg img").hover(function () {
                    if ($(this).prev().html().length != 0) {
                        $(this).prev().show();
                    }
                }, function () {
                    $(this).prev().hide();
                });
            }
            function pageNext() {
                var pageCount = $(".affiche-page").length;
                if (pageCount > 0) {

                    $(".pager_next").click(function () {
                        var objVisible = $(".affiche-page:visible");
                        if ($(".affiche-page:visible").next(".affiche-page").eq(0).length > 0) {
                            $(".affiche-page:visible").next(".affiche-page").eq(0).show();
                            objVisible.hide();
                            pageIndex++;
                            $(".pageIndex").html(pageIndex);
                        }
                    });
                }
            }
            function pagePre() {
                var pageCount = $(".affiche-page").length;
                if (pageCount > 0) {
                    $(".pager_pre").click(function () {
                        var objVisible = $(".affiche-page:visible");
                        if ($(".affiche-page:visible").prev().eq(0).length > 0) {
                            $(".affiche-page:visible").prev().eq(0).show();
                            objVisible.hide();
                            pageIndex--;
                            $(".pageIndex").html(pageIndex);
                        }
                    });
                }
            }

            $(".nav-item").eq(1).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        </script>
    </div>
</asp:Content>

