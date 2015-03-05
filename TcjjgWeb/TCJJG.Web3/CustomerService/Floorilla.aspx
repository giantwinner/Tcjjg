<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Floorilla.aspx.cs" Inherits="CustomerService_Floorilla" %>

<%@ Register Src="../UserControl/CustomerService.ascx" TagName="CustomerService"
    TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/CustomerService.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_IndexContainer">
        <uc2:CustomerService ID="CustomerService1" runat="server" />
        <div class="Floorilla_Container">
           <div class="Title_City">
                <img src="../Images/About/tcjjg_2012__tkjiantou.jpg" align="absmiddle" />&nbsp;<span
                    class="CityName" runat="server" id="Span_CityName"></span><br />
                <img src="../Images/About/tcjjg_2012__tkbelowline.jpg" />
            </div>
            <div class="Floorilla_Content" id="Floorilla_Content" runat="server">
            </div>
        </div>
    </div>
    <div class="clearF">
    </div>
    <script type="text/javascript">
        $("#A_CustomerServiceCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $("#Floorilla").css("background-image", "url('../Images/CustomerService/tcjjg_2012__ucbg.jpg')");
    </script>
<%--    <script type="text/javascript">
        $.get("/Ajax/HelpCenter.aspx?id=" + 29, function (result) {
            $(".Floorilla_Content").html(result);
        });
    </script>--%>
</asp:Content>
