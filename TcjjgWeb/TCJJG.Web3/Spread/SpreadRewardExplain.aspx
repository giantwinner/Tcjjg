<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SpreadRewardExplain.aspx.cs" Inherits="Spread_SpreadRewardExplain" %>

<%@ Register Src="../UserControl/Spread.ascx" TagName="Spread" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SpreadRewardExplain.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function show2(_this) {
            //选项卡调用
            document.getElementById("dType1").className = "top4";
            document.getElementById("dType2").className = "top4";
            document.getElementById(_this).className = "top2";
        } 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_SpreadContainer">
        <uc1:Spread ID="Spread1" runat="server" />
        <div class="Bigbody">
            <div class="top">
                <div id="dType1" class="top2">
                    <asp:LinkButton ID="lkType1" runat="server" OnClick="type1_Click">奖励说明</asp:LinkButton></div>
                <div class="top_none">
                </div>
                <div id="dType2" class="top4">
                    <asp:LinkButton ID="Type2" runat="server" OnClick="type2_Click">详细奖励说明</asp:LinkButton></div>
                <div class="top_none">
                </div>
                <div class="top5">
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
                    <br /><br />
                    1.CMOP同城斗地主竞技赛报名要用金币<br /><br />
                    2.道具商城购买道具需要使用金币<br /><br />
                    3.详细道具说明请点击道具商城查看<br /><br /><br />
                </div>
                <div class="buttom_text">
                    <div class="colorBor">
                        <div class="middle_left">
                            <asp:Label ID="Label1" runat="server" Text="奖励返还规则"></asp:Label></div>
                        <div class="middle_right" align="right">
                        </div>
                    </div>
                    <br /><br />
                    1.<span>金币：</span>推广下线每升1级,推广员将获得相应的金币奖励（等级上限为50级）<br /><br />
                    2.<span>道具：</span>推广下线升到一定等级可获得道具奖励（等级上限为50级）<br /><br /><br />
                </div>
                <div class="buttom_text">
                    <div class="colorBor">
                        <div class="middle_left">
                            <asp:Label ID="Label2" runat="server" Text="金币领取注意事项"></asp:Label></div>
                        <div class="middle_right" align="right">
                        </div>
                    </div>
                    <br /><br />
                    1.如果账单生成日起30天不领取奖励，系统将自动清理相关数据请玩家及时关注网站领取奖励<br /><br />
                    2.推广下线到达50级时，推广员将不再获得金币返还奖励<br /><br /><br />
                </div>
            </asp:Panel>
            <asp:Panel ID="pRight" runat="server" Visible="false" CssClass="spreadPanel">
                <br /><br />  
                <asp:RadioButtonList ID="RadioButtonList1" runat="server"
                    RepeatColumns="3" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged" 
                    AutoPostBack="True">
                    <asp:ListItem Text="直接推广奖励" Value="1" Selected="True" style=" font-size:14px;">直接推广奖励</asp:ListItem>
                    <asp:ListItem Text="间接推广奖励" Value="2" style=" font-size:14px;">间接推广奖励</asp:ListItem>
                </asp:RadioButtonList>
                 <br />   <br />  
                <table width="685px" cellspacing="0" class="tableStyle">
                    <tr>
                        <td height="30">
                            <div>
                                经验值等级</div>
                        </td>
                        <td height="30">
                            <div>
                                <asp:Label ID="lbAwardDes1" runat="server" Text="直接推广奖励"></asp:Label></div>
                        </td>
<%--                        <td>
                        金币累积数
                        </td>
                        <td height="30">
                            <div>
                                经验值等级</div>
                        </td>
                        <td height="30">
                            <div>
                                <asp:Label ID="lbAwardDes2" runat="server" Text="直接推广奖励"></asp:Label></div>
                        </td>
                        <td>
                        金币累积数
                        </td>--%>
                    </tr>
                    <asp:Repeater ID="rpSRE" runat="server">
                        <ItemTemplate>
                            <tr >
                                <td height="30">
                                    <div>
                                        <%#Eval("rank")%></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("AwardDes")%></div>
                                </td>
 <%--                               <td height="30"><div><%#Eval("TAmount")%></div></td>
                                <td height="30">
                                    <div>
                                        <%#Eval("rank2")%></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("AwardDes2")%></div>
                                </td>
                                <td height="30">
                                  <div><%#Eval("TAmount2")%></div>
                                </td>--%>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <div class="bottom-3">
                    <asp:Label ID="lbText" runat="server" Text="提示：累积10个好友都达到5级则额外赠送20000金币！"></asp:Label>&nbsp;
                </div>
            </asp:Panel>
        </div>
    </div>
    <div class="ClearF">
    </div>
            <script type="text/javascript">
                $("#SpreadRewardExplain").css("background-image", "url('../Images/CustomerService/tcjjg_2012__ucbg.jpg')");
    </script>
</asp:Content>
