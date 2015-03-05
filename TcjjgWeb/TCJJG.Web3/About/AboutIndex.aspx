<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AboutIndex.aspx.cs" Inherits="About_AboutIndex" %>

<%@ Register Src="../UserControl/About.ascx" TagName="About" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/About.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_UCAboutContainer">
        <uc1:About ID="About1" runat="server" />
        <div class="RightContainer">
            <div class="IndexNav">
                &nbsp; &nbsp; &nbsp; &nbsp;<span>企业简介</span><span>相关资质</span><span>企业文化</span><span>团队风采</span>
            </div>
            <div id="Content">
                <div class="Introduction">
                    中游竞技文化股份有限公司成立于2011年9月，注册资本为人民币伍仟万元，是由中杰投资、灰熊科技共同投资专门为“CMOP赛事&公益” 成立的专业开发运营公司，公司注册地为海南省，运营总部位于北京市石景山商务核心地区--中铁建设大厦15层，现有管理、市场及产品开发人员100多人，软件专利及著作权50多项。公司主要是以体育竞技网络产品的研发、推广、运营为一体的现代化高科技企业。
                    <br />
                    <br />
                    <br />
                    <img src="../Images/About/tcjjg_2012__topLeft1.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
                        src="../Images/About/topRight1.jpg" /><br />
                    <img src="../Images/About/Midleft1.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
                        src="../Images/About/MidRight1.jpg" />
                </div>
                <div class="Licence">
                    相关资质:<br />
                    <br />
                    <img src="../Images/About/tcjjg_2012__yingyezhizhao.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<img
                        src="../Images/About/wangluowenhua.jpg" />
                    <br />
                    <span class="licenceScirptLeft">营业执照</span><span class="licenceScirptRight">网络文化经营许可证</span>
                    <br />
                    <br />
                    <br />
                    <br />
                    <img src="../Images/About/zhanlvehezuo.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/About/xieyishu.jpg" /><br />
                    <span class="licenceScirptLeftMid">中体赛事主办合作协议</span><span class="licenceScirptRightMid">团中央光华科技基金赛事合作协议</span>
                    <br />
                    <br />
                    <br />
                    <br />
                    <img src="../Images/About/chanquan.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;<img src="../Images/About/zhuzuoquan.jpg" /><br />
                    <span class="licenceScirptLeftBtm">同城竞技馆知识产权</span><span class="licenceScirptRightBtm">同城竞技馆计算机软件著作权</span>
                    <br />
                    <br />
                    <br />
                    <br />
                    <img class="LastLicence" src="../Images/About/tcjjg_2012__zengzhidianxin.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
                        src="../Images/About/gonganbeian.jpg" /><br />
                    <span class="licenceScirptLast">增值电信业务经营许可证</span><span class="licenceScirptLastRight">公安备案</span>
                </div>
                <div class="CorporationCulture">
                    <span class="CultureContent">追求卓越&nbsp;快乐公益</span> <span class="CultureContent2">我们致力于创建全国最顶尖的公益性棋牌竞技赛事品牌，以专业的技术团队打造一个稳定、公平的竞技平台，为用户带来最完美的竞技体验。
                    </span><span class="CultureContent2">公司自成立以来，我们不但积极参与公益事业，同时还带领着广大用户在快乐棋牌的同时为社会公益事业做出力所能及的贡献。
                    </span>
                </div>
                <div class="Team">
                    <span class="team1">
                        <img src="../Images/About/tcjjg_2012__topLeft.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
                            src="../Images/About/topRight.jpg" />
                        <br />
                        <br />
                        <img src="../Images/About/Midleft.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
                            src="../Images/About/MidRight.jpg" />
                        <br />
                        <br />
                        <img src="../Images/About/last.jpg" /></span><span class="team2">
                            <img src="../Images/About/tcjjg_2012__topLeft2.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
                                src="../Images/About/topRight2.jpg" />
                            <br />
                            <br />
                            <img src="../Images/About/Midleft2.jpg" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img
                                src="../Images/About/MidRight2.jpg" />
                            <br />
                            <br />
                            <img src="../Images/About/last2.jpg" />
                        </span><span class="PagerBar"><span id="PagePre">上一页</span>&nbsp;<span id="PageNext">下一页</span></span>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_About").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });

        //左侧导航栏默认选中
        $("#AboutIndex").css({ "background-image": "url('../Images/About/tcjjg_2012__sel.jpg')", "color": "rgb(244,111,6)", "font-weight": "bold", "background-position": "right" });
        //上边导航栏
        $(function () {
            //切换导航的内容
            $("#Content div").hide();
            $("#Content div").eq(0).show();
            $(".IndexNav span").eq(0).css({ "background-image": "url('../Images/About/tcjjg_2012__indexNav_sel.jpg')", "color": "rgb(244,111,6)", "font-weight": "bold" })
            $(".IndexNav span").click(function () {
                $(".IndexNav span").css({ "background-image": "url('../Images/About/tcjjg_2012__indexNav_def.jpg')", "color": "rgb(133,141,148)", "font-weight": "normal" })
                $(this).css({ "background-image": "url('../Images/About/tcjjg_2012__indexNav_sel.jpg')", "color": "rgb(244,111,6)", "font-weight": "bold" })
                var current = $(this).index();
                $("#Content div").hide();
                $("#Content div").eq(current).show();


                //高度设置
                if (current == "0") {
                    $(".D_UCAboutContainer").css("height", "650px");
                    $(".D_UCAboutLeft").css("height", "650px");
                }
                else if (current == "2") {
                    $(".D_UCAboutContainer").css("height", "512px");
                    $(".D_UCAboutLeft").css("height", "512px");
                } else if (current == "1") {
                    $(".D_UCAboutContainer").css("height", "1400px");
                    $(".D_UCAboutLeft").css("height", "1400px");
                }
                else if (current == "3") {
                    $(".D_UCAboutContainer").css("height", "767px");
                    $(".D_UCAboutLeft").css("height", "767px");
                }

            });


            /******* 团队风采翻页********/
            $(".team2").hide();
            $("#PageNext").click(function () {

                $(".team1").hide();
                $(".team2").show();
            })
            $("#PagePre").click(function () {

                $(".team2").hide();
                $(".team1").show();
            })
        })
    </script>
</asp:Content>
