<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Match_Athletics.aspx.cs" Inherits="Match_Match_Athletics" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/Match.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        //        function getQueryString() {
        //            var result = location.search.match(new RegExp("[\?\&][^\?\&]+=[^\?\&]+", "g"));
        //            if (null!=result) {
        //                for (var i = 0; i < result.length; i++) {
        //                    result[i] = result[i].substring(1);
        //                }
        //                return result;
        //            } else {
        //                return "";
        //            }
        //        }
        //        $(function () {
        //            var param = getQueryString().toString().substr(2, 1);
        //            $(".First").eq(param - 1).addClass("RedFrame");
        //            $(".Frame").eq(param - 1).addClass("RedFrame");  
        //        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="MatchContainer">
        <div class="TopImg">
            <img src="../Images/Match/Matchjingji.jpg" /></div>
        <div class="TopIntro">
            CMOP同城斗地主大奖赛分为线上海选赛、地区大师赛、全国大师赛3个阶段, 其中线上海选赛包括：CMOP同城斗地主竞技赛、CMOP同城斗地主日赛、CMOP同城斗地主周赛和CMOP同城斗地主月赛,
            在通过线上海选赛的层层晋级后，即可获得地区大师赛的参赛门票，更有机会向全国大师赛发起冲击！
        </div>
        <br />
        <div class="MastersTour">
            CMOP同城斗地主全国大师赛
        </div>
        <br />
        <div class="ToUP">
            <img src="../Images/Match/MatchToup.jpg" />
        </div>
        <br />
        <div class="MastersTour">
            CMOP同城斗地主地区大师赛
        </div>
        <br />
        <div class="ToUP">
            <img src="../Images/Match/MatchToup.jpg" />
        </div>
        <br />
        <div class="Phase">
            线上海选阶段
        </div>
        <div class="Line">
        </div>
        <div class="First" style="margin-left: 87px;">
            <br />
            线上海选第一站
            <div class="PhaseContent">
                CMOP同城斗地主竞技赛
            </div>
        </div>
        <div class="ArrowHead">
            <img src="../Images/Match/matchToRight.jpg" />
        </div>
        <div class="First">
            <br />
            线上海选第二站
            <div class="PhaseContent">
                CMOP同城斗地主日赛
            </div>
        </div>
        <div class="ArrowHead">
            <img src="../Images/Match/matchToRight.jpg" />
        </div>
        <div class="First">
            <br />
            线上海选第三站
            <div class="PhaseContent">
                CMOP同城斗地主周赛
            </div>
        </div>
        <div class="ArrowHead">
            <img src="../Images/Match/matchToRight.jpg" />
        </div>
        <div class="First">
            <br />
            线上海选第四站
            <div class="PhaseContent">
                CMOP同城斗地主月赛
            </div>
        </div>
        <div class="ClearF">
        </div>
        <div class="Frame">
            <div class="BtmMatch">
                <br />
                <div>
                    &nbsp;&nbsp;竞技赛
                </div>
                <br />
                同城竞技的技术比赛哦，从10:05开始到凌晨2:55结束，每10分钟一场比赛，随时<br />
                等待您的参与，比赛可获得日赛门票。方便您晋级到更高的比赛。<br />
            </div>
        </div>
        <div class="Frame">
            <div class="BtmMatch">
                <br />
                <div>
                    &nbsp;&nbsp;日&nbsp;赛
                </div>
                <br />
                从竞技赛可以晋级到日赛，从12:00开始到凌晨3:00结束，每小时一场。需要用日赛<br />
                门票报名参与哦，比赛奖品更丰富。周赛门票+苹果卡+海量金币等你哦！<br />
            </div>
        </div>
        <div class="Frame">
            <div class="BtmMatch">
                <br />
                <div>
                    &nbsp;&nbsp;周&nbsp;赛
                </div>
                <br />
                日赛获得的周赛门票可以派上用场啦！每周末的21:30恭候您的参与。每周都有<br />
                iphone4s等您赢，心动不如行动，抓紧时间报名参与吧。<br />
            </div>
        </div>
        <div class="Frame">
            <div class="BtmMatch">
                <br />
                <div>
                    &nbsp;&nbsp;月&nbsp;赛
                </div>
                <br />
                同城晋级赛区最终战--月赛。每月最后一个周五隆重开启。苹果大奖不再是梦！<br />
                苹果手机、笔记本电脑、平板电脑应有尽有。只要您有足够的智慧和运气，那么大<br />奖最终将会属于你。参与比赛还会获得地区大师赛的参赛门票，更有机会向全国大<br />师赛发起冲击！<br />

            </div>
        </div>
        <br />
        <a href="../HallPage/HallPageFL.aspx" class="BtnTakeInMatch"></a>
        <br />
        <br />
    </div>
</asp:Content>
