<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PayLogInfo.aspx.cs" Inherits="PayCenter_PayLogInfo"
    MasterPageFile="../MasterPage.master" %>

<%@ Register Src="../UserControl/UC_PayCenter_Nav.ascx" TagName="UC_PayCenter_Nav"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        if (window != top)
            top.location.href = location.href; 
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="subPage_Layout">
        <div class="subPage_Left">
            <uc1:UC_PayCenter_Nav ID="UC_PayCenter_Nav1" runat="server" />
            <div class="subPage_Left_Service">
            </div>
        </div>
        <div class="subPage_Right" >
            <div class="AwardList_Title" style="width: 680px">
                详细账单
            </div>
            <div class="UserCenter_Right_Layout" style="height: 600px; width: 680px;">
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
    </div>
    <script type="text/javascript">
        $("#A_PayCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });

        $(".subPage_Left_Nav_Item").eq(1).addClass("subPage_Left_Nav_Item_Selected");
    </script>
</asp:Content>
