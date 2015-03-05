<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="FindPassWordStep3.aspx.cs" Inherits="UserCenter_FindPassWordStep3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="uc-findpwd-wrap">
        <div class="findpwdText">
            登录密码找回：
        </div>
        <div class="div-findpwd-step3" id="step3">
            <div class="findpwd-stepImg-wrap">
                <img src="../Images/UserCenter/findpwdstep1-b.png" alt="" /><img src="../Images/UserCenter/findpwdstep2-b.png"
                    alt="" /><img src="../Images/UserCenter/findpwdstep3-a.png" alt="" />
            </div>
            <asp:Panel ID="pnelMail" runat="server">
                <div class="findpwdtext" style="margin-top: 24px; margin-bottom: 24px; font-size: 14px;">
                    绑定邮箱密码找回
                </div>
                <asp:Label ID="lblmail" CssClass="findpwdtext" Style="margin-left: 130px;" runat="server"
                    Text=""></asp:Label>
                <br />
                <br />
                <div style="color: Red; font-size: 14px; margin-bottom: 270px;">
                    <span>* 接收邮件可能有5分钟左右的网络延时，请耐心等待。更多问题请</span><a style="color: #92F8FA; text-decoration: underline;"
                        href="http://wpa.qq.com/msgrd?v=3&uin=1793878267&site=qq&menu=yes" target="_blank">联系客服</a>。
                </div>
            </asp:Panel>
            <asp:Panel ID="pnelPhone" runat="server" Visible="false">
                <div class="findpwdtext" style="margin-top: 24px; margin-bottom: 24px; font-size: 14px;">
                    绑定手机密码找回
                </div>
                <asp:Label ID="lblphone" CssClass="findpwdtext" runat="server" Text="" Style="margin-left: 130px;"></asp:Label>
                <br />
                <br />
                <div style="color: Red; font-size: 14px; margin-bottom: 270px;">
                    <span>* 接收信息可能有5分钟左右的网络延时，请耐心等待。更多问题请</span><a style="color: #92F8FA; text-decoration: underline;"
                        href="http://wpa.qq.com/msgrd?v=3&uin=1793878267&site=qq&menu=yes" target="_blank">联系客服</a>。
                </div>
            </asp:Panel>
        </div>
        <div class="div-findpwd-step4" id="step4" style="display: none">
            <img class="findokimg" src="/Images/UserCenter/findok.png" alt="" />
            <div class="findsuccess">
                &nbsp;恭喜,密码找回成功！<span id="second">5</span>秒后跳转到主页！
            </div>
            <a class="FindOK" style="display: block; position: absolute; top: 86px;" href="/">立即跳转
            </a>
        </div>
    </div>
</asp:Content>
