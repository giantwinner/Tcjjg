<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="SalesPurchaseRecord.aspx.cs" Inherits="AwardCenter_SalesPurchaseRecord" %>

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
                <div class="top-title">
                    我的交易-已买到的道具</div>
                <div class="bottom">
                    <asp:Repeater ID="dlSalesRecord" runat="server" OnItemCommand="dlSalesRecord_ItemCommand">
                        <HeaderTemplate>
                            <table width="100%" cellspacing="0" class="tableStyle">
                                <tr>
                                    <th height="42" width="100">
                                        <div align="center">
                                            物品名称</div>
                                    </th>
                                    <th height="42" width="100">
                                        <div align="center">
                                            竞拍单价</div>
                                    </th>
                                    <th height="42" width="80">
                                        <div align="center">
                                            竞拍数量</div>
                                    </th>
                                    <th height="42" width="100">
                                        <div align="center">
                                            总价</div>
                                    </th>
                                    <th height="42" width="120">
                                        <div align="center">
                                            说明</div>
                                    </th>
                                    <th height="42" width="100">
                                        <div align="center">
                                            竞拍时间</div>
                                    </th>
                                    <th height="42" width="70">
                                        <div align="center">
                                            操作</div>
                                    </th>
                                </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td height="59" width="100">
                                    <div align="center">
                                        <%#Eval("typename")%></div>
                                </td>
                                <td height="59" width="100">
                                    <div align="center">
                                        <%#Eval("Price")%><%#Eval("PricetypeName")%></div>
                                </td>
                                <td height="59" width="80">
                                    <div align="center">
                                        <%#Eval("CurrentAmount")%></div>
                                </td>
                                <td height="59" width="100">
                                    <div align="center">
                                        <%#Convert.ToInt32(Eval("Price"))*Convert.ToInt32(Eval("CurrentAmount"))%><%#Eval("PricetypeName")%></div>
                                </td>
                                <td height="59" width="120">
                                    <div align="center">
                                        <%#Eval("Memo")%></div>
                                </td>
                                <td height="59" width="100">
                                    <div align="center">
                                        <%#Eval("CreateTime")%></div>
                                </td>
                                <td height="59" width="70">
                                    <div align="center">
                                        <asp:LinkButton ID="LinkButton2" OnClientClick="javascript:return confirm('您确认删除吗?')"
                                            CommandName="salesDle" CommandArgument='<%#Eval("PurchaseID")%>' runat="server">删除</asp:LinkButton>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
                <%-- 分页 --%>
                <div align="center">
                    <webdiyer:AspNetPager ID="AspNetPager2" runat="server" FirstPageText="首页" LastPageText="尾页"
                        NextPageText="下一页" OnPageChanged="AspNetPager2_PageChanged" PageSize="5" PrevPageText="上一页">
                    </webdiyer:AspNetPager>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_AwardCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".subPage_Left_Nav_Item").eq(2).addClass("subPage_Left_Nav_Item_Selected");
    </script>
</asp:Content>
