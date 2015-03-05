<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="Css/Default.css" rel="stylesheet" type="text/css" />
    <script src="Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="Js/Silverlight.js" type="text/javascript"></script>
    <script src="Js/common.js" type="text/javascript"></script>
    <script src="Js/ChangeCode.js" type="text/javascript"></script>
    <script src="Js/Default.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $.post("Ajax/Ajax_VisitCounter.aspx", { visitWeb: "0" });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_Mid_Container">
        <div class="D_Mid_Top">
            <div class="D_Mid_Top_Left">
                <asp:Panel ID="pnl_First" runat="server">
                    <a href="UserCenter/UserReg.aspx" class="BtnRegister">
                        <img src="Images/Default/tcjjg_2012_7.jpg" alt="" /></a>
                    <div class="D_Login">
                        <asp:TextBox ID="txtUserName0" runat="server" CssClass="TxtLogin"></asp:TextBox>
                        <asp:TextBox ID="txtPsw0" runat="server" CssClass="TxtLogin" TextMode="Password"></asp:TextBox>
                        <div class="BtnLogin" id="BtnLogin0">
                        </div>
                    </div>
                    <asp:Label ID="labMsg0" CssClass="lblMsg" runat="server" Text="" Font-Bold="true"
                        ForeColor="Red"></asp:Label>
                    <a class="FindPwd" href="UserCenter/FindPassWord.aspx">忘记密码?</a>
                    <div class="LoginLoading">
                        正在登录 请稍候...
                    </div>
                    <div class="D_Contact">
                        <div>
                            <a href="http://wpa.qq.com/msgrd?v=3&uin=243559966&site=qq&menu=yes" target="_blank">
                                <img src="Images/Default/tcjjg_2012_9.jpg" alt="" align="absmiddle" />&nbsp;&nbsp;&nbsp;客服QQ：243559966</a>
                        </div>
                        <div>
                            <a href="CustomerService/Floorilla.aspx">
                                <img src="Images/Default/tcjjg_2012_10.jpg" alt="" align="absmiddle" />&nbsp;&nbsp;&nbsp;同城玩家交流群</a>
                        </div>
                        <div>
                            <img src="Images/Default/tcjjg_2012_11.jpg" alt="" />&nbsp;&nbsp; <a href="CustomerService/CustomerServiceCenter.aspx">
                                <img src="Images/Default/tcjjg_2012_12.jpg" alt="" /></a>
                        </div>
                    </div>
                    <asp:ImageButton ImageUrl="~/Images/Default/img-jackaroo.jpg" 
                        CssClass="DownLoad" ID="ImageButton1" OnClientClick="return CheckCookie()" 
                        runat="server" onclick="ImageButton1_Click" AccessKey="z" />
