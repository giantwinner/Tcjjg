<%@ Page Language="C#" AutoEventWireup="true" CodeFile="MaintenancePage.aspx.cs"
    Inherits="MaintenancePage_MaintenancePage" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>同城斗地主竞技赛-中国扑克竞技赛（CMOP）</title>
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <link href="../Css/MasterPage.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div class="D_Container">
        <div class="D_Head">
            <div class="D_Head_Inner">
                <div class="D_Img_Logo">
                    <img src="../Images/MasterPage/tcjjg_2012_2.jpg" alt="" /></div>
                <div class="D_Img_Mid">
                    <img src="../Images/MasterPage/tcjjg_2012_3.jpg" alt="" /></div>
                <div class="D_Head_Right">
                    <div class="D_Head_Right_Top">
                        <a href="#" id="M_Link_Login">登录 | </a><a href="#" id="M_Link_Register">注册</a><a
                            href="#" id="M_Link_UserName" style="display: none; width: 150px; position: absolute;
                            left: -132px; _left: -154px; text-align: right;"></a><span class="splitLine" style="position: absolute;
                                right: 227px; _right: 245px; visibility: hidden;">| </span><a href="#" id="M_Link_Msg"
                                    style="display: none; position: absolute; left: 29px; _left: 11px;">消息<span class="msgCount"></span>
                                </a><span class="splitLine" style="position: absolute; right: 171px; _right: 187px;
                                    visibility: hidden;">| </span><span style="visibility: hidden;">a</span><a href="#"
                                        id="M_Link_Logout" style="display: none">退出 </a><span>| </span><a href="#">设为首页</a><span>
                                            | </span><a href="#">添加桌面图标</a>
                    </div>
                    <div class="D_Head_Right_Bottom">
                        <div class="D_Head_Right_Bottom_X">
                            <a href="#">
                                <img src="../Images/MasterPage/tcjjg_2012_4.jpg" alt="" />&nbsp;新浪微博</a>
                        </div>
                        <div class="D_Head_Right_Bottom_T">
                            <a href="#">
                                <img src="../Images/MasterPage/tcjjg_2012_5.jpg" alt="" />&nbsp;腾讯微博</a>
                        </div>
                    </div>
                </div>
            </div>
            <div class="D_Nav">
                <ul>
                    <li><a id="A_Index" href="#">首&nbsp;页</a></li><li class="NavSpace"></li>
                    <li class="NavSpace1"></li>
                    <li><a href="#">比赛大厅</a></li><li class="NavSpace"></li>
                    <li class="NavSpace1"></li>
                    <li><a id="A_User" href="#">用户中心</a></li><li class="NavSpace"></li>
                    <li class="NavSpace1"></li>
                    <li><a id="A_PayCenter" href="#">充值中心</a></li><li class="NavSpace"></li>
                    <li class="NavSpace1"></li>
                    <li><a id="A_AwardCenter" href="#">兑奖商城</a></li><li class="NavSpace"></li>
                    <li class="NavSpace1"></li>
                    <li><a id="A_CustomerServiceCenter" href="#">客服中心</a></li><li class="NavSpace"></li>
                    <li class="NavSpace1"></li>
                    <li><a href="#">玩家论坛</a></li><li class="NavSpace"></li>
                    <li class="NavSpace1"></li>
                    <li><a id="A_About" href="#">关于中游</a></li>
                </ul>
            </div>
        </div>
        <div>
            <div style="margin: 0 auto; position: relative; height: 300px; width: 800px; line-height: 30px;
                font-size: 14px;">
                <asp:Literal ID="LtlContent" runat="server"></asp:Literal>
            </div>
        </div>
        <div class="D_Footer">
            <div class="D_Footer_Bar">
            </div>
            <div class="D_Footer_Nav">
                <span><a href="#">首页</a></span> | <a href="#">关于我们</a> | <a href="#">服务条款</a> |
                <a href="#">联系方式</a> | <a href="#">招贤纳士</a> | <a href="#">家长监护</a> | <a href="#">CMOP官网</a>
            </div>
            <div class="D_Footer_Copyright">
                Copyright&nbsp;2008-2012&nbsp;中游竞技文化股份有限公司&nbsp;版权所有&nbsp;琼ICP证B2-20120009号&nbsp;琼ICP备11002650号<br />
                <span class="D_Footer_Copyright_cnzz"></span>&nbsp;海南省公安厅备案46000002000001号&nbsp;琼网文[2012]0134-001号
            </div>
        </div>
    </div>
    </form>
</body>
</html>
