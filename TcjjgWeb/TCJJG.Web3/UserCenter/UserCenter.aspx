<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserCenter.aspx.cs" Inherits="UserCenter_UserCenter"
    MasterPageFile="../MasterPage.master" %>

<%@ Register Src="../UserControl/UserCenter.ascx" TagName="UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        if (window != top)
            top.location.href = location.href; 
    </script>
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
            <div class="userCenter_Left_Nav" id="userCenter_Left_Nav">
                <%--账号信息--%>
                <div class="userCenter_Left_Nav_Title">
                    账号信息
                </div>
                <asp:HyperLink ID="hyperUserInfo" runat="server" NavigateUrl="UserInfo.aspx" Target="frameMain">
                <div class="userCenter_Left_Nav_Item">
                    <img alt="" src="../Images/SubPage/tcjjg_2012__pInfo.jpg" class="userCenter_Left_Nav_Item_Img" />
                    个人资料
                </div>
                </asp:HyperLink>
                <asp:HyperLink ID="HyperLink5" runat="server" NavigateUrl="UpdateUserInfo.aspx" Target="frameMain">
                <div class="userCenter_Left_Nav_Item">
                    <img alt="" src="../Images/SubPage/tcjjg_2012__upInfo.jpg" class="userCenter_Left_Nav_Item_Img" />
                    修改资料
                </div>
                </asp:HyperLink>
                <asp:HyperLink ID="HyperLink4" runat="server" NavigateUrl="UserAmplyInfo.aspx" Target="frameMain">
                <div class="userCenter_Left_Nav_Item">
                    <img alt="" src="../Images/SubPage/tcjjg_2012__upHead.jpg" class="userCenter_Left_Nav_Item_Img" />
                    修改头像
                </div>
                </asp:HyperLink>
                <%--账号安全--%>
                <div class="userCenter_Left_Nav_Title">
                    账号安全
                </div>
                <asp:HyperLink ID="linkPwd" runat="server" Target="frameMain">
                <div class="userCenter_Left_Nav_Item">
                    <img alt="" src="../Images/SubPage/tcjjg_2012__uppwd.jpg" class="userCenter_Left_Nav_Item_Img" />
                    修改密码
                </div>
                </asp:HyperLink>
                <asp:HyperLink ID="linkQuestion" runat="server" Target="frameMain">
                <div class="userCenter_Left_Nav_Item">
                    <img alt="" src="../Images/SubPage/tcjjg_2012__proctectPwd.jpg" class="userCenter_Left_Nav_Item_Img" />
                    密码保护
                </div>
                </asp:HyperLink>
                <%--财富中心--%>
                <div class="userCenter_Left_Nav_Title">
                    财富中心
                </div>
                <div class="userCenter_Left_Nav_Item" onclick="document.location='../PayCenter/PayCenter.aspx'">
                    <img alt="" src="../Images/SubPage/tcjjg_2012__charge.jpg" class="userCenter_Left_Nav_Item_Img" />
                    我要充值
                </div>
                <div class="userCenter_Left_Nav_Item" onclick="document.location='../AwardCenter/AwardCenter.aspx'">
                    <img alt="" src="../Images/SubPage/tcjjg_2012__exchange.jpg" class="userCenter_Left_Nav_Item_Img" />
                    我要兑奖
                </div>
                <asp:HyperLink ID="hyperGiveRiches" runat="server" NavigateUrl="GiveRiches.aspx"
                    Target="frameMain">
                <div class="userCenter_Left_Nav_Item">
                    <img alt="" src="../Images/SubPage/tcjjg_2012__sendfortune.jpg" class="userCenter_Left_Nav_Item_Img" />
                    财富赠送
                </div>
                </asp:HyperLink>
                <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="UserReckoning.aspx" Target="frameMain">
                <div class="userCenter_Left_Nav_Item">
                    <img alt="" src="../Images/SubPage/tcjjg_2012__selectbill.jpg" class="userCenter_Left_Nav_Item_Img" />
                    账单查询
                </div>
                </asp:HyperLink>
                <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="AwardLog.aspx" Target="frameMain">
                <div class="userCenter_Left_Nav_Item">
                    <img alt="" src="../Images/SubPage/tcjjg_2012__exchangeRecord.jpg" class="userCenter_Left_Nav_Item_Img" />
                    兑奖记录
                </div>
                </asp:HyperLink>
                <%--消息中心--%>
                <div class="userCenter_Left_Nav_Title">
                    消息中心
                </div>
                <asp:HyperLink ID="HyperLink3" runat="server" NavigateUrl="UserSeleMessage.aspx"
                    Target="frameMain">
                <div class="userCenter_Left_Nav_Item">
                    短消息
                </div>
                </asp:HyperLink>
            </div>
        </div>
        <div class="userCenter_Right">
            <iframe id="frameMain" name="frameMain" src="UserInfo.aspx" height="700px" scrolling="no"
                frameborder="0" width="100%"></iframe>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".userCenter_Left_Nav_Item").eq(0).addClass("userCenter_Left_Nav_Item_Selected");
        $(document).ready(function () {
            $(".userCenter_Left_Nav_Item").click(function () {
                $(".userCenter_Left_Nav_Item").removeClass("userCenter_Left_Nav_Item_Selected");
                $(this).addClass("userCenter_Left_Nav_Item_Selected");
            })
        })
    </script>
</asp:Content>
