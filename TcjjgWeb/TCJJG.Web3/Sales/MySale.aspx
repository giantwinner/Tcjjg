<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="MySale.aspx.cs" Inherits="Sales_MySale" %>

<%-- 分页 --%>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="../UserControl/UC_AwardCenter_Nav.ascx" TagName="UC_AwardCenter_Nav"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/UC_UserInformation.ascx" TagName="UC_UserInformation"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <link href="../Css/SalesPurchaseRecord.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
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
                我的拍卖
            </div>
            <div class="bigBorder">
                <div class="headrows1">
                    <div class="headclos1">
                        <asp:ImageButton ID="ImgMySale" runat="server" ImageUrl="~/Images/SubPage/mySale.jpg"
                            PostBackUrl="~/Sales/MySale.aspx" /></div>
                    <div class="headclos1">
                        <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/Images/SubPage/alreadySale.jpg"
                            PostBackUrl="~/Sales/SalesSoldRecord.aspx" />
                    </div>
                    <div class="headclos1">
                        <asp:ImageButton ID="ImgGoods" runat="server" ImageUrl="~/Images/SubPage/alreadyBuy.jpg"
                            PostBackUrl="~/Sales/SalesPurchaseRecord.aspx" />
                    </div>
                    <div class="headclos1">
                        <asp:ImageButton ID="ImgSales" runat="server" ImageUrl="~/Images/SubPage/propHall.jpg"
                            PostBackUrl="~/Sales/SalingGoodsRecord.aspx" />
                    </div>
                </div>
                <%-- 出售中的竞拍信息 --%>
                <div class="top-title">
                    正在拍卖</div>
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
                                    <asp:LinkButton ID="ButCancel" CommandName="ButCancel" OnClientClick="javascript:return confirm('确认取消本次竞拍?')"
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
                    <webdiyer:AspNetPager ID="AspNetPager5" runat="server" FirstPageText="首页" LastPageText="尾页"
                        NextPageText="下一页" OnPageChanged="AspNetPager5_PageChanged" PageSize="3" PrevPageText="上一页">
                    </webdiyer:AspNetPager>
                </div>
                <br />
                <%-- 过期的竞拍信息 --%>
                <div class="bottom-title">
                    <div style="visibility: hidden">
                        占位</div>
                    <br />
                    <div class="salesConfig_bottom_Title">
                        过期拍卖<div class="salesConfig_bottom_Info">
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
                    <webdiyer:AspNetPager ID="AspNetPager4" runat="server" FirstPageText="首页" LastPageText="尾页"
                        NextPageText="下一页" OnPageChanged="AspNetPager4_PageChanged" PageSize="3" PrevPageText="上一页">
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
