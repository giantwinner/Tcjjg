<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserReckoningAmply.aspx.cs"
    Inherits="UserCenter_UserReckoningAmply" MasterPageFile="../MasterPage.master" %>

<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../Css/UserCenter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="userCenter_Layout">
        <div class="userCenter_Top">
            <div class="userCenter_Top_Text">
                用户中心</div>
            <div class="userCenter_Top_Img">
            </div>
        </div>
        <div class="userCenter_Left">
            <uc1:UC_UserCenter ID="UC_UserCenter1" runat="server" />
        </div>
        <div class="userCenter_Right">
            <div class="UserCenter_Right_Layout">
                <div class="UserCenter_Right_Title">
                    详细账单
                </div>
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
        $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".userCenter_Left_Nav_Item").eq(10).addClass("userCenter_Left_Nav_Item_Selected");
    </script>
</asp:Content>
