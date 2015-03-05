<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SpreadHelp.aspx.cs" Inherits="Spread_SpreadHelp" %>

<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/Spread_Menu.ascx" TagName="Spread_Menu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/Spread.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../Css/SpreadHelp.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function copyToClipboard(txt) {
            try {
                var Sys = {};
                var ua = navigator.userAgent.toLowerCase();
                if (window.MessageEvent && !document.getBoxObjectFor)
                    Sys.chrome = ua.match(/chrome\/([\d.]+)/)[1]
                if (Sys.chrome) {
                    alert("您使用的浏览器不支持此复制功能,请使用Ctrl+C或鼠标右键。");
                    return false;
                }
            } catch (e) {
            }
            //
            if (window.clipboardData) {
                window.clipboardData.clearData();
                window.clipboardData.setData("Text", txt);
            } else if (navigator.userAgent.indexOf("Opera") != -1) {
                window.location = txt;
            } else if (window.netscape) {
                try {
                    netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
                } catch (e) {
                    alert("被浏览器拒绝！\n请在浏览器地址栏输入'about:config'并回车\n然后将'signed.applets.codebase_principal_support'设置为'true'");
                }
                var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
                if (!clip)
                    return;
                var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
                if (!trans)
                    return;
                trans.addDataFlavor('text/unicode');
                var str = new Object();
                var len = new Object();
                str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
                var copytext = txt;
                str.data = copytext;
                trans.setTransferData("text/unicode", str, copytext.length * 2);
                var clipid = Components.interfaces.nsIClipboard;
                if (!clip)
                    return false;
                clip.setData(trans, null, clipid.kGlobalClipboard);
                //alert("复制成功！")
            }
            //
            alert("复制成功，请粘贴到你的QQ/MSN上推荐给你的好友");
        }
        function setdata1() {
            copyToClipboard(document.getElementById("ctl00_ContentPlaceHolder1_txtLink1").value);
        }
        function setdata2() {
            copyToClipboard(document.getElementById("ctl00_ContentPlaceHolder1_txtLink2").value);
        }
        function setdata3() {
            copyToClipboard(document.getElementById("ctl00_ContentPlaceHolder1_txtLink3").value);
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_SpreadContainer">
        <uc1:UC_UserInfo ID="UC_UserInfo" runat="server" />
        <uc2:Spread_Menu ID="Spread_Menu" runat="server" />
        <div class="Bigbody">
            <div class="body" id="body1">
                <div class="spread-title">
                    <img src="/Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;推广帮助
                </div>
                <div class="middle1">
                    <div class="middle1_title">
                        &nbsp;&nbsp;1.论坛发帖</div>
                    <br />
                    <div class="middle1_but">
                        <p>
                            可以把您的推广链接发送到您准备推广的博客、论坛、个人网站中。</p>
                        <p>
                            如：人人网、开心网、新浪微博、腾讯微博、百度贴吧等</p>
                        <p>
                            推广时可附上有吸引力的文字，这样可以提高推广力度，不要忘记写上您的推广链接。</p>
                        <div class="middle1_buttom">
                            <span class="middle1_buttom_s1">您的推广链接：</span> <span class="middle1_buttom_s2">
                                <asp:TextBox ID="txtLink1" CssClass="text" Width="440" ReadOnly="true" Text="http://localhost/Spread/SpreadIndex.aspx"
                                    runat="server"></asp:TextBox></span> <span id="butCopy" onclick="setdata1()" style="display: inline-block; margin-left:5px;"
                                        class="savebtn" >复制地址 </span>
                        </div>
                    </div>
                </div>
                <div class="middle2">
                    <div class="middle1_title">
                        &nbsp;&nbsp;2.邮件邀请</div>
                    <br />
                    <div class="middle1_but">
                        <p>
                            可以把您的推广链接通过邮件发送出去。</p>
                        <div class="middle1_buttom">
                            <span class="middle1_buttom_s1">您的推广链接：</span> <span class="middle1_buttom_s2">
                                <asp:TextBox ID="txtLink2" CssClass="text" Width="440" ReadOnly="true" Text="http://localhost/Spread/SpreadIndex.aspx"
                                    runat="server"></asp:TextBox></span> <span class="savebtn" style="display: inline-block; margin-left:5px;"
                                        id="Button2" onclick="setdata1()">复制地址</span>
                        </div>
                        <br />
                        <p style="text-align: left">
                            附上文字如: 我最近正在玩同城斗地主赛事,这个比赛很不错,又好玩又刺激，还能能赢大奖,一起来玩吧!</p>
                        <p style="color: #F80604;">
                            经证实,发送QQ群邮件是很有效的方法</p>
                        <div class="p_bgcolor">
                            <b>参与方式:</b>
                            <p>
                                1.打开QQ邮箱--点击写信—点击QQ群邮件</p>
                            <p>
                                2.填写邮件内容(别忘记留下您的推广链接和推广号)</p>
                            <p>
                                3.选择收件群并发送邮件</p>
                            <br />
                            <b>推广效果:</b>
                            <p>
                                根据原有“发QQ群邮件活动”的效果统计，每2封邮件就能为您带来一个注册下线，只要向10个群发送邮件，每个月可以轻松带来5个注册下线。</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="body" id="body2" style="display: none">
                <div class="p_bgcolor" style="line-height: 20px;">
                    <div style="padding-left: 14px">
                     <br />
                        <b>如何获得更好的效果：</b>
                        <p>
                            1.选择和同城竞技馆有关的QQ群，如：棋牌爱好者QQ群</p>
                        <p>
                            2.多加QQ群，多发群邮件</p>
                        <p>
                            3.选择人数较多的QQ群</p>
                        <br />
                    </div>
                </div>
                <div class="middle1">
                    <div class="middle1_title">
                        &nbsp;&nbsp;3.好友邀请</div>
                    <br />
                    <div class="middle1_but">
                        <p>
                            方法一：把下列链接发给您的好友</p>
                        <br />
                        <div class="middle1_buttom">
                            <span class="middle1_buttom_s1">您的推广链接：</span> <span class="middle1_buttom_s2">
                                <asp:TextBox ID="txtLink3" Width="440" ReadOnly="true" CssClass="text" Text="http://localhost/Spread/SpreadIndex.aspx"
                                    runat="server"></asp:TextBox></span> <span id="Button1" onclick="setdata1()" class="savebtn"
                                        style="display: inline-block; margin-left:5px;">复制地址 </span>
                        </div>
                        <br />
                        <p>
                            方法二：把您的推广号告诉你得好友（推广号请点击个人中心，头像下面的推广按钮进入查看，只要她在注册页面“推广账号”一栏中输入您的推广号，她就会成为您的推广玩家。）</p>
                    </div>
                </div>
            </div>
            <div class="pageBar1">
                <div>
                    <img class="pager_pre" src="../Images/UserCenter/pre1.png" alt="" /></div>
                <div class="pageCount">
                    <span class="pageIndex"></span>/<span class="pageTotalCount"></span></div>
                <div>
                    <img class="pager_next" src="../Images/UserCenter/next1.png" alt="" /></div>
            </div>
        </div>
    </div>
    <div class="ClearF">
    </div>
    <script type="text/javascript">
        $(".pageTotalCount").html("2");
        var pageIndex = 1;
        $(".pageIndex").html(pageIndex);
        pageNext();
        pagePre();
        function pageNext() {
            var pageCount = 2;
            if (pageCount > 0) {

                $(".pager_next").click(function () {
                    var objVisible = $(".body:visible");
                    if ($(".body:visible").next(".body").eq(0).length > 0) {
                        $(".body").next(".body").eq(0).show();
                        objVisible.hide();
                        pageIndex++;
                        $(".pageIndex").html(pageIndex);
                    }
                });
            }
        }
        function pagePre() {
            var pageCount = 2;
            if (pageCount > 0) {
                $(".pager_pre").click(function () {
                    var objVisible = $(".body:visible");
                    if ($(".body:visible").prev().eq(0).length > 0) {
                        $(".body:visible").prev().eq(0).show();
                        objVisible.hide();
                        pageIndex--
                        $(".pageIndex").html(pageIndex);
                    }
                });
            }
        }

    </script>
    <script type="text/javascript">
        $(".uc-nav-item").eq(4).find("img").attr("src", $(".uc-nav-item").eq(4).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(4).addClass("hover").addClass("selected");
    </script>
</asp:Content>
