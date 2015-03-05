<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="BindMail.aspx.cs" Inherits="UserCenter_BindMail" %>

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
            <div class="uc-content-title">
                <img src="../Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;邮箱绑定
            </div>
            <div class="uc-content-realnameauthentication">
                <asp:Panel ID="pnel" runat="server">
                    <span class="uc-input-lefttext">邮<span class="letterspace">空空</span>箱：</span>
                    <asp:TextBox ID="txtEmail" runat="server"></asp:TextBox>(绑定成功前请勿退出登录)<br />
                    <br />
<%--                    <asp:LinkButton ID="BtnBinding" runat="server" CssClass="savebtn" OnClick="BtnBinding_Click"
                        Style="margin-left: 74px;">绑定</asp:LinkButton>--%>
                    <asp:ImageButton ID="BtnBinding" runat="server" OnClick="BtnBinding_Click"  ImageUrl="~/Images/BtnImg/bing1.png" />

                </asp:Panel>
                <asp:Panel ID="pnel2" runat="server">
                    <asp:Label ID="lblBindMailMsg" runat="server" Text=""></asp:Label>
                    <br />
                </asp:Panel>
                <br />
                <br />
                <div style="color: Red">提示：绑定邮箱无法修改，只能作密码找回及官方邮件接收使用。</div>
                <br />
                <asp:Label Style="margin-left: 74px;" ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Style="margin-left: 74px;"
                    ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="请输入正确的邮箱格式" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Style="margin-left: 74px;"
                    ControlToValidate="txtEmail" Display="Dynamic" ErrorMessage="请输入邮箱"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>
    </div>
    <script type="text/javascript">
        $(".nav-item").eq(2).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        $(".uc-nav-item").eq(2).find("img").attr("src", $(".uc-nav-item").eq(2).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(2).addClass("hover").addClass("selected");
    </script>
</asp:Content>
