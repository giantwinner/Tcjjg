<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="UserSeleMessageAmply.aspx.cs"
    Inherits="UserCenter_UserSeleMessageAmply" MasterPageFile="../MasterPage.master" %>

<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/common.js" type="text/javascript"></script>
    <script src="../Js/CreateXMLHttpRequest.js" type="text/javascript"></script>
    <script src="../Js/user_MessageAmply.js" type="text/javascript"></script>
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
                <div class="D_UserInfoContainer">
                    <div class="D_RightInner">
                        <div id="dateAfficheOpeList">
                            <div class="div_SystemMsgTitle">
                                <div id="div_SystemMsgTitle">
                                </div>
                            </div>
                            <div class="newsTitle_2_Line">
                            </div>
                            <div class="div_SystemMsgTime">
                                <div id="div_SystemMsgTime">
                                </div>
                            </div>
                            <div class="divNewsContent">
                                <div id="div_SystemMsgC">
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script language="javascript" defer="defer" type="text/javascript">
        seleMessageAmply();
    </script>
     <script type="text/javascript">
         $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
         $(".userCenter_Left_Nav_Item").eq(12).addClass("userCenter_Left_Nav_Item_Selected");
    </script>
</asp:Content>
