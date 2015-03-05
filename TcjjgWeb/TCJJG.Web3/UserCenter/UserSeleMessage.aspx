<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="UserSeleMessage.aspx.cs"
    Inherits="UserCenter_UserSeleMessage" MasterPageFile="../MasterPage.master" %>

<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/common.js" type="text/javascript"></script>
    <script src="../Js/CreateXMLHttpRequest.js" type="text/javascript"></script>
    <script src="../Js/user_Message.js" type="text/javascript"></script>
    <script src="../Js/page.js" type="text/javascript"></script>
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
                    短消息
                </div>
                <br />
                <div class="userCenter2page2">
                    <div id="dateUserMsg">
                    </div>
                    <div class="div_page_main_UserMessageSel">
                        <div id="divUserMessagePage" class="divUserMessagePage">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script language="javascript" defer="defer" type="text/javascript">
        seleMessage();
    </script>
     <script type="text/javascript">
         $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
         $(".userCenter_Left_Nav_Item").eq(12).addClass("userCenter_Left_Nav_Item_Selected");
    </script>
</asp:Content>
