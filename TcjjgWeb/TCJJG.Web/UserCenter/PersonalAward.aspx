<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="PersonalAward.aspx.cs" Inherits="UserCenter_PersonalAward" %>

<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/UC_LeftNav.ascx" TagName="UC_LeftNav" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0px auto; width: 1000px; height: 740px; margin-bottom: 38px;">
        <uc1:UC_UserInfo ID="UC_UserInfo" runat="server" />
        <uc2:UC_LeftNav ID="UC_LeftNav" runat="server" />
        <div class="uc-content-wrap">
            <div class="mygood-wrap">
                <asp:Literal ID="ltlContainer" runat="server"></asp:Literal>
                <div class="pageBar">
                    <div>
                        <img class="pager_pre" src="../Images/UserCenter/pre1.png" alt="" /></div>
                    <div class="pageCount">
                        <span class="pageIndex"></span>/<span class="pageTotalCount"></span></div>
                    <div>
                        <img class="pager_next" src="../Images/UserCenter/next1.png" alt="" /></div>
                </div>
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>
    </div>
    <script type="text/javascript">
        $(".pageItem").eq(0).show();
        $(".pageTotalCount").html($(".pageItem").length);
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
            var pageCount = $(".pageItem").length;
            if (pageCount > 0) {

                $(".pager_next").click(function () {
                    var objVisible = $(".pageItem:visible");
                    if ($(".pageItem:visible").next(".pageItem").eq(0).length > 0) {
                        $(".pageItem:visible").next(".pageItem").eq(0).show();
                        objVisible.hide();
                        pageIndex++;
                        $(".pageIndex").html(pageIndex);
                    }
                });
            }
        }
        function pagePre() {
            var pageCount = $(".pageItem").length;
            if (pageCount > 0) {
                $(".pager_pre").click(function () {
                    var objVisible = $(".pageItem:visible");
                    if ($(".pageItem:visible").prev().eq(0).length > 0) {
                        $(".pageItem:visible").prev().eq(0).show();
                        objVisible.hide();
                        pageIndex--
                        $(".pageIndex").html(pageIndex);
                    }
                });
            }
        }


    </script>
    <script type="text/javascript">
        $(".nav-item").eq(2).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        $(".uc-nav-item").eq(0).find("img").attr("src", $(".uc-nav-item").eq(0).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(0).addClass("hover").addClass("selected");
    </script>
</asp:Content>
