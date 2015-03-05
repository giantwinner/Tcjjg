<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SpreadResults.aspx.cs" Inherits="Spread_SpreadResults" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/Spread_Menu.ascx" TagName="Spread_Menu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/Spread.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../Css/SpreadResults.css" rel="stylesheet" type="text/css" />
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
                    <img src="/Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;推广成绩
                </div>
                <div class="top">
                    <div class="top1">
                    </div>
                    <div id="dType1" class="tap1">
   <%--                     <asp:LinkButton ID="lkType1" runat="server" OnClick="lkType1_Click">推广详情</asp:LinkButton>--%>
                        <asp:ImageButton ID="lkType1" style=" float:left; margin-left:6px;" OnClick="lkType1_Click" ImageUrl="~/Images/BtnImg/spreadDetail2.jpg" runat="server" />
                        </div>
                    <div id="dType2" class="tap2">
                                            <asp:ImageButton ID="lkType2" style=" float:left; margin-left:6px;"  OnClick="lkType2_Click" ImageUrl="~/Images/BtnImg/ach1.jpg" runat="server" />

          <%--              <asp:LinkButton ID="lkType2" runat="server" OnClick="lkType2_Click">业绩汇总</asp:LinkButton>--%>
                        </div>
                </div>
                <asp:Panel ID="pLeft" runat="server">
                    <div class="divNone">
                    </div>
                    <table cellspacing="0" class="tableStyle">
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
                            <%--<td height="30">
                            <div>
                                推广类型</div>
                        </td>
                        <td height="30">
                            <div>
                                所属网吧</div>
                        </td>
                            --%>
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
                                    <td style="display: none" height="30">
                                        <div>
                                            <%#Eval("lev").ToString()=="1"?"直接推广":"间接推广"%></div>
                                    </td>
                                    <td style="display: none" height="30">
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
                            NextPageText="下一页" OnPageChanged="AspNetPager2_PageChanged" PageSize="15" PrevPageText="上一页">
                        </webdiyer:AspNetPager>
                    </div>
                    <asp:Label ID="lbNoneInfo1" runat="server" Font-Size="Small"></asp:Label>
                    <br />
                    <div class="bottom-3" style="font-size: 14px;">
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
                            <%--                        <td height="30">
                            <div>
                                直接推广玩家数量</div>
                        </td>
                        <td height="30">
                            <div>
                                间接推广玩家数量</div>
                        </td>--%>
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
                                            <%# Eval("Lev1").ToString() == "0" ? "-" : Eval("Lev1").ToString()%></div>
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
                        </tr>
                    </table>
                    <br />
                    <div class="top1_buttom">
                        &nbsp;<b>已领取奖励</b>
                    </div>
                    <br />
                                        <table width="685px" cellspacing="0" class="tableStyle">
                        <tr>
                            <td height="30">
                                <div>
                                    物品名称</div>
                            </td>

                            <td height="30">
                                <div>
                                    数量</div>
                            </td>
                        </tr>
                        <asp:Repeater ID="rptRewardGeted" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td height="30">
                                        <div>
                                            <%#Eval("TypeName")%></div>
                                    </td>
                                    <td height="30">
                                        <div>
                                            <%# Eval("Amount")%></div>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </table>
                    <br />
                    <div class="bottom-3">
                        温馨提示：您还未领取的奖品可以点击左侧“领取奖品”进行领取</div>
                </asp:Panel>
            </div>
        </div>
    </div>
    <div class="ClearF">
    </div>
    <script type="text/javascript">
        $(".uc-nav-item").eq(3).find("img").attr("src", $(".uc-nav-item").eq(3).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(3).addClass("hover").addClass("selected");
    </script>
</asp:Content>
