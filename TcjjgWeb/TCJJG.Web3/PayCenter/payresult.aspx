<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/MasterPage.master"
    CodeFile="payresult.aspx.cs" Inherits="PayCenter_payresult" %>

<%@ Register Src="../UserControl/UC_PayCenter_Nav.ascx" TagName="UC_PayCenter_Nav"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/QueryString.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="subPage_Layout">
        <div class="subPage_Left">
            <uc1:UC_PayCenter_Nav ID="UC_PayCenter_Nav1" runat="server" />
            <div class="subPage_Left_Service">
                <a class="AwardLinkToService" href="http://wpa.qq.com/msgrd?v=3&uin=243559966&site=qq&menu=yes"
                    target="_blank"></a>
            </div>
        </div>
        <div class="subPage_Right">
            <div class="payCenter_Right_Guid">
                <img alt="" class="payCenter_Right_Guid_Img" src="../Images/SubPage/payGuid1.jpg" />
                <img alt="" class="payCenter_Right_Guid_Img" src="../Images/SubPage/payGuidArrows.jpg" />
                <img alt="" class="payCenter_Right_Guid_Img" src="../Images/SubPage/payGuid2a.jpg" />
                <img alt="" class="payCenter_Right_Guid_Img" src="../Images/SubPage/payGuidArrows.jpg" />
                <img alt="" class="payCenter_Right_Guid_Img" src="../Images/SubPage/payGuid3b.jpg" />
            </div>
            <div class="payCenter_Right_Content">
                <div class="payCenter_Right_Content_BGTop">
                </div>
                <div class="payCenter_Right_Content_Main">
                    <div class="payCenter_Right_Content_Main_Left">
                        <div class="payCenter_Right_Content_Main_Nav">
                            <div class="payCenter_Right_Content_Main_Nav_Guid">
                            </div>
                            <a href="pay_Card.aspx" target="frameMain"><span class="payCenter_Right_Content_Main_Nav_Item">
                                同城竞技馆点卡 </span></a><a href="Yeepay.aspx" target="frameMain"><span class="payCenter_Right_Content_Main_Nav_Item">
                                    网络银行充值 </span></a><a href="MessageRecharge.aspx" target="frameMain"><span class="payCenter_Right_Content_Main_Nav_Item">
                                        手机短信充值 </span></a><a href="Yeepay.aspx?py=SZX-NET" target="frameMain"><span class="payCenter_Right_Content_Main_Nav_Item">
                                            神州行卡充值 </span></a><a href="Yeepay.aspx?py=UNICOM-NET" target="frameMain"><span class="payCenter_Right_Content_Main_Nav_Item">
                                                联通全国卡充值 </span></a><a href="Yeepay.aspx?py=JUNNET-NET" target="frameMain"><span class="payCenter_Right_Content_Main_Nav_Item">
                                                    骏网一卡通充值 </span></a><a href="Yeepay.aspx?py=SNDACARD-NET" target="frameMain"><span
                                                        class="payCenter_Right_Content_Main_Nav_Item">盛大卡充值 </span>
                            </a><a href="Yeepay.aspx?py=ZHENGTU-NET" target="frameMain"><span class="payCenter_Right_Content_Main_Nav_Item">
                                征途卡充值 </span></a><a href="PhoneRecharge.aspx" target="frameMain"><span class="payCenter_Right_Content_Main_Nav_Item">
                                    V币电话支付 </span></a>
                        </div>
                    </div>
                    <div class="payCenter_Right_Content_Main_Right">
                        <iframe id="frameMain" onload="this.height=700" name="frameMain" src="payFinish.aspx"
                            scrolling="no" frameborder="0" width="100%"></iframe>
                    </div>
                </div>
                <div class="payCenter_Right_Content_BGBottom">
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_PayCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        if (window != top)
            top.location.href = location.href;  
    </script>
    <script type="text/javascript">
        $(document).ready(function () {
            var r = QueryString("r1");
            if (r == 1) {
                $("#frameMain").attr("src", "payFinish.aspx");
            }
            else if (r == 2) {
                $("#frameMain").attr("src", "payFail.aspx");
            }
        })
    </script>
</asp:Content>
