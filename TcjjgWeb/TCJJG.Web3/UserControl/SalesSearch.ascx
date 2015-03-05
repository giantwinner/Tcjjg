<%@ Control Language="C#" AutoEventWireup="true" CodeFile="SalesSearch.ascx.cs" Inherits="UserControl_SalesSearch" %>
<div class="salesSearch">
    竞拍搜索
    <div class="salesSearch_Item">
        <asp:DropDownList ID="dplType" runat="server" OnSelectedIndexChanged="dplType_SelectedIndexChanged"
            AutoPostBack="True" Height="20px" Width="100px" ForeColor="#7c7d7e">
            <asp:ListItem Selected="True" Value="0">搜索类型</asp:ListItem>
            <asp:ListItem Value="1">一口价物品</asp:ListItem>
            <asp:ListItem Value="2">拍卖人昵称</asp:ListItem>
        </asp:DropDownList>
    </div>
    <div class="salesSearch_Item">
        <asp:Panel ID="divTxtSearchNickName" CssClass="salesSearch_Panel" runat="server"
            Width="150px">
            <asp:TextBox ID="txtSearchNickName" runat="server" Width="100px"></asp:TextBox>
        </asp:Panel>
    </div>
    <div class="salesSearch_Item">
        <asp:Panel ID="divddlSearchAccount" CssClass="salesSearch_Panel" runat="server" Width="108px" >
            <asp:DropDownList ID="ddlSearchAccount" runat="server" Width="100px" ForeColor="#7c7d7e">
            </asp:DropDownList>
        </asp:Panel>
    </div>
    <div class="salesSearch_Btn" >
        <asp:ImageButton ID="butSearch" runat="server" OnClick="butSearch_Click" ImageUrl="~/Images/SubPage/SalesSearch.jpg" />
    </div>
</div>
