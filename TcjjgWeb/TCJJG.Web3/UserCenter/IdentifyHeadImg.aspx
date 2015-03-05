<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="IdentifyHeadImg.aspx.cs" Inherits="UserCenter_IdentifyHeadImg" %>

<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
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
                    头像认证
                </div>
                <div class="D_UserInfoContainer">
                    <br />
                    <br />
                    <br />
                    <div class="FirstStep" runat="server" id="First">
                        <span>第一步---》请选择您想认证头像的方式：</span><br />
                        <div class="FirstStep-Left">
                            <asp:LinkButton ID="LinkButton1" CssClass="IDCardBtn"  runat="server" 
                                onclick="LinkButton1_Click">身份认证</asp:LinkButton>
                            <div class="IDCardBtn2">
                                1.上传身份证件 （扫描、拍照均可）<br />
                                2.需要扣除5万金币
                                <br />
                                3.三个工作日内，消息中心将通知认证结果
                            </div>
                        </div>
                        <div class="FirstStep-Right">
                            <asp:LinkButton ID="LinkButton2" CssClass="IDCardBtn" runat="server" 
                                onclick="LinkButton2_Click">视频认证</asp:LinkButton>
                            <div class="IDCardBtn2">
                                1.登记个人信息，预约视频认证<br />
                                2.需要扣除10万金币<br />
                                3.三个工作日内，消息中心将通知认证结果
                            </div>
                        </div>
                        <div class="FirstStep-RedText">
                            认证头像前需将系统头像修改为玩家本人真实照片！！
                        </div>
                        提示：<br />
                        *认证头像只在工作日进行审核<br />
                        *认证提交后，扣除的金币将不予返还。请玩家确认要被认证的头像后在点击提交。<br />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
