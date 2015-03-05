<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="CSS/Default.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/Default.js" type="text/javascript"></script>
    <script src="/Scripts/ajax-visitor.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="default">
        <div id="d-top">
            <img class="border-top" src="/Images/Default/border-top.png" alt="" />
            <div id="top-mid">
                <div class="divTransImg">
                    <ul class="switchbar">
                        <li>•</li>
                        <li>•</li>
                        <li>•</li>
                        <li>•</li>
                    </ul>
                    <asp:Literal ID="ltaTopImgs" runat="server"></asp:Literal>
                </div>
                 <img src="Images/Default/btnleft.jpg" alt="" class="btnleft"/>
                <a href="/UserCenter/UserReg-BaseInfo.aspx" class="adreg">注册</a> <a href="/UserCenter/UserLogin.aspx"
                    class="adlogin">登录</a> <a class="adtryplay" onclick="VisitorReqest()">试玩</a>
                <div class="versionlog">
                    <div class="versionTitle">
                        我们一直在努力
                    </div>
                    <div class="v-wrap"> <asp:Literal ID="ltl4" runat="server"></asp:Literal>
                    </div>
                   
                    <a href="/Affiche/VersionLog.aspx" class="versionMore">更多>></a>
                </div>
            </div>
            <img class="border-bottom" src="/Images/Default/border-bottom.png" alt="" />
        </div>
        <div id="d-middle">
            <img class="border-top" src="/Images/Default/border-top.png" alt="" />
            <div id="middle-mid">
            </div>
            <img class="kflogo" src="Images/Default/kflogo.png" alt="" />
            <img class="kfphone" src="Images/Default/kfphone.jpg" alt="" />
            <a class="kfQQ" href="http://wpa.qq.com/msgrd?v=3&uin=1793878267&site=qq&menu=yes"
                target="_blank">
                <img src="/Images/Default/kfqq.jpg" alt="" /></a>
            <img class="border-bottom" src="/Images/Default/border-bottom.png" alt="" />
        </div>
        <div id="d-bottom">
            <div id="d-bottom-left">
                <img class="border-top" src="Images/Default/border-l-top.png" alt="" />
                <div class="bottom-left-mid">
                    <img class="newslogo" src="Images/Default/newslogo.jpg" alt="" />
                    <a class="newsMore" href="/Affiche/Interactive.aspx" target='_blank'>
                        同城竞技馆
                    </a>
                    <div class="newsaddress">
                        北京
                    </div>
                    <div class="newwrap">
                    </div>
                </div>
                <img class="border-bottom" src="Images/Default/border-l-bottom.png" alt="" />
            </div>
            <div id="d-bottom-right">
                <img class="bottom-right-top" src="Images/Default/border-r-top.png" alt="" />
                <div class="bottom-right-mid">
                    <img src="Images/Default/ddz.jpg" alt="" />
                    <img src="Images/Default/texas.jpg" alt="" />
                    <img src="Images/Default/dogrun.jpg" alt="" />
                    <img src="Images/Default/othergame.jpg" alt="" />
                    <a class="game game1" href="/HelpCenter/Game.aspx?game=0"></a><a class="intr intr1"
                        href="/HelpCenter/Goods.aspx?intr=0"></a><a class="game game2" href="/HelpCenter/Game.aspx?game=1">
                        </a><a class="intr intr2" href="/HelpCenter/Goods.aspx?intr=1"></a><a class="game game3"
                            href="/HelpCenter/Game.aspx?game=2"></a><a class="intr intr3" href="/HelpCenter/Goods.aspx?intr=2">
                            </a><a class="game game4"></a><a class="intr intr4"></a>
                </div>
                <img class="bottom-right-bottom" src="Images/Default/border-r-bottom.png" alt="" />
            </div>
        </div>
    </div>
</asp:Content>
