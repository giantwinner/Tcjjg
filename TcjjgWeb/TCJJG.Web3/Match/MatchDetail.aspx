<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="MatchDetail.aspx.cs" Inherits="Match_MatchDetail" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/Match.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function getQueryString() {
            var result = location.search.match(new RegExp("[\?\&][^\?\&]+=[^\?\&]+", "g"));
            if (null != result) {
                for (var i = 0; i < result.length; i++) {
                    result[i] = result[i].substring(1);
                }
                return result;
            } else {
                return "";
            }
        }
        $(function () {
            var param = getQueryString().toString().substr(2, 1);
            $(".MatchDetailContainer").eq(param - 1).show();
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
<%--    <div class="MatchDetailContainer" runat="server">
        <div class="TopImg">
            <img src="../Images/Match/DetailApple.jpg" />
        </div>
        <div class="MidIntro">
            诱人的奖品，持续的火爆！<br />
            苹果系列赛每周一至周五21:30开赛<br />
            每场一台ipad2，还有苹果卡和金币等诱人奖励<br />
            <br />
            （赛事详细信息请见平台）<br />
            <br />
        </div>
        <br />
        <br />
        <a href="../HallPage/HallPageFL.aspx" class="BtnTakeInMatch"></a>
        <br />
        <br />
        <br />
    </div>
    <div class="MatchDetailContainer" runat="server">
        <div class="TopImg">
            <img src="../Images/Match/appCard.jpg" />
        </div>
        <div class="MidIntro">
            拥有苹果系列产品不再是梦！苹果卡争夺赛每日开启五场，您可以获得海量苹果卡，集齐苹果卡即可兑换苹果手机、苹果笔记本以及苹果ipad2！心动不如行动，赶紧抓紧时间报名参与吧
            <br />
            <br />
            <br />
        </div>
        <br />
        <span style="display: block; width: 170px; margin: 0 auto;">（赛事详细信息请见平台）</span>
        <br />
        <a href="../HallPage/HallPageFL.aspx" class="BtnTakeInMatch"></a>
        <br />
        <br />
        <br />
    </div>
    <div class="MatchDetailContainer" runat="server">
        <div class="TopImg">
            <img src="../Images/Match/rankjingying.jpg" />
        </div>
        <div class="MidIntro">
            万众期待的等级房间已经与大家见面了，在这里将给予斗地主高手们一个更广阔的平台！相信许多斗地主高手已经<br />
            跃跃欲试，等级越高技术越高，竞争也会更加激烈与刺激哦！当然，丰厚大奖也绝对不会让各位玩家失望的，等级越<br />
            高获得奖励价值越高。让我们一起相约每周日15:30吧！
            <br />
            <br />
            每场比赛的奖品根据报名等级相挂钩<br />
            5&nbsp;级 - 苹果ipod mp3 播放器<br />
            10级 - 苹果ipod touch4 播放器<br />
            15级 - 苹果ipad2 平板电脑<br />
            20级 - 苹果iphone4s 手机<br />
            25级 - 苹果MacBook Air 笔记本电脑<br />
        </div>
        <br />
        <br />
        <br />
        <span style="display: block; width: 170px; margin: 0 auto;">（赛事详细信息请见平台）</span>
        <br />
        <a href="../HallPage/HallPageFL.aspx" class="BtnTakeInMatch"></a>
        <br />
        <br />
        <br />
    </div>
    <div class="MatchDetailContainer" runat="server">
        <div class="TopImg">
            <img src="../Images/Match/goldjingjing.jpg" />
        </div>
        <div class="MidIntro">
            是不是金币不够用呢？想不想迅速赢取大量金币呢？快快来参加金币精英赛吧！只要支付500金币报名，60人， 报名即可开赛哦。谁都有机会迅速赢得大量金币，心动不如行动，赶紧抓紧时间报名参与吧^_^
            <br />
        </div>
        <br />
        <br />
        <br />
        <span style="display: block; width: 170px; margin: 0 auto;">（赛事详细信息请见平台）</span>
        <br />
        <a href="../HallPage/HallPageFL.aspx" class="BtnTakeInMatch"></a>
        <br />
        <br />
        <br />
    </div>--%>
    
<asp:Literal ID="ltrl" runat="server"></asp:Literal>
</asp:Content>
