<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="UpdateHeadPortrait.aspx.cs" Inherits="UserCenter_UpdateHeadPortrait" %>

<%@ Register Src="~/UserControl/UC_UserInfo.ascx" TagName="UC_UserInfo" TagPrefix="uc1" %>
<%@ Register Src="~/UserControl/UC_LeftNav.ascx" TagName="UC_LeftNav" TagPrefix="uc2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../CSS/UserCenter.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/UserHead.css" rel="stylesheet" type="text/css" />
    <link href="../CSS/UserHeadStyle.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
        //必须先加载
        var ImgServerURL = "";
        function F_GetImgServerURL() {
            return "<%= GetImgServerURL()%>";
        }
        ImgServerURL = F_GetImgServerURL();
    </script>
    <script src="../Scripts/common.js" type="text/javascript"></script>
    <script src="../Scripts/CreateXMLHttpRequest.js" type="text/javascript"></script>
    <script src="../Scripts/user_infoAmply.js" type="text/javascript"></script>
    <script src="../Scripts/user_Head.js" type="text/javascript"></script>
    <script src="../Scripts/HeadImgChange.js" type="text/javascript"></script>
    <link href="../CSS/Avatar.css" rel="stylesheet" type="text/css" />
    <link href="/CSS/Avatar/ui-lightness/jquery.ui.all.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/jquery-1.6.1.min.js" type="text/javascript"></script>
    <script src="/Scripts/jquery-ui-1.8.13.custom.min.js" type="text/javascript"></script>
    <script src="/Scripts/ajaxFileUpload.js" type="text/javascript"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div style="margin: 0px auto; width: 1000px; height: 740px; margin-bottom: 38px;">
        <uc1:UC_UserInfo ID="UC_UserInfo" runat="server" />
        <uc2:UC_LeftNav ID="UC_LeftNav" runat="server" />
        <div class="uc-content-wrap">
            <div class="uc-content-title">
                <img src="../Images/UserCenter/uc-content-title-img.jpg" alt="" />&nbsp;修改头像
            </div>
            <div class="divUserAmplyInfo_main">
                <div class="divUserAmplyInfo_main2">
                    <div class="divUserAmplyInfo_main2_c1_line">
                        <div class="div_RegMain25_head_1_amp">
                            <div id="tap1" style="margin-left: 42px;" class="head-tap-select" onclick="tap1click();">
                                选择默认
                            </div>
                            <div id="tap2" class="head-tap-default" onclick="tap2click();">
                                上传头像
                            </div>
                            <div id="tap3" class="head-tap-default" onclick="tap3click();">
                                真人认证
                            </div>
                        </div>
                        <div id="updateHead-wrap">
                            <div id="I_div_RegMain25_head_3" class="div_RegMain25_head_2_amp">
                                <div id="pageList1" class="pageList">
                                </div>
                                <div id="pageList2" class="pageList">
                                </div>
                                <div id="pageList3" class="pageList">
                                </div>
                            </div>
                            <div class="pageBar">
                                <div class="previous" onclick="PreviousPage()">
                                    ←
                                </div>
                                <div class="next" onclick="NextPage()">
                                    →
                                </div>
                            </div>
                            <div id="I_div_RegMain25_head_4" class="displayNone">
                                <div style="clear: both; width: 550px;">
                                    <div id="divUp" style="width: 520px; float: left; margin-left: 20px">
                                        <input type="file" id="avatarFile" name="avatarFile" onchange="_uploadImg();" />
                                        <div id="divUploadAvatar">
                                            <div id="divContenter">
                                                <div id="divBG">
                                                    <div id="divCuter">
                                                    </div>
                                                </div>
                                            </div>
                                            <div id="divAvatarInfo">
                                                <div id="divImgAvatar">
                                                    <img id="imgAvatarView" alt="头像" style="display: none;" />
                                                </div>
                                                <div id="divUploadTxt">
                                                    通过移动和改变左边橙色方块大小可选择图像区域
                                                </div>
                                                <div id="divUploadBtn">
                                                    <input type="button" class="btnAvatar" onclick="return _uploadAvatarOK()" value="确定" />
                                                    <input type="button" class="btnAvatar" onclick="_uploadAvatarCancel()" value="取消" />
                                                </div>
                                                <div id="divSaveInfo">
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="divUserAmplyInfo_main2_c1_c">
                                <div id="divMyHeadImg">
                                    <div id="defaultUserHead">
                                        <asp:Image ID="img_CurrentHeadImage" runat="server" ImageUrl="/Images/hu/head0.jpg"
                                            alt="头像" Width="72" Height="72" /></div>
                                    <asp:ImageButton ID="headR" runat="server" Visible="false" CssClass="HeadR" ImageUrl="~/Images/UserCenter/role.png" />
                                    <div runat="server" id="DivSex" style="display: none">
                                    </div>
                                    <div id="defaultUserHeadBtn" class="divHRbtn1">
                                        <asp:Panel ID="Panel1" runat="server">
                                            <a class="savebtn" onclick="return O_head_btn();">保存</a>
                                        </asp:Panel>
                                    </div>
                                    <div id="div_defaultUserHeadBtn_callback_lab" class="defaultUserHeadBtn_callback_lab">
                                    </div>
                                    <div id="div_defaultUserHeadBtn_wait" class="div_c_defaultUserHeadBtn_wait">
                                    </div>
                                    <div id="div_defaultUserHeadBtn_taskUserHead" class="displayNone">
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="vip-wrap">
                            <iframe id="iframe" runat="server" name="iframe" scrolling="no" width="100%" height="100%"
                                src="IdentifyHeadImg-Validate.aspx" frameborder="0"></iframe>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="uc-content-r">
            <img src="../Images/UserCenter/uc-content-r.png" alt="" />
        </div>
    </div>
    <asp:Label ID="lblRoles" runat="server" Text="0"  style=" display:none;"></asp:Label>
    <script type="text/javascript">
        $(".nav-item").eq(2).css({"background-image": "url('../Images/MasterPage/navhover.png')","background-repeat": "no-repeat"});
        $(".uc-nav-item").eq(1).find("img").attr("src", $(".uc-nav-item").eq(1).find("img").attr("src").replace("2", "1"));
        $(".uc-nav-item").eq(1).addClass("hover").addClass("selected");

    </script>
    <script src="/Scripts/AvatarUpLoad.js" type="text/javascript"></script>
</asp:Content>
