<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Match-sxs.aspx.cs" Inherits="MatchInfo_Match_sxs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>同城斗地主竞技赛-中国扑克竞技赛（CMOP）</title>
    <link href="../Css/Match.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="sxs">
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/1shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/2shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/3shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/4shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/5shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/6shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/7shengxiaosai.jpg" />
<%--        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/8shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/9shengxiaosai.jpg" />--%>
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/10shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/11shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/12shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/13shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/14shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/15shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/16shengxiaosai.jpg" />
        <%--        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/17shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/18shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/19shengxiaosai.jpg" />--%>
        <a class="sxs_BG_Img1" href="http://www.tcjjg.com/HelpCenter/systemAfficheOpe-477.html">
            <img alt="" class="sxs_BG_Img1" src="../Images/AnimalMatch/sxs_hjz_1.jpg" /></a><a href="http://www.tcjjg.com/helpCenter/systemAfficheOpe-556.html"
                class="sxs_BG_Img1"><img alt="" class="sxs_BG_Img1" src="../Images/AnimalMatch/sxs_hjz_2.jpg" /></a><a
                    class="sxs_BG_Img1"><img alt="" class="sxs_BG_Img1" src="../Images/AnimalMatch/sxs_hjz_3.jpg" /></a><a
                        class="sxs_BG_Img1"><img alt="" class="sxs_BG_Img1" src="../Images/AnimalMatch/sxs_hjz_4.jpg" /></a><a
                            class="sxs_BG_Img1"><img alt="" class="sxs_BG_Img1" src="../Images/AnimalMatch/sxs_hjz_5.jpg" /></a><a
                                class="sxs_BG_Img1"><img alt="" class="sxs_BG_Img1" src="../Images/AnimalMatch/sxs_hjz_6.jpg" /></a><img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/25shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/26shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/27shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/28shengxiaosai.jpg" />
        <img alt="" class="sxs_BG_Img" src="../Images/AnimalMatch/29shengxiaosai.jpg" />
<%--        <div class="sxs_winner">
            <div class="sxs_winner_nav">
                <asp:Literal ID="ltlRound" runat="server"></asp:Literal>
                <%--                <div class="sxs_winner_nav_item">
                    第一轮获奖名单
                </div>
                <div class="sxs_winner_nav_item">
                    第二轮获奖名单
                </div>
                <div class="sxs_winner_nav_item">
                    第三轮获奖名单
                </div>
                <span class="help_nav_more" id="more1">&nbsp;>>&nbsp;</span>
            </div>
            <div class="sxs_winner_nav2" style="display: none">
                <span class="help_nav_more" id="more2" style="float: left; display: inline">&nbsp;<<&nbsp;</span>
                <span class="help_nav_more" id="more3" style="float: right; display: inline">&nbsp;>>&nbsp;</span>
                <asp:Literal ID="ltlRound2" runat="server"></asp:Literal>
            </div>
            <div class="sxs_winner_nav3" style="display: none">
                <span class="help_nav_more" id="more4" style="float: left; display: inline">&nbsp;<<&nbsp;</span>
                <span class="help_nav_more" id="more5" style="float: right; display: inline">&nbsp;>>&nbsp;</span>
                <asp:Literal ID="ltlRound3" runat="server"></asp:Literal>
            </div>
            <div class="sxs_winner_info">
                为保证比赛的公平、公正、公开，我们会及时把每天的比赛结果公布在这里，以方便所有玩家的监督&查询！
            </div>
            <%--            <table id="round1" class="sxs_winner_table">
                <tr>
                    <th class="th">
                        第一轮
                    </th>
                    <th class="th">
                        获奖生肖票
                    </th>
                    <th class="th">
                        获得生肖票玩家
                    </th>
                </tr>
            <table class="sxs_winner_table">
            </table>
            <%-- 
            <tr><td class="td1">第一天</td><td class="td2">鼠票</td><td class="td3"></td></tr>
            <tr><td class="td1">第二天</td><td class="td2">牛票</td><td class="td3"></td></tr>
            <tr><td class="td1">第三天</td><td class="td2">虎票</td><td class="td3"></td></tr>
            <tr><td class="td1">第四天</td><td class="td2">兔票</td><td class="td3"></td></tr>
            <tr><td class="td1">第五天</td><td class="td2">龙票</td><td class="td3"></td></tr>
            <tr><td class="td1">第六天</td><td class="td2">蛇票</td><td class="td3"></td></tr>
            <tr><td class="td1">第七天</td><td class="td2">马票</td><td class="td3"></td></tr>
            <tr><td class="td1">第八天</td><td class="td2">羊票</td><td class="td3"></td></tr>
            <tr><td class="td1">第九天</td><td class="td2">猴票</td><td class="td3"></td></tr>
            <tr><td class="td1">第十天</td><td class="td2">鸡票</td><td class="td3"></td></tr>
            <tr><td class="td1">第十一天</td><td class="td2">狗票</td><td class="td3"></td></tr>
            <tr><td class="td1">第十二天</td><td class="td2">猪票</td><td class="td3"></td></tr>--%>
            <%--            </table>
            <table id="round2" class="sxs_winner_table">
                <tr>
                    <th class="th">
                        第二轮
                    </th>
                    <th class="th">
                        获奖生肖票
                    </th>
                    <th class="th">
                        获得生肖票玩家
                    </th>
                </tr>
                <asp:Literal ID="LiteralWinner2" runat="server"></asp:Literal>
            </table>
            <table id="round3" class="sxs_winner_table">
                <tr>
                    <th class="th">
                        第三轮
                    </th>
                    <th class="th">
                        获奖生肖票
                    </th>
                    <th class="th">
                        获得生肖票玩家
                    </th>
                </tr>
                <asp:Literal ID="LiteralWinner3" runat="server"></asp:Literal>
            </table>
        </div>--%>

        <div class="sxs_link" onclick="document.location='../UserCenter/UserReg.aspx'">
        </div>
    </div>
    </form>
