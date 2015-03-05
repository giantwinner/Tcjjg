<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SpreadIndex.aspx.cs" Inherits="Spread_SpreadIndex" %>

<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/Spread_Menu.ascx" TagName="Spread_Menu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../Css/SpreadIndex.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Spread.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/changeNavStyle.js" type="text/javascript"></script>
    <script type="text/javascript">
        function setdata() {
            //            var clipBoardContent = "";
            //            clipBoardContent += document.getElementById("ctl00_ContentPlaceHolder1_txtSpreadURL").value;
            //            if (window.clipboardData) {
            //                window.clipboardData.setData("Text", clipBoardContent);

            //            } else if (window.netscape) {
            //                netscape.security.PrivilegeManager.enablePrivilege('UniversalXPConnect');
            //                var clip = Components.classes['@mozilla.org/widget/clipboard;1'].createInstance(Components.interfaces.nsIClipboard);
            //                if (!clip) return; var trans = Components.classes['@mozilla.org/widget/transferable;1'].createInstance(Components.interfaces.nsITransferable);
            //                if (!trans) return;
            //                trans.addDataFlavor('text/unicode');
            //                var str = new Object();
            //                var len = new Object();
            //                var str = Components.classes["@mozilla.org/supports-string;1"].createInstance(Components.interfaces.nsISupportsString);
            //                var copytext = clipBoardContent;
            //                str.data = copytext;
            //                trans.setTransferData("text/unicode", str, copytext.length * 2);
            //                var clipid = Components.interfaces.nsIClipboard;
            //                if (!clip) return false;
            //                clip.setData(trans, null, clipid.kGlobalClipboard);
            //                return true;
            //            }
            //return false;
            copyToClipboard(document.getElementById("ctl00_ContentPlaceHolder1_txtSpreadURL").value);
        }
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
    </script>
    <script type="text/javascript">
        if (window != top)
            top.location.href = location.href; 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_SpreadContainer">
        <uc1:UC_UserInfo ID="UC_UserInfo" runat="server" />
        <uc2:Spread_Menu ID="Spread_Menu" runat="server" />
        <div class="Bigbody">
            <div class="body">
                <div class="spread-title">
                    <img src="/Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;推广首页
                </div>
                <asp:Panel ID="pLoginYes" Visible="false" runat="server">
                    <div class="top1">
                        <div class="top1_top">
                            推广员账号（同游戏账号）：
                            <asp:Label ID="LabNickName" runat="server" Text="" ForeColor="blue"></asp:Label>
                        </div>
                        <div class="top1_buttom">
<%--                            <div class="top1_buttom2" style="margin-left: 0;">
                                <div class="top1_buttom3">
                                    您的推广号：<asp:Label ID="LabSpreadNumber" runat="server" Text=""></asp:Label></div>
                            </div>--%>
                            <div class="top1_buttom2">
                                <div class="top1_buttom3">
                                    <%--总赚金币总额：<asp:Label ID="LabRewardCount" runat="server" Text=""></asp:Label>--%></div>
                            </div>
                            <div class="top1_buttom2" style="margin-left: 0;">
                                <div class="top1_buttom3">
                                    推广人数：<asp:Label ID="LabSpreadCount" runat="server" Text=""></asp:Label></div>
                            </div>
                        </div>
                    </div>
                    <div class="top2_buttom">
                        发送邀请链接给朋友：<asp:TextBox ID="txtSpreadURL" Width="440" ReadOnly="true" CssClass="text1"
                            Text="*.aspx?pid=userid" runat="server"></asp:TextBox>
                        <a class="savebtn" onclick="setdata()" style="display: inline-block; margin-left:5px;">复制地址</a>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pLoginNo" runat="server">
                    <div class="top2">
                        <div class="top2_top">
                            您还没有登录！请点击下面的登录按钮登录。如果您没有账号请<a href="/UserCenter/UserReg-BaseInfo.aspx">注册</a></div>
                        <div class="top2_buttom">
                            <a href="/UserCenter/UserLogin.aspx" class=" savebtn">登录</a></div>
                    </div>
                </asp:Panel>
                <div class="colorBor">
                    <div class="middle_left">
                        <asp:Label ID="lbReward" runat="server" Text="奖励制度"></asp:Label>
                    </div>
                    <div class="middle_right" align="right">
                        <a href="SpreadRewardExplain.aspx">查看详情>> </a>
                    </div>
                </div>
                <div class="nocolorBor">
                    <div class="middle2_left">
                        根据推广玩家的等级，推广员将获得道具奖励。</div>
                    <div class="middle2_right">
                        </div>
                </div>
                <div class="colorBor">
                    <div class="middle_left">
                        <asp:Label ID="lbWhySpread" runat="server" Text="什么是同城竞技馆推广员系统？"></asp:Label>
                    </div>
                    <div class="middle_right" align="right">
                    </div>
                </div>
                <div class="buttom_text">
                    1.每个玩家都有唯一的推广账号和推广链接。<br />
                    2.注册时填写推广账号或通过推广链接注册的玩家，都是推广员的推广玩家。<br />
                    3.推广玩家等级越高推广员获得奖励越多。<br />
                </div>
            </div>
        </div>
    </div>
    <div class="ClearF">
    </div>
    <script type="text/javascript">
        $(".uc-nav-item").eq(0).find("img").attr("src", $(".uc-nav-item").eq(0).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(0).addClass("hover").addClass("selected");
    </script>
</asp:Content>
