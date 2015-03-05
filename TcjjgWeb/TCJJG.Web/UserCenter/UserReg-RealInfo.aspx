<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserReg-RealInfo.aspx.cs" Inherits="UserCenter_UserReg_RealInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/user_reg.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="uc-reg-wrap">
        <div class="uc-reg-l">
            <img src="../Images/UserCenter/uc-reg-l.png" alt="" />
        </div>
        <div class="uc-reg-m">
            <div class="uc-reg-title" style="font-size: 20px; width: 528px;">
                恭喜你！注册成功！点击“跳过”按钮可以直接进入游戏。
            </div>
            <div class="uc-input-wrap">
                <div class="uc-reg-userinf-title">
                    实名认证
                </div>
                <div class="RowInfo">
                    真实姓名:&nbsp;<asp:TextBox ID="txtRealName" runat="server" CssClass="textReg" MaxLength="8"></asp:TextBox>
                </div>
                <div class="RowInfo">
                    身份证号:&nbsp;<asp:TextBox ID="txtIDCard" runat="server" CssClass="textReg" MaxLength="18"></asp:TextBox>
                </div>
                <asp:Panel ID="pSpreadName" runat="server" Visible="false">
                    <div class="uc-reg-userinf-title">
                       <span class="Fold" onclick="ToggleSpread()">+</span>推广用户（非必填项）
                    </div>
                    <div id="spreadArea" class="RowInfo" style=" display:none;">
                        推广账号:&nbsp;<asp:TextBox MaxLength="15" ID="txtSpreadUser" runat="server" class="textReg"
                            onblur="regBlur_SpreadUser()" onfocus="regFous_SpreadUser();"></asp:TextBox>
                    </div>
                </asp:Panel>
                <div class="uc-linkto-bind">
                    绑定手机保护账号安全，并有100金币奖励！<a href="/UserCenter/BindMovePhone.aspx" class="uc-linkbtn">点此绑定</a>
                </div>
                <div class="uc-linkto-bind">
                    绑定邮箱保护账号安全，并有50<span style="visibility: hidden;">0</span>金币奖励！<a href="/UserCenter/BindMail.aspx"
                        class="uc-linkbtn">点此绑定</a>
                </div>
                <br />
                <a href="/HallPage/HallPageFL.aspx" class="uc-linkbtn" style="margin-left: 65px;">跳过</a>
                &nbsp;&nbsp;
                <%--                <asp:LinkButton
                    ID="btnSave" runat="server" CssClass="savebtn" Style="display: inline-block"
                    OnClick="btnSave_Click">完成</asp:LinkButton>--%>
                <asp:ImageButton ID="btnSave" Style="display: inline-block; position: relative; bottom: -13px;"
                    OnClick="btnSave_Click" ImageUrl="~/Images/BtnImg/compete1.png" runat="server" />
                &nbsp;<asp:Label ID="lblmsg" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
            </div>
        </div>
        <div class="uc-reg-r">
            <img src="../Images/UserCenter/uc-reg-r.png" alt="" />
        </div>
    </div>
</asp:Content>
