<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Safe.aspx.cs" Inherits="CustomerService_Safe" %>

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
                找回密码
            </div>
            <div class="help_nav_item">
                修改密码
            </div>
            <div class="help_nav_item">
                密码保护
            </div>
            <div class="help_nav_item">
                账号安全
            </div>--%>
            <asp:Literal ID="litGuid" runat="server"></asp:Literal>
            <span class="help_nav_more" id="more1">&nbsp;>>&nbsp;</span>
        </div>
        <div class="help_nav" id="nav2" style="display: none">
            <span class="help_nav_more" id="more2" style="float: left">&nbsp;<<&nbsp;</span>
            <asp:Literal ID="litGuidMore" runat="server"></asp:Literal>
        </div>
        <br />
        <div>
            <%--<div id="safe1" class="help_content">
                如果您忘记了自己的密码，请登陆网站首页，在首页登陆按钮右侧有一个“忘记密码”选项
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe01.jpg" />
                <br />
                <br />
                点击“忘记密码”按钮，跳转到密码找回页面。
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe02.jpg" />
                <br />
                <br />
                输入您需要找回密码的账号，例如：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe03.jpg" />
                <br />
                <br />
                点击“下一步”出现对话框：
                <br />
                <br />
                1、在没有填写密保问题时出现如下页面：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe04.jpg" />
                <br />
                <br />
                目前我们的平台只有唯一一种找回密码的方式，只能通过密码保护问题找回，否则无法找回。
                <br />
                所以在此提示您在注册账号之后一定要填写密码找回问题及答案，并且牢记它们哦。
                <br />
                <br />
                2、在有填写密保问题的情况下出现如下页面：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe05.jpg" />
                <br />
                <br />
                填写您的密保问题及新密码，例如：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe06.jpg" />
                <br />
                <br />
                点击“确认”出现如下页面：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe07.jpg" />
                <br />
                <br />
                即成功找回密码。
                <br />
                <br />
            </div>
            <div id="safe2" class="help_content">
                修改流程：登陆官网-》我的账户-》安全中心-》密码修改
                <br />
                修改密码详细步骤：
                <br />
                <br />
                <b>(一) 、无密保问题情况下： </b>
                <br />
                <br />
                1、登录首页，点击“我的账户”
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe08.jpg" />
                <br />
                <br />
                2、进入我的账户，点击“安全中心”，点击“密码修改”
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe09.jpg" />
                <br />
                <br />
                3、右边密码修改，填写正确的原始密码和新密码如下：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe10.jpg" />
                <br />
                <br />
                4、点击“确定”出现如下：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe11.jpg" />
                <br />
                <br />
                到此，密码修改成功。
                <br />
                <br />
                <b>（二）、有密保问题情况下：</b>
                <br />
                <br />
                1、登录首页，点击“我的账户”
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe12.jpg" />
                <br />
                <br />
                2、进入我的账户，点击“安全中心”，点击“密码修改”
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe13.jpg" />
                <br />
                <br />
                3、右边密码修改，正确填写密保问题答案：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe14.jpg" />
                <br />
                <br />
                4、点击“确定”，在新页面中填写正确的原始密码和新密码如下：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe15.jpg" />
                <br />
                <br />
                5、点击“确定”出现如下：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe16.jpg" />
                <br />
                <br />
                到此，密码修改成功。
                <br />
                <br />
                <b>温馨提示: </b>如果您忘记密码想找回密码，目前我们的平台只有唯一一种找回密码的方式，就是通过密码保护找回，如果您未填写密保则无法找回密码。所以请您尽快填写密码保护，并且牢记它们。
                <br />
                <br />
            </div>
            <div id="safe3" class="help_content">
                <b>（一）、密保问题的设置：</b>
                <br />
                <br />
                设置流程：登陆官网-》我的账户-》安全中心-》密保问题
                <br />
                <br />
                1、登录首页，点击“我的账户”
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe17.jpg" />
                <br />
                <br />
                2、进入我的账户，点击“安全中心”，点击“密保问题”
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe18.jpg" />
                <br />
                <br />
                3、选择密保问题，填写答案，点击“下一步”，如下：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe19.jpg" />
                <br />
                <br />
                4、正确填写验证密保保护问题，点击“下一步”，例如：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe20.jpg" />
                <br />
                <br />
                出现如下页面：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe21.jpg" />
                <br />
                <br />
                到此，密保问题设置成功。
                <br />
                <br />
                <b>（二）、修改密保问题</b>
                <br />
                <br />
                修改流程：登陆官网-》我的账户-》安全中心-》密保问题
                <br />
                <br />
                1、登录首页，点击“我的账户”
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe22.jpg" />
                <br />
                <br />
                2、进入我的账户，点击“安全中心”，点击“密保问题”
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe23.jpg" />
                <br />
                <br />
                3、出现如下界面，点击“修改密保”
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe24.jpg" />
                <br />
                <br />
                4、正确填写旧的密保答案，点击“下一步”，例如：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe25.jpg" />
                <br />
                <br />
                5、选择并填写新的密保问题及答案，点击“下一步”，例如：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe26.jpg" />
                <br />
                <br />
                6、正确填写验证密保保护问题，点击“下一步”，例如：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe27.jpg" />
                <br />
                <br />
                出现如下页面：
                <br />
                <br />
                <img alt="" src="../StyleSheet/defaultImg/safe28.jpg" />
                <br />
                <br />
                密保问题修改成功。
                <br />
                <br />
                <b>温馨提示: </b>目前我们的平台只有唯一一种找回密码的方式，只能通过密码保护问题找回，否则无法找回。所以在一定要认真填写密码找回问题及答案，并且牢牢记住哦。
                <br />
                <br />
            </div>
            <div id="safe4" class="help_content">
                <br />
                <div>
                    各位亲爱的同城竞技馆玩家：<br />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;一直以来我们始终致力于维护游戏环境，保护每一位“同城”玩家的账号与游戏财产安全。我们深知每一个游戏账号背后所蕴含着的，不但是您所付出的无数时间与汗水，更有着与线上知己的欢笑，以及无数美好的游戏回忆。正因为此，以最先进的科技手段保护您的游戏账号安全，以最优质的服务为您解决各种账号问题，不仅仅是我们的职责所在，更是我们作为游戏人的良知所在！面对五花八门的诈骗手段，我们要提示您以下几点，希望各位亲爱的玩家能提高警惕，远离风险。
                    <br />
                    <br />
                    1、对官方人员的分辨
                    <br />
                    官方工作人员绝对不会在游戏内以任何理由向玩家索要账号密码、密码保护问题及答案、身份证号码、保密邮箱等账号信息的。如果有玩家收到来自自称为同城斗地主GM、同城斗地主客服01、同城斗地主客服02等假冒官方的短消息，内容为索要密码、更改账号信息等涉及到账号安全方面的，请提高警惕，并及时向客服举报。
                    <br />
                    <br />
                    2、使用外挂=给盗号贼免费打工
                    <br />
                    请勿使用任何外挂或辅助工具，这些声称外挂或辅助工具的往往含有盗号木马。因为外挂或辅助工具导致账号被盗，其后果由玩家自身承担。
                    <br />
                    <br />
                    3、避免进行线下交易
                    <br />
                    请勿相信线下交易。线下交易的风险性非常大，盗号分子会在线下交易设置各种圈套来引诱玩家们泄露账号信息，达到盗号的目的。
                    <br />
                    <br />
                    4、提高安全意识，完善保护个人信息
                    <br />
                    请保管好自己的账号信息，不要将个人密码，账号信息告诉给其他人。其次请完善账号资料。新注册的玩家一定要注意填写密码找回选项，提高账号的安全度。老玩家如果遗漏了此选项，请点击
                    “我的账户”在基本信息中补填密码保护资料。这样才能确保如果您的账号出现异常能及时找回。若您发现账号出现异常，有无法正常登陆游戏或账号疑似被盗的情况发生，请您即时致电客服电话4007706700，我们将以最迅捷的速度为您恢复初始密码，之后您可以通过密码找回功能重置新密码。
                    <br />
                    <br />
                    5、输入账号、密码时要警惕
                    <br />
                    隔墙有耳，身旁有眼。在拥挤的网吧中，你的身边是否也有这么一双眼睛？
                    <br />
                    输入帐号、密码前，先观察一下周遭环境吧。 多种密码输入方式：输入密码时，采取乱序输入，譬如密码是DNF2009，可以先输入2009。
                    <br />
                    <br />
                    《同城斗地主竞技赛》因你而精彩！预祝您游戏愉快！
                </div>
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
            $("#Safe").css("background-image", "url('../Images/CustomerService/tcjjg_2012__ucbg.jpg')");
            $("#A_CustomerServiceCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });

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
            })
    </script>
</asp:Content>

