<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Appeal.aspx.cs" Inherits="CustomerService_Appeal" %>

<%@ Register Src="../UserControl/CustomerService.ascx" TagName="CustomerService"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/CustomerService.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/ChangeCode.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="D_IndexContainer">
        <uc1:CustomerService ID="CustomerService1" runat="server" />
        <div class="Appeal_Container">
            <div class="Appeal_Title">
                <div class="Appeal_Title_Content">
                    账号申诉
                </div>
            </div>
            <div class="Appeal_Content">
                请输入要申请的账号：&nbsp;<asp:TextBox ID="txtUserName" runat="server" CssClass="Appeal_Text"
                    MaxLength="15"></asp:TextBox>
                <br />
                <br />
                真实姓名：&nbsp;<asp:TextBox ID="txtRealName" runat="server" CssClass="Appeal_Text" MaxLength="10"></asp:TextBox>
                <br />
                <br />
                身份证号：&nbsp;<asp:TextBox ID="txtIdCardNum" runat="server" CssClass="Appeal_Text" MaxLength="18"></asp:TextBox>
                <br />
                <br />
                <div class="UpLoad">
                    <span>上传身份证正面照：</span><br />
                    <asp:Image CssClass="imgPreview" ID="imgPreview" runat="server" ImageUrl="~/Images/CustomerService/tcjjg_2012__apperlimg.jpg" /><span class="UploadWarning">注:请上传小于50KB图片</span><br />
                     <asp:FileUpload ID="fileUpload" runat="server" CssClass="inputFile" /><br />
                    <asp:ImageButton CssClass="btnUpload" ID="btnUpload" runat="server" ImageUrl="~/Images/CustomerService/tcjjg_2012__uplown.jpg"
                        OnClick="btnUpload_Click" />
                </div>
                <div class="ValiCode">
                    <br />
                    <br />
                    验证码：&nbsp;<asp:TextBox ID="txtVli" runat="server" class="txtCode" MaxLength="4"></asp:TextBox>
                    <img id="imgCode" class="imgCode" alt="看不清？点击更换" src="../Index/ValidateCode.aspx"
                        onclick="ChangeCode();" style="cursor: pointer;" align="absmiddle" /></div>
  
                <span>请提交后联系在线客服</span> &nbsp;<asp:ImageButton ID="ImgBtnSubmit" CssClass="ImgBtnSubmit"
                    runat="server" ImageUrl="~/Images/CustomerService/tcjjg_2012__appealOK.jpg" OnClick="ImgBtnSubmit_Click" /><br />
                <asp:Label CssClass="lblUploadMessage" ID="lblUploadMessage" runat="server" Text=""></asp:Label>
            </div>
        </div>
    </div>
    <div class="clearF">
    </div>
    <script type="text/javascript">
        $("#A_CustomerServiceCenter").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
    </script>
    </span>
</asp:Content>