<%--                    <div class="DownLoad" onclick="CheckCookie()">
                        <img src="Images/Default/img-jackaroo.jpg" alt="" /></div>--%>
                </asp:Panel>
                
                <asp:Panel ID="pnl_Again" runat="server" Style="display: none">
                    <a href="UserCenter/UserReg.aspx" class="BtnRegister">
                        <img src="Images/Default/tcjjg_2012_7.jpg" alt="" /></a>
                    <div class="D_Login">
                        <asp:TextBox ID="txtUserName" runat="server" CssClass="TxtLogin"></asp:TextBox>
                        <asp:TextBox ID="txtPsw" runat="server" CssClass="TxtLogin" TextMode="Password"></asp:TextBox>
                        <div class="BtnLogin" id="BtnLogin1">
                        </div>
                    </div>
                    <div class="ValiCode">
                        验证码:<asp:TextBox ID="txtVli" runat="server" class="txtCode" MaxLength="4" Width="40px"></asp:TextBox><img
                            id="imgCode" class="imgCode" alt="看不清？点击更换" src="/Index/ValidateCode.aspx" onclick="ChangeCode();"
                            style="cursor: pointer;" align="absmiddle" /></div>
                    <asp:Label ID="labMsg" runat="server" Text="" CssClass="lblMsg" Font-Bold="true"
                        ForeColor="Red"></asp:Label>
                    <a class="FindPwd1" href="/UserCenter/FindPassWord.aspx">忘记密码?</a>
                    <div class="LoginLoading">
                        正在登录 请稍候...
                    </div>
                    <div class="D_Contact2">
                        <div>
                            <a href="http://wpa.qq.com/msgrd?v=3&uin=243559966&site=qq&menu=yes" target="_blank">
                                <img src="Images/Default/tcjjg_2012_9.jpg" alt="" align="absmiddle" />&nbsp;&nbsp;&nbsp;客服QQ：243559966</a>
                        </div>
                        <div>
                            <a href="CustomerService/Floorilla.aspx">
                                <img src="Images/Default/tcjjg_2012_10.jpg" alt="" align="absmiddle" />&nbsp;&nbsp;&nbsp;同城玩家交流群</a>
                        </div>
                        <div>
                            <img src="Images/Default/tcjjg_2012_11.jpg" alt="" />&nbsp;&nbsp; <a href="CustomerService/CustomerServiceCenter.aspx">
                                <img src="Images/Default/tcjjg_2012_12.jpg" alt="" /></a>
                        </div>
                    </div>
                                        <div class="DownLoad">
                        <img src="Images/Default/img-jackaroo.jpg" alt="" /></div>
                </asp:Panel>
                <asp:Panel ID="pnl_Success" runat="server" Style="display: none">
                    <a href="HallPage/HallPageFL.aspx" class="BtnRegister">
                        <img src="Images/Default/tcjjg_2012__enterhall.jpg" alt="" /></a>
                    <div class="HeadSize">
                        <asp:Image ID="ImgAvatar" runat="server" ImageUrl="~/Images/CustomerService/tcjjg_2012__apperlimg.jpg" CssClass="Avatar" /></div>
                    <div class="D_LoginInfo">
                        <span>昵<span class="D_LoginInfoSpace">空</span>称： </span><span>
                            <asp:Label ID="lblNickName" runat="server" Text="" CssClass="lblInfo"></asp:Label>
                        </span>
                        <br />
                        <span>元<span class="D_LoginInfoSpace">空</span>宝： </span><span>
                            <asp:Label ID="lblYuanBao" runat="server" Text="" CssClass="lblInfo"></asp:Label></span><br />
                        <span>金<span class="D_LoginInfoSpace">空</span>币： </span><span>
                            <asp:Label ID="lblGoldCoin" runat="server" Text="" CssClass="lblInfo"></asp:Label></span>
                                                 
                    </div>
                    <%--<asp:HyperLink ID="LinkMyGoods" CssClass="MyGoods" NavigateUrl="~/UserCenter/PersonalAward.aspx"
                        runat="server"><img src="Images/Default/Default_MyGoods.jpg" /></asp:HyperLink>
                    <asp:HyperLink ID="LinkAward" runat="server" NavigateUrl="~/Sales/SalesInfo.aspx"><img src="Images/Default/Default_GoodsHall.jpg" /></asp:HyperLink>
                    --%><asp:HyperLink ID="AgencyLink" runat="server" CssClass="AgencyLink"></asp:HyperLink>
                    <div class="D_BtnList">
                        <a href="UserCenter/PasswordChange.aspx">
                            <img src="Images/Default/tcjjg_2012__changepwd.jpg" /></a> <a href="PayCenter/PayCenter.aspx">
                                <img src="Images/Default/tcjjg_2012__charge.jpg" /></a><div>
                                </div>
                        <asp:HyperLink ID="LogOut" runat="server" ImageUrl="~/Images/Default/tcjjg_2012__logout.jpg"
                            NavigateUrl="~/UserCenter/userLogout.aspx"></asp:HyperLink>
                    </div>
                                                            <div class="DownLoad3">
                        <img src="Images/Default/img-jackaroo.jpg" alt="" /></div>
                </asp:Panel>
            </div>
            <div class="D_Mid_Top_Right">
                <div class="D_Mid_Top_Minicomkvm">
                    <asp:Literal ID="ltaTopImgs" runat="server"></asp:Literal>
                    <%--<img src="Images/Default/tcjjg_2012_f1.jpg" />--%>
                </div>
                <div class="D_BtnSwitchContainer">
                    <asp:Literal ID="ltaTopbut" Text="" runat="server"></asp:Literal>
                </div>
            </div>
        </div>
        <div class="D_Mid_Mid">
            <div class="D_Match">
                <div class="D_Match_Menu">
                    <div class="Match_Report">
                        赛事报道</div>
                    <div class="Match_Intro">
                        赛事中心</div>
                    <a href="<%= GetBBSUrl() %>/showforum-8.aspx" target="_blank" class="More" id="MatchMore">更多&nbsp;<img
                        style="width: 3px; height: 5px; margin-bottom: 2px;" src="Images/Default/tcjjg_2012_15.jpg"
                        alt="" /></a>
                </div>
                <div class="D_Match_ContentContainer">
                    <div class="D_Match_Report">
                        <a href="#" class="PlayerImg1" target="_blank">
                            <img class="PlayerImg" />
                        </a>
                        <div class="PlayerInfo">
                            <br />
                            <a href="#" class="TxtUrl" target="_blank"><span class="CRTitle"></span>
                                <br />
                                <span class="CRContent"></span></a>
                        </div>
                        <a href="#" class="PlayerImg1" target="_blank">
                            <img class="PlayerImg" />
                        </a>
                        <div class="PlayerInfo">
                            <br />
                            <a href="#" class="TxtUrl" target="_blank"><span class="CRTitle"></span>
                                <br />
                                <span class="CRContent"></span></a>
                        </div>
                        <div class="ClearF">
                        </div>
                        <a href="#" class="PlayerImg1" target="_blank">
                            <img class="PlayerImg" />
                        </a>
                        <div class="PlayerInfo">
                            <br />
                            <a href="#" class="TxtUrl" target="_blank"><span class="CRTitle"></span>
                                <br />
                                <span class="CRContent"></span></a>
                        </div>
                        <a href="#" class="PlayerImg1" target="_blank">
                            <img class="PlayerImg" />
                        </a>
                        <div class="PlayerInfo">
                            <br />
                            <a href="#" class="TxtUrl" target="_blank"><span class="CRTitle"></span>
                                <br />
                                <span class="CRContent"></span></a>
                        </div>
                    </div>
                    <div class="D_Match_Intro">
                    </div>
                </div>
            </div>
            <div class="D_News">
                <div class="D_News_Menu">
                    <div class="D_News_Title">
                        新闻公告
                    </div>
                    <a href="Affiche/Affiche.aspx" class="NewsMore">更多&nbsp;<img src="Images/Default/tcjjg_2012_15.jpg"
                        alt="" style="width: 3px; height: 5px; margin-bottom: 2px;" /></a>
                </div>
                <div class="D_News_Container">
                </div>
            </div>
        </div>
        <div class="D_Mid_Cooperate">
            <img class="D_Mid_Cooperate_img" src="Images/Default/tcjjg_2012_20.jpg" alt="" />
            <div class="Cooperate_BottomBar">
            </div>
            <div class="Coopertate_ImgList">
                <a href="http://www.chinaacgg.com/" target="_blank">
                    <img src="Images/Default/tcjjg_2012_22.jpg" /></a><span></span><a href="http://www.csemg.com/"
                        target="_blank"><img src="Images/Default/tcjjg_2012_23.jpg" /></a><span></span><a
                            href="http://www.ghstf.org/" target="_blank"><img src="Images/Default/tcjjg_2012_24.jpg" /></a><span></span><a
                                href="http://www.sina.com.cn/" target="_blank"><img src="Images/Default/tcjjg_2012_25.jpg" /></a><span></span><a
                                    href="http://www.sohu.com/" target="_blank"><img src="Images/Default/tcjjg_2012_26.jpg" /></a><span></span><a
                                        href="http://www.youku.com/" target="_blank"><img src="Images/Default/tcjjg_2012_27.jpg" /></a><span></span><a
                                            href="http://www.gtv.com.cn/" target="_blank"><img src="Images/Default/tcjjg_2012_28.jpg" /></a><span></span><a
                                                href="http://www.cntv.cn/" target="_blank"><img src="Images/Default/tcjjg_2012_29.jpg" /></a>
            </div>
        </div>
    </div>
</asp:Content>
