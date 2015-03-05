<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Report.aspx.cs" Inherits="CustomerService_Report" %>

<%@ Register src="../UserControl/HelpCenter.ascx" tagname="HelpCenter" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Css/CustomerService.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="D_IndexContainer">
        <uc1:HelpCenter ID="HelpCenter1" runat="server" />
                <div class="D_IndexRightContainer">
                    <div class="help_position">
        <div class="help_nav" id="nav1">
            <%--           <div class="help_nav_item">
                作弊举报
            </div>
            <div class="help_nav_item" style="width: 150px">
                作弊处罚标准与准则
            </div>
            <div class="help_nav_item">
                官方处理举报流程
            </div>--%>
            <asp:Literal ID="litGuid" runat="server"></asp:Literal>
            <span class="help_nav_more" id="more1">&nbsp;>>&nbsp;</span>
        </div>
        <div class="help_nav" id="nav2" style="display: none">
            <span class="help_nav_more" id="more2" style="float: left">&nbsp;<<&nbsp;</span>
            <asp:Literal ID="litGuidMore" runat="server"></asp:Literal>
        </div>
        <div>
            <%--            <div id="report1" class="help_content">
                <br />
                举报流程：
                <br />
                同城严重作弊处理办法自出台以来，对维护比赛公平性、营造良好的比赛环境起到了很大的作用，现已处理玩家投诉近百起，可以说我们的投诉系统运行的还是十分成功的！当然，还是会有一部分玩家对我们的投诉方法有诸多不清楚的地方，现在我们来对投诉流程进行一下详细说明：
                <br />
                <br />
                1、登录账号之后进入游戏大厅进行报名参赛，比赛过程中如发现其他玩家出现异常出牌情况，可立即点击房间右上角举报按钮。
                <br />
                <br />
                <img alt="" class="help_right_image" src="../StyleSheet/defaultImg/help_report2 (2).png" />
                <br />
                <br />
                2、要慎重，举报人在觉得本场比赛有人异常出牌的情况下，可立即点击举报按钮，举报需扣除举报人500金币举报费用，待审核通过后才会给予返还，当场比赛有严重作弊者，除返还举报人举报费用外，会额外赠予200金币。
                <br />
                <br />
                <img alt=""  src="../StyleSheet/defaultImg/help_report2 (1).png" />
                <br />
                <br />
                3、等待审核'举报成功后，被举报双方的账号都会被限制交易，这是同城相关部门出台为避免作弊团伙尽快的转移或清空账号内的财富的相关政策。官方会在玩家举报之后8个工作小时内进行审核，请您耐心等待。
                <br />
                <br />
                <img alt=""  src="../StyleSheet/defaultImg/help_report3.png" />
                <br /><br />
            </div>
            <div id="report2" class="help_content">
                <br />
                作弊情况分以下三种：
                <br />
                <br />
                1、严重作弊
                <br />
                标准： 完全不按正常思维逻辑出牌，严重影响牌局输赢结果。
                <br />
                处罚标准：经作弊审核小组一致通过，将永久封停作弊玩家的账号，账号内所有财富全部清零。
                <br />
                举报玩家的补偿：举报作弊的玩家给予返还举报作弊金的同时额外奖励200金币。
                <br />
                <br />
                2、疑似作弊
                <br />
                标准： 不按正常思维逻辑出牌，对牌局输赢造成一定影响。（此情况由于玩家出牌风格或水平高低有限，造成各种疑似情况，一切由作弊审核小组凭游戏录像审核结果为准）
                <br />
                处罚标准： 给予疑似作弊的玩家站内信警告（警告三次以上按严重作弊处理）
                <br />
                举报玩家的补偿：返还举报作弊金。
                <br />
                <br />
                3、无作弊行为
                <br />
                标准：玩家所举报的比赛属于正常出牌行为，无任何作弊嫌疑。
                <br />
                处罚标准：举报作弊的玩家举报金不予返还一切处罚均以官方处理结果为准！！！所有举报作弊的审核结果均以站内信的形式通知玩家。
                <br /><br />
                小提示：为了防止恶意举报，检举人举报作弊时扣除500金币举报金，经官方审核后，情况属实系统将自动返还所扣除的举报费用，同时将对作弊玩家进行处理。
            </div>
            <div id="report3" class="help_content">
                <br />
                玩家举报：
                <br />
                1. 玩家在比赛过程中遇到异常出牌行为的玩家，可以点击房间右上角的举报按钮。
                <br />
                2. 系统自动扣除举报玩家500金币举报费用，根据处理结果会对举报金进行返还、扣除或者奖励。
                <br />
                3. 检举人举报成功后，系统会自动将被举报双方账号限制交易。
                <br />
                <br />
                审核时间:
                <br />
                工作人员会在举报成功后的8个工作小时内尽快审核该场次比赛。
                <br />
                <br />
                审核流程：
                <br />
                1. 由审核部门A组成员负责初审作弊录像,记录初步审核意见。
                <br />
                2. 由审核部门B组成员进行复审，最终制定复审意见。
            </div>--%>
            <div id="guidContent" class="help_content">
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

            $("#Report").css("background-image", "url('../Images/CustomerService/tcjjg_2012__ucbg.jpg')");

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

                $(".help_nav_item").eq(1).css("width", "140px");

            })
    </script>
</asp:Content>

