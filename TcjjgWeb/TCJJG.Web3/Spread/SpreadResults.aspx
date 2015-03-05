<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SpreadResults.aspx.cs" Inherits="Spread_SpreadResults" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<%@ Register src="../UserControl/Spread.ascx" tagname="Spread" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Css/SpreadResults.css" rel="stylesheet" type="text/css" />
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="D_SpreadContainer">
        <uc1:Spread ID="Spread1" runat="server" />
                <div class="Bigbody">
            <div class="top">
                <div class="top1">
                </div>
                <div id="dType1" class="top2">
                    <asp:LinkButton ID="lkType1" runat="server" OnClick="lkType1_Click">推广详情</asp:LinkButton></div>
                <div class="top_none">
                </div>
                <div id="dType2" class="top4">
                    <asp:LinkButton ID="lkType2" runat="server" OnClick="lkType2_Click">业绩汇总</asp:LinkButton></div>
                <div class="top_none">
                </div>
                <div class="top5">
                </div>
            </div>
            <asp:Panel ID="pLeft" runat="server">
                <div class="divNone">
                </div>
                <table width="685px" cellspacing="0" class="tableStyle">
                    <tr>
                        <td height="30">
                            <div>
                                用户名</div>
                        </td>
                        <td height="30">
                            <div>
                                玩家昵称</div>
                        </td>
                        <td height="30">
                            <div>
                                等级</div>
                        </td>
                        <td height="30">
                            <div>
                                推广类型</div>
                        </td>
                        <td height="30">
                            <div>
                                所属网吧</div>
                        </td>
                        <td height="30">
                            <div>
                                注册时间</div>
                        </td>
                        <td height="30">
                            <div>
                                充值总额</div>
                        </td>
                    </tr>
                    <asp:Repeater ID="rpSRInfo" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td height="30">
                                    <div>
                                        <%#Eval("UserName")%></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("NickName")%></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("CurrentRank")%></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("lev").ToString()=="1"?"直接推广":"间接推广"%></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%--select  1 lev,a.UserName,a.CurrentRank,a.BarName,a.RegTime,a.LastLogOnTime--%>
                                        <%#Eval("BarName")%></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("RegTime")%></div>
                                </td>
                                <td height="30">
                                    <div>
                                         <%#Eval("Total_NoExpCard") == null ? "0" : Eval("Total_NoExpCard")%></div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <%-- 分页 --%>
                <div align="center">
                    <webdiyer:AspNetPager ID="AspNetPager2" runat="server" FirstPageText="首页" LastPageText="尾页"
                        NextPageText="下一页" OnPageChanged="AspNetPager2_PageChanged" PageSize="20" PrevPageText="上一页">
                    </webdiyer:AspNetPager>
                </div>
                <asp:Label ID="lbNoneInfo1" runat="server" Font-Size="Small"></asp:Label>
                <br />
                <div class="bottom-3" style=" font-size:14px;">
                    温馨提示：推广详情的数据将于每天的凌晨5点更新</div>
            </asp:Panel>
            <asp:Panel ID="pRight" Visible="false" runat="server">
                <div class="divNone">
                </div>
                <table width="685px" cellspacing="0" class="tableStyle">
                    <tr>
                        <td height="30">
                            <div>
                                被推广玩家等级</div>
                        </td>
                        <td height="30">
                            <div>
                                直接推广玩家数量</div>
                        </td>
                        <td height="30">
                            <div>
                                间接推广玩家数量</div>
                        </td>
                        <td height="30">
                            <div>
                                共推广玩家数量</div>
                        </td>
                    </tr>
                    <asp:Repeater ID="rpSRCount" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td height="30">
                                    <div>
                                        <%#Eval("Lev")%></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("Lev1").ToString() =="0"?"-" : Eval("Lev1")%></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("Lev2").ToString() == "0" ? "-" : Eval("Lev2")%></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%# (Convert.ToInt32(Eval("Lev1")) + Convert.ToInt32(Eval("Lev2"))).ToString() == "0" ? "-" : (Convert.ToInt32(Eval("Lev1")) + Convert.ToInt32(Eval("Lev2"))).ToString()%></div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                            <tr>
                                <td height="30">
                                    <div>
                                        合计</div>
                                </td>
                                <td height="30">
                                    <div>
                                        共：<asp:Label ID="labLev1" runat="server" Text=""></asp:Label></div>
                                </td>
                                <td height="30">
                                    <div>
                                        共：<asp:Label ID="labLev2" runat="server" Text=""></asp:Label></div>
                                </td>
                                <td height="30">
                                    <div>
                                        总计：<asp:Label ID="labLevCount" runat="server" Text=""></asp:Label></div>
                                </td>
                            </tr>
                </table>
                <div class="bottom">
                    <div class="bottom-1">
                        已领取金币：<asp:Label ID="LabRewardCount1" runat="server" Text="0"></asp:Label></div>
                    <div class="bottom-2">
                        未领取金币：<asp:Label ID="LabRewardCount2" runat="server" Text="0"></asp:Label></div>
                </div>
                <div class="bottom-3">
                    温馨提示：您还未领取的金币与道具可以点击左侧“领取奖励”按钮进行领取</div>
            </asp:Panel>
        </div>
    </div>
        <div class="ClearF">
    </div>
            <script type="text/javascript">
                $("#SpreadResults").css("background-image", "url('../Images/CustomerService/tcjjg_2012__ucbg.jpg')");
    </script>

</asp:Content>

