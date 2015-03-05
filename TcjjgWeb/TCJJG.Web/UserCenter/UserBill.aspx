<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserBill.aspx.cs" Inherits="UserCenter_UserBill" %>

<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/UC_LeftNav.ascx" TagName="UC_LeftNav" TagPrefix="uc2" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0px auto; width: 1000px; height: 740px; margin-bottom: 38px;">
        <uc1:UC_UserInfo ID="UC_UserInfo" runat="server" />
        <uc2:UC_LeftNav ID="UC_LeftNav" runat="server" />
        <div class="uc-content-wrap">
            <div class="uc-content-title">
                <img src="../Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;账单查询
            </div>
            <div style="margin-top: 10px">
                <div class="reckoing-wrap">
                    开始日期&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                    &nbsp; 结束日期&nbsp;<asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                    &nbsp;
                    <%--                    <asp:LinkButton ID="btnOK" runat="server" CssClass="savebtn" OnClick="btnOK_Click"
                        Style="display: inline-block">查询</asp:LinkButton>--%>
                    <asp:ImageButton ID="btnOK" Style="display: inline-block; position: relative; bottom: -11px;"
                        runat="server" OnClick="btnOK_Click" ImageUrl="~/Images/BtnImg/select1.png" />
                </div>
                <br />
                <div>
                    <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="False" CssClass="gridview">
                        <Columns>
                            <asp:BoundField DataField="ITE" HeaderText="费用名称" />
                            <asp:BoundField DataField="SUB" HeaderText="费用类型" />
                            <asp:BoundField DataField="AW" HeaderText="类型" HeaderStyle-Width="132">
                                <HeaderStyle Width="132px"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="AM" HeaderText="数额" HeaderStyle-Width="132">
                                <HeaderStyle Width="132px"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="RE" HeaderText="余额" HeaderStyle-Width="132">
                                <HeaderStyle Width="132px"></HeaderStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="CR" HeaderText="日期" />
                            <asp:TemplateField ItemStyle-CssClass="gridview_Reckoing_TD" HeaderText="详细">
                                <ItemTemplate>
                                    <%#"<a class=\"Reckoning_Link\" href='UserBillDetail.aspx?RID=" + Eval("Rid").ToString() + "'>详细</a>"%>
                                </ItemTemplate>
                                <ItemStyle CssClass="gridview_Reckoing_TD"></ItemStyle>
                            </asp:TemplateField>
                        </Columns>
                        <RowStyle HorizontalAlign="Center" />
                    </asp:GridView>
                    <br />
                    <div style="font-size: 14px; font-family: 微软雅黑">
                        <center>
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页"
                                NextPageText="下一页" OnPageChanged="AspNetPager1_PageChanged" PageSize="8" PrevPageText="上一页">
                            </webdiyer:AspNetPager>
                        </center>
                    </div>
                </div>
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>
    </div>
    <script type="text/javascript">
        $(".nav-item").eq(2).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        $(".uc-nav-item").eq(4).find("img").attr("src", $(".uc-nav-item").eq(4).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(4).addClass("hover").addClass("selected");
    </script>
</asp:Content>
