<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ActivityPage.aspx.cs" Inherits="Activity_ActivityPage" %>

<%@ Register Src="~/UserControl/AC_TopBlock.ascx" TagName="AC_TopBlock" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/AC_Left.ascx" TagName="AC_Left" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/activity.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0px auto; width: 1000px; height: 740px; margin-bottom: 38px;">
        <uc1:AC_TopBlock ID="AC_TopBlock" runat="server" />
        <uc2:AC_Left ID="AC_Left" runat="server" />
        <div class="activity-content-m">
            <div class="activity-content-m-inner" style="display: none" id="fengyun2">
                <img src="../Images/Activity/titleImg.jpg" alt="" class="titleImg" />
                <div class="exRank-wrap">
                    <div class="exRank-title">
                        <asp:Label ID="lblDate1" runat="server" Text=""></asp:Label>推广榜</div>
                    <table cellspacing="0" class="tableStyle">
                        <tr class="title">
                            <td width="48.5px">
                                <div>
                                    排名</div>
                            </td>
                            <td width="108.5px">
                                <div>
                                    玩家</div>
                            </td>
                            <td width="108.5px">
                                <div>
                                    单日推广玩家数</div>
                            </td>
                            <td width="84.5px">
                                <div>
                                    奖励</div>
                            </td>
                        </tr>
                        <asp:Repeater ID="rpEx" runat="server">
                            <ItemTemplate>
                                <tr style='background-color: <%#(Container.ItemIndex%2==0)?"transparent":"#CB9954"%>'>
                                    <td width="48.5px" class="colorz">
                                        <div>
                                            <%# ChangShow(Eval("Rank"))%></div>
                                    </td>
                                    <td width="108.5px" class="colorz">
                                        <div>
                                            <%#Eval("NickName")%></div>
                                    </td>
                                    <td width="108.5px" class="colorb">
                                        <div>
                                            <%#Eval("Value")%></div>
                                    </td>
                                    <td width="84.5px" class="colorz">
                                        <div>
                                            <%#Eval("Reward")%></div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                <div class="bonousRank-wrap">
                    <div class="exRank-title">
                        <asp:Label ID="lblDate2" runat="server" Text=""></asp:Label>总奖金榜</div>
                    <table cellspacing="0" class="tableStyle">
                        <tr class="title">
                            <td width="40px">
                                <div>
                                    排名</div>
                            </td>
                            <td width="96px">
                                <div>
                                    玩家</div>
                            </td>
                            <td width="42px">
                                <div>
                                    总奖金</div>
                            </td>
                            <td width="96px">
                                <div>
                                    单日获得总奖金</div>
                            </td>
                            <td width="76px">
                                <div>
                                    奖励</div>
                            </td>
                        </tr>
                        <asp:Repeater ID="rpbonus" runat="server">
                            <ItemTemplate>
                                <tr style='background-color: <%#(Container.ItemIndex%2==0)?"transparent":"#CB9954"%>'>
                                    <td width="40px" class="colorz">
                                        <div>
                                            <%# ChangShow(Eval("Rank"))%></div>
                                    </td>
                                    <td width="96px" class="colorz">
                                        <div>
                                            <%#Eval("NickName")%></div>
                                    </td>
                                    <td width="42px" class="colorz">
                                        <div>
                                            <%#Eval("UserRich")%></div>
                                    </td>
                                    <td width="96px" class="colorb">
                                        <div>
                                            <%#Eval("Value")%></div>
                                    </td>
                                    <td width="76px" class="colorz">
                                        <div>
                                            <%#Eval("Reward")%></div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                </div>
                <div class="promotText">
提示：<br />
1.推广榜以玩家单日推广人数进行排名（被推广的玩家必须达到3级并且在注册的第二天也登录游戏了才能算作有效推广人数）。<br />
2.总奖金榜以玩家单日获得总奖金的额度进行排名。<br />
3.牌手风云榜每天凌晨2点更新，更新后的推广榜显示前天的排行数据，总奖金榜显示昨天的排行数据。<br />
4.活动截止时间请注意官网公告。
                </div>
            </div>
            <div class="activity-content-m-inner" style="display: none" id="la2">
                <img src="../Images/Activity/lapengyou.jpg" class="lapengyou" />
                <a href="/Spread/SpreadIndex.aspx">
                    <img src="../Images/Activity/zouqi.jpg" class="zouqi" /></a>
                <div class="latext">
                    <b>免费得钥匙攻略</b> 1. 把自己的推广账号（注册用户名）告诉自己的朋友，让她注册时填写。<br />
                    <span style="visibility: hidden"><b>免费得钥匙攻略</b></span> 2. 把自己的推广链接发到微博、QQ和SNS上，朋友点击进入，注册无须填写推广账号。
                </div>
            </div>
            <div class="activity-content-m-inner" id="huan2">
                <img class="huanhuafei" src="../Images/Activity/huanhuafei.jpg" alt="" />
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/Activity/activity-r.png" alt="" />
        </div>
    </div>
    <script src="/Scripts/QueryString.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(".nav-item").eq(4).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        $(function () {
            //
            $(".latest-title").css("color", "white");
            $("#huan1").css("color", "red");
            $(".activity-content-m-inner").hide()
            $("#huan2").show();
            var ac = QueryString("ac");
            if (ac == 1) {
                huan();
            } else if (ac == 2) {
                fengyun();
            } else if (ac == 3) {
                la();
            }

            //
            $("#fengyun1").click(function () {
                fengyun();
            });
            $("#la1").click(function () {
                la();
            });
            $("#huan1").click(function () {
                huan();
            });
        })
        function fengyun() {
            $(".latest-title").css("color", "white");
            $("#fengyun1").css("color", "red");
            $(".activity-content-m-inner").hide()
            $("#fengyun2").show();
        }
        function la() {
            $(".latest-title").css("color", "white");
            $("#la1").css("color", "red");
            $(".activity-content-m-inner").hide()
            $("#la2").show();
        }
        function huan() {
            $(".latest-title").css("color", "white");
            $("#huan1").css("color", "red");
            $(".activity-content-m-inner").hide()
            $("#huan2").show();
        }
    </script>
</asp:Content>
