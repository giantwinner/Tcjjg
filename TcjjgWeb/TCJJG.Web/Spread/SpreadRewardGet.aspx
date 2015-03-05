<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SpreadRewardGet.aspx.cs" Inherits="Spread_SpreadRewardGet" %>

<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/Spread_Menu.ascx" TagName="Spread_Menu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../Css/SpreadRewardGet.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/Spread.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/setday.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_SpreadContainer">
        <uc1:UC_UserInfo ID="UC_UserInfo" runat="server" />
        <uc2:Spread_Menu ID="Spread_Menu" runat="server" />
        <div class="Bigbody">
            <div class="body">
                <div class="spread-title">
                    <img src="/Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;领取奖品
                </div>
                <div class="colorBor">
                    &nbsp;<asp:Label ID="Label1" runat="server" Text="本次可领取的奖励"></asp:Label>
                </div>
                <table width="685px" cellspacing="0" class="tableStyle">
                    <tr>
                        <td height="30" width="40%">
                            <div>
                                可领取奖励</div>
                        </td>
                        <td height="30">
                            <div>
                                数量</div>
                        </td>
                    </tr>
                    <asp:Repeater ID="rpRewardGet" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td height="30">
                                    <div>
                                        <%#Eval("TypeName") %></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("Amount")%></div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <asp:Label ID="lbNoneInfo1" runat="server" Font-Size="Small"></asp:Label>
                <div class="bottomBor">
                    <div class="bottomBor1">
                    </div>
                    <div class="bottomBor2" align="right">
                    </div>
                    <div class="bottomBor3" align="right">
<%--
                        <asp:LinkButton ID="lbGetReward" OnClick="lbGetReward_Click" runat="server" CssClass="savebtn">领取</asp:LinkButton>--%>
                                     <asp:ImageButton ID="lbGetReward" runat="server" OnClick="lbGetReward_Click"  ImageUrl="~/Images/BtnImg/lingqu1.png" />

                    </div>
                </div>
                <div class="bottom-3">
                    注：本次可领取奖励为推广下线新升等级所产生的奖励。<%--道具与账号绑定，不可交易赠送。--%></div>
                <div class="colorBor">
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label>
                </div>
                <div class="bottomBor">
                    <div class="bottomBor1">
                    </div>
                    <%------%>
                    <div class="bottomBor2" align="right">
                        &nbsp; 选择日期：&nbsp;
                        <asp:TextBox ID="txtDate1" runat="server" CssClass="text1" onclick="setday(this)" Width="80"></asp:TextBox>&nbsp;
                        至 &nbsp;
                        <asp:TextBox ID="txtDate2" runat="server" CssClass="text1" onclick="setday(this)" Width="80"></asp:TextBox>
                    </div>
                    <%------%>
                    <div class="bottomBor3" align="right">
<%--                        <asp:LinkButton ID="LinkButton1" OnClick="LinkButton1_Click" runat="server" CssClass="savebtn">查询</asp:LinkButton>
--%>                    
                                         <asp:ImageButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click"  ImageUrl="~/Images/BtnImg/select1.png" />

</div>
                </div>
                <br />
                <table width="685px" cellspacing="0" class="tableStyle">
                    <tr>
                        <td height="30">
                            <div>
                                可领取的奖励</div>
                        </td>
                        <td height="30">
                            <div>
                                数 量</div>
                        </td>
                        <td height="30">
                            <div>
                                领取状态</div>
                        </td>
                        <td height="30">
                            <div>
                                日期</div>
                        </td>
                    </tr>
                    <asp:Repeater ID="rpSpreadInfo" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td height="30">
                                    <div>
                                        <%#Eval("TypeName") %></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("Amount") %></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("Status").ToString() == "0" ? "未领取" : "已领取"%></div>
                                </td>
                                <td height="30">
                                    <div>
                                        <%#Eval("CreateTime") %></div>
                                </td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
                <asp:Label ID="lbNoneInfo2" runat="server" Text="" Font-Size="Small"></asp:Label>
            </div>
        </div>
    </div>
    <div class="ClearF">
    </div>
    <script type="text/javascript">
        $(".uc-nav-item").eq(2).find("img").attr("src", $(".uc-nav-item").eq(2).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(2).addClass("hover").addClass("selected");
    </script>
</asp:Content>
