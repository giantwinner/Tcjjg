<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="UpdateUserInfo.aspx.cs"
    MaintainScrollPositionOnPostback="true" Inherits="UserCenter_UpdateUserInfo"
    MasterPageFile="~/MasterPage.master" %>

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
                    修改资料
                </div>
                <div class="D_UserInfoContainer">
                    <div class="D_RightInner">
                        <div style="margin-left: 100px">
                            <span>性<span style="visibility: hidden">空空</span>别：
                                <asp:DropDownList ID="ddlGender" runat="server" Width="178px">
                                    <asp:ListItem Value="1">男</asp:ListItem>
                                    <asp:ListItem Value="2">女</asp:ListItem>
                                </asp:DropDownList>
                                <div style="height: 21px">
                                </div>
                            </span>职<span style="visibility: hidden">空空</span>业：
                            <asp:DropDownList ID="ddlWork" runat="server" Width="178px">
                                <asp:ListItem Value="0">--请选择--</asp:ListItem>
                                <asp:ListItem Value="1">在校学生</asp:ListItem>
                                <asp:ListItem Value="2">固定工作者</asp:ListItem>
                                <asp:ListItem Value="3">自由职业者</asp:ListItem>
                                <asp:ListItem Value="4">待业/无业/失业</asp:ListItem>
                                <asp:ListItem Value="5">退休</asp:ListItem>
                                <asp:ListItem Value="6">其他</asp:ListItem>
                            </asp:DropDownList>
                            <div style="height: 21px">
                            </div>
                            生<span style="visibility: hidden">空空</span>日：
                            <asp:TextBox ID="txtBirthday" runat="server" onclick="SelectDate(this)" CssClass="help_textBox"></asp:TextBox>
                            <div style="height: 21px">
                            </div>
                            确认密码：
                            <asp:TextBox ID="txtPassWord0" runat="server" CssClass="help_textBox" TextMode="Password"></asp:TextBox>
                            <div style="height: 21px">
                            </div>
                            <div>
                                <asp:ImageButton ID="ImgBtn" ImageUrl="~/Images/UserCenter/tcjjg_2012__UpInfoOK.jpg"
                                    runat="server" OnClick="ImgBtn_Click" Style="margin-left: 74px;" 
                                    CausesValidation="False" />
                                &nbsp; <span style="display: inline-block; position: relative; bottom: 10px">
                                    <asp:Label ID="lblPrompt" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div class="UserCenter_Right_Title" style="position: absolute; top: 255px;">
                        修改实名认证
                    </div>
                    <div class="D_RightInner2">
                        <div style="margin-left: 100px">
                            姓<span style="visibility: hidden">空空</span>名：
                            <asp:TextBox ID="txtRealName" runat="server" CssClass="help_textBox" MaxLength="8"></asp:TextBox>
                            <div style="height: 21px">
                            </div>
                            身份证号：
                            <asp:TextBox ID="txtIDCard" runat="server" CssClass="help_textBox" MaxLength="18"></asp:TextBox>
                            <div style="height: 21px">
                            </div>
                            手<span style="visibility: hidden">空空</span>机：
                            <asp:TextBox ID="txtMovePhone" runat="server" CssClass="help_textBox" MaxLength="24"></asp:TextBox>
                            <div style="height: 21px">
                            </div>
                            确认密码：
                            <asp:TextBox ID="txtPassWord" runat="server" CssClass="help_textBox" TextMode="Password"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                ControlToValidate="txtPassWord" ErrorMessage="请输入确认密码"></asp:RequiredFieldValidator>
                            <div style="height: 21px">
                            </div>
                            <span style="color: Red; margin-left: 74px;">提示：修改实名认证需要扣费300元宝</span>
                            <div style="height: 21px">
                            </div>
                            <div>
                                <asp:ImageButton ID="ImgBtn2" OnClientClick="return confirm( '修改实名认证需要扣除300元宝，确认修改？')"
                                    ImageUrl="~/Images/UserCenter/tcjjg_2012__UpInfoOK.jpg" runat="server" OnClick="ImgBtn2_Click"
                                    Style="margin-left: 74px;" />
                                &nbsp; <span style="display: inline-block; position: relative; bottom: 10px">
                                    <asp:Label ID="lblPrompt2" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
                                </span>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript">
        $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".userCenter_Left_Nav_Item").eq(1).addClass("userCenter_Left_Nav_Item_Selected");
    </script>
</asp:Content>
