<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UpdateUserInfo.aspx.cs" Inherits="UserCenter_UpdateUserInfo" %>

<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/UC_LeftNav.ascx" TagName="UC_LeftNav" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
        <script src="/Scripts/My97DatePicker/WdatePicker.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0px auto; width: 1000px; height: 740px; margin-bottom: 38px;">
        <uc1:UC_UserInfo ID="UC_UserInfo" runat="server" />
        <uc2:UC_LeftNav ID="UC_LeftNav" runat="server" />
        <div class="uc-content-wrap">
            <div class="uc-content-title">
                <img src="../Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;修改资料
            </div>
            <div class="uc-content-realnameauthentication">
                <span class="uc-input-lefttext">性<span class="letterspace">空空</span>别：</span>
                <asp:RadioButton ID="rbtnMale" runat="server" GroupName="Gender" Checked="true" Text="男" /><span
                    class="letterspace">空空</span><asp:RadioButton ID="rbtnFemale" runat="server" GroupName="Gender"
                        Text="女" />
                <div style="height: 21px">
                </div>
                <span class="uc-input-lefttext">职<span class="letterspace">空空</span>业：</span>
                <asp:DropDownList ID="ddlWork" runat="server" CssClass="uc-text">
                    <asp:ListItem Value="0">--请选择--</asp:ListItem>
                    <asp:ListItem Value="1">在校学生</asp:ListItem>
                    <asp:ListItem Value="2">固定工作者</asp:ListItem>
                    <asp:ListItem Value="3">自由职业者</asp:ListItem>
                    <asp:ListItem Value="4">待业/无业/失业</asp:ListItem>
                    <asp:ListItem Value="5">退休</asp:ListItem>
                    <asp:ListItem Value="6">其他</asp:ListItem>
                </asp:DropDownList>
                <div style="height: 21px">
                </div>
                <span class="uc-input-lefttext">生<span class="letterspace">空空</span>日：</span>
                <asp:TextBox ID="txtBirthday" runat="server" onclick="WdatePicker()"></asp:TextBox>
                <div style="height: 21px">
                </div>
                <span class="uc-input-lefttext">确认密码：</span>
                <asp:TextBox ID="txtPassWord" runat="server" TextMode="Password"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtPassWord"
                    ErrorMessage="请输入确认密码"></asp:RequiredFieldValidator>
                <div style="height: 21px">
                </div>
                <div>
<%--                    <asp:LinkButton ID="SaveBtn" runat="server" CssClass="savebtn" OnClick="SaveBtn_Click"
                        Style="margin-left: 74px;">保存</asp:LinkButton>--%>
                 <asp:ImageButton ID="SaveBtn" Style=" display:block; margin-left: 74px;" runat="server"  OnClick="SaveBtn_Click"  ImageUrl="~/Images/BtnImg/save1.png" />

                    <asp:Label ID="lblPrompt" runat="server" ForeColor="Red" Font-Bold="True" Style="margin-left: 74px;"></asp:Label>
                </div>
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt=""/>
        </div>
    </div>
            <script type="text/javascript">
                $(".nav-item").eq(2).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
                $(".uc-nav-item").eq(0).find("img").attr("src", $(".uc-nav-item").eq(0).find("img").attr("src").replace("2", "1"));
                $(".uc-nav-item").eq(0).addClass("hover").addClass("selected");
    </script>
</asp:Content>
