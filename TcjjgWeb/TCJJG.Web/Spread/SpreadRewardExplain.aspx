<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SpreadRewardExplain.aspx.cs" Inherits="Spread_SpreadRewardExplain" %>

<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/Spread_Menu.ascx" TagName="Spread_Menu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../Css/SpreadRewardExplain.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Spread.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        function show2(_this) {
            //选项卡调用
            document.getElementById("dType1").className = "tap1";
            document.getElementById("dType2").className = "tap1";
            document.getElementById(_this).className = "tap2";
        } 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_SpreadContainer">
        <uc1:UC_UserInfo ID="UC_UserInfo" runat="server" />
        <uc2:Spread_Menu ID="Spread_Menu" runat="server" />
        <div class="Bigbody">
            <div class="body">
                <div class="spread-title">
                    <img src="/Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;奖励说明
                </div>
                <div class="top" style="display: none;">
                    <div id="dType1" class="tap1">
                        <%--<asp:LinkButton ID="lkType1" runat="server" OnClick="type1_Click">奖励说明</asp:LinkButton>--%>
                        <asp:ImageButton ID="lkType1" Style="display: none; float: left; margin-left: 6px;"
                            OnClick="type1_Click" ImageUrl="~/Images/BtnImg/award2.jpg" runat="server" />
                    </div>
                    <div id="dType2" class="tap2">
                        <%--<asp:LinkButton ID="Type2" runat="server" OnClick="type2_Click">详细奖励说明</asp:LinkButton>--%>
                        <asp:ImageButton ID="Type2" Style="display: none; float: left; margin-left: 6px;"
                            OnClick="type2_Click" ImageUrl="~/Images/BtnImg/detailaward1.jpg" runat="server" />
                    </div>
                </div>
                <asp:Panel ID="pLeft" runat="server">
                    <div class="buttom_text">
                        <div class="colorBor">
                            <div class="middle_left">
                                <asp:Label ID="lbWhySpread" runat="server" Text="金币道具有什么用？"></asp:Label></div>
                            <div class="middle_right" align="right">
                            </div>
                        </div>
                        <br />
                        <br />
                        1.CMOP同城斗地主竞技赛报名要用金币<br />
                        <br />
                        2.商城购买物品需要使用金币<br />
                        <br />
                        3.详细物品说明请点击商城查看<br />
                        <br />
                        <br />
                    </div>
                    <div class="buttom_text">
                        <div class="colorBor">
                            <div class="middle_left">
                                <asp:Label ID="Label1" runat="server" Text="奖励返还规则"></asp:Label></div>
                            <div class="middle_right" align="right">
                            </div>
                        </div>
                        <br />
                        <br />
                        <span>道具：</span>推广下线升到一定等级可获得道具奖励（等级上限为50级）<br />
                        <br />
                        <br />
                    </div>
                </asp:Panel>
                <asp:Panel ID="pRight" runat="server" Visible="false" CssClass="spreadPanel">
                    <div class="buttom_text">
                        <div class="colorBor">
                            <div class="middle_left">
                                <asp:Label ID="Label2" runat="server" Text="奖励领取注意事项"></asp:Label></div>
                            <div class="middle_right" align="right">
                            </div>
                        </div>
                        <br />
                        <br />
                        1.如果账单生成日起30天不领取奖励，系统将自动清理相关数据，请玩家及时关注网站领取奖励<br />
                        <br />
                        2.推广下线到达20级时，推广员将不再获得返还奖励<br />
                        <br />
                    </div>
                    <br />
                    <table width="685px" cellspacing="0" class="tableStyle">
                        <tr>
                            <td height="30">
                                <div>
                                    奖励条件</div>
                            </td>
                            <td height="30">
                                <div>
                                    返还奖励
                                </div>
                            </td>
                            <td height="30">
                                <div>
                                    数量
                                </div>
                            </td>
                        </tr>
                        <asp:Repeater ID="rpSRE" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td height="30">
                                        <div>
                                            下线达到<%#Eval("Rank")%>级</div>
                                    </td>
                                    <td height="30">
                                        <div>
                                            <%#Eval("TypeName")%></div>
                                    </td>
                                    <td height="30">
                                        <div>
                                            <%#Eval("Amount")%></div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                    <div class="bottom-3">
                    </div>
                </asp:Panel>
            </div>
        </div>
    </div>
    <div class="ClearF">
    </div>
    <script type="text/javascript">
        $(".uc-nav-item").eq(1).find("img").attr("src", $(".uc-nav-item").eq(1).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(1).addClass("hover").addClass("selected");
    </script>
</asp:Content>
