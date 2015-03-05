<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Affiche.aspx.cs" Inherits="Affiche_Affiche" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/Affiche.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_AfficheContainer">
        <div class="D_CompetitionAffiche">
            <div class="CompetitionAfficheTitle">
                <span class="title">赛事公告</span><span class="scroll"><span class="NewsToLeft"></span>
                    &nbsp;<span class="NewsToRight"></span></span>
            </div>
            <div style="height: 210px;">
                <asp:Literal ID="ltlContainer" runat="server"></asp:Literal>
            </div>
            <%--            <div class="CompetitionAfficheContent">
            </div>--%>
        </div>
        <div class="D_SystemAffiche">
            <div class="SystemAfficheTitle">
                <span class="title">系统公告</span><span class="scroll"><span class="SysToLeft"></span>
                    &nbsp;<span class="SysToRight"></span></span>
            </div>
            <div style="height: 210px;">
                <asp:Literal ID="ltlContainer2" runat="server"></asp:Literal>
            </div>
            <%--            <div class="SystemAfficheContent">
            </div>--%>
        </div>
        <span style=" display:block; height:2px;"></span>
    </div>
    <%--    <script type="text/javascript">
        $(function () {
            GetNewsAffiche();
            GetSystemAffiche();

            //点击新闻公告
            $(".NewsToLeft").click(function () {
                var RowContent = $(".CompetitionAfficheContent .RowContent").eq(0);
                $(".CompetitionAfficheContent").remove(RowContent);
                $(".CompetitionAfficheContent").append(RowContent);
            });
            $(".NewsToRight").click(function () {
                var RowContent = $(".CompetitionAfficheContent .RowContent").last();
                $(".CompetitionAfficheContent").remove(RowContent);
                $(".CompetitionAfficheContent .RowContent").eq(0).before(RowContent);
            });


            //点击系统公告
            $(".SysToLeft").click(function () {
                var RowContent = $(".SystemAfficheContent .RowContent").eq(0);
                $(".SystemAfficheContent").remove(RowContent);
                $(".SystemAfficheContent").append(RowContent);
            });
            $(".SysToRight").click(function () {
                var RowContent = $(".SystemAfficheContent .RowContent").last();
                $(".SystemAfficheContent").remove(RowContent);
                $(".SystemAfficheContent .RowContent").eq(0).before(RowContent);
            });
        })

        //获得新闻公告
        function GetNewsAffiche() {
            $.post("/Ajax/Ajax_Bulletin.aspx?type=2",
             {}, function (data) {
                 $(".CompetitionAfficheContent").html(); var html = "";
                 var jsonData = eval("(" + data + ")");
                 for (var i = 0; i < jsonData.length; i++) {
                     html = html + "<a class=\"RowContent\" href='/Affiche/AfficheDetail-" + jsonData
[i].NewsID + ".html'><span class=\"Block\"></span>&nbsp;&nbsp;<span class=\"Content\">" + jsonData
[i].NewsTitle + " </span>" +
                    "<span class=\"Time\">" + jsonData[i].NewsDate + "</span></a>";
                 }
                 $(".CompetitionAfficheContent").html(html);
             })
        }
        //获得系统公告
        function GetSystemAffiche() {
            $.post("/Ajax/Ajax_Bulletin.aspx?type=3",
             {}, function (data) {
                 $(".SystemAfficheContent").html(); var html = "";
                 var jsonData = eval("(" + data + ")");
                 for (var i = 0; i < jsonData.length; i++) {
                     html = html + "<a class=\"RowContent\" href='/Affiche/AfficheDetail-" + jsonData
[i].NewsID + ".html'><span class=\"Block\"></span>&nbsp;&nbsp;<span class=\"Content\">" + jsonData
[i].NewsTitle + " </span>" +
                    "<span class=\"Time\">" + jsonData[i].NewsDate + "</span></a>";
                 }
                 $(".SystemAfficheContent").html(html);
             })
         }

    </script>--%>
    <script type="text/javascript">
        $(function () {

            /*************/
            $(".CompetitionAfficheContent").eq(0).show();
            pageNext();
            pagePre();
            function pageNext() {
                var pageCount = $(".CompetitionAfficheContent").length;
                if (pageCount > 0) {
                    $(".NewsToRight").click(function () {
                        var objVisible = $(".CompetitionAfficheContent:visible");
                        if ($(".CompetitionAfficheContent:visible").next(".CompetitionAfficheContent").eq(0).length > 0) {
                            $(".CompetitionAfficheContent:visible").next(".CompetitionAfficheContent").eq(0).show();
                            objVisible.hide();
                        }
                    });
                }
            }
            function pagePre() {
                var pageCount = $(".CompetitionAfficheContent").length;
                if (pageCount > 0) {
                    $(".NewsToLeft").click(function () {
                        var objVisible = $(".CompetitionAfficheContent:visible");
                        if ($(".CompetitionAfficheContent:visible").prev(".CompetitionAfficheContent").eq(0).length > 0) {
                            $(".CompetitionAfficheContent:visible").prev(".CompetitionAfficheContent").eq(0).show();
                            objVisible.hide();
                        }
                    });
                }
            }
            /***********/
            $(".SystemAfficheContent").eq(0).show();
            pageNextSys();
            pagePreSys();
            function pageNextSys() {
                var pageCount = $(".SystemAfficheContent").length;
                if (pageCount > 0) {
                    $(".SysToRight").click(function () {
                        var objVisible = $(".SystemAfficheContent:visible");
                        if ($(".SystemAfficheContent:visible").next(".SystemAfficheContent").eq(0).length > 0) {
                            $(".SystemAfficheContent:visible").next(".SystemAfficheContent").eq(0).show();
                            objVisible.hide();
                        }
                    });
                }
            }
            function pagePreSys() {
                var pageCount = $(".SystemAfficheContent").length;
                if (pageCount > 0) {
                    $(".SysToLeft").click(function () {
                        var objVisible = $(".SystemAfficheContent:visible");
                        if ($(".SystemAfficheContent:visible").prev(".SystemAfficheContent").eq(0).length > 0) {
                            $(".SystemAfficheContent:visible").prev(".SystemAfficheContent").eq(0).show();
                            objVisible.hide();
                        }
                    });
                }
            }


        })
    </script>
</asp:Content>
