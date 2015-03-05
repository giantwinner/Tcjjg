<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="RealNameAuthentication.aspx.cs" Inherits="UserCenter_RealNameAuthentication" %>

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
                <img src="../Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;实名认证
            </div>
            <div class="uc-content-realnameauthentication">
                <span class="uc-input-lefttext">姓<span class="letterspace">空空</span>名：</span>
                <asp:TextBox ID="txtRealName" runat="server" MaxLength="8"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtRealName"
                    ErrorMessage="请输入姓名"></asp:RequiredFieldValidator>
                <div style="height: 21px">
                </div>
                <span class="uc-input-lefttext">身份证号：</span>
                <asp:TextBox ID="txtIDCard" runat="server" MaxLength="18"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtIDCard"
                    ErrorMessage="请输入身份证号"></asp:RequiredFieldValidator>
                <div style="height: 21px">
                </div>
                <span class="uc-input-lefttext">确认密码：</span>
                <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassWord"
                    ErrorMessage="请输入确认密码"></asp:RequiredFieldValidator>
                <div style="height: 21px">
                </div>
                <asp:Label ID="lblcostmsg" runat="server" Text="提示：修改实名认证需要扣费300元宝" Style="color: Red;
                    margin-left: 74px; font-weight: normal"></asp:Label>
                <div style="height: 10px">
                </div>
                <div>
<%--                    <asp:LinkButton ID="SaveBtn" runat="server" CssClass="savebtn" OnClick="SaveBtn_Click"
                        Style="margin-left: 74px;">保存</asp:LinkButton>--%>
                   <asp:ImageButton ID="SaveBtn" Style=" display:block; margin-left: 74px;" runat="server"  OnClick="SaveBtn_Click"  ImageUrl="~/Images/BtnImg/save1.png" />

                    <asp:Label ID="lblPrompt2" runat="server" ForeColor="Red" Font-Bold="True" Style="margin-left: 74px;"></asp:Label>
                </div>
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>
    </div>
    <script type="text/javascript">
        $(".nav-item").eq(2).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        $(".uc-nav-item").eq(7).find("img").attr("src", $(".uc-nav-item").eq(7).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(7).addClass("hover").addClass("selected");
    </script>
</asp:Content>
