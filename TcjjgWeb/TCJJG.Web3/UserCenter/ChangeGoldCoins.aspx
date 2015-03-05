<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ChangeGoldCoins.aspx.cs" Inherits="UserCenter_ChangeGoldCoins" %>

<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
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
                    货币兑换</div>
                <div class="D_UserInfoContainer">
                    <asp:Panel ID="pnelYG" runat="server" Visible="false">
                    <div style="">
                        <br />
                        <div style="color: #fa8400">
                            元宝兑换金币（<asp:Label ID="lblYBCount0" runat="server" Text=""></asp:Label>元宝=<asp:Label ID="lblGoldCount0" runat="server" Text=""></asp:Label>金币）<br />
                        </div>
                        现有元宝数：<asp:Label ID="lblYuanBao" runat="server" Text="0"></asp:Label>
                        <br />
                        现有金币数：<asp:Label ID="lblGoldCoins" runat="server" Text="0"></asp:Label>
                        <br />
                        兑换元宝数：<asp:TextBox ID="txtYuanBaoCount" runat="server" CssClass="help_textBox" Height="17"
                            Width="100" MaxLength="9"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtYuanBaoCount"
                            ErrorMessage="请填写兑换数量" Display="Dynamic" SetFocusOnError="True" ValidationGroup="YuanGold"></asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtYuanBaoCount"
                            Display="Dynamic" ErrorMessage="请填写正确的兑换数量" Operator="DataTypeCheck" SetFocusOnError="True"
                            Type="Integer" ValidationGroup="YuanGold"></asp:CompareValidator>
                        <br />
                        <div style="height: 10px;">
                        </div>
                        <span style="visibility: hidden">兑换元宝数：</span>
                        <asp:ImageButton ID="ImgBtnChange" ImageUrl="~/Images/SubPage/dh_03_03.jpg" runat="server"
                            OnClick="ImgBtnChange_Click" ValidationGroup="YuanGold" />
                    </div>
                    </asp:Panel>
                    <asp:Panel ID="pnelYuanCity" runat="server" Visible="false">
                        <div style="">
                            <br />
                            <div style="color: #fa8400">
                                元宝兑换<asp:Label ID="lblCityCoinType5" runat="server" Text=""></asp:Label>
                                (<asp:Label ID="lblYBCount1" runat="server" Text="" />元宝兑换<asp:Label ID="lblCityCoinCount1" runat="server" Text="" /><asp:Label ID="lblCityCoinType6" runat="server" Text="" />)<br />
                            </div>
                            现有<asp:Label ID="lblCityCoinType7" runat="server" Text=""></asp:Label>数：<asp:Label
                                ID="lblOwnCityCoin2" runat="server" Text="0"></asp:Label>
                            <br />
                            现有元宝数：<asp:Label ID="lblYuanBao1" runat="server" Text="0"></asp:Label>
                            <br />
                            兑换元宝数：<asp:TextBox ID="txtYuanbao2" runat="server" CssClass="help_textBox" Height="17"
                                Width="100" MaxLength="9"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtYuanbao2"
                                ErrorMessage="请填写兑换数量" Display="Dynamic" SetFocusOnError="True" ValidationGroup="YuanCity"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator3" runat="server" ControlToValidate="txtYuanbao2"
                                Display="Dynamic" ErrorMessage="请填写正确的兑换数量" Operator="DataTypeCheck" SetFocusOnError="True"
                                Type="Integer" ValidationGroup="YuanCity"></asp:CompareValidator>
                            <br />
                            <div style="height: 10px;">
                            </div>
                            <span style="visibility: hidden">兑换元宝数：</span>
                            <asp:ImageButton ID="imgBtnYuanBaToCity" ImageUrl="~/Images/SubPage/dh_03_03.jpg"
                                runat="server" OnClick="imgBtnYuanBaToCity_Click" ValidationGroup="YuanCity" />
                        </div>
                    </asp:Panel>
                    <asp:Panel ID="pnelCityGold" runat="server" Visible="false">
                        <div style="">
                            <br />
                            <div style="color: #fa8400">
                                <asp:Label ID="lblCityCoinType1" runat="server" Text=""></asp:Label>兑换金币 (<asp:Label
                                    ID="lblCityCoinCount2" runat="server" Text="" /><asp:Label
                                    ID="lblCityCoinType4" runat="server" Text="" />兑换<asp:Label
                                    ID="lblGoldCoinCount" runat="server" Text="" />金币)<br />
                            </div>
                            现有<asp:Label ID="lblCityCoinType2" runat="server" Text=""></asp:Label>数：<asp:Label
                                ID="lblOwnCityCoin1" runat="server" Text="0"></asp:Label>
                            <br />
                            现有金币数：<asp:Label ID="lblGoldCoins2" runat="server" Text="0"></asp:Label>
                            <br />
                            兑换<asp:Label ID="lblCityCoinType3" runat="server" Text=""></asp:Label>数：<asp:TextBox
                                ID="txtCityCoin" runat="server" CssClass="help_textBox" Height="17" Width="100"
                                MaxLength="9"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtCityCoin"
                                ErrorMessage="请填写兑换数量" Display="Dynamic" SetFocusOnError="True" ValidationGroup="CityGold"></asp:RequiredFieldValidator>
                            <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="txtCityCoin"
                                Display="Dynamic" ErrorMessage="请填写正确的兑换数量" Operator="DataTypeCheck" SetFocusOnError="True"
                                Type="Integer" ValidationGroup="CityGold"></asp:CompareValidator>
                            <br />
                            <div style="height: 10px;">
                            </div>
                            <span style="visibility: hidden">兑换元宝数：</span>
                            <asp:ImageButton ID="imgBtnCityToGold" ImageUrl="~/Images/SubPage/dh_03_03.jpg" runat="server"
                                OnClick="imgBtnCityToGold_Click" ValidationGroup="CityGold" />
                        </div>
                    </asp:Panel>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".userCenter_Left_Nav_Item").eq(7).addClass("userCenter_Left_Nav_Item_Selected");
    </script>
    </div>
</asp:Content>
