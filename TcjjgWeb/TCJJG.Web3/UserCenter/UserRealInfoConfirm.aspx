<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserRealInfoConfirm.aspx.cs" Inherits="UserCenter_UserRealInfoConfirm" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/UserReg.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .help_textBox
        {
            border: 1px solid #666666;
            font-size: 12px;
            height: 22px;
            width: 173px;
            line-height: 20px;
        }
        .UserCenter_Right_Title
        {
            width: 770px;
            border-bottom-style: solid;
            border-bottom-width: 1px;
            border-bottom-color: #dadada;
            height: 50px;
            color: #fa8400;
            font-size: 14px;
            line-height: 75px;
            _line-height: 50px;
            margin: 0 auto;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server">
        <div class="D_MidClew">
            提示：为了您能顺利领取奖励，请正确填写实名信息，填写成功后，您还将获得每日登录奖励和新手破产补助等特权！
        </div>
        <div class="UserCenter_Right_Title">
            填写实名认证
        </div>
        <div style="width: 380px; margin-left: auto; margin-right: auto; margin-top: 30px;">
            姓<span style="visibility: hidden">空空</span>名：
            <asp:TextBox ID="txtRealName" runat="server" CssClass="help_textBox" MaxLength="8"></asp:TextBox>
            <div style="height: 21px">
            </div>
            身份证号：
            <asp:TextBox ID="txtIDCard" runat="server" CssClass="help_textBox" MaxLength="18"></asp:TextBox>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtIDCard"
                ErrorMessage="请填写正确的身份证号" ValidationExpression="\d{17}[\d|X]|\d{15}"></asp:RegularExpressionValidator>
            <div style="height: 21px">
            </div>
            手<span style="visibility: hidden">空空</span>机：
            <asp:TextBox ID="txtMovePhone2" runat="server" CssClass="help_textBox" MaxLength="24"></asp:TextBox>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtMovePhone2"
                ErrorMessage="请输入正确的手机号" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
            <div style="height: 21px">
            </div>
            <div>
                <asp:ImageButton ID="ImgBtn" ImageUrl="~/Images/UserCenter/tcjjg_2012__UpInfoOK.jpg"
                    runat="server" OnClick="ImgBtn_Click" Style="margin-left: 74px;" />
                &nbsp;
                <asp:LinkButton ID="linkBtnComplete" runat="server" ForeColor="Blue" OnClick="linkBtnComplete_Click">以后再填</asp:LinkButton>
                <br />
                <asp:Label Style="margin-left: 74px;" ID="lblMsg" runat="server" Text="" ForeColor="Red"></asp:Label>
            </div>
        </div>
    </asp:Panel>
    <asp:Panel ID="Panel2" runat="server" Visible="false">
        <div class="D_RegSuccess">
            <div>
                <img src="../Images/Register/tcjjg_2012__rs1.jpg" /></div>
            <div class="Congratulate">
                <img src="../Images/Register/tcjjg_2012__rs2.jpg" align="absmiddle" />&nbsp;&nbsp;恭喜您注册成功！</div>
            <div>
                <a href="../UserCenter/">
                    <img src="../Images/Register/tcjjg_2012__rs4.jpg" /></a>&nbsp; <a href="../PayCenter/PayCenter.aspx">
                        <img src="../Images/Register/tajjg_2012__charge.jpg" /></a>&nbsp; <a href="../HallPage/HallPageFL.aspx">
                            <img src="../Images/Register/tcjjg_2012__rs3.jpg" /></a></div>
        </div>
    </asp:Panel>
</asp:Content>
