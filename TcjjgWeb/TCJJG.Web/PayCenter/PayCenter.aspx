<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="PayCenter.aspx.cs" Inherits="PayCenter_PayCenter" %>

<%@ Register Src="~/UserControl/Pay_UserInfoAndStep.ascx" TagName="Pay_UserInfoAndStep"
    TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/Pay_LeftMenu.ascx" TagName="Pay_LeftMenu" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/PayCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function LinkToPayPageByType() {
            $(":radio").click(function () {
                $("#ctl00_ContentPlaceHolder1_iframe").attr("src", this.defaultValue);
                //ChangeStepImg();
            });
        }
        $(function () {
            LinkToPayPageByType();
        })
        //        function ChangeStepImg() {
        //            var inputLength= $(":text", document.frames('iframe').document).val().length
        //            if (inputLength>0) {
        //                $(".pay-step1").attr("src", "/Images/PayCenter/pay-step-1-d.png");
        //                $(".pay-step2").attr("src", "/Images/PayCenter/pay-step-2-c.png");
        //            } else {
        //                $(".pay-step1").attr("src", "/Images/PayCenter/pay-step-1-c.png");
        //                $(".pay-step2").attr("src", "/Images/PayCenter/pay-step-2-d.png");
        //            }
        //        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0px auto; width: 1000px; height: 740px; margin-bottom: 38px;">
        <uc1:Pay_UserInfoAndStep ID="Pay_UserInfoAndStep" runat="server" />
        <uc2:Pay_LeftMenu ID="Pay_LeftMenu" runat="server" />
        <div class="uc-content-wrap">
            <div class="pay-type-wrap">
                <div class="pay-type-text">
                    选择您要充值的方式</div>
                <asp:RadioButtonList ID="rbtnPayType" runat="server" RepeatColumns="6" Style="margin-left: -20px"
                    RepeatDirection="Horizontal" CellSpacing="20">
                    <asp:ListItem Value="pay_Card.aspx" Selected="True">同城竞技馆点卡</asp:ListItem>
                    <asp:ListItem Value="Yeepay.aspx">网络银行充值 </asp:ListItem>
                    <asp:ListItem Value="MessageRecharge.aspx">手机短信充值</asp:ListItem>
                    <asp:ListItem Value="Yeepay.aspx?py=SZX-NET">神州行卡充值 </asp:ListItem>
                    <asp:ListItem Value="Yeepay.aspx?py=UNICOM-NET">联通全国卡充值 </asp:ListItem>
                    <asp:ListItem Value="Yeepay.aspx?py=JUNNET-NET">骏网一卡通充值</asp:ListItem>
                    <asp:ListItem Value="Yeepay.aspx?py=SNDACARD-NET">盛大卡充值 </asp:ListItem>
                    <asp:ListItem Value="Yeepay.aspx?py=ZHENGTU-NET">征途卡充值 </asp:ListItem>
                    <asp:ListItem Value="PhoneRecharge.aspx">V币电话支付 </asp:ListItem>
                    <asp:ListItem Value="Alipay.aspx">支付宝充值</asp:ListItem>
                </asp:RadioButtonList>
                <div class="paysplitline">
                    <img src="../Images/PayCenter/paysplitline.jpg" alt="" /></div>
                <iframe id="iframe" runat="server" name="iframe" scrolling="auto" width="100%" height="430px"
                    style="*height: 429px;" src="pay_Card.aspx" frameborder="0"></iframe>
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>
    </div>
    <script type="text/javascript">
        $(".nav-item").eq(3).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        $(".uc-nav-item").eq(0).find("img").attr("src", $(".uc-nav-item").eq(0).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(0).addClass("hover").addClass("selected");
    </script>
</asp:Content>
