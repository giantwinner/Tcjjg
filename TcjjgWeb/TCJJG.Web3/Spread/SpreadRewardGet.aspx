<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SpreadRewardGet.aspx.cs" Inherits="Spread_SpreadRewardGet" %>

<%@ Register src="../UserControl/Spread.ascx" tagname="Spread" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Css/SpreadRewardGet.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/Calendar.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="D_SpreadContainer">
        <uc1:Spread ID="Spread1" runat="server" />
        <div class="Bigbody">
            <div class="colorBor">
                <div class="middle_left">
                    &nbsp;<asp:Label ID="Label1" runat="server" Text="本次可领取的奖励"></asp:Label></div>
                <div class="middle_right" align="right">
                </div>
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
                        <asp:ImageButton onclick="lbGetReward_Click"  ImageUrl="~/Images/Spread/sp_draw.jpg" ID="lbGetReward" runat="server"/>
                </div>
            </div>
            
            <div class="bottom-3">
                注：本次可领取奖励为推广下线新升等级所产生的奖励。<%--道具与账号绑定，不可交易赠送。--%></div>
            <div class="colorBor">
                <div class="middle_left">
                    <asp:Label ID="Label2" runat="server" Text=""></asp:Label></div>
                <div class="middle_right" align="right">
                </div>
            </div>
            <div class="bottomBor">
                <div class="bottomBor1">
                </div>
                <%------%>
                <div class="bottomBor2" align="right">
                    &nbsp; 选择日期：&nbsp;
                    <asp:TextBox ID="txtDate1" runat="server" CssClass="text1" onfocus="javascript:calendar();"
                        Width="80"></asp:TextBox>&nbsp; 至 &nbsp;
                    <asp:TextBox ID="txtDate2" runat="server" CssClass="text1" onfocus="javascript:calendar();"
                        Width="80"></asp:TextBox>
                </div>
                <%------%>
                <div class="bottomBor3" align="right">
                   
                    <asp:ImageButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" ImageUrl="~/Images/Spread/sp_select.jpg" />
                </div>
                
            </div>
            <br />
            <table width="685px" cellspacing="0" class="tableStyle">
                <tr>
                    <td height="30">
                        <div>
                            推广类型</div>
                    </td>
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
                                    <%#Eval("ChildLevel").ToString() == "1" ? "直接推广" : "间接推广"%></div>
                            </td>
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
        <div class="ClearF">
    </div>
    
            <script type="text/javascript">
                $("#SpreadRewardGet").css("background-image", "url('../Images/CustomerService/tcjjg_2012__ucbg.jpg')");
    </script>
</asp:Content>

