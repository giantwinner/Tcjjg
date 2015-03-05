<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SalesDetail.aspx.cs" Inherits="Sales_SalesDetail" MasterPageFile="../MasterPage.master" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="../UserControl/UC_AwardCenter_Nav.ascx" TagName="UC_AwardCenter_Nav"
    TagPrefix="uc1" %>
<%@ Register Src="../UserControl/UC_UserInformation.ascx" TagName="UC_UserInformation"
    TagPrefix="uc2" %>
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
                <a class="AwardLinkToService" href="http://wpa.qq.com/msgrd?v=3&uin=243559966&site=qq&menu=yes" target="_blank">
                </a>
            </div>
        </div>
        <div class="subPage_Right">
            <div class="AwardList_Title">
                竞拍购买
            </div>
            <table class="tableGoodsInfo">
                <tr>
                    <td class="table_bind" rowspan="4">
                        <div align="left">
                            <asp:Image ID="imgIcon" runat="server" Height="75" Width="75" /></div>
                    </td>
                    <td class="table_left">
                        物品名称：
                    </td>
                    <td class="table_right">
                        <asp:Label ID="labSalesName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="table_left">
                        物品简介：
                    </td>
                    <td class="table_right">
                        <asp:Label ID="labGoodsMemo" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="table_left">
                        拍卖玩家：
                    </td>
                    <td class="table_right">
                        <asp:Label ID="labSalesNickName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="table_left">
                        当前单价：
                    </td>
                    <td class="table_right">
                        <asp:Label ID="labSalesPrice" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="table_bind">
                        &nbsp;
                    </td>
                    <td class="table_left">
                        物品总价：
                    </td>
                    <td class="table_right">
                        <asp:Label ID="labSalesTotal" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="table_bind">
                        &nbsp;
                    </td>
                    <td class="table_left">
                        支付类型：
                    </td>
                    <td class="table_right">
                        <asp:Label ID="labPricetypeName" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="table_bind">
                        &nbsp;
                    </td>
                    <td class="table_left">
                        物品数量：
                    </td>
                    <td class="table_right">
                        <asp:Label ID="labCurrentAmount" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="table_bind">
                        &nbsp;
                    </td>
                    <td class="table_left">
                        结束时间：
                    </td>
                    <td class="table_right">
                        <asp:Label ID="labOverTime" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="table_bind">
                        &nbsp;
                    </td>
                    <td class="table_left">
                        竞拍要求：
                    </td>
                    <td class="table_right">
                        <asp:Label ID="labSalesRequest" runat="server" Text="等级1级以上可以在拍卖区内购买物品。"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="table_bind">
                        &nbsp;
                    </td>
                    <td class="table_left">
                        确认密码：
                    </td>
                    <td class="table_right">
                        <asp:TextBox ID="txtUserPassword" TextMode="Password" runat="server" CssClass="help_textBox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="table_bind">
                        &nbsp;
                    </td>
                    <td class="table_left">
                        <div align="right" class="btn_SalesSubmit">
                            <asp:ImageButton ID="SalesSubmit" runat="server" OnClick="SalesSubmit_Click" ImageUrl="~/Images/SubPage/jingpaiBuy.jpg" />
                        </div>
                    </td>
                    <td class="table_right">
                        <asp:Label ID="labMsg" CssClass="DivEror" runat="server" ForeColor="Red"></asp:Label>
                    </td>
                </tr>
            </table>
        </div>
    </div>
     <script type="text/javascript">
         $("#A_AwardCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
         $(".subPage_Left_Nav_Item").eq(2).addClass("subPage_Left_Nav_Item_Selected");
    </script>
</asp:Content>