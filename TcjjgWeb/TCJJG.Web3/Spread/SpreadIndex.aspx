<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SpreadIndex.aspx.cs" Inherits="Spread_SpreadIndex" %>

<%@ Register Src="../UserControl/Spread.ascx" TagName="Spread" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SpreadIndex.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
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
        <uc1:Spread ID="Spread1" runat="server" />
        <div class="Bigbody">
            <asp:Panel ID="pLoginYes" Visible="false" runat="server">
                <div class="top1">
                    <div class="top1_top">
                        推广员账号（同游戏账号）： <a href="../UserCenter/">
                            <asp:Label ID="LabNickName" runat="server" Text="" ForeColor="red"></asp:Label>
                        </a>
                    </div>
                    <div class="top1_buttom">
                        <div class="top1_buttom2">
                            <div class="top1_buttom3">
                                您的推广号：<asp:Label ID="LabSpreadNumber" runat="server" Text=""></asp:Label></div>
                        </div>
                        <div class="top1_buttom2">
                            <div class="top1_buttom3">
                                总赚金币总额：<asp:Label ID="LabRewardCount" runat="server" Text=""></asp:Label></div>
                        </div>
                        <div class="top1_buttom2">
                            <div class="top1_buttom3">
                                推广人数：<asp:Label ID="LabSpreadCount" runat="server" Text=""></asp:Label></div>
                        </div>
                    </div>
                </div>
                <div class="top2_buttom">
                    发送邀请链接给朋友：<asp:TextBox ID="txtSpreadURL" Width="400" ReadOnly="true" CssClass="text1"
                        Text="*.aspx?pid=userid" runat="server"></asp:TextBox>
                    <span id="butCopy" class="CopyUrl" onclick="setdata()"></span>
                </div>
            </asp:Panel>
            <asp:Panel ID="pLoginNo" runat="server">
                <div class="top2">
                    <div class="top2_top">
                        您还没有登录！请点击下面的登录按钮登录。如果您没有账号请<a href="../UserCenter/userReg.aspx">注册</a></div>
                    <div class="top2_buttom">
                        <asp:LinkButton ID="lbutLogin" CssClass="SpredLogin" runat="server" PostBackUrl="~/UserCenter/UserLogin.aspx"></asp:LinkButton></div>
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
                    根据推广下线的等级，推广员将获得金币和道具奖励</div>
                <div class="middle2_right">
                    <a href="../Help/FAQ.aspx">什么是金币?</a></div>
            </div>
            <div class="colorBor">
                <div class="middle_left">
                    <asp:Label ID="lbWhySpread" runat="server" Text="什么是CMOP推广员系统"></asp:Label>
                </div>
                <div class="middle_right" align="right">
                </div>
            </div>
            <div class="buttom_text">
                1.系统为每位推广员提供了属于其个人的推广号和推广链接<br />
                2.注册时填写了推广号或通过推广链接注册的新玩家，都算是推广员的推广下线<br />
                3.推广下线分为直接与间接<br />
                即：推广员推广的直接下线，此下线再推广的下线，称为原推广员的间接下线，该推广员也会获得奖励<br />
                4.系统会根据推广下线达到等级为推广员返还奖励，等级上限为50级<br />
                5.推广下线注册时间满1年，解除推广关系<br />
            </div>
        </div>
    </div>
    <div class="ClearF">
    </div>
    <script type="text/javascript">
        $("#SpreadIndex").css("background-image", "url('../Images/CustomerService/tcjjg_2012__ucbg.jpg')");
    </script>
</asp:Content>
