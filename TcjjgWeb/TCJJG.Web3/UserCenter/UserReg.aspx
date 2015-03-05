<%@ Page Language="C#" AutoEventWireup="true" CodeFile="UserReg.aspx.cs" Inherits="UserCenter_UserReg"
    MasterPageFile="../MasterPage.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/UserReg.css" rel="stylesheet" type="text/css" />
    <script src="../Js/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Js/common.js" type="text/javascript"></script>
    <script src="../Js/CreateXMLHttpRequest.js" type="text/javascript"></script>
    <script src="../Js/ChangeCode.js" type="text/javascript"></script>
    <script src="../Js/Silverlight.js" type="text/javascript"></script>
    <script src="../Js/user_validate.js" type="text/javascript"></script>
    <script src="../Js/user_reg.js" type="text/javascript"></script>
    <script src="../Js/NewCalendar.js" type="text/javascript"></script>
    <script type="text/javascript">
        //填写更多资料
        $(function () {
            $("#ChkMoreInfo").click(function () {
                if ($(this).attr("checked")) {
                    $(".MoreInfo").show();
                } else {
                    $(".MoreInfo").hide();
                };
            })
            $.post("../Ajax/Ajax_VisitCounter.aspx", { visitWeb: "1" });
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <asp:Panel ID="Panel1" runat="server" Visible="true">
        <div class="D_RegContainer">
            <div class="lbl1">
                <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
            </div>
            <div style="position: relative">
                <span class="Asterisk">*</span>所在地<span style="visibility: hidden;">空</span>&nbsp;<asp:DropDownList
                    ID="ddlProvince" runat="server" AutoPostBack="true" CssClass="ddlArea" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                </asp:DropDownList>
                &nbsp;（省）<asp:DropDownList ID="ddlCity" runat="server" CssClass="ddlArea">
                </asp:DropDownList>
                （市）
                <div class="D_Prompt" style="position: absolute; left: 395px; top: 2px;">
                    <div id="cddFinish" class="D_Prompt_Finish">
                    </div>
                    <div id="cddError" class="D_Prompt_Error">
                    </div>
                </div>
                <div class="D_Clew" style="position: absolute; left: 415px; *left: 408px;">
                    <div class="D_Clew_Inner" id="cddl">
                        请选择您所在的省份与城市
                    </div>
                </div>
            </div>
            <div class="RowInfo">
                <span class="Asterisk">*</span>账<span style="visibility: hidden;">空空</span>号&nbsp;<asp:TextBox
                    ID="txtUserName" runat="server" MaxLength="15" type="text" class="textReg" onblur="reg_UserID();"
                    onfocus="reg_ddl();"></asp:TextBox>
                <div class="D_Prompt">
                    <div id="userNameFinish" class="D_Prompt_Finish">
                    </div>
                    <div id="userNameError" class="D_Prompt_Error">
                    </div>
                </div>
                <div class="D_Clew">
                    <div class="D_Clew_Inner" id="ctxtUserName">
                        6-15个字符，中、英文与数字组合的形式</div>
                </div>
            </div>
            <div class="RowInfo">
                <span class="Asterisk">*</span>密<span style="visibility: hidden;">空空</span>码&nbsp;<asp:TextBox
                    ID="txtPsw1" MaxLength="20" runat="server" TextMode="Password" class="textReg"
                    onblur="reg_psw1();" onfocus="regFous_Pass1();"></asp:TextBox>
                <div class="D_Prompt">
                    <div id="password1Finish" class="D_Prompt_Finish">
                    </div>
                    <div id="password1Error" class="D_Prompt_Error">
                    </div>
                </div>
                <div class="D_Clew">
                    <div class="D_Clew_Inner" id="cpassword1">
                        密码长度在6-20位之间</div>
                </div>
            </div>
            <div class="RowInfo">
                <span class="Asterisk">*</span>确认密码&nbsp;<asp:TextBox ID="txtPsw2" runat="server"
                    MaxLength="20" TextMode="Password" class="textReg" onblur="reg_psw2();" onfocus="regFous_Pass2();"></asp:TextBox>
                <div class="D_Prompt">
                    <div id="password2Finish" class="D_Prompt_Finish">
                    </div>
                    <div id="password2Error" class="D_Prompt_Error">
                    </div>
                </div>
                <div class="D_Clew">
                    <div class="D_Clew_Inner" id="cpassword2">
                        重复密码长度在6-20位之间</div>
                </div>
            </div>
            <div class="RowInfoNickName">
                <span class="Asterisk" style="visibility: hidden">*</span>昵<span style="visibility: hidden;">空空</span>称&nbsp;<asp:TextBox
                    ID="txtNickName" MaxLength="15" runat="server" class="textReg" onblur="reg_NickName();"
                    onfocus="regFous_NickName();"></asp:TextBox>
            </div>
            <div class="D_ClewNickName">
                <div class="D_Prompt" style="position: absolute; top: 5px;">
                    <div id="nickNameFinish" class="D_Prompt_Finish">
                    </div>
                    <div id="nickNameError" class="D_Prompt_Error">
                    </div>
                </div>
                <div class="D_ClewNickName_Inner" id="cnickName" style="position: absolute; left: 20px">
                   6-15个字符，中、英文与数字组合的形式,可以不填昵称，如果不填昵称，系统将随机生成一个新的昵称。请勿注册不雅昵称。注册不雅昵称者在比赛中夺冠，影响恶劣，我们有权没收冠军奖励！
                </div>
            </div>
            <div class="RowInfo" style="display: none">
                <span class="Asterisk" style="visibility: hidden">*</span>联系方式&nbsp;<asp:TextBox
                    ID="txtContact" runat="server" class="textReg" onblur="reg_identityCard()"></asp:TextBox>
                <div class="D_Clew">
                    <span style="display: none">请输入您的联系方式</span></div>
            </div>
            <asp:Panel ID="pSpreadName" runat="server" Visible="true">
                <div class="RowInfo">
                    <span class="Asterisk" style="visibility: hidden">*</span>推广账号&nbsp;<asp:TextBox
                        MaxLength="15" ID="txtSpreadUser" runat="server" class="textReg" onblur="regBlur_SpreadUser()"
                        onfocus="regFous_SpreadUser();"></asp:TextBox></div>
                <div class="DownAsterisk">
                    （选填）注册时填写推广账号，送一个价值10元的小礼包&nbsp;&nbsp;
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel5" runat="server" Visible="false">
                <div class="d_lineReg" style="display: none">
                    <span class="d_line_s1Reg">手机号码：</span><span class="d_line_s2">
                        <asp:TextBox ID="txtMovePhone" runat="server" type="text" class="text1"></asp:TextBox>(*)</span><span
                            id="Span3" class="textPrompt">11位数字</span></div>
                <div class="d_lineReg" style="display: none">
                    <span class="d_line_s1Reg">验&nbsp;证&nbsp;码：</span><span class="d_line_s2">
                        <asp:TextBox ID="txtMovePhoneValiNO" runat="server" class="txtCode" MaxLength="4"></asp:TextBox>
                        <input type="button" id="btnSendMessages" value="获取验证码" onclick="F_sendMessages();"
                            style="*top: 4px; * position: relative;" /></span></div>
            </asp:Panel>
            <br />
            <div class="D_InsertMoreInfo">
                <input type="checkbox" id="ChkMoreInfo" value=" " />&nbsp;<span class="InsertMoreInfo">填写更多资料</span>
            </div>
            <br />
            <div class="MoreInfo" style="display: none">
                &nbsp;<span>性&nbsp;&nbsp;别：&nbsp;&nbsp;<asp:DropDownList ID="ddlGender" runat="server"
                    class="textReg2" Width="160px">
                    <asp:ListItem Value="1">男</asp:ListItem>
                    <asp:ListItem Value="2">女</asp:ListItem>
                </asp:DropDownList>
                    <br />
                    <br />
                    <br />
                    &nbsp;</span><span>职&nbsp;&nbsp;业：&nbsp;&nbsp;<asp:DropDownList ID="ddlWork" runat="server"
                        class="textReg2" Width="160px">
                        <asp:ListItem Value="0">--请选择--</asp:ListItem>
                        <asp:ListItem Value="1">在校学生</asp:ListItem>
                        <asp:ListItem Value="2">固定工作者</asp:ListItem>
                        <asp:ListItem Value="3">自由职业者</asp:ListItem>
                        <asp:ListItem Value="4">待业/无业/失业</asp:ListItem>
                        <asp:ListItem Value="5">退休</asp:ListItem>
                        <asp:ListItem Value="6">其他</asp:ListItem>
                    </asp:DropDownList>
                        <br />
                        <br />
                        <br />
                    </span>&nbsp;<span>生&nbsp;&nbsp;日：&nbsp;&nbsp;<asp:TextBox ID="txtBirthday" runat="server"
                        onclick="SelectDate(this)" Width="154px" class="textReg2"></asp:TextBox></span><br />
                <br />
                <br />
            </div>
            <br />
            <hr />
            <div class="RowInfo" style="display: none">
                <span class="Asterisk">*</span>验&nbsp;证&nbsp;码&nbsp;<asp:TextBox ID="TextBox1" runat="server"
                    class="textReg" onblur="reg_identityCard()"></asp:TextBox>
            </div>
            <div class="D_Clew" style="display: none">
                抄写图片中的数字
            </div>
            <br />
            <asp:Panel ID="Panel4" runat="server" Visible="false">
                <div class="d_lineReg" style="margin-top: 20px">
                    <span class="Asterisk">*</span>验&nbsp;证&nbsp;码<span class="d_line_s2">
                        <asp:TextBox ID="valiNO" runat="server" class="textReg" MaxLength="4" onblur="checkValiRegOnblur('ctl00_ContentPlaceHolder1_valiNO')"
                            onfocus="regFous_valiNO();" Width="250px"></asp:TextBox>
                        <img id="imgCode" class="txtCode1" alt="看不清？点击更换" src="/Index/ValidateCode.aspx"
                            onclick="ChangeCode();" style="cursor: pointer; position: relative; top: 7px;
                            _top: 2px;" height="23px" /></span> <span id="vvaliNO" class="vtxtUserName">
                    </span>
                    <div class="D_Prompt">
                        <div id="valiFinish" class="D_Prompt_Finish">
                        </div>
                        <div id="valiError" class="D_Prompt_Error">
                        </div>
                    </div>
                    <div class="D_Clew">
                        <div class="D_Clew_Inner" id="cvaliNO">
                            请输入4位验证码</div>
                    </div>
                </div>
            </asp:Panel>
            <div class="D_ServiceInfo">
                <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Text="我已查看并同意" /><a href="../CustomerService/regService.html"
                    target="_blank">《中游竞技文化股份有限公司用户服务协议》</a>
                <div class="D_Prompt">
                    <div id="check1Finish" class="D_Prompt_Finish">
                    </div>
                    <div id="check1Error" class="D_Prompt_Error">
                    </div>
                </div>
                <div class="D_Clew">
                    <div class="D_Clew_Inner" id="check1" style="width: 320px">
                        请选择同意《中游竞技文化股份有限公司用户服务协议》
                    </div>
                </div>
                <br />
                <br />
                <asp:CheckBox ID="CheckBox2" runat="server" Checked="True" Text="我已查看并同意" /><a href="../CustomerService/regfcm.html"
                    target="_blank">《网络游戏防沉迷系统及实名认证服务协议》</a>
                <div class="D_Prompt">
                    <div id="check2Finish" class="D_Prompt_Finish">
                    </div>
                    <div id="check2Error" class="D_Prompt_Error">
                    </div>
                </div>
                <div class="D_Clew">
                    <div class="D_Clew_Inner" id="check2" style="width: 320px">
                        请选择同意《网络游戏防沉迷系统及实名认证服务协议》
                    </div>
                </div>
            </div>
            <div class="D_Submit">
                <asp:ImageButton ID="btnSubmit" runat="server" ImageUrl="~/Images/Register/tcjjgregsubmit.jpg"
                    CssClass="btn_Reg" OnClick="btnSubmit_Click" />&nbsp;&nbsp;<asp:Label ID="labMsg"
                        runat="server" Font-Bold="True" ForeColor="Red" Visible="True"></asp:Label>
            </div>
            <div class="d_lineReg" style="display: none">
                <div id="div_must_smod" class="regdiv_must_smod1">
                    <span class="">
                        <input name="isNotMustWr" type="checkbox" class="chk" onclick="f_reg_must_cla();" /></span>增加密码找回</div>
            </div>
            <div id="reg_must_sum" style="_margin-left: -90px; display: none;">
                <div class="d_lineReg">
                    <span class="d_line_s1" style="font-size: 16px; color: #5b3800; width: 100px; margin-left: -12px;">
                        密码保护：</span><span class="d_line_s2" style="line-height: 20px; vertical-align: middle;
                            padding-top: 6px;"><asp:DropDownList ID="DDLPsw" runat="server" CssClass="ddlArea">
                                <asp:ListItem Selected="True" Value="0">请选择..</asp:ListItem>
                                <asp:ListItem Value="1">您的手机号码</asp:ListItem>
                                <asp:ListItem Value="2">您的出生地</asp:ListItem>
                                <asp:ListItem Value="3">您的邮箱</asp:ListItem>
                                <asp:ListItem Value="4">您的名字</asp:ListItem>
                                <asp:ListItem Value="5">您的小学名称</asp:ListItem>
                            </asp:DropDownList>
                        </span><span id="Span1" class="textPrompt"><strong style="color: Red; font-weight: bold;">
                            (选填)</strong>将用于找回密码</span>
                </div>
                <div class="d_lineReg">
                    <span class="d_line_s1" style="font-size: 16px; color: #5b3800; width: 100px; margin-left: -12px;">
                        问题答案：</span><span class="d_line_s2"><asp:TextBox ID="txtPwdAnswer" runat="server"
                            class="textReg" Text=""></asp:TextBox></span><span id="Span2" class="textPrompt"><strong
                                style="color: Red; font-weight: bold;">&nbsp;(选填)</strong>将用于找回密码，不长于64个字符</span></div>
            </div>
        </div>
    </asp:Panel>
</asp:Content>
