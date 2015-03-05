<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SalesConfig.aspx.cs" Inherits="AwardCenter_SalesConfig"
    MasterPageFile="../MasterPage.master" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="../UserControl/UC_AwardCenter_Nav.ascx" TagName="UC_AwardCenter_Nav"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/UC_UserInformation.ascx" TagName="UC_UserInformation"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <link href="../Css/SalesConfig.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/ChangeCode.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="subPage_Layout">
        <div class="subPage_Left">
            <uc1:UC_AwardCenter_Nav ID="UC_AwardCenter_Nav1" runat="server" />
            <uc2:UC_UserInformation ID="UC_UserInformation1" runat="server" />
            <div class="subPage_Left_Service">
                <a class="AwardLinkToService" href="http://wpa.qq.com/msgrd?v=3&uin=243559966&site=qq&menu=yes"
                    target="_blank"></a>
            </div>
        </div>
        <div class="subPage_Right">
            <div class="AwardList_Title">
                我要拍卖
            </div>
            <div class="salesConfig_left" style=" position:relative">
                <div class="salesConfig_left_Title">
                    请选择要出售的商品</div>
                <asp:Label CssClass="noSales" ID="labMiddleLeftNone" runat="server" Text=""></asp:Label>
                <%--绑定用户财富--%>
                <asp:DataList ID="dlUserAcount" runat="server" OnItemCommand="dlUserAcount_ItemCommand"
                    RepeatColumns="3" RepeatDirection="Horizontal">
                    <ItemTemplate>
                        <div class="salesConfig_left_Sales">
                            <div class="salesConfig_left_SalesName">
                                <%#Eval("N")%></div>
                            <div class="salesConfig_left_SalesImg">
                                <asp:ImageButton ID="ImageButton1" ImageUrl='<%#Eval("I")%>' Width="100" Height="100"
                                    ToolTip='<%#Eval("M")%>' runat="server" CommandArgument='<%#Eval("T")%>' />
                            </div>
                            <div class="salesConfig_left_SalesAmount">
                                数量：<%#Eval("A")%></div>
                        </div>
                    </ItemTemplate>
                </asp:DataList>
                <div align="center" style="width:450px; position:absolute; bottom:36px;">
                    <webdiyer:AspNetPager ID="AspNetPager3" runat="server" FirstPageText="首页" LastPageText="尾页"
                        NextPageText="下一页" OnPageChanged="AspNetPager3_PageChanged" PageSize="6" PrevPageText="上一页">
                    </webdiyer:AspNetPager>
                </div>
            </div>
            <div class="salesConfig_right">
                <div class="salesConfig_right_Title">
                    出售物品详细信息
                </div>
                <asp:Panel ID="pMiddleRightBottom" runat="server" CssClass="Middle-right-bottom">
                    <div class="rowsImg">
                        <br />
                        <div class="salesConfig_right_Image">
                            <asp:Label ID="lblGoodsName" CssClass="salesConfig_right_Name" runat="server" Text=""></asp:Label>
                            <asp:Image ID="imgGoodsIcon" runat="server" ImageUrl="~/Images/SubPage/salesInfoConfig.jpg"
                                Width="75" />
                        </div>
                    </div>
                    <div class="rowsText">
                        <div class="rowsText_right1">
                            出售介绍：</div>
                        <div class="rowsText_right2">
                            <asp:Label ID="labGoodsMemo" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="rows">
                        <div class="clos_left">
                            出售方式：</div>
                        <div class="clos_right">
                            一口价</div>
                    </div>
                    <div class="rows">
                        <div class="clos_left">
                            出售数量：</div>
                        <div class="clos_right">
                            <asp:TextBox ID="txtGoodsNum" MaxLength="4" runat="server" Text="1" Width="70px"
                                CssClass="text1"></asp:TextBox></div>
                    </div>
                    <%--<div class="rows">
                        <div class="clos_left">--%>
                    <asp:Label ID="Label1" Visible="false" runat="server" Text="出售限价："></asp:Label>
                    <%--</div>
                        <div class="clos_right">--%>
                    <asp:Label ID="labMinPrice" Visible="false" runat="server" Text=""></asp:Label>
                    <asp:Label ID="labMaxPrice" Visible="false" runat="server" Text=""></asp:Label>
                    <asp:Label ID="labTypeName1" Visible="false" runat="server" Text=""></asp:Label>
                    <%--    </div>
                    </div>--%>
                    <div class="rows">
                        <div class="clos_left">
                            出售单价：</div>
                        <div class="clos_right">
                            <asp:TextBox ID="txtGoodsPrice" runat="server" MaxLength="7" Width="70px" CssClass="text1"></asp:TextBox>
                            <asp:Label ID="labTypeName2" runat="server" Text=""></asp:Label> 100整数倍</div>
                    </div>
                    <div class="rowsRidio">
                        <div class="clos_left">
                            有效时间：</div>
                        <div class="rowsRidio_right">
                            <asp:RadioButtonList ID="rblGoodsTime" runat="server" Height="19px" RepeatColumns="2"
                                Width="137px" Font-Size="Small">
                                <asp:ListItem Selected="True" Value="1">24小时</asp:ListItem>
                                <asp:ListItem Value="2">48小时</asp:ListItem>
                            </asp:RadioButtonList>
                        </div>
                    </div>
                    <div class="rowsRidio">
                        <div class="clos_left">
                            &nbsp;验&nbsp;证&nbsp;码：</div>
                        <div class="rowsRidio_right_txtVli">
                            <asp:TextBox ID="txtVli" runat="server" class="txtCode" MaxLength="4"></asp:TextBox>&nbsp;<img
                                id="imgCode" class="txtCode1" alt="看不清？点击更换" src="/Index/ValidateCode.aspx" onclick="ChangeCode();"
                                style="cursor: pointer;" height="23px" /></div>
                    </div>
                    <div class="rows">
                        <div class="clos_left">
                        </div>
                        <div class="clos_right">
                            <asp:ImageButton ID="ButGoodsSubmit" runat="server" OnClick="ButGoodsSubmit_Click"
                                ImageUrl="~/Images/SubPage/btnOk.jpg" />
                        </div>
                    </div>
                    <div class="clos_two">
                        <asp:Label ID="labMsg" ForeColor="Red" runat="server" Text=""></asp:Label>
                    </div>
                </asp:Panel>
            </div>
            <div class="salesConfig_bottom">
                <%-- 出售中的竞拍信息 --%>
                <div class="salesConfig_bottom_Title">
                    <div style="visibility: hidden">
                        占位</div>
                    <br />
                    我的拍卖</div>
                <asp:Repeater ID="dlSalesConfig" runat="server" OnItemCommand="dlSalesConfig_ItemCommand">
                    <HeaderTemplate>
                        <table width="734px" cellspacing="0" class="salesConfig_bottom_table">
                            <tr height="45px">
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        <strong>物 品</strong></div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        <strong>名 称</strong></div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        <strong>单价(金币)</strong></div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        <strong>数 量</strong></div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        <strong>方 式</strong></div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        <strong>状 态</strong></div>
                                </td>
                                <td width="70">
                                    <div class="salesConfig_bottom_Item">
                                        <strong>发布时间</strong></div>
                                </td>
                                <td width="70">
                                    <div class="salesConfig_bottom_Item">
                                        <strong>结束时间</strong></div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        <strong>操 作</strong></div>
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr height="72">
                            <td>
                                <div align="center">
                                    <img src='<%#Eval("icon")%>' width="60" height="60" /></div>
                            </td>
                            <td>
                                <div align="center">
                                    <%#Eval("typename")%></div>
                            </td>
                            <td>
                                <div align="center">
                                    <%#Eval("Price")%></div>
                            </td>
                            <td>
                                <div align="center">
                                    <%#Eval("CurrentAmount")%></div>
                            </td>
                            <td>
                                <div align="center">
                                    一口价</div>
                            </td>
                            <td>
                                <div align="center">
                                    <%#Eval("SalesStatusName")%></div>
                            </td>
                            <td width="70">
                                <div align="center">
                                    <%#Eval("CreateTime")%></div>
                            </td>
                            <td width="70">
                                <div align="center">
                                    <%#Eval("OverTime")%></div>
                            </td>
                            <td>
                                <div id="divCancel" runat="server" align="center">
                                    <asp:LinkButton ID="ButCancel" CssClass="cancelbut" CommandName="ButCancel" OnClientClick="javascript:return confirm('确认取消本次竞拍?')"
                                        ForeColor="Blue" CommandArgument='<%#Eval("SalesID")%>' runat="server">取消</asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <%-- 分页 --%>
                <br />
                <div align="center">
                    <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页"
                        NextPageText="下一页" OnPageChanged="AspNetPager1_PageChanged" PageSize="3" PrevPageText="上一页">
                    </webdiyer:AspNetPager>
                </div>
                <br />
                <%-- 过期的竞拍信息 --%>
                <div class="bottom-title">
                    <div style="visibility: hidden">
                        占位</div>
                    <br />
                    <div class="salesConfig_bottom_Title">
                        已过期<div class="salesConfig_bottom_Info">
                            （过期的商品最高保留30天！30天后系统将自动回收！）</div>
                    </div>
                </div>
                <asp:Repeater ID="dlSalesConfigOldTime" runat="server" OnItemCommand="dlSalesConfigOldTime_ItemCommand">
                    <HeaderTemplate>
                        <table width="734px" cellspacing="0" border="0" class="salesConfig_bottom_table">
                            <tr height="42">
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        物 品</div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        名 称</div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        单价(金币)</div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        数 量</div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        状 态</div>
                                </td>
                                <td height="42">
                                    <div class="salesConfig_bottom_Item">
                                        过期天数</div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        结束时间</div>
                                </td>
                                <td>
                                    <div class="salesConfig_bottom_Item">
                                        操 作</div>
                                </td>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr height="72">
                            <td>
                                <div align="center">
                                    <img src='<%#Eval("icon")%>' width="60" height="60" /></div>
                                </div>
                            </td>
                            <td>
                                <div align="center">
                                    <%#Eval("typename")%></div>
                            </td>
                            <td>
                                <div align="center">
                                    <%#Eval("Price")%><%#Eval("PricetypeName")%></div>
                            </td>
                            <td height="72">
                                <div align="center">
                                    <%#Eval("CurrentAmount")%></div>
                            </td>
                            <td>
                                <div align="center">
                                    <%#Eval("SalesStatusName")%></div>
                            </td>
                            <td>
                                <div align="center">
                                    <%#Eval("OverDay").ToString() == "0" ? "今" : Eval("OverDay").ToString()%>天
                                </div>
                            </td>
                            <td width="70">
                                <div align="center">
                                    <%#Eval("OverTime")%></div>
                            </td>
                            <td>
                                <div id="divCancel" runat="server" align="center">
                                    <asp:LinkButton ID="LinkButton1" CssClass="cancelbut" CommandName="ButCancel" OnClientClick="javascript:return confirm('过期竞拍，确认取消本次竞拍?')"
                                        ForeColor="Blue" CommandArgument='<%#Eval("SalesID")%>' runat="server">领回</asp:LinkButton>
                                </div>
                            </td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
                <%-- 分页 --%>
                <br />
                <div align="center">
                    <webdiyer:AspNetPager ID="AspNetPager2" runat="server" FirstPageText="首页" LastPageText="尾页"
                        NextPageText="下一页" OnPageChanged="AspNetPager2_PageChanged" PageSize="3" PrevPageText="上一页">
                    </webdiyer:AspNetPager>
                </div>
                <br />
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_AwardCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".subPage_Left_Nav_Item").eq(2).addClass("subPage_Left_Nav_Item_Selected");
    </script>
</asp:Content>
