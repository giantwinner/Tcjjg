<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeFile="UserAmplyInfo.aspx.cs"
    Inherits="UserCenter_UserAmplyInfo" MasterPageFile="../MasterPage.master" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="../UserControl/UC_UserCenter.ascx" TagName="UC_UserCenter" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="../Css/SubPage.css" rel="stylesheet" type="text/css" />
    <link href="../Css/UserHeadStyle.css" rel="stylesheet" type="text/css" />
    <link href="../Css/UserHead.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" language="javascript">
        //必须先加载
        var ImgServerURL = "";
        function F_GetImgServerURL() {
            return "<%= GetImgServerURL()%>";
        }
        ImgServerURL = F_GetImgServerURL();
    </script>
    <script src="../Js/common.js" type="text/javascript"></script>
    <script src="../js/CreateXMLHttpRequest.js" type="text/javascript"></script>
    <script src="../Js/user_infoAmply.js" type="text/javascript"></script>
    <script src="../Js/user_Head.js" type="text/javascript"></script>
    <script src="../Js/jq/jquery-1[1].2.6.pack.js" type="text/javascript"></script>
    <script src="../Js/jq/useruploadheadcommond.js" type="text/javascript"></script>
    <script src="../Js/jq/ui.core.packed.js" type="text/javascript"></script>
    <script src="../Js/jq/ui.draggable.packed.js" type="text/javascript"></script>
    <script src="../Js/HeadImgChange.js" type="text/javascript"></script>
    <script type="text/javascript">
        password = "divChangePsw_password1";
        password2 = "divChangePsw_password2";
    </script>
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
                    头像修改
                </div>
                <br />
                <br />
                <div class="divUserAmplyInfo_main">
                    <div class="divUserAmplyInfo_main2">
                        <div class="divUserAmplyInfo_main2_c1_line">
                            <div class="div_RegMain25_head_1_amp">
                                <div id="I_div_RegMain25_head_1" class="div_RegMain25_head_1_1" onclick="F_div_RegMain25_head_1_1();">
                                    选择默认
                                </div>
                                <div id="I_div_RegMain25_head_2" class="div_RegMain25_head_1_4" onclick="F_div_RegMain25_head_1_2();">
                                    上传头像
                                </div>
                            </div>
                            <div id="I_div_RegMain25_head_3" class="div_RegMain25_head_2_amp">
                                <%--                           <div id="H1_div_RegMain25_head_3" class="div_RegMain25_head_2_a">
                                    加载中...请稍候...
                                </div>
                                <div id="H2_div_RegMain25_head_3" class="div_RegMain25_head_2_b">
                                </div>
                                <div id="H3_div_RegMain25_head_3" class="div_RegMain25_head_2_c">
                                </div>
                                <div id="H4_div_RegMain25_head_3" class="div_RegMain25_head_2_d">
                                </div>
                                <div id="H5_div_RegMain25_head_3" class="div_RegMain25_head_2_e_cut">
                                </div>--%>
                                <div style="width: 436px; height: 240px;">
                                    <div id="pageList1" class="pageList">
                                    </div>
                                    <div id="pageList2" class="pageList">
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
                            </div>
                            <div id="I_div_RegMain25_head_4" class="displayNone">
                                <div class="urds_1">
                                    你最好上传一张真人照片证明你是地球人(文件需小于300KB哦~)</div>
                                <div class="urds_2">
                                    <span class="urds_2_s1">
                                        <asp:FileUpload ID="fileImg" runat="server" />
                                        <%--<input id="fileImg" runat="server" type="file" />--%></span><span class="urds_2_s2"><asp:Button
                                            ID="Button1" runat="server" class="div_button4" OnClick="Button1_Click" Text="上传" /></span>
                                </div>
                                <div class="Currentimages">
                                    <div id="div_HeadImageCut" class="div_HeadImageCut_class">
                                        <div id="content" style="background-color: #FFFFFF">
                                            <div id="image">
                                                <img alt="" id="img" runat="server" />
                                            </div>
                                            <div id="drop">
                                                <img alt="" id="drop_img" runat="server" />
                                            </div>
                                        </div>
                                        <table align="center" border="0">
                                            <tr>
                                                <td id="Min">
                                                    <img alt="缩小" src="/Images/uploadHead/Minc.jpg" style="width: 19px; height: 19px"
                                                        id="moresmall" class="smallbig" />
                                                </td>
                                                <td>
                                                    <div id="bar">
                                                        <div class="child">
                                                        </div>
                                                    </div>
                                                </td>
                                                <td id="Max">
                                                    <img alt="放大" src="/Images/uploadHead/Maxc.jpg" style="width: 19px; height: 19px"
                                                        id="morebig" class="smallbig" />
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="3" align="center">
                                                    <asp:Button ID="btn_Image" runat="server" OnClick="btn_Image_Click" class="div_button2" />
                                                </td>
                                            </tr>
                                        </table>
                                    </div>
                                    <div class="displayNone">
                                        原尺寸：宽<label id="width">
                                            <%=this.width %></label>px 高：<label id="height"><%=this.height%>px</label>
                                        图片实际宽度：
                                        <asp:TextBox ID="txt_width" runat="server" Text="1"></asp:TextBox><br />
                                        图片实际高度：
                                        <asp:TextBox ID="txt_height" runat="server" Text="1"></asp:TextBox><br />
                                        距离顶部：
                                        <asp:TextBox ID="txt_top" runat="server" Text="1"></asp:TextBox><br />
                                        距离左边：
                                        <asp:TextBox ID="txt_left" runat="server" Text="1"></asp:TextBox><br />
                                        截取框的宽：
                                        <asp:TextBox ID="txt_DropWidth" runat="server" Text="1"></asp:TextBox><br />
                                        截取框的高：
                                        <asp:TextBox ID="txt_DropHeight" runat="server" Text="1"></asp:TextBox><br />
                                        放大倍数：
                                        <asp:TextBox ID="txt_Zoom" runat="server" Text="1"></asp:TextBox>
                                    </div>
                                </div>
                            </div>
                            <div class="divUserAmplyInfo_main2_c1_c">
                                <div id="divMyHeadImg">
                                    <div id="defaultUserHead">
                                        <asp:Image ID="img_CurrentHeadImage" runat="server" ImageUrl="/Images/hu/head0.jpg"
                                            alt="头像" Width="63" Height="63" /></div>
                                    <div runat="server" id="DivSex" style="display: none">
                                    </div>
                                    <div id="defaultUserHeadBtn" class="divHRbtn1">
                                        <asp:Panel ID="Panel1" runat="server">
                                            <input type="button" class="div_button2" onclick="O_head_btn();" />
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
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script type="text/javascript" language="javascript" defer="defer">

        function userInfoSel(s1, s2, s3, s4) {
            G('divAwardAdd_txtAddress').value = s1;
            G('divAwardAdd_txtPostNumber').value = s2;
            G('divAwardAdd_txtRecipient').value = s3;
            G('divAwardAdd_txtEmail').value = s4;
        }


        $("#A_User").css({ "font-size": "14px", "color": "Black", "background-color": "White", "border-bottom-style": "solid", "border-bottom-width": "2px", "border-bottom-color": "#FFFFFF" });
        $(".userCenter_Left_Nav_Item").eq(2).addClass("userCenter_Left_Nav_Item_Selected");

    
    </script>
</asp:Content>
