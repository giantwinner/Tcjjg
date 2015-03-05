<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="BindMovePhone.aspx.cs" Inherits="UserCenter_BindMovePhone" %>

<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/UC_LeftNav.ascx" TagName="UC_LeftNav" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0px auto; width: 1000px; height: 740px; margin-bottom: 38px;">
        <uc1:UC_UserInfo ID="UC_UserInfo" runat="server" />
        <uc2:UC_LeftNav ID="UC_LeftNav" runat="server" />
        <div class="uc-content-wrap">
            <div class="uc-content-title" style="width: 140px;">
                <img src="../Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;<asp:Label
                    ID="lblTitle" runat="server" Text="手机绑定"></asp:Label>
            </div>
            <div class="uc-content-realnameauthentication" style="position: relative;">
                <asp:Panel ID="PnelBinding" runat="server">
                    <span class="uc-input-lefttext">手机号</span>：<asp:TextBox ID="txtMobile" runat="server"
                        MaxLength="11"></asp:TextBox>
                    <br />
                    <br />
                    验证码：<asp:TextBox ID="txtCode" runat="server" Width="120" MaxLength="4"></asp:TextBox>
                    <br />
                    <br />
<%--                    <asp:LinkButton ID="BtnBinding" runat="server" CssClass="savebtn" Style="margin-left: 50px;"
                        OnClick="BtnBinding_Click">确定</asp:LinkButton>--%>
                                            <asp:ImageButton ID="BtnBinding" runat="server" Style="margin-left: 50px;" OnClick="BtnBinding_Click"  ImageUrl="~/Images/BtnImg/enter1.png" />

                    <div class="getcheckNum" onclick="SendMsg()">
                        获取验证码
                    </div>
                    <br />
                    <asp:Label ID="lblBindMobileMsg" runat="server" Text="" Style="margin-left: 50px; color:Red"></asp:Label>
                </asp:Panel>
                <asp:Panel ID="PnelBinded" runat="server">
                    绑定成功！你绑定的手机号为：<asp:Label ID="lblBindedNum" runat="server" Text=""></asp:Label>&nbsp;
                    点击这里<asp:LinkButton ID="linkBtn" CssClass="changeBindm" runat="server" OnClick="linkBtn_Click">更换绑定手机</asp:LinkButton>
                </asp:Panel>
                <asp:Panel ID="Pnelchang1" runat="server">
                    更换绑定手机需要给旧手机发送一条验证码，输入正确的验证码后进入新的手机绑定页面<br />
                    <br />
                    你绑定的手机号为：<asp:Label ID="lblBindedNum2" runat="server" Text=""></asp:Label><br />
                    <br />
                    验证码：<asp:TextBox ID="txtCode2" runat="server" Width="120" MaxLength="4"></asp:TextBox>
                    <div class="getcheckNum" style="top: 48px;" onclick="SendMsg2()">
                        获取验证码
                    </div>
                    <br />
                    <br />
  <%--                  <asp:LinkButton ID="LinkNextStep" runat="server" CssClass="savebtn" Style="margin-left: 50px;"
                        OnClick="LinkNextStep_Click">下一步</asp:LinkButton>--%>
        <asp:ImageButton ID="LinkNextStep" runat="server" Style="margin-left: 50px;" OnClick="LinkNextStep_Click"  ImageUrl="~/Images/BtnImg/next1.png" />

                    <br />
                    <asp:Label ID="lblBindMobileMsg2" runat="server" Text="" Style="margin-left: 50px; color:Red"></asp:Label>
                </asp:Panel>
                <br />
                <br />
                <div style="color: Red; line-height: 20px; font-weight: normal;">
                    <asp:Label ID="lblprompt" runat="server" Text="提示：*输入11位手机号码，支持移动联通电信，输入账号完毕后可以获得一个手机验证码，但请注意，每个账号每天只能获得3次验证机会，手机绑定是账号保护的最有效途径，请谨慎操作。"></asp:Label>
                </div>
                <br />
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>
        <asp:Label ID="HideNum" runat="server" Text="" Style="display: none;"></asp:Label>
    </div>
    <script type="text/javascript">
        $(".nav-item").eq(2).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        $(".uc-nav-item").eq(3).find("img").attr("src", $(".uc-nav-item").eq(3).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(3).addClass("hover").addClass("selected");
    </script>
    <script src="/Scripts/BindMobile.js" type="text/javascript"></script>
</asp:Content>
