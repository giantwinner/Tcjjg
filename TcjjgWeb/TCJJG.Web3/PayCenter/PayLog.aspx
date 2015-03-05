<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PayLog.aspx.cs" Inherits="PayCenter_PayLog"
    MasterPageFile="../MasterPage.master" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="../UserControl/UC_PayCenter_Nav.ascx" TagName="UC_PayCenter_Nav"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        if (window != top)
            top.location.href = location.href; 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="subPage_Layout">
        <div class="subPage_Left">
            <uc1:UC_PayCenter_Nav ID="UC_PayCenter_Nav1" runat="server" />
            <div class="subPage_Left_Service">
                <a class="AwardLinkToService" href="http://wpa.qq.com/msgrd?v=3&uin=243559966&site=qq&menu=yes" target="_blank">
                </a>
            </div>
        </div>
        <div class="subPage_Right">
            <div class="AwardList_Title" style="width: 700px">
                账单查询
            </div>
            <br />
            <div style="height: 600px; font-size: 13px;">
                <div class="btnPositionDiv">
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
                    <table class="table_Reckoing">
                        <tr>
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
                        GridLines="None" ShowHeader="False" CssClass="gridview_Reckoing" EnableModelValidation="True">
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
                                    <%#"<a class=\"Reckoning_Link\" href='PayLogInfo.aspx?RID=" + Eval("Rid").ToString() + "'>详细</a>"%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <br />
                    <div class="peck_ts_ma_page">
                        <center>
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页"
                                NextPageText="下一页" OnPageChanged="AspNetPager1_PageChanged" PageSize="10" PrevPageText="上一页">
                            </webdiyer:AspNetPager>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_PayCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });

        $(".subPage_Left_Nav_Item").eq(1).addClass("subPage_Left_Nav_Item_Selected");
    </script>
</asp:Content>
