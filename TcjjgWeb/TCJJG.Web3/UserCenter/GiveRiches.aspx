<%@ Page Language="C#" AutoEventWireup="true" CodeFile="GiveRiches.aspx.cs" Inherits="UserCenter_GiveRiches"
    MasterPageFile="../MasterPage.master" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/common.js" type="text/javascript"></script>
    <script src="../Js/NewCalendar.js" type="text/javascript"></script>
    <script language="javascript" type="text/javascript">
        function sessGR(un, rt, am) {
            G("gd_c_uc_m_1").className = "displayNone";
            G("gd_c_uc_m_2_1").innerHTML = "您成功的赠送给 " + un + " " + rt + "个 " + am;
            G("gd_c_uc_m_2").className = "c_uc_m_2";
        }
        function send10() {
            var cn = G('ctl00_ContentPlaceHolder1_txtZSuserName').value;
            if (cn == null || cn == "") {
                G('ctl00_ContentPlaceHolder1_lblMsg').innerHTML = "请正确输入受赠帐号";
                return false;
            }

            var ct = G('ctl00_ContentPlaceHolder1_txtCount').value;
            var cti = parseInt(ct);
            if (cti > 2147483647) {
                G('ctl00_ContentPlaceHolder1_lblMsg').innerHTML = "请正确输入赠送数量";
                return false;
            }
            if (cti == 0) {
                G('ctl00_ContentPlaceHolder1_lblMsg').innerHTML = "请正确输入赠送数量";
                return false;
            }
            G('ctl00_ContentPlaceHolder1_lblMsg').innerHTML = "";
            return true;
        }

    </script>
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
                    财富赠送
                </div>
                <br />
                <div class="UserCenter_GiveRichs">
                    <div>
                        <div style="line-height: 30px">
                            <div>
                                赠送类型：
                                <asp:DropDownList ID="dplZStype" runat="server" class="text1" AutoPostBack="True"
                                    OnSelectedIndexChanged="dplZStype_SelectedIndexChanged" Width="120">
                                </asp:DropDownList>
                                (*)请选择对应的赠送类型
                            </div>
                            <div>
                                受赠昵称：
                                <asp:TextBox CssClass="help_textBox" ID="txtZSuserName" runat="server" Width="117px"
                                    AutoCompleteType="Disabled"></asp:TextBox>&nbsp;(*)<asp:Label ID="txtZSuserNameTS"
                                        runat="server" Text="请填写受赠昵称"></asp:Label>
                            &nbsp;受赠成功后，系统在受赠的金币中扣除5%作为税收</div>
                            <div>
                                赠送数量：
                                <asp:TextBox CssClass="help_textBox" ID="txtCount" runat="server" Width="117px" AutoCompleteType="Disabled"></asp:TextBox>
                                <asp:Label ID="lblBonus" runat="server" Text="0"></asp:Label>
                            </div>
                            <div class="d_line_Hg d_line_btn" style="padding-top: 5px;">
                                <asp:ImageButton ID="Button3" runat="server" OnClick="Button3_Click" ImageUrl="~/Images/SubPage/tcjjg_2012__suresend.jpg" />
                                <asp:Label class="UserCenter_GiveRichs_Msg" ID="lblMsg" runat="server" ForeColor="Red"
                                    Font-Bold="True"></asp:Label>
                            </div>
                        </div>
                        <div>
                            <div style="margin-top: 10px">
                                友情提示：
                            </div>
                            <div style="border-bottom-style: dotted; border-bottom-width: 1px; border-bottom-color: #999999;
                                padding-bottom: 10px;">
                                1、只有VIP用户可以赠送（金币除外）；<br />
                                2、受赠账户不限制条件。
                            </div>
                        </div>
                    </div>
                    <div style="margin-top: 10px">
                        赠送时间：&nbsp;开始日期：
                        <asp:TextBox CssClass="help_textBox" ID="txtDate1" runat="server" onclick="SelectDate(this)"
                            Width="80"></asp:TextBox>&nbsp;
                            结束日期：
                        <asp:TextBox CssClass="help_textBox" ID="txtDate2" runat="server" onclick="SelectDate(this)"
                            Width="80"></asp:TextBox>&nbsp;
                        <asp:ImageButton ID="Button2" CssClass="btnPosition2" runat="server" OnClick="Button2_Click"
                            ImageUrl="~/Images/SubPage/tcjjg_2012__select.jpg" />&nbsp;
                        <asp:Label ID="lblMsg2" runat="server"
                            Font-Bold="True" ForeColor="Red"></asp:Label>
                    </div>
                    <br />
                    <div class="gridview_Reckoing_Head">
                        <div class="gridview_Reckoing_Head1">
                            受&nbsp;&nbsp;赠</div>
                        <div class="gridview_Reckoing_Head2">
                            赠&nbsp;&nbsp;送</div>
                        <div class="gridview_Reckoing_Head3">
                            日&nbsp;&nbsp;期</div>
                    </div>
                    <asp:GridView ID="gvData" runat="server" AutoGenerateColumns="False" CellPadding="4"
                        GridLines="None" Width="100%" CssClass="gridview_Reckoing" ShowHeader="True"
                        EmptyDataText="没有找到相关数据">
                        <RowStyle HorizontalAlign="Center" Height="30" />
                        <Columns>
                            <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th3" HeaderText="类型">
                                <ItemTemplate>
                                    <%# Eval("SU").ToString() == "4" ? Eval("AW") : string.Empty%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th3" HeaderText="数量">
                                <ItemTemplate>
                                    <%# Eval("SU").ToString() == "4" ? Eval("AM").ToString() : string.Empty%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th4" HeaderText="赠送人">
                                <ItemTemplate>
                                    <%# Eval("SU").ToString() == "4" ? Eval("Memo").ToString() : string.Empty%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th3" HeaderText="类型">
                                <ItemTemplate>
                                    <%# Eval("SU").ToString() == "0" ? Eval("AW") : string.Empty%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th3" HeaderText="数量">
                                <ItemTemplate>
                                    <%# Eval("SU").ToString() == "0" ? Eval("AM").ToString() : string.Empty%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField ItemStyle-CssClass="table_Reckoing_Th4" HeaderText="受赠人">
                                <ItemTemplate>
                                    <%# Eval("SU").ToString() == "0" ? Eval("Memo").ToString() : string.Empty%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <ItemTemplate>
                                    <%# Eval("CR")%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                    <div style="margin-top: 5px">
                        <center>
                            <webdiyer:AspNetPager ID="AspNetPager1" runat="server" FirstPageText="首页" LastPageText="尾页"
                                NextPageText="下一页" OnPageChanged="AspNetPager1_PageChanged" PageSize="6" PrevPageText="上一页">
                            </webdiyer:AspNetPager>
                        </center>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".userCenter_Left_Nav_Item").eq(9).addClass("userCenter_Left_Nav_Item_Selected");
    </script>
</asp:Content>
