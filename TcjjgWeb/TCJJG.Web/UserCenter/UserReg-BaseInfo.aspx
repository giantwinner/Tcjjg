<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UserReg-BaseInfo.aspx.cs" Inherits="UserCenter_UserReg_BaseInfo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <script src="../Scripts/jquery-1.4.1.min.js" type="text/javascript"></script>
    <script src="../Scripts/common.js" type="text/javascript"></script>
    <script src="../Scripts/CreateXMLHttpRequest.js" type="text/javascript"></script>
    <script src="../Scripts/ChangeCode.js" type="text/javascript"></script>
    <script src="../Scripts/user_validate.js" type="text/javascript"></script>
    <script src="../Scripts/user_reg.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            $("#ctl00_ContentPlaceHolder1_txtUserName").focus();
            $("#ctl00_pnelfirst").css("display", "none");
            $("#beginGame").css("display", "none");
        })
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="uc-reg-wrap">
        <div class="uc-reg-l">
            <img src="../Images/UserCenter/uc-reg-l.png" alt="" />
        </div>
        <div class="uc-reg-m">
            <div class="uc-reg-title">
                快速注册
            </div>
            <div class="uc-reg-linkToLogin">
                如果你已经注册账号 请点击这里<a href="/UserCenter/UserLogin.aspx">登录</a>
            </div>
            <div class="uc-reg-linkToFindPwd">
                如果你忘记了密码 请点击这里<a href="/UserCenter/FindPassWord.aspx">找回密码</a>
            </div>
            <div class="uc-input-wrap">
                <asp:Panel ID="pnelStep1" runat="server">
                    <div id="step1">
                        <div class="RowInfo">
                            账<span style="visibility: hidden;">空空</span>号:&nbsp;<asp:TextBox ID="txtUserName"
                                runat="server" MaxLength="15" type="text" class="textReg" onblur="reg_UserID();"
                                Style="margin-left: 0px" onfocus="reg_ddl();"></asp:TextBox>
                            <div class="D_Prompt">
                                <div id="userNameFinish" class="D_Prompt_Finish">
                                </div>
                                <div id="userNameError" class="D_Prompt_Error">
                                </div>
                            </div>
                            <div class="D_Clew">
                                <div class="D_Clew_Inner" id="ctxtUserName">
                                    4-15个字符，中、英文与数字组合的形式</div>
                            </div>
                        </div>
                        <div class="RowInfo">
                            密<span style="visibility: hidden;">空空</span>码:&nbsp;<asp:TextBox ID="txtPsw1" MaxLength="20"
                                runat="server" TextMode="Password" class="textReg" onblur="reg_psw1();" onfocus="regFous_Pass1();"></asp:TextBox>
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
                            确认密码:&nbsp;<asp:TextBox ID="txtPsw2" runat="server" MaxLength="20" TextMode="Password"
                                class="textReg" onblur="reg_psw2();" onfocus="regFous_Pass2();"></asp:TextBox>
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
                        <div class="RowInfo">
                            <span style="visibility: hidden;">空</span>验证码:
                            <asp:TextBox ID="valiNO" runat="server" class="textReg" MaxLength="4" onblur="checkValiRegOnblur('ctl00_ContentPlaceHolder1_valiNO')"
                                onfocus="regFous_valiNO();" Width="170px"></asp:TextBox>
                            <img id="imgCode" alt="看不清？点击更换" src="/UserCenter/ValidateCode.aspx" onclick="ChangeCode();" />&nbsp;
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
                        <%--                        <asp:LinkButton ID="btnStep1" runat="server" CssClass="savebtn" OnClick="btnStep1_Click"
                            Style="margin-left: 65px;">注册</asp:LinkButton>--%>
                        <asp:ImageButton ID="btnStep1" Style="margin-left: 113px;" OnClick="btnStep1_Click"
                            ImageUrl="~/Images/BtnImg/reg1.png" runat="server" /><br />
                        <asp:Label ID="lblRegMsg" runat="server" Font-Bold="True" ForeColor="Red" Style="margin-left: 113px;"></asp:Label>
                    </div>
                </asp:Panel>
                <asp:Panel ID="pnelStep2" runat="server" Visible="false">
                    <div id="step2">
                        <div class="uc-reg-userinf-title">
                            个人信息
                        </div>
                        <%--                        <div class="RowInfo">
                            昵<span style="visibility: hidden;">空空</span>称:&nbsp;<asp:TextBox ID="txtNickName"
                                MaxLength="15" runat="server" class="textReg" onblur="reg_NickName();" onfocus="regFous_NickName();"></asp:TextBox>
                            <div class="D_Prompt">
                                <div id="nickNameFinish" class="D_Prompt_Finish">
                                </div>
                                <div id="nickNameError" class="D_Prompt_Error">
                                </div>
                            </div>
                            <div class="D_Clew">
                                <div class="D_Clew_Inner" id="cnickName" style="position: absolute; top: 44px; left: 325px;
                                    width: 235px; height: 110px;">
                                    4-15个字符，中、英文与数字组合的形式,可以不填昵称，如果不填昵称，系统将随机生成一个新的昵称。请勿注册不雅昵称。注册不雅昵称者在比赛中夺冠，影响恶劣，我们有权没收冠军奖励！
                                </div>
                            </div>
                        </div>
                        --%>
                        <div class="RowInfo">
                            性<span style="visibility: hidden;">空空</span>别:&nbsp;<asp:RadioButton ID="rbtnMale"
                                GroupName="Gender" Text="男" runat="server" /><span style="visibility: hidden;">空空</span><asp:RadioButton
                                    ID="rbtnFemale" runat="server" Checked="true" Text="女" GroupName="Gender" />
                        </div>
                        <div class="RowInfo">
                            居住城市:&nbsp;<asp:DropDownList ID="ddlProvince" runat="server" AutoPostBack="true"
                                CssClass="ddlArea" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                            </asp:DropDownList>
                            &nbsp;<asp:DropDownList ID="ddlCity" runat="server" CssClass="ddlArea">
                            </asp:DropDownList>
                            <div class="D_Prompt">
                                <div id="cddFinish" class="D_Prompt_Finish">
                                </div>
                                <div id="cddError" class="D_Prompt_Error">
                                </div>
                            </div>
                            <div class="D_Clew">
                                <div class="D_Clew_Inner" id="cddl">
                                    请选择您所在的省份与城市
                                </div>
                            </div>
                        </div>
                        <asp:Panel ID="pSpreadName" runat="server" Visible="false">
                            <div class="uc-reg-userinf-title">
                                <asp:CheckBox ID="chFold" runat="server" AutoPostBack="True" 
                                    oncheckedchanged="chFold_CheckedChanged" />推广用户（非必填项）
                            </div>
                            <asp:Panel ID="pnelSpread" runat="server" Visible="false">
                                <div id="spreadArea" class="RowInfo">
                                    推广账号:&nbsp;<asp:TextBox MaxLength="15" ID="txtSpreadUser" runat="server" class="textReg"
                                        onblur="regBlur_SpreadUser()" onfocus="regFous_SpreadUser();"></asp:TextBox>
                                </div>
                            </asp:Panel>
                            <br />
                        </asp:Panel>
                        <div class="D_ServiceInfo">
                            <asp:CheckBox ID="CheckBox1" runat="server" Checked="True" Style="position: relative;
                                top: 2.2px;" /><span>我已查看并同意</span><a href="/CustomerService/regService.html" target="_blank">《中游竞技文化股份有限公司用户服务协议》</a>
                            <div class="D_Prompt">
                                <div id="check1Finish" class="D_Prompt_Finish">
                                </div>
                                <div id="check1Error" class="D_Prompt_Error">
                                </div>
                            </div>
                            <br />
                            <br />
                            <asp:CheckBox ID="CheckBox2" runat="server" Checked="True" Style="position: relative;
                                top: 2.2px;" /><span>我已查看并同意</span><a href="/CustomerService/regfcm.html" target="_blank">《网络游戏防沉迷系统及实名认证服务协议》</a>
                            <div class="D_Prompt">
                                <div id="check2Finish" class="D_Prompt_Finish">
                                </div>
                                <div id="check2Error" class="D_Prompt_Error">
                                </div>
                            </div>
                        </div>
                        <asp:ImageButton ID="btnRegComplete" Style="margin-left: 113px;" OnClick="btnRegComplete_Click"
                            ImageUrl="~/Images/BtnImg/compete1.png" runat="server" /><br />
                        <asp:Label ID="labMsg" runat="server" Font-Bold="True" ForeColor="Red" Style="margin-left: 113px;"></asp:Label>
                    </div>
                </asp:Panel>
            </div>
        </div>
        <div class="uc-reg-r">
            <img src="../Images/UserCenter/uc-reg-r.png" alt="" />
        </div>
    </div>
    <asp:Label ID="lblMarkUserName" runat="server" Text="" Style="display: none;"></asp:Label>
</asp:Content>
