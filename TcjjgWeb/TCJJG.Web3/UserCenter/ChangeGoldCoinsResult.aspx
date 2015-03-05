<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="ChangeGoldCoinsResult.aspx.cs" Inherits="UserCenter_ChangeGoldCoinsResult" %>

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
                    元宝兑换金币
                </div>
                <div class="D_UserInfoContainer">
                    <div style="width: 300px; margin: 0 auto; margin-top: 40px;">
                        <asp:Panel Visible="false" ID="pnel_ok" runat="server">
                            <div style="float: left; padding-top: 15px;">
                                <img src="../Images/SubPage/dh_ok.png" />
                            </div>
                            <div style="float: left; margin-left: 10px; line-height: 30px;">
                                <strong>操作成功</strong><br />
                                货币兑换成功
                            </div>
                        </asp:Panel>
                        <asp:Panel ID="pnel_msg" runat="server">
                            <div style="float: left; padding-top: 5px;">
                                <img src="../Images/SubPage/dh_face.png" />
                            </div>
                            <div style="float: left; margin-left: 10px; line-height: 30px;">
                                <asp:Label ID="lblMsg" runat="server" Text=""></asp:Label><br />
                                <asp:ImageButton ID="imgBtnRedirect" runat="server" ImageUrl="~/Images/SubPage/dh_repeat.jpg"
                                    OnClick="imgBtnRedirect_Click" />
                            </div>
                        </asp:Panel>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".userCenter_Left_Nav_Item").eq(7).addClass("userCenter_Left_Nav_Item_Selected");
    </script>
</asp:Content>
