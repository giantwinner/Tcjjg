<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="HelpCenter_Default" %>

<%@ Register Src="~/UserControl/HC_TopBlock.ascx" TagName="HC_TopBlock" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/HC_LeftMenu.ascx" TagName="HC_LeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/HelpCenter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0px auto; width: 1000px;">
        <uc1:HC_TopBlock ID="HC_TopBlock" runat="server" />
        <uc2:HC_LeftMenu ID="HC_LeftMenu" runat="server" />
        <div class="uc-content-wrap">
            <iframe id="frameRight" runat="server" name="frameRight" scrolling="auto" width="100%"
                src="Guid.aspx" height="568px" frameborder="0"></iframe>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>
    </div>
    <script src="../Scripts/QueryString.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            var r = QueryString("hc");
            if (r == "ddz") {
                $("#ctl00_ContentPlaceHolder1_frameRight").attr("src", "Game-DDZ.aspx");
            } else if (r == "dz") {
                $("#ctl00_ContentPlaceHolder1_frameRight").attr("src", "Game-DZ.aspx");
            }
            else if (r == "rg") {
                $("#ctl00_ContentPlaceHolder1_frameRight").attr("src", "Game-RunDog.aspx");
            }
            $(".nav-item").eq(5).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        })
    </script>
</asp:Content>
