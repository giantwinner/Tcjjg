<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SalesInfo.aspx.cs" Inherits="Sales_SalesInfo"
    MasterPageFile="~/MasterPage.master" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="../UserControl/UC_AwardCenter_Nav.ascx" TagName="UC_AwardCenter_Nav"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/UC_UserInformation.ascx" TagName="UC_UserInformation"
    TagPrefix="uc2" %>
<%@ Register Src="../UserControl/SalesSearch.ascx" TagName="SalesSearch" TagPrefix="uc3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
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
            <div class="AwardList_Title" style="padding-left: 52px;">
                玩家拍卖区
            </div>
            <div class="salesListTitle">
                <div class="btnSales1" id="linkToSalesConfig" onclick="document.location='SalesConfig.aspx'">
                </div>
                <div class="btnSales2" onclick="document.location='MySale.aspx'">
                </div>
                <div class="sales_Search">
                    <uc3:SalesSearch ID="SalesSearch2" runat="server" />
                </div>
            </div>
            <div style="_margin-top: -15px">
                <asp:ImageButton ID="iborderByPrice" ImageUrl="~/Images/SubPage/Arrow_3.jpg"
                     runat="server" CssClass="OrderByPrice" OnClick="iborderByPrice_Click" />
                <asp:ImageButton ID="iborderByCurrentAmount" ImageUrl="~/Images/SubPage/Arrow_3.jpg" 
                    runat="server" CssClass="OrderByAmount" OnClick="iborderByCurrentAmount_Click" />
                <asp:Repeater ID="repeaterSalesList" runat="server">
                    <HeaderTemplate>
                        <div class="salesListHead">
                            <span class="salesListHeadItem" style="margin-left: 5px">物品</span> <span class="salesListHeadItem">
                                名称</span> <span class="salesListHeadItem">单价(金币)</span> <span class="salesListHeadItem">
                                    数量</span> <span class="salesListHeadItem">总价</span> <span class="salesListHeadItem">
                                        卖家</span> <span class="salesListHeadItem">结束时间</span> <span class="salesListHeadItemLast">
                                            操作</span>
                        </div>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="salesListItem">
                            <span class="salesListItemImg"><a href="SalesDetail.aspx?SID=<%#Eval("salesID")%>">
                                <img alt="" src='<%#Eval("icon")%>' height="60" width="60" />
                            </a></span><span class="salesListItemText" style="margin-left: 25px; *margin-left: 30px">
                                <a href="SalesDetail.aspx?SID=<%#Eval("salesID")%>">
                                    <%#Eval("typename")%>
                                </a></span><span class="salesListItemText">
                                    <%#Eval("Price")%></span> <span style=" margin-left:13px; _margin-left:0px;*margin-left:0px;" class="salesListItemText">
                                        <%#Eval("CurrentAmount")%></span> <span class="salesListItemText">
                                            <%#Convert.ToInt32(Eval("Price")) * Convert.ToInt32(Eval("CurrentAmount"))%></span>
                            <span class="salesListItemText" style=" margin-left:5px; _margin-left:0px;*margin-left:0px;">
                                <%#Eval("NickName")%></span> <span class="salesListItemText">
                                    <%#Eval("OverTime")%></span> <span class="salesListItemBtn"><a class="Reckoning_Link"
                                        href="SalesDetail.aspx?SID=<%#Eval("salesID")%>">
                                        <img alt="" src="../Images/SubPage/AwardBtnBuy.jpg" />
                                    </a></span>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
            </div>
            <div align="center">
                <br />
                <webdiyer:AspNetPager ID="aspNetPager" runat="server" FirstPageText="首页" LastPageText="尾页"
                    NextPageText="下一页" OnPageChanged="AspNetPager_PageChanged" PageSize="6" PrevPageText="上一页">
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </webdiyer:AspNetPager>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_AwardCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".subPage_Left_Nav_Item").eq(2).addClass("subPage_Left_Nav_Item_Selected");
    </script>
</asp:Content>
