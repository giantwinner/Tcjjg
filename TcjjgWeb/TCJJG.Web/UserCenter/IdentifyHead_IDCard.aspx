<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IdentifyHead_IDCard.aspx.cs"
    Inherits="UserCenter_IdentifyHead_IDCard" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="SecondStep-IDCard" id="IDCard" runat="server">
        <div class="UpLoad">
            <b>上传身份证件图片</b>：
            <br />
            <asp:Image CssClass="imgPreview" ID="imgPreview" runat="server" ImageUrl="~/Images/UserCenter/imgPreview.jpg" /><br />
            <span class="UploadWarning"><b>注</b>:请上传小于200KB图片</span><br />
            <asp:FileUpload ID="fileUpload" runat="server" CssClass="inputFile" /><br />
            <asp:ImageButton CssClass="btnUpload" ID="btnUpload" runat="server" ImageUrl="~/Images/UserCenter/btnUpload.jpg"
                OnClick="btnUpload_Click" />
            <br />
            <asp:ImageButton ID="btnSubmit" CssClass="btnSubmit" runat="server" OnClick="btnSubmit_Click"
                ImageUrl="~/Images/BtnImg/submit1.png" />
            <br />
            <a href="javascript:history.go(-1);" style=" position:absolute; right:13px; bottom:68px; text-decoration:none;">返回上一步</a>
            <asp:Label CssClass="lblUploadMessages" ID="lblMsg" Font-Size="Large" runat="server"
                ForeColor="Red"></asp:Label>
        </div>
    </div>
    </form>
</body>
</html>
