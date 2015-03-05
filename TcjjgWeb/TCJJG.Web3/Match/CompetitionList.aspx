<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CompetitionList.aspx.cs" Inherits="Match_CompetitionList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/Competition.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_Competition_Container" style="position: relative; width: 930px; height: 370px;
        margin-left: auto; margin-right: auto; margin-top: 90px; margin-bottom: 90px;">
        <asp:Literal ID="ltlContainer" runat="server"></asp:Literal>
        <%-- <div class="liTop" style="margin-bottom: 50px;">
            <a href="Match_Athletics.aspx" style="margin-left: 20px; margin-right: 20px; display: inline-block;
                width: 256px; height: 145px;">
                <img src="../Images/Competition/LxilieMatch.jpg" /></a> <a href="MatchDetail.aspx?m=1"
                    style="margin-left: 20px; margin-right: 20px; display: inline-block; width: 256px;
                    height: 145px;">
                    <img src="../Images/Competition/LappMatch.jpg" /></a> <a href="MatchDetail.aspx?m=2"
                        style="margin-left: 20px; margin-right: 20px; display: inline-block; width: 256px;
                        height: 145px;">
                        <img src="../Images/Competition/LappCard.jpg" /></a>
        </div>
        <div class="liTop" style="margin-bottom: 50px;">
            <a href="MatchDetail.aspx?m=1" style="margin-left: 20px; margin-right: 20px; display: inline-block;
                width: 256px; height: 145px;">
                <img src="../Images/Competition/Ljingyin.jpg" /></a> <a href="MatchDetail.aspx?m=2"
                    style="margin-left: 20px; margin-right: 20px; display: inline-block; width: 256px;
                    height: 145px;">
                    <img src="../Images/Competition/Lgoldjingying.jpg" /></a> <a href="Match-sxs.aspx"
                        style="margin-left: 20px; margin-right: 20px; display: inline-block; width: 256px;
                        height: 145px;">
                        <img src="../Images/Competition/Lsxs.jpg" /></a>
        </div>--%>
        <div class="pager_pre">
            <img src="../Images/Competition/PagerLeft.jpg" />
        </div>
        <div class="pager_next">
            <img src="../Images/Competition/PagerRight.jpg" />
        </div>
    </div>
    <script type="text/javascript">
        $(".liTop").eq(0).show();
        pageNext();
        pagePre();
        function pageNext() {
            var pageCount = $(".liTop").length;
            if (pageCount > 0) {
                $(".pager_next").click(function () {
                    var objVisible = $(".liTop:visible");
                    if ($(".liTop:visible").next(".liTop").eq(0).length > 0) {
                        $(".liTop:visible").next(".liTop").eq(0).show();
                        objVisible.hide();
                    }
                });
            }
        }
        function pagePre() {
            var pageCount = $(".liTop").length;
            if (pageCount > 0) {
                $(".pager_pre").click(function () {
                    var objVisible = $(".liTop:visible");
                    if ($(".liTop:visible").prev(".liTop").eq(0).length > 0) {
                        $(".liTop:visible").prev(".liTop").eq(0).show();
                        objVisible.hide();
                    }
                });
            }
        }
    </script>
</asp:Content>
