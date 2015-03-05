<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserBillDetail.aspx.cs" Inherits="UserCenter_UserBillDetail" %>

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
                <img src="../Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;账单查询
            </div>
            <div style="margin-top: 10px">
                <div class="ReckoningAmply" style="margin-top: 40px">
                    <div class="ReckoningAmply_Left">
                        费用名称：
                    </div>
                    <div class="ReckoningAmply_Right">
                        <asp:Label ID="lblAwardName" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="ReckoningAmply">
                    <div class="ReckoningAmply_Left">
                        费用类型：
                    </div>
                    <div class="ReckoningAmply_Right">
                        <asp:Label ID="lblAcountType" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="ReckoningAmply">
                    <div class="ReckoningAmply_Left">
                        资金流向：
                    </div>
                    <div class="ReckoningAmply_Right">
                        <asp:Label ID="lblDirection" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="ReckoningAmply">
                    <div class="ReckoningAmply_Left">
                        类型：
                    </div>
                    <div class="ReckoningAmply_Right">
                        <asp:Label ID="lblTypeName" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="ReckoningAmply">
                    <div class="ReckoningAmply_Left">
                        金额：
                    </div>
                    <div class="ReckoningAmply_Right">
                        <asp:Label ID="lblAmount" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="ReckoningAmply">
                    <div class="ReckoningAmply_Left">
                        余额：
                    </div>
                    <div class="ReckoningAmply_Right">
                        <asp:Label ID="lblRemainder" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="ReckoningAmply">
                    <div class="ReckoningAmply_Left">
                        说明：
                    </div>
                    <div class="ReckoningAmply_Right">
                        <asp:Label ID="lblMemo" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
                <div class="ReckoningAmply">
                    <div class="ReckoningAmply_Left">
                        日期：
                    </div>
                    <div class="ReckoningAmply_Right">
                        <asp:Label ID="lblDate" runat="server" Text="Label"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>
    </div>
    <script type="text/javascript">
        $(".nav-item").eq(2).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        $(".uc-nav-item").eq(4).find("img").attr("src", $(".uc-nav-item").eq(4).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(4).addClass("hover").addClass("selected");
    </script>
</asp:Content>
