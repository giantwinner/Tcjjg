<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="IdentifyHead_Video.aspx.cs" Inherits="UserCenter_IdentifyHead_Video" %>

<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/NewCalendar.js" type="text/javascript"></script>
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
                    <div class="SecondStep-Video" id="Video" runat="server">
                        <span style="text-align: center">第二步---》通过视频认证：</span><br />
                        <br />
                        用户名：<asp:Label ID="lblUserName" runat="server" Text=""></asp:Label><br />
                        昵<span style="visibility: hidden">空</span>称：<asp:Label ID="lblNickName" runat="server"
                            Text=""></asp:Label><br />
                        Q<span style="visibility: hidden">空空</span>Q：
                        <asp:TextBox ID="txtQQ" MaxLength="20" runat="server"></asp:TextBox>
                        <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToValidate="txtQQ"
                            ErrorMessage="格式错误" Operator="DataTypeCheck" Type="Double" ValidationGroup="格式错误"></asp:CompareValidator>
                        <br />
                        预约时间：<asp:TextBox ID="txtDate" onclick="SelectDate(this)" runat="server"></asp:TextBox>
                        <asp:DropDownList ID="ddlHour" runat="server">
                            <asp:ListItem Selected="True" Value="09"></asp:ListItem>
                            <asp:ListItem>10</asp:ListItem>
                            <asp:ListItem Value="11"></asp:ListItem>
                            <asp:ListItem Value="12"></asp:ListItem>
                            <asp:ListItem Value="13"></asp:ListItem>
                            <asp:ListItem Value="14"></asp:ListItem>
                            <asp:ListItem Value="15"></asp:ListItem>
                            <asp:ListItem Value="16"></asp:ListItem>
                            <asp:ListItem Value="17"></asp:ListItem>
                            <asp:ListItem Value="18"></asp:ListItem>
                        </asp:DropDownList>
                        ：<asp:DropDownList ID="ddlMini" runat="server">
                            <asp:ListItem Selected="True" Value="00"></asp:ListItem>
                            <asp:ListItem Value="15"></asp:ListItem>
                            <asp:ListItem Value="30"></asp:ListItem>
                            <asp:ListItem Value="45"></asp:ListItem>
                        </asp:DropDownList>
                        <br />
                        <asp:Button ID="btnSubmit2" OnClientClick="if(!confirm('认证头像将扣除您10万金币，是否确认提交？')){return false}"
                            runat="server" Text="提交" OnClick="btnSubmit2_Click" />
                        <br /><br />
                        提示：
                        <br />
                        *提交成功后，系统将自动扣除您10万金币
                        <br />
                        *系统只接受3日内的预约
                        <br />
                        *视频认证只在工作日的工作时间段9：00—18：00进行
                        <br />
                        <asp:Label ID="lblMsg" runat="server" CssClass="lblMsg" Text="" ForeColor="Red" Font-Size="Large"></asp:Label>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
