<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserSeleMessage.aspx.cs" Inherits="UserCenter_UserSeleMessage" %>

<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/UC_LeftNav.ascx" TagName="UC_LeftNav" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/common.js" type="text/javascript"></script>
    <script src="../Scripts/CreateXMLHttpRequest.js" type="text/javascript"></script>
    <script src="../Scripts/user_Message.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0px auto; width: 1000px; height: 740px; margin-bottom: 38px;">
        <uc1:UC_UserInfo ID="UC_UserInfo" runat="server" />
        <uc2:UC_LeftNav ID="UC_LeftNav" runat="server" />
        <div class="uc-content-wrap" style=" position:relative;">
            <div class="uc-content-title">
                <img src="../Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;短消息
            </div>
            <div id="uc-message-wrap">
            </div>
            <div class="pageBar">
                <div>
                    <img class="pager_pre" onclick="pre()" src="../Images/UserCenter/pre1.png" alt="" /></div>
                <div class="pageCount">
                    <span class="pageIndex"></span>/<span class="pageTotalCount"></span></div>
                <div>
                    <img class="pager_next"  onclick="next()" src="../Images/UserCenter/next1.png" alt="" /></div>
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>
    </div>
            <script type="text/javascript">
                $(".nav-item").eq(2).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
                $(".uc-nav-item").eq(5).find("img").attr("src", $(".uc-nav-item").eq(5).find("img").attr("src").replace("2", "1"));
                $(".uc-nav-item").eq(5).addClass("hover").addClass("selected");
    </script>
</asp:Content>
