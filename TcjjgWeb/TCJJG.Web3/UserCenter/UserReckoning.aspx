<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="UserReckoning.aspx.cs"
    Inherits="UserCenter_UserReckoning" MasterPageFile="../MasterPage.master" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../Css/UserCenter.css" rel="stylesheet" type="text/css" />
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
                    账单查询
                </div>

                <div style="margin-top: 10px">
                    <div >
                        开始日期&nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                        </asp:DropDownList>
                        &nbsp; 结束日期&nbsp;<asp:DropDownList ID="DropDownList2" runat="server">
                        </asp:DropDownList>
                        &nbsp;
                        <asp:ImageButton ID="btnOK" runat="server" CssClass="btnPosition" ImageUrl="~/Images/SubPage/tcjjg_2012__select.jpg"
                            OnClick="btnOK_Click" />
                    </div>
                    <br />
                    <div>
                        <table class="table_Reckoing" style="width:782px;">
                            <tr >
                                <th rowspan="2" class="table_Reckoing_Th1">
                                    费用名称
                                </th>
                                <th rowspan="2" class="table_Reckoing_Th1">
                                    费用类型
                                </th>
                                <th colspan="3" class="table_Reckoing_Th2">
                                    收入
                                </th>
                                <th colspan="3" class="table_Reckoing_Th2">
                                    支出
                                </th>
                                <th rowspan="2" class="table_Reckoing_Th1">
                                    日期
                                </th>
                                <th rowspan="2" class="table_Reckoing_Th1" style="color: #060606">
                                    详细
                                </th>
                            </tr>
                            <tr>
                                <th class="table_Reckoing_Th1">
                                    类型
                                </th>
                                <th class="table_Reckoing_Th1">
                                    金额
                                </th>
                                <th class="table_Reckoing_Th1">
                                    余额
                                </th>
                                <th class="table_Reckoing_Th1">
                                    类型
                                </th>
                                <th class="table_Reckoing_Th1">
                                    金额
                                </th>
                                <th class="table_Reckoing_Th1">
                                    余额
                                </th>
                            </tr>
                        </table>
                        <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="False" CellPadding="4"
                            GridLines="None" ShowHeader="False" CssClass="gridview_Reckoing" EnableModelValidation="True" Width="782">
                            <RowStyle HorizontalAlign="Center" Height="30" />
                            <Columns>
                                <asp:TemplateField ItemStyle-CssClass="gridview_Reckoing_TD">
                                    <ItemTemplate>
                                        <%#Eval("ITE")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-CssClass="gridview_Reckoing_TD">
                                    <ItemTemplate>
                                        <%# Eval("SUB")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-CssClass="gridview_Reckoing_TD">
                                    <ItemTemplate>
                                        <%# Eval("DI").ToString() == "1" ? Eval("AW"): string.Empty%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-CssClass="gridview_Reckoing_TD">
                                    <ItemTemplate>
                                        <%# Eval("DI").ToString() == "1" ? Eval("AM").ToString() : string.Empty%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-CssClass="gridview_Reckoing_TD">
                                    <ItemTemplate>
                                        <%# Eval("DI").ToString() == "1" ? Eval("RE").ToString() : string.Empty%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-CssClass="gridview_Reckoing_TD">
                                    <ItemTemplate>
                                        <%# Eval("DI").ToString() == "0" ? Eval("AW") : string.Empty%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-CssClass="gridview_Reckoing_TD">
                                    <ItemTemplate>
                                        <%# Eval("DI").ToString() == "0" ? Eval("AM").ToString() : string.Empty%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-CssClass="gridview_Reckoing_TD">
                                    <ItemTemplate>
                                        <%# Eval("DI").ToString() == "0" ? Eval("RE").ToString() : string.Empty%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-CssClass="gridview_Reckoing_TD">
                                    <ItemTemplate>
                                        <%# Eval("CR")%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField ItemStyle-CssClass="gridview_Reckoing_TD">
                                    <ItemTemplate>
                                        <%#"<a class=\"Reckoning_Link\" href='UserReckoningAmply.aspx?RID=" + Eval("Rid").ToString() + "'>详细</a>"%>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </asp:GridView>
  
                        <div >
                            <center>
                                <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页"
                                    NextPageText="下一页" OnPageChanged="AspNetPager1_PageChanged" PageSize="8" PrevPageText="上一页">
                                </webdiyer:AspNetPager>
                            </center>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
        <script type="text/javascript">
            $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
            $(".userCenter_Left_Nav_Item").eq(10).addClass("userCenter_Left_Nav_Item_Selected");
    </script>
</asp:Content>
