<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="PersonalAward.aspx.cs" Inherits="UserCenter_PersonalAward" %>

<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <link href="../Css/GetAwards.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
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
                <div class="AwardContainer">
                    <div class="UserCenter_Right_Title">
                        我的物品
                    </div>
                    <br />
                    <div class="pageBar">
                        <img class="pager_pre" src="../Images/SubPage/pager_pre.jpg" />&nbsp;<img class="pager_next"
                            src="../Images/SubPage/pager_next.jpg" />
                    </div>
                    <br />
                    <%--                    <div class="PersonalAwardContainer">
                                                <div class="AwardItemContainer">
                            <div class="AD_Remark">
                                可以参加日赛，10张可合成一张周赛门票
                            </div>
                            <div class="AD_ImgUrl">
                                <img src="../Images/SubPage/ticket_day.jpg" />
                            </div>
                            <div class="AD_Name">
                                日赛门票
                            </div>
                            <div class="AD_Count">
                                19
                            </div>
                        </div>--%>
                    <div style="margin-bottom: 52px;">
                        <asp:Literal ID="ltlContainer" runat="server"></asp:Literal>
                    </div>
                    <div class="pageBar" style=" position:relative; bottom:15px;">
                        <img class="pager_pre" src="../Images/SubPage/pager_pre.jpg" />&nbsp;<img class="pager_next" src="../Images/SubPage/pager_next.jpg" />
                    </div>
                    <div class="PersonalAwardLink">
                        <a href="../AwardCenter/GoodsList.aspx">
                            <img src="../Images/SubPage/usegold.jpg" /></a><span style="display: inline-block;
                                width: 78px;"></span><a href="../Sales/SalesInfo.aspx"><img src="../Images/SubPage/usersale.jpg" /></a>
                    </div>
                    <span class="AD_Warn">注：合成功能需登录比赛大厅后，点击“我的物品”按钮，在物品合成里进行</span>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".userCenter_Left_Nav_Item").eq(5).addClass("userCenter_Left_Nav_Item_Selected");
        $(".PersonalAwardContainer").eq(0).show();
        showRemark();
        pageNext();
        pagePre();
        function showRemark() {
            $(".AD_ImgUrl").hover(function () {
                if ($(this).prev().html().length != 0) {
                    $(this).prev().show();
                }
            }, function () {
                $(this).prev().hide();
            });
        }
        function pageNext() {
            var pageCount = $(".PersonalAwardContainer").length;
            if (pageCount > 0) {

                $(".pager_next").click(function () {
                    var objVisible = $(".PersonalAwardContainer:visible");
                    if ($(".PersonalAwardContainer:visible").next().eq(0).length > 0) {
                        $(".PersonalAwardContainer:visible").next().eq(0).show();
                        objVisible.hide();
                    }
                });
            }
        }
        function pagePre() {
            var pageCount = $(".PersonalAwardContainer").length;
            if (pageCount > 0) {
                $(".pager_pre").click(function () {
                    var objVisible = $(".PersonalAwardContainer:visible");
                    if ($(".PersonalAwardContainer:visible").prev().eq(0).length > 0) {
                        $(".PersonalAwardContainer:visible").prev().eq(0).show();
                        objVisible.hide();
                    }
                });
            }
        }


    </script>
</asp:Content>
