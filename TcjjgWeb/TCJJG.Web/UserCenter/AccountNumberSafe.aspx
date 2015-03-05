<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="AccountNumberSafe.aspx.cs" Inherits="UserCenter_AccountNumberSafe" %>

<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/UC_LeftNav.ascx" TagName="UC_LeftNav" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/AccountNumberSafe.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0px auto; width: 1000px; height: 740px; margin-bottom: 38px;">
        <uc1:UC_UserInfo ID="UC_UserInfo" runat="server" />
        <uc2:UC_LeftNav ID="UC_LeftNav" runat="server" />
        <div class="uc-content-wrap " style="position: relative;">
            <div class="uc-content-title" style="margin-top: 15px; margin-left:15px;">
                <img src="../Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;修改密码
            </div>
            <div class="uc-updatepwd-wrap">
                <iframe id="frameMain" name="frameMain" height="253px" scrolling="no" frameborder="0"
                    width="100%" src='<% = frameSrc %>'></iframe>
            </div>
            <div class="uc-content-title" style="margin-top: 255px;margin-left:15px;">
                <img src="../Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;密码保护
            </div>
                        <div class="uc-pwdprotect-wrap">
                <iframe id="frameMain2" name="frameMain2" height="280px" scrolling="no" frameborder="0"
                    width="100%" src='<% = frameSrc2 %>'></iframe>
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>
    </div>
    <script type="text/javascript">
        $(".nav-item").eq(2).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        $(".uc-nav-item").eq(6).find("img").attr("src", $(".uc-nav-item").eq(6).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(6).addClass("hover").addClass("selected");
    </script>
</asp:Content>
