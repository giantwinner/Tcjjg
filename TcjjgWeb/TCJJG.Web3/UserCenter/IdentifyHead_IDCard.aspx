<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="IdentifyHead_IDCard.aspx.cs" Inherits="UserCenter_IdentifyHead_IDCard" %>

<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <link href="../Css/UserCenter.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
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
                    <div class="SecondStep-IDCard" id="IDCard" runat="server">
                        <div class="UpLoad">
                            <span style="text-align: center">第二步---》上传身份证件图片：</span><br />
                            <br />
                            <asp:Image CssClass="imgPreview" ID="imgPreview" runat="server" ImageUrl="~/Images/CustomerService/tcjjg_2012__apperlimg.jpg" /><br />
                            <span class="UploadWarning">注:请上传小于200KB图片</span><br />
                            <asp:FileUpload ID="fileUpload" runat="server" CssClass="inputFile" /><br />
                            <asp:ImageButton CssClass="btnUpload" ID="btnUpload" runat="server" ImageUrl="~/Images/CustomerService/tcjjg_2012__uplown.jpg"
                                OnClick="btnUpload_Click" />
                            <br /> 
                            <asp:Button ID="btnSubmit" CssClass="btnSubmit" runat="server" Text="提交"  OnClientClick="if(!confirm('认证头像将扣除您5万金币，是否确认提交？')){return false}" OnClick="btnSubmit_Click" />
                            <br />
                            <asp:Label CssClass="lblUploadMessage" ID="lblMsg" Font-Size="Large" runat="server" ForeColor="Red"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