</body>
</html>
<%--<script type="text/javascript">
    $(document).ready(function () {
        //背景图片高度
        var heights = $("#pitchon").attr("heights");
        var regex = /\d+/g;
        var addHeight = regex.exec(heights) / 3;
        $(".imgH").height($(".imgH").height() + addHeight);

        //当选项卡低于5项时，隐藏“更多”
        if ($(".sxs_winner_nav_item").length <= 5) {
            $("#more1").css("display", "none");
        }
        if ($(".sxs_winner_nav_item").length > 5) {
            if ($(".sxs_winner_nav_item").length < 11) {
                $("#more3").css("display", "none");
            }
        }

        //默认选中
        $("#pitchon").addClass("sxs_winner_nav_item_sel");

        var rid = $("#pitchon").attr("roundid");

        $.get("../Ajax/AJAX_WinnerRound.aspx", "id=" + rid, function (data) {
            $(".sxs_winner_table").html(data);
            $(".sxs_winner_table").eq(0).show();

            //当多于5轮时
            if (parseInt(rid) > 5) {
                $(".sxs_winner_nav2").css("display", "");
                $(".sxs_winner_nav").css("display", "none");
                //当多于10轮时
                if (parseInt(rid) > 10) {
                    $("#more3").css("display", "");
                    $(".sxs_winner_nav3").css("display", "");
                    $(".sxs_winner_nav2").css("display", "none");
                    $(".sxs_winner_nav").css("display", "none");
                }
            }
        })


        //当点击切换选项卡时
        $(".sxs_winner_nav_item").click(function () {
            $(".sxs_winner_nav_item").removeClass("sxs_winner_nav_item_sel");

            $(this).addClass("sxs_winner_nav_item_sel");

            var rid = $(this).attr("roundid");

            //背景图片高度
            $(".imgH").height("136px");
            var heights = $(this).attr("heights");
            var regex = /\d+/g;
            var addHeight = regex.exec(heights) / 3;
            $(".imgH").height($(".imgH").height() + addHeight);


            $.get("../Ajax/AJAX_WinnerRound.aspx", "id=" + rid, function (data) {
                $(".sxs_winner_table").html(data);
                $(".sxs_winner_table").eq(0).show();
            })
        })

        //点击"更多"时
        $("#more1").click(function () {
            $(".sxs_winner_nav").css("display", "none");
            $(".sxs_winner_nav2").css("display", "");
            if ($(".sxs_winner_nav_item").length < 11) {
                $("#more3").css("display", "none");
            }
            $("#pitchon").addClass("sxs_winner_nav_item_sel");

            var rid = $("#pitchon").attr("roundid");

            $.get("../Ajax/AJAX_WinnerRound.aspx", "id=" + rid, function (data) {
                $(".sxs_winner_table").html(data);
                $(".sxs_winner_table").eq(0).show();
            })
        });
        $("#more2").click(function () {
            $(".sxs_winner_nav").css("display", "");
            $(".sxs_winner_nav2").css("display", "none");
            $(".sxs_winner_nav_item").removeClass("sxs_winner_nav_item_sel");
        });
        $("#more3").click(function () {
            $(".sxs_winner_nav").css("display", "none");
            $(".sxs_winner_nav2").css("display", "none");
            $(".sxs_winner_nav3").css("display", "");

            $("#pitchon").addClass("sxs_winner_nav_item_sel");

            var rid = $("#pitchon").attr("roundid");

            $.get("../Ajax/AJAX_WinnerRound.aspx", "id=" + rid, function (data) {
                $(".sxs_winner_table").html(data);
                $(".sxs_winner_table").eq(0).show();
            })
        });
        $("#more4").click(function () {
            $(".sxs_winner_nav2").css("display", "");
            $(".sxs_winner_nav3").css("display", "none");
            $(".sxs_winner_nav_item").removeClass("sxs_winner_nav_item_sel");

            $("#pitchon").addClass("sxs_winner_nav_item_sel");

            var rid = $("#pitchon").attr("roundid");

            $.get("../Ajax/AJAX_WinnerRound.aspx", "id=" + rid, function (data) {
                $(".sxs_winner_table").html(data);
                $(".sxs_winner_table").eq(0).show();
            })
        });
    })
</script>--%>
