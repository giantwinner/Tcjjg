<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="AwardLog.aspx.cs"
    Inherits="UserCenter_AwardLog" MasterPageFile="../MasterPage.master" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/QueryString.js" type="text/javascript"></script>
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/NewCalendar.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="userCenter_Layout">
        <div class="userCenter_Top">
            <div class="userCenter_Top_Text">
                用户中心</div>
            <div class="userCenter_Top_Img">
            </div>
        </div>
        <div class="userCenter_Left">
            <uc1:UC_UserCenter ID="UC_UserCenter1" runat="server" />
        </div>
        <div class="userCenter_Right">
            <div class="UserCenter_Right_Layout">
                <div class="UserCenter_Right_Title">
                    兑奖记录
                </div>
                <br />
                <div class="div_UserReckoning_Main">
                    <div style="margin-top: -10px; margin-left: 150px;">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="RadioButtonList1_SelectedIndexChanged"
                            RepeatDirection="Horizontal" >
                            <asp:ListItem Selected="True" Value="0">网吧兑奖(财富赠送)记录</asp:ListItem>
                            <asp:ListItem Value="1">CMOP商店兑换记录</asp:ListItem>
                            <asp:ListItem Value="2">比赛奖品兑换记录</asp:ListItem>
                        </asp:RadioButtonList>
                    </div>
                    <div class="div_UserReckoning_Main2">
                        <div class="div_UserReckoning_Main212">
                            <asp:Panel ID="Panel1" runat="server" Visible="false">
                                <div>
                                    &nbsp; 赠送时间:&nbsp;
                                    <asp:TextBox ID="txtDate1" runat="server" CssClass="text1" onclick="SelectDate(this)"
                                        Width="160px" ></asp:TextBox>
                                    &nbsp
                                    <asp:ImageButton ID="Button2" CssClass="btnPosition" runat="server" OnClick="Button2_Click" ImageUrl="~/Images/SubPage/btnOk.jpg" />
                                </div>
                                <br />
                                <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                    GridLines="None" Width="100%" CssClass="gridview_Reckoing" ShowHeader="True"
                                    OnRowCreated="gvData_RowCreated" EmptyDataText="暂时还没有赠送记录!">
                                    <RowStyle HorizontalAlign="left" Height="30" />
                                    <Columns>
                                        <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th1" HeaderText="类型">
                                            <ItemTemplate>
                                                <%# Eval("SU").ToString() == "4" ? Eval("AW") : string.Empty%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th1" HeaderText="数量">
                                            <ItemTemplate>
                                                <%# Eval("SU").ToString() == "4" ? Eval("AM").ToString() : string.Empty%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th1" HeaderText="赠送人">
                                            <ItemTemplate>
                                                <%# Eval("SU").ToString() == "4" ? Eval("Memo").ToString() : string.Empty%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th1" HeaderText="类型">
                                            <ItemTemplate>
                                                <%# Eval("SU").ToString() == "0" ? Eval("AW") : string.Empty%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th1" HeaderText="数量">
                                            <ItemTemplate>
                                                <%# Eval("SU").ToString() == "0" ? Eval("AM").ToString() : string.Empty%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th1" HeaderText="受赠人">
                                            <ItemTemplate>
                                                <%# Eval("SU").ToString() == "0" ? Eval("Memo").ToString() : string.Empty%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th1">
                                            <ItemTemplate>
                                                <%# Eval("CR")%>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </asp:GridView>
                                <br />
                                <div>
                                    <center>
                                        <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页"
                                            NextPageText="下一页" OnPageChanged="AspNetPager1_PageChanged" PageSize="6" PrevPageText="上一页">
                                        </webdiyer:AspNetPager>
                                    </center>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel2" runat="server" Visible="false">
                                <div style="margin-top: 10px">
                                    <asp:GridView ID="gvAward" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                        EnableModelValidation="True" GridLines="None" Width="100%" EmptyDataText="暂时还没有CMOP兑奖记录!"
                                        CssClass="gridview_Reckoing" ShowHeader="True">
                                        <Columns>
                                            <asp:BoundField DataField="UserName" HeaderText="用户名" />
                                            <asp:BoundField DataField="NickName" HeaderText="昵称" />
                                            <asp:BoundField DataField="AwardName" HeaderText="奖品名称" />
                                            <asp:BoundField DataField="AwardCount" HeaderText="兑换数量" />
                                            <asp:TemplateField HeaderText="财富">
                                                <ItemTemplate>
                                                    <%# Eval("AwardBonus")%>
                                                    <%# Eval("ClaimCredentialTypeName")%>
                                                </ItemTemplate>
                                            </asp:TemplateField>
                                            <asp:BoundField DataField="TotalBonus" HeaderText="总价" />
                                            <asp:BoundField DataField="ClaimStatusName" HeaderText="状态" />
                                            <asp:BoundField DataField="ClaimPro1UserName" HeaderText="兑换网吧" />
                                            <asp:BoundField DataField="CreateDate" HeaderText="创建时间" />
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <RowStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="None" />
                                    </asp:GridView>
                                    <div>
                                        <center style="margin-top: 20px">
                                            <webdiyer:AspNetPager ID="AspNetPager2" runat="server" FirstPageText="首页" LastPageText="尾页"
                                                NextPageText="下一页" OnPageChanged="AspNetPager2_PageChanged" PageSize="15" PrevPageText="上一页">
                                            </webdiyer:AspNetPager>
                                        </center>
                                    </div>
                                </div>
                            </asp:Panel>
                            <asp:Panel ID="Panel3" runat="server" Visible="false">
                                <div style="margin-top: 10px">
                                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BorderStyle="None"
                                        EnableModelValidation="True" GridLines="None" Width="100%" EmptyDataText="暂时还没有比赛奖品兑换记录!"
                                        CssClass="gridview_Reckoing">
                                        <Columns>
                                            <asp:BoundField DataField="UserName" HeaderText="用户名" />
                                            <asp:BoundField DataField="NickName" HeaderText="昵称" />
                                            <asp:BoundField DataField="MatchName" HeaderText="比赛名称" />
                                            <asp:BoundField DataField="AwardName" HeaderText="奖品名称" />
                                            <asp:BoundField DataField="AwardCount" HeaderText="兑换数量" />
                                            <asp:BoundField DataField="ClaimStatusName" HeaderText="状态" />
                                            <asp:BoundField DataField="CreateDate" HeaderText="创建时间" />
                                        </Columns>
                                        <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                                        <RowStyle Height="25px" HorizontalAlign="Center" VerticalAlign="Middle" BorderStyle="None" />
                                    </asp:GridView>
                                    <div style="margin-top: 20px">
                                        <center>
                                            <webdiyer:AspNetPager ID="AspNetPager3" runat="server" FirstPageText="首页" LastPageText="尾页"
                                                NextPageText="下一页" OnPageChanged="AspNetPager3_PageChanged" PageSize="20" PrevPageText="上一页">
                                            </webdiyer:AspNetPager>
                                        </center>
                                    </div>
                                </div>
                            </asp:Panel>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".userCenter_Left_Nav_Item").eq(11).addClass("userCenter_Left_Nav_Item_Selected");
    </script>
</asp:Content>
