<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="CustomerServiceCenter.aspx.cs" Inherits="CustomerService_CustomerServiceCenter" %>

<%@ Register Src="../UserControl/CustomerService.ascx" TagName="CustomerService"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/CustomerService.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_IndexContainer">
        <uc1:CustomerService ID="CustomerService1" runat="server" />
        <div class="D_IndexRightContainer">
            <img src="../Images/CustomerService/tcjjg_2012__indexcs.jpg" />
            <div class="DownImgList">
                <a href="http://wpa.qq.com/msgrd?v=3&uin=243559966&site=qq&menu=yes" target="_blank">
                    <img src="../Images/CustomerService/tcjjg_2012__onlinecs.jpg" /></a>
                <div class="ImgListSpace">
                </div>
                <a href="<%= GetBBSUrl() %>/posttopic.aspx?forumid=11&forumpage=1" target="_blank">
                    <img src="../Images/CustomerService/tcjjg_2012__arraign.jpg" /></a>
                <div class="ImgListSpace">
                </div>
                <a href="Appeal.aspx">
                    <img src="../Images/CustomerService/tcjjg_2012__appeal.jpg" /></a>
            </div>
        </div>
    </div>
    <div class="clearF">
    </div>
    <script type="text/javascript">
        $("#A_CustomerServiceCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $("#CustomerServiceCenter").css("background-image", "url('../Images/CustomerService/tcjjg_2012__ucbg.jpg')");
    </script>
</asp:Content>
