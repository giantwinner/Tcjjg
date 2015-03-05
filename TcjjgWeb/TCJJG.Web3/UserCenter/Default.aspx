<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="UserCenter_Default"
    MasterPageFile="../MasterPage.master" %>

<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
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
            <uc2:UC_UserCenter ID="UC_UserCenter1" runat="server" />
        </div>
        <div class="userCenter_Right">
            <div class="UserCenter_Right_Layout">
                <div class="UserCenter_Right_Title">
                    基本信息
                </div>
                <div class="UserInfo_Content">
                    <div class="UserInfo_Content_ImgHead">
                        <asp:Image ID="imgHead" runat="server" Height="63px" Width="63px" />
                    </div>
                    <div class="UserInfo_Content_Item" style="top: 15px; left: 110px">
                        昵<span style="visibility: hidden">空</span>称：
                        <asp:Label ID="lblNick" runat="server"></asp:Label>
                    </div>
                    <div class="UserInfo_Content_Item" style="top: 40px; left: 110px">
                        等<span style="visibility: hidden">空</span>级：
                        <asp:Label ID="lblLevel" runat="server"></asp:Label>
                    </div>
                    <div class="UserInfo_Content_Item" style="top: 65px; left: 110px">
                        经验值：
                        <asp:Label ID="lblExperience" runat="server"></asp:Label>
                    </div>
                    <div class="UserInfo_Content_Item" style="top: 15px; left: 330px">
                        金<span style="visibility: hidden">空</span>币：
                        <asp:Label ID="lblGold" runat="server"></asp:Label>
                    </div>
                    <div class="UserInfo_Content_Item" style="top: 40px; left: 330px">
                        元<span style="visibility: hidden">空</span>宝：
                        <asp:Label ID="lblYuanBao" runat="server"></asp:Label>
                    </div>
                    <div class="UserInfo_Content_Item" style="top: 65px; left: 330px">
                        推广号：
                        <asp:Label ID="lblSpread" runat="server"></asp:Label>
                    </div>
                    <div class="UserInfo_BtnUpdateImg" onclick="document.location='UserAmplyInfo.aspx'">
                    </div>
                    <input class="IdentifyHeadImgUrl" onclick="AlertIdentifyDiv()" type="button" name="name" value="认证头像" />
                    <div class="UserInfo_BtnSpread" onclick="document.location='../Spread/SpreadIndex.aspx'">
                    </div>
                    <div class="UserInfo_BtnPay" onclick="document.location='../PayCenter/PayCenter.aspx'">
                    </div>
                    <div class="UserInfo_Change" onclick="document.location='../UserCenter/ChangeGoldCoins.aspx'">
                    </div>
                    <div class="UserInfo_BtnSpread" onclick="document.location='../Spread/SpreadIndex.aspx'">
                    </div>
                    <div class="UserInfo_BtnUpdateInfo">
                    </div>
                    <div class="IdentifyDiv" runat="server" id="IdentifyDiv">
                        <div class="CloseBtn" onclick="HideIdentifyDiv()">
                            x
                        </div>
                        <span style="text-align: center">用户认证头像说明：</span>
                        <br />
                        通过认证头像的玩家可以用自己的真实照片做为游戏头像，头像下方将显示尊贵“V”字，不仅易于辨识，同时大厅也将对认证头像的用户进行重点展示，在游戏时使您备受关注！<br />
                        <br />
                        申请头像认证的用户需要满足如下条件：<br />
                        1.认证头像前须将系统头像修改为玩家本人真实照片；<br />
                        2.您的大厅等级必须达到<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>级以上；<br />
                        3.您的注册资料必须完整填写；<br />
                        4.通过身份证件认证需要支付5万金币的费用；<br />
                        通过视频认证将支付10万金币的费用。<br />
                        <br />
                        温馨提示：<br />
                        1.认证头像为经过认证后合格的照片，如果用户更换头像将不在显示认证头像信息；<br />
                        2.上传图片为JPG格式，文件大小不得超过200K；<br />
                        3.头像认证过程需要三个工作日，审查结果将会在消息中心告知；<br />
                        4.认证头像为有偿服务，扣除的金币将不予返还。
                        <asp:Button ID="btnBeginIdentify" CssClass="BtnBeginIdentify" runat="server" Text="开始认证"
                            OnClick="btnBeginIdentify_Click" />
                        <br />
                    </div>
                    <div class="promptInfo" runat="server" id="promptInfo">
                    </div>
                </div>
                <div class="UserInfo_Detail">
                    <div class="UserInfo_Detail_Title">
                        个人资料
                    </div>
                    <br />
                    <div class="UserInfo_Detail_Content">
                        <div>
                            性别：<asp:Label ID="lblGender" runat="server"></asp:Label>
                        </div>
                        <div>
                            职业：<asp:Label ID="lblJob" runat="server"></asp:Label>
                        </div>
                        <div>
                            生日：<asp:Label ID="lblBirthday" runat="server"></asp:Label>
                        </div>
                        <div style="height: 10px;">
                        </div>
                        <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="UpdateUserInfo.aspx">
            <div class="btnChangeUserInfo"></div>
                        </asp:HyperLink>
                    </div>
                </div>
                <br />
                <div class="UserInfo_Detail">
                    <div class="UserInfo_Detail_Title">
                        实名认证
                    </div>
                    <br />
                    <div class="UserInfo_Detail_Content">
                        <div>
                            姓<span style="visibility: hidden">空空</span>名：<asp:Label ID="lblName" runat="server"></asp:Label>
                        </div>
                        <div>
                            身份证号：<asp:Label ID="lblIDCard" runat="server"></asp:Label>
                        </div>
                        <div>
                            手<span style="visibility: hidden">空空</span>机：<asp:Label ID="lblMovePhone" runat="server"></asp:Label>
                        </div>
                        <div style="height: 10px;">
                        </div>
                        <asp:HyperLink ID="HyperLink2" runat="server" NavigateUrl="UpdateUserInfo.aspx">
            <div class="btnChangeUserInfo"></div>
                        </asp:HyperLink>
                    </div>
                </div>
            </div>
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
        function IdentifyHeadImg() {

        }
        function HideIdentifyDiv() {
            $(".IdentifyDiv").hide();
            $(".promptInfo").hide();
        }
        function AlertIdentifyDiv() {
            $(".promptInfo").hide();
            $(".IdentifyDiv").show();
        }
    </script>
</asp:Content>
