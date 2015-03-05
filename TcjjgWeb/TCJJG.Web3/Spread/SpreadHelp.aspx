<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SpreadHelp.aspx.cs" Inherits="Spread_SpreadHelp" %>

<%@ Register src="../UserControl/Spread.ascx" tagname="Spread" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Css/SpreadHelp.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function setdata1() {
            var clipBoardContent = "";
            clipBoardContent += document.getElementById("ctl00_ContentPlaceHolder1_txtLink1").value
            window.clipboardData.setData("Text", clipBoardContent);
            alert("复制成功，请粘贴到你的QQ/MSN上推荐给你的好友");
        }
        function setdata2() {
            var clipBoardContent = "";
            clipBoardContent += document.getElementById("ctl00_ContentPlaceHolder1_txtLink2").value
            window.clipboardData.setData("Text", clipBoardContent);
            alert("复制成功，请粘贴到你的QQ/MSN上推荐给你的好友");
        }
        function setdata3() {
            var clipBoardContent = "";
            clipBoardContent += document.getElementById("ctl00_ContentPlaceHolder1_txtLink3").value
            window.clipboardData.setData("Text", clipBoardContent);
            alert("复制成功，请粘贴到你的QQ/MSN上推荐给你的好友");
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="D_SpreadContainer">
    <uc1:Spread ID="Spread1" runat="server" />
            <div class="Bigbody">
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
<br />
                    <div class="middle1_buttom">
                        <span class="middle1_buttom_s1">您的推广链接：</span> <span class="middle1_buttom_s2">
                            <asp:TextBox ID="txtLink1" Width="400" ReadOnly="true"  Text="http://localhost/Spread/SpreadIndex.aspx"
                                runat="server" ></asp:TextBox></span> 
                                    <span id="butCopy" onclick="setdata1()" class="CopyUrl"></span>
                                
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
                            <asp:TextBox ID="txtLink2" Width="400" ReadOnly="true"  Text="http://localhost/Spread/SpreadIndex.aspx"
                                runat="server"></asp:TextBox></span> 
                                   <span id="Button2" onclick="setdata1()" class="CopyUrl"></span>
                    </div>
                    <br />
                    <p>
                        附上文字如: 我最近正在玩同城斗地主赛事,这个比赛很不错,又好玩又刺激，还能能赢大奖,一起来玩吧!</p> <br /> <br />
                    <p class="middle_seze14" style="color: #F45D16;">
                        经证实,发送QQ群邮件是很有效的方法</p> <br /> <br />

                    <div class="p_bgcolor">
                        <span style="color: #F45D16;">
                            参与方式:</span>
                        <p>
                            1.打开QQ邮箱--点击写信—点击QQ群邮件</p><br />
                        <p>
                            2.填写邮件内容(别忘记留下您的推广链接和推广号)</p><br />
                        <p>
                            3.选择收件群并发送邮件</p><br />
                        <span style="color: #F45D16;">
                            推广效果:</span>
                        <p>
                            根据原有“发QQ群邮件活动”的效果统计，每2封邮件就能为您带来一个注册下线，只要向10个群发送邮件，每个月可以轻松带来5个注册下线。</p><br />
                        <span style="color: #F45D16;">
                            如何获得更好的效果：</span>
                        <p>
                            1.关键点：参加QQ群、多参与，关键字、群人数</p><br />
                        <p>
                            2.选择和同城斗地主有关的QQ群，如：棋牌爱好者QQ群</p><br />
                        <p>
                            3.多加QQ群，多发群邮件</p><br />
                        <p>
                            4.选择人数较多的QQ群</p><br />
                        <p>
                            5.在邮件中填写有效的宣传内容</p><br />
                    </div>
                        <p>
                            <a style="color:rgb(53,53,53) ;" href="../Help/Game.aspx " target="_blank">（邮件内容可参考：http://www.tcjjg.com/Help/Game.aspx ）</a></p>
                </div>
            </div>
            <div class="middle1">
                <div class="middle1_title">
                    &nbsp;&nbsp;3.好友邀请</div> <br />
                <div class="middle1_but">
                    <p>
                        方法一：把下列链接发给您的好友</p> <br />
                    <div class="middle1_buttom">
                        <span class="middle1_buttom_s1">您的推广链接：</span> <span class="middle1_buttom_s2">
                            <asp:TextBox ID="txtLink3" Width="400" ReadOnly="true" CssClass="text1" Text="http://localhost/Spread/SpreadIndex.aspx"
                                runat="server"></asp:TextBox></span> <span id="Button1" onclick="setdata1()" class="CopyUrl"></span>
                    </div> <br />
                    <p>
                        方法二：把您的推广号告诉您的好友（推广号请点击<a href="SpreadIndex.aspx">推广首页</a>查看,只要他在注册页面‘推荐人’一栏中输入您的推荐号，他就会成为您的推广玩家。）</p>
                </div>
            </div>
        </div>
        </div>
            <div class="ClearF">
    </div>
        <script type="text/javascript">
            $("#SpreadHelp").css("background-image", "url('../Images/CustomerService/tcjjg_2012__ucbg.jpg')");
    </script>
</asp:Content>

